//
//  Challenge.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import Foundation
import SwiftData

@Model
class Challenge{
    var id : UUID
    var title : String
    var startDate : Date
    var endDate : Date
    var isDone : Bool
    @Relationship(deleteRule: .cascade)
    var tasks: [Task] = []
    
    init(title: String, startDate: Date, endDate: Date, isDone : Bool = false){
        self.id = UUID()
        self.title = title
        self.startDate = startDate
        self.endDate = endDate
        self.isDone = isDone
    }
}
