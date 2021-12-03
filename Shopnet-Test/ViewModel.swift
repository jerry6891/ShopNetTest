//
//  ViewModel.swift
//  Shopnet-Test
//
//  Created by Gerardo Lozano on 12/2/21.
//

import Foundation
import Combine

class ViewModel {
    // Starts the Method of 'GET' the Users
    func getCharacter(completion: @escaping ([Model]) -> ()) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        // Initializes the Error Enumeration
        enum MyError: Error {
            case FoundNil(String)
        }
        
        // Starts the URL Session
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            do {
                if let responseData = data {
                    let users = try JSONDecoder().decode(RAMMResponse.self, from: responseData)
                    print(users)
                    
                    // Stars the Asynchronous Process
                    DispatchQueue.main.async {
                        completion(users.results)
                    }
                }
                // Throws the Error is Any
                throw MyError.FoundNil("officialUsers")
                
                // Catches the Error if Any
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
