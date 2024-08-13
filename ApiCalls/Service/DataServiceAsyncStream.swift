//
//  DataServiceAsyncStream.swift
//  ApiCalls
//
//  Created by macbook on 31.07.2024.
//

import Foundation

class DataServiceAsyncStream: ObservableObject {
    @Published var users: [UserDatabase] = []
    
    func fetchData() {
        Task {
            for await newUsers in fetchUsers() {
                DispatchQueue.main.async {
                    self.users = newUsers
                }
            }
        }
    }
    func fetchUsers() -> AsyncStream<[UserDatabase]> {
        return AsyncStream { continuation in
            Task {
                guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
                    continuation.finish()
                    return
                }
                do {
                    let (data, response) = try await URLSession.shared.data(from: url)
                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode >= 400 && httpResponse.statusCode < 500  {
                            let users = try JSONDecoder().decode([UserDatabase].self, from: data)
                            continuation.yield(users)
                            continuation.finish()
                        }
                    }
                } catch {
                    print("Error fetching users: \(error)")
                    continuation.finish()
                }
            }
        }
    }
}
