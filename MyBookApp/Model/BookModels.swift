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
    let saleInfo: SaleInfo
}

struct VolumeInfo: Codable {
    let title: String?
    let authors: [String]?
    let publishedDate: String?
    let imageLinks: ImageLinks?
    let description: String?
    let googleBooksWebLink: String?
    let categories: [String]?
    let publisher: String?
    let pageCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case authors
        case publishedDate
        case imageLinks
        case description
        case googleBooksWebLink = "canonicalVolumeLink"
        case categories
        case publisher
        case pageCount
    }
}

struct ImageLinks: Codable {
    let smallThumbnail: String?
    let thumbnail: String?
}

struct SaleInfo: Codable {
    let retailPrice: RetailPrice?
}

struct RetailPrice: Codable {
    let amount: Int?
    let currencyCode: String?
}
