//
//  ScrollableModel.swift
//  Shopnet-Test
//
//  Created by Rex Karnufex on 12/3/21.
//

import Foundation

struct ScrollableModel: Codable {
    let info: Info
    let results: [Result]
}

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

struct Result: Codable {
    let id: Int
    let name: String
    let status: String
    let image: String
}
