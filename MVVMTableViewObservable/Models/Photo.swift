//
//  Photo.swift
//  MVVMTableViewObservable
//
//  Created by Alejocram on 8/11/22.
//

import Foundation

struct Photo: Codable {
    let id: Int
    let name: String
    let description: String?
    let created_at: Date
    let image_url: String
    let for_sale: Bool
    let camera: String?
}

struct Photos: Codable {
    let photos: [Photo]
}
