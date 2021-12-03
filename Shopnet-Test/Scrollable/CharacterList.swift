//
//  CharacterList.swift
//  Shopnet-Test
//
//  Created by Rex Karnufex on 12/3/21.
//

import SwiftUI

struct CharacterList: View {
    @ObservedObject var data: ScrollableViewModel
    var body: some View {
        NavigationView {
            List {
                ForEach(data.responses, id: \.page) { response in
                    ForEach(Array(response.element.results.enumerated()), id: \.element.id) { character in
                        CharacterView(image: character.element.image, name: character.element.name, status: character.element.status.capitalized, stats: character.element.status.stats())
                            .onAppear {
                                guard character.offset == response.element.results.count - 1,
                                      let next = response.element.info.next,
                                      let pageString = next.components(separatedBy: "?page=").last,
                                      let nextPage = Int(pageString)
                                else { return }
                                data.loadPage(nextPage)
                            }
                    }
                }
            }
            //.listStyle(PlainListStyle())
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }.onAppear{ data.loadPage(1) }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList(data: ScrollableViewModel()).preferredColorScheme(.dark)
    }
}
