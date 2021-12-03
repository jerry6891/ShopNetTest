//
//  SingleCharacterView.swift
//  Shopnet-Test
//
//  Created by Gerardo Lozano on 12/2/21.
//

import SwiftUI

struct SingleCharacterView: View {
    
    let character: Model
    
    var body: some View {
        HStack {
            VStack(alignment: .center, spacing: 25) {
                Image(uiImage: character.image.load())
                    .resizable()
                    .frame(width: 300, height: 300)
                    .cornerRadius(30.0)
                
                Text("Name: \(character.name)")
                    .font(.headline)
                
                Text("Status: \(character.status)")
                    .font(.subheadline)
                
                Text("Location: \(character.location.locatioName)")
                    .font(.subheadline)
            }
        }
    }
}
