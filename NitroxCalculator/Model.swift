//
//  Model.swift
//  NitroxCalculator
//
//  Created by Nikolay Zhekov on 22/02/2023.
//

import Foundation

enum Unit: String, CaseIterable, Identifiable {
    case metric = "Metric"
    case imperial = "Imperial"

    var id: Self { self }
}
