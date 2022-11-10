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
    
    func getPhotos() {
        PhotoService.shared.getPhotos { [weak self] success, photos, error in
            if success {
                self?.photos.value = photos
            } else {
                self?.error.value = error
            }
        }
    }
    
    func photoSelected(at indexPath: IndexPath) {
        let photo = photos.value[indexPath.row]
    }
}
