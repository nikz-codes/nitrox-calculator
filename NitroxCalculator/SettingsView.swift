//
//  SettingsView.swift
//  NitroxCalculator
//
//  Created by Nikolay Zhekov on 07/03/2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("unit") var unit: Unit = Unit.metric

    var body: some View {
        NavigationStack {
            Form {
                Picker("Unit", selection: $unit) {
                    ForEach(Unit.allCases, id: \.self) { value in
                        Text(value.rawValue).tag(value)
                    }
                }
            }
                .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
