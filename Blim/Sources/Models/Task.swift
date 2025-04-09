//
//  Task.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import Foundation
import SwiftData

@Model
class Task{
    var id : UUID
    var title : String
    var createdAt : Date
    var challenge : Challenge?
    
    init(title: String, challenge: Challenge? = nil){
        self.id = UUID()
        self.title = title
        self.createdAt = Date()
        self.challenge = challenge
    }
}
