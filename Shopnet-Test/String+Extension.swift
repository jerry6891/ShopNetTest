//
//  String+Extension.swift
//  Shopnet-Test
//
//  Created by Gerardo Lozano on 12/2/21.
//

import Foundation
import SwiftUI

// Function Attempt on Status Color Depending on Each Character
extension String {
    func stats() -> Color {
        var color = Color.clear
        switch self {
        case "Alive":
            color = Color(#colorLiteral(red: 0.002057942161, green: 0.7247604216, blue: 0.003193084639, alpha: 1))
        case "Dead":
            color = Color(#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1))
        case "unknown":
            color = Color(#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1))
        default:
            color = Color.clear
        }
        return color
    }
}
