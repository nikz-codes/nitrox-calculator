//
//  MODCalculatorView.swift
//  NitroxCalculator
//
//  Created by Nikolay Zhekov on 07/03/2023.
//

import SwiftUI

struct MODCalculatorView: View {
    private let animationDuration = 0.4
    private let calculator = MODCalculator()

    @AppStorage("unit") var unit: Unit = Unit.metric
    @State var ppO2: Double = 1.4
    @State var fO2: Double = 21
    @State var mod: Double = 0

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text("Max Operating Depth")
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding(4)
                Text("for").light()
                if fO2 == 21 {
                    Text("Air")
                        .strong()
                } else if fO2 == 100 {
                    Text("Oxygen")
                        .strong()
                } else {
                    Text("EAN \(fO2, specifier: "%0.0f")")
                        .strong()
                }
                Text("is").light()
                Text("\(mod, specifier: "%0.0f") \(unit == .metric ? "meters" : "feet")").strong()

                Slider(
                    value: $fO2.animation(.easeInOut(duration: animationDuration)),
                    in: 21...100,
                    step: 1)
                    .padding()
                    .onChange(of: fO2) { _ in
                    updateMOD()
                }

                Text("with ppO₂").font(.subheadline)

                Picker("ppO2", selection: $ppO2) {
                    Text("1.4").tag(1.4)
                    Text("1.5").tag(1.5)
                    Text("1.6").tag(1.6)
                }
                    .onChange(of: ppO2) { _ in
                    updateMOD()
                }
                    .pickerStyle(.segmented)
                    .padding()
            }
            Spacer()
        }.onAppear {
            updateMOD()
        }
    }

    func updateMOD() {
        withAnimation(.easeInOut(duration: animationDuration)) {
            self.mod = self.calculator.calculateMOD(fO2: fO2, ppO2: ppO2, unit: unit)
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
