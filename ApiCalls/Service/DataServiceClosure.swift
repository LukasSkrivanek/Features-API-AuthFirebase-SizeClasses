//
//  DataServiceClosure.swift
//  ApiCalls
//
//  Created by macbook on 31.07.2024.
//

import Foundation

class DataServiceClosure: ObservableObject {
    @Published var users: [UserDatabase] = []
    
    func fetchUsers(completion: @escaping ([UserDatabase]) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let users = try JSONDecoder().decode([UserDatabase].self, from: data)
                    DispatchQueue.main.async {
                        completion(users)
                    }
                } catch {
                    print("Error decoding users: \(error)")
                }
            } else if let error = error {
                print("Error fetching users: \(error)")
            }
        }.resume()
    }
}
