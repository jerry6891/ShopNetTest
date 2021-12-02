//
//  Model.swift
//  Shopnet-Test
//
//  Created by Gerardo Lozano on 12/2/21.
//

import UIKit
import SwiftUI
import Combine

struct Model: Codable, Identifiable {
    
    // Enumeration Of The Requested JSON Properties
    enum CodingKeys: String, CodingKey {
        case name
        case status
        case image
        case location
    }
    
    // Defines The API/JSON Properties
    var id = UUID()
    var name: String
    var status: String
    var image: String
    var location: Location
}

struct Location: Codable {
    enum CodingKeys: String, CodingKey {
        case locatioName = "name"
    }
    var locatioName: String
}

// Defines The Results' Object Array
struct RAMMResponse: Codable {
    var results: [Model]
}
