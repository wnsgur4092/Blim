//
//  ChallengeCardView.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import Foundation
import SwiftUI

struct ChallengeCardView: View {
    let challenge: Challenge

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("📌 나의 챌린지")
                .font(.caption)
                .foregroundStyle(.gray)

            Text(challenge.title)
                .font(.title2.bold())

            Text("\(challenge.startDate.formatted()) ~ \(challenge.endDate.formatted())")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.thinMaterial)
        .cornerRadius(16)
        .shadow(radius: 4)
    }
}

#Preview {
    ChallengeCardView(
        challenge: Challenge(
            title: "화이팅",
            startDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 5))!,
            endDate: Calendar.current.date(from: DateComponents(year: 2025, month: 4, day: 30))!
        )
    )
}
