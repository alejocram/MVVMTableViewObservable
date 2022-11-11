//
//  PhotoDetailViewModel.swift
//  MVVMTableViewObservable
//
//  Created by Alejocram on 9/11/22.
//

import Foundation

final class PhotoDetailViewModel {
    var photo: ObservableObject<Photo?> = ObservableObject(nil)
    
    func getPhotoDetail() {
        photo.value = PhotoService.shared.getPhotoSelected()
    }
}
