//
//  MainViewModel.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import Foundation
import SwiftData

final class MainViewModel: ObservableObject {
    @Published var selectedChallenge: Challenge?
    @Published var isChallengeActive: Bool = false

    func updateChallengeStatus(challenges: [Challenge], context: ModelContext) {
        if let challenge = challenges.first {
            selectedChallenge = challenge

            // 종료일 경과 시 자동 완료 처리
            if !challenge.isDone && challenge.endDate < Date() {
                challenge.isDone = true
                try? context.save()
            }

            isChallengeActive = !challenge.isDone
        } else {
            selectedChallenge = nil
            isChallengeActive = false
        }
    }
}
