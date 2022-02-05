//
//  BookModels.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/05.
//

import Foundation

struct Book: Codable {
    let items: [Item]
}

struct Item: Codable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let imageLinks: ImageLinks?
    let description: String?
}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}
