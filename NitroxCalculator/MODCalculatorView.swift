//
//  MODCalculatorView.swift
//  NitroxCalculator
//
//  Created by Nikolay Zhekov on 22/02/2023.
//

import SwiftUI

struct MODCalculatorView: View {
    @AppStorage("unit") var unit: Unit = Unit.metric
    @State var ppO2: Double = 1.4
    @State var fO2: Double = 21

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Max Operating Depth")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(4)
                Text("for").light()
                Text("EAN \(fO2, specifier: "%0.0f")").strong()
                Text("is").light()
                Text("? \(unit == .metric ? "meters" : "feet")").strong()

                Slider(
                    value: $fO2,
                    in: 21...100,
                    step: 1)
                    .padding()

                Text("with ppO₂").font(.subheadline)

                Picker("ppO2", selection: $ppO2) {
                    Text("1.4").tag(1.4)
                    Text("1.5").tag(1.5)
                    Text("1.6").tag(1.6)
                }
                    .pickerStyle(.segmented)
                    .padding()
            }
            Spacer()
        }
    }
}

extension Text {
    func strong() -> some View {
        self.font(.title)
            .fontWeight(.bold)
            .padding(4)
    }

    func light() -> some View {
        self.font(.title2)
            .padding(4)
    }
}

struct MODCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MODCalculatorView()
    }
}
