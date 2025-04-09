//
//  Challenge.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import Foundation
import SwiftData

@Model
class Challenge {
    var id: UUID
    var title: String
    var startDate: Date
    var endDate: Date

    init(title: String, startDate: Date, endDate: Date) {
        self.id = UUID()
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
    }

    var isExpired: Bool {
        endDate < Date()
    }
}
