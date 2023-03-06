//
//  Model.swift
//  NitroxCalculator
//
//  Created by Nikolay Zhekov on 07/03/2023.
//

import Foundation

enum Unit: String, CaseIterable, Identifiable {
    case metric = "Metric"
    case imperial = "Imperial"

    var id: Self { self }
}
