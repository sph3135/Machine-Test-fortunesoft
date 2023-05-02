//
//  PhotoCollectionModel.swift
//  Photo Album
//
//

import Foundation

struct PhotoCollectionModel: Codable {
    let status: Int
    let data: [Details]
}

struct Details: Codable {
    let title: String
    let image: String
}
