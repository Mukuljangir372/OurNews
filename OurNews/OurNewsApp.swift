//
//  OurNewsApp.swift
//  OurNews
//
//  Created by Mukul Jangir on 03/06/22.
//

import SwiftUI

/**
 @main - This defines the entry point of your app
 App - This is a application class used for having application propertices
 
 Scene - Scenes are the building blocks of SwiftUI. Theses defines How your app
 looks in different IOS platforms like mac, iphone etc.
 WindowGroup is basically used for phone screens. You can create your own scence
 if you are working with Mac apps in SWIFTUI.
 
 */
@main
struct OurNewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
