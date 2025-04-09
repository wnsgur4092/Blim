//
//  NewChallengeViewModel.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import Foundation
import SwiftData

final class NewChallengeViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()

    func createChallenge(context: ModelContext, onSuccess: () -> Void) {
        guard !title.isEmpty, startDate <= endDate else { return }

        let challenge = Challenge(title: title, startDate: startDate, endDate: endDate)

        context.insert(challenge)
        try? context.save()

        // ✅ 콘솔 출력
        print("✅ 새로운 챌린지 생성됨:")
        print("📌 제목: \(challenge.title)")
        print("📆 기간: \(challenge.startDate.formatted()) ~ \(challenge.endDate.formatted())")
        print("🆔 ID: \(challenge.id)")

        onSuccess()
    }
}
