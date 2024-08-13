//
//  DataServiceAsyncAwait.swift
//  ApiCalls
//
//  Created by macbook on 31.07.2024.
//

import Foundation

class DataServiceAsyncAwait: ObservableObject {
    
    @Published var users: [UserDatabase] = []
    
    func fetchData() {
        Task {
            await fetchUsers()
        }
    }
    
    private func fetchUsers() async {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([UserDatabase].self, from: data)
            await MainActor.run {
                self.users = users
            }
        } catch {
            print("Error fetching users: \(error)")
        }
    }
}
