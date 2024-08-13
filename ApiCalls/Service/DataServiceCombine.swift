//
//  DataServiceCombine.swift
//  ApiCalls
//
//  Created by macbook on 31.07.2024.
//

import Foundation
import Combine

class DataServiceCombine: ObservableObject, APIService {
    
    
    func fetchUsers() -> AnyPublisher<[UserDatabase], any Error> {
        let urlSession = URLSession.shared
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        return urlSession.dataTaskPublisher(for: url)
            .tryMap { output in
                // Check for valid response and data
                guard let response = output.response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .decode(type: [UserDatabase].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}
