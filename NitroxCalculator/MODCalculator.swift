//
//  MODCalculator.swift
//  NitroxCalculator
//
//  Created by Nikolay Zhekov on 07/03/2023.
//

import Foundation

class MODCalculator {
    /// Calculate Max Operating Depth (MOD)
    /// - Parameters:
    ///   - fO2: Fraction of Oxygen
    ///   - ppO2: Partial Pressure
    ///   - unit: Unit (Metric or Imperial)
    /// - Returns: MOD
    func calculateMOD(fO2: Double, ppO2: Double, unit: Unit) -> Double {
        var mod = (ppO2 / (fO2 / 100.0) - 1) * 10.0

        if unit == .imperial {
            mod *= 3.3
        }

        return round(mod)
    }
}
