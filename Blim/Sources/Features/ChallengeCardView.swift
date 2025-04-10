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
    @Environment(\.modelContext) private var context
    var onDelete: (() -> Void)?   // ✅ 삭제 핸들러
    @State private var taskText: String = ""

    var body: some View {
        VStack(spacing: 16) {
            // ✅ 상단 챌린지 카드
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("📌 나의 챌린지")
                        .font(.caption)
                        .foregroundStyle(.gray)

                    Spacer()

                    // ✅ 삭제 버튼만 표시
                    Button {
                        onDelete?()
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }

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

            Spacer()

            // ✅ 하단 Task 입력 (Underline 스타일)
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    TextField("오늘의 계획을 입력하세요", text: $taskText)
                        .font(.body)
                        .padding(.vertical, 8)
                        .overlay(
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(.gray),
                            alignment: .bottom
                        )
                }

                Button {
                    addTask()
                } label: {
                    Image(systemName: "paperplane.fill")
                        .font(.title2)
                }
                .disabled(taskText.isEmpty)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
    }

    private func addTask() {
        let newTask = Task(title: taskText, challenge: challenge)
        context.insert(newTask)
        try? context.save()
        taskText = ""
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
