//
//  TrainerApp.swift
//  Trainer
//
//  Created by user on 2022/05/08.
//

import SwiftUI
import Firebase

class AppDelegate : NSObject , UIApplicationDelegate {
    private func application(_ application : UIApplication , didFinishLaunchingOptions launchOptions : [UIApplication.LaunchOptionsKey :Any]?) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}


@main
struct TrainerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
