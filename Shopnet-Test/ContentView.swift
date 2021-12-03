//
//  ContentView.swift
//  Shopnet-Test
//
//  Created by Gerardo Lozano on 12/2/21.
//

import SwiftUI

struct ContentView: View {
    // Create RAM' Articles Empty State Object
    @State var ramArticles: [Model] = []
    let stats: Color
    
    var body: some View {
        // All UI Within The API Call Implementation
        NavigationView {
            List {
                ForEach(ramArticles, id: \.id) { character in
                    NavigationLink(destination: SingleCharacterView(character: character)) {
                        HStack {
                            Image(uiImage: character.image.load())
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(30.0)
                            
                            VStack(alignment: .leading, spacing: 6) {
                                Text(character.name)
                                    .font(.headline)
                                
                                HStack {
                                    Circle()
                                        .stroke(character.status.stats(), style: StrokeStyle(lineWidth: 3, lineCap: .round, dash: [1]))
                                        .frame(width: 10, height: 10)
                                    
                                    Text(character.status)
                                        .font(.subheadline)
                                        .foregroundColor(character.status.stats())
                                }
                                Text(character.location.locatioName)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray)
                            }.padding(.leading, 10)
                        }.padding(10)
                    }
                }
            }.navigationTitle(Text("Rick And Morty"))
        }.onAppear {
            ViewModel().getCharacter { (characterArticles) in
                self.ramArticles = characterArticles
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(stats: Color.clear).preferredColorScheme(.dark)
    }
}

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
