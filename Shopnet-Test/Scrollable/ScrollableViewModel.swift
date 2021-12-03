//
//  ScrollableViewModel.swift
//  Shopnet-Test
//
//  Created by Rex Karnufex on 12/3/21.
//

import Foundation
import Combine

class ScrollableViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var responses: [(page: Int, element: ScrollableModel)] = []
    
    func loadPage(_ page: Int) {
        if responses.contains(where: { $0.page == page }) {}
        let url = URL(string: "https://rickandmortyapi.com/api/character/?page=\(page == 1 ? 1 : page)")
        
        if let mainUrl = url {
            var request = URLRequest(url: mainUrl)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTaskPublisher(for: request)
                .map{ $0.data }
                .removeDuplicates()
                .decode(type: ScrollableModel.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        print("\(error)")
                    }
                }, receiveValue: { response in
                    self.responses.insert((page, response), at: page - 1)
                }).store(in: &cancellables)
        }
        
    }
}
