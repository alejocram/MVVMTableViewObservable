//
//  PhotoService.swift
//  MVVMTableViewObservable
//
//  Created by Alejocram on 8/11/22.
//

import Foundation

final class PhotoService {
    static let shared: PhotoService = PhotoService()
    init() {}
    
    func getPhotos(complete: @escaping(_ success: Bool, _ photos: [Photo], _ error: Error?) -> ()) {
        DispatchQueue.global().async {
//            sleep(3)
            let path = Bundle.main.path(forResource: "content", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let photos = try! decoder.decode(Photos.self, from: data)
            complete( true, photos.photos, nil )
        }
    }
}
