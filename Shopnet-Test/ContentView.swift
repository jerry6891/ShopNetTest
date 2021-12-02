//
//  ContentView.swift
//  Shopnet-Test
//
//  Created by Gerardo Lozano on 12/2/21.
//

import SwiftUI

extension String {
    func load() -> UIImage {
        do {
            guard let url = URL(string: self) else { return UIImage() }
            let data: Data = try Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
        } catch {}
        return UIImage()
    }
}

struct ContentView: View {
    
    // Create RAM' Articles Empty State Object
    @State var ramArticles: [Model] = []
    
    var body: some View {
        
        // All UI Within The API Call Implementation
        NavigationView {
            List {
                ForEach(ramArticles) { character in
                    NavigationLink(destination: SingleCharacterView(character: character)) {
                        HStack {
                            Image(uiImage: character.image.load())
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(character.name)
                                    .font(.headline)
                                
                                HStack {
                                    Circle()
                                        .stroke(Color.green, style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [1]))
                                        .frame(width: 10, height: 10)
                                    
                                    Text(character.status)
                                        .font(.subheadline)
                                        .foregroundColor(Color.gray)
                                }
                                    Text(character.location.locatioName)
                                        .font(.system(size: 12))
                                        .foregroundColor(Color.green)
                            }
                        }
                    }
                }.id(UUID())
            }.navigationTitle(Text("Rick And Morty"))
        }.onAppear {
            ViewModel().getCharacter { (characterArticles) in
                self.ramArticles = characterArticles
            }
        }
    }
}

// Function Attempt on Status Color Depending on Each Character
func getStatus() {
    if try! Model(from: RAMMResponse.self as! Decoder).status == "Alive" {
        _ = CGColor(red: 0, green: 255, blue: 0, alpha: 1)
    } else if try! Model(from: RAMMResponse.self as! Decoder).status == "Dead" {
        _ = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
    } else if try! Model(from: RAMMResponse.self as! Decoder).status == "Unknown" {
        _ = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
