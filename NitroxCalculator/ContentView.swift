//
//  ContentView.swift
//  NitroxCalculator
//
//  Created by Nikolay Zhekov on 18/02/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MODCalculatorView().tabItem {
                Label("MOD", systemImage: "gauge")
            }

            SettingsView().tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
