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
    @Published var shouldShowCompletionPopup: Bool = false

    func syncChallengeState(from challenges: [Challenge], context: ModelContext) {
        var hasValid = false

        for challenge in challenges {
            if challenge.endDate < Date() {
                // ✅ 챌린지 종료 감지
                shouldShowCompletionPopup = true
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
