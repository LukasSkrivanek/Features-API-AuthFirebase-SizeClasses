//
//  ContentView.swift
//  ApiCalls
//
//  Created by macbook on 31.07.2024.
//

import SwiftUI
import Combine



struct ContentView: View {
    @StateObject private var viewModel: UserViewModel
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    init(viewModel: UserViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        if horizontalSizeClass == .compact {
            VStack {
                List(viewModel.dataArray) { user in
                    Text(user.name)
                   
                }
                .onAppear {
                    viewModel.fetchData()
            }
            }
        } else {
                List(viewModel.dataArray) { user in
                    Text(user.name)
                        .foregroundStyle(.red)
                }
                .onAppear {
                    viewModel.fetchData()
            }
            
        }
    }
}
 


/*
struct ContentView: View {
    @StateObject private var viewModel = DataServiceAsyncStream()
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear{
            viewModel.fetchData()
            }
        }
    }
*/


#Preview {
    ContentView(viewModel: UserViewModel(apiService: DataServiceCombine()))
        
        
}
