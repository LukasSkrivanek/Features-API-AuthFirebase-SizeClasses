//
//  ApiCallsApp.swift
//  ApiCalls
//
//  Created by macbook on 31.07.2024.
//

import SwiftUI
import SwiftData
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct ShowMeFunctions: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            //ContentView(viewModel: UserViewModel(apiService: DataServiceCombine()))
           // PersonView()
               // .modelContainer(for: [Person.self])
            
            MainView()
                .environmentObject(viewModel)
        }
    }
}
