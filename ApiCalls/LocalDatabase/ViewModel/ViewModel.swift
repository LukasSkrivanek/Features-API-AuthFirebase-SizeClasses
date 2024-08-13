//
//  ViewModel.swift
//  ApiCalls
//
//  Created by macbook on 31.07.2024.
//

import Foundation
import Combine

protocol APIService {
    func fetchUsers() -> AnyPublisher<[UserDatabase], Error>
}



class UserViewModel: ObservableObject{
    @Published var dataArray : [UserDatabase] = []
    private var apiService: APIService
    var cancellables = Set<AnyCancellable>()
    
    init(apiService: APIService) {
        self.apiService = apiService
        fetchData()
    }
    
    
    
    func fetchData() {
        apiService.fetchUsers()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedData in
                self?.dataArray = returnedData
            }
            .store(in: &cancellables)
           

        
    }
    
    }

