//
//  MainViewModel.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import Foundation
import SwiftData

final class MainViewModel: ObservableObject {
    @Published var activeChallenge: Challenge? = nil
    @Published var hasNoChallenge: Bool = true

    func syncChallengeState(from challenges: [Challenge], context: ModelContext) {
        // 진행 가능한 챌린지만 남기고 나머지 삭제
        var hasValid = false

        for challenge in challenges {
            if challenge.endDate < Date() {
                context.delete(challenge)
            } else {
                activeChallenge = challenge
                hasValid = true
            }
        }

        try? context.save()
        hasNoChallenge = !hasValid
    }
}
