//
//  NewChallengeView.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import SwiftUI
import SwiftData

struct NewChallengeView: View {
    @ObservedObject var viewModel: NewChallengeViewModel
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack(spacing: 16) {
            GroupBox {
                TextField("예: 영어 공부하기", text: $viewModel.title)
                    .textFieldStyle(.roundedBorder)

                DatePicker("시작일", selection: $viewModel.startDate, displayedComponents: [.date])
                DatePicker("종료일", selection: $viewModel.endDate, displayedComponents: [.date])
            } label: {
                Label("새로운 챌린지", systemImage: "flag")
                    .foregroundStyle(.pink)
            }

            Button("챌린지 시작") {
                viewModel.createChallenge(context: context) {
                    dismiss()
                }
            }
            .disabled(viewModel.title.isEmpty)
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    NewChallengeView(viewModel: NewChallengeViewModel())
}
