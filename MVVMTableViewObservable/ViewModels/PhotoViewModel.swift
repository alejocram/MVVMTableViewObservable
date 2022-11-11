//
//  PhotoViewModel.swift
//  MVVMTableViewObservable
//
//  Created by Alejocram on 8/11/22.
//

import Foundation

final class PhotoViewModel {
    var photos: ObservableObject<[Photo]> = ObservableObject([Photo]())
    var error: ObservableObject<Error?> = ObservableObject(nil)
    var isLoading: ObservableObject<Bool> = ObservableObject(false)
    
    func getPhotos() {
        self.isLoading.value = true
        PhotoService.shared.getPhotos { [weak self] success, photos, error in
            if success {
                self?.photos.value = photos
            } else {
                self?.error.value = error
            }
            self?.isLoading.value = false
        }
    }
    
    func photoSelected(at indexPath: IndexPath) {
        PhotoService.shared.setPhotoSelected(indexPath: indexPath)
    }
}
