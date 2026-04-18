//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by JENNA on 4/11/26.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
