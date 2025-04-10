import SwiftUI
import SwiftData

struct MainView: View {
    @Query private var challenges: [Challenge]
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = MainViewModel()
    @State private var showSheet = false
    @State private var showDeleteAlert = false
    @State private var challengeToDelete: Challenge?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                if let challenge = viewModel.activeChallenge {
                    ChallengeCardView(challenge: challenge) {
                        challengeToDelete = challenge
                        showDeleteAlert = true
                    }
                    .alert("🧹 챌린지를 삭제할까요?", isPresented: $showDeleteAlert) {
                        Button("삭제", role: .destructive) {
                            if let challenge = challengeToDelete {
                                viewModel.deleteChallenge(challenge, context: context)
                            }
                        }
                        Button("취소", role: .cancel) { }
                    } message: {
                        Text("너무 어려운 도전이었나요?\n괜찮아요, 더 간단한 목표를 지정해봐요!")
                    }
                } else if viewModel.hasNoChallenge {
                    emptyState
                }
            }
            .padding()
            .navigationTitle("Blim")
            .onAppear {
                viewModel.syncChallengeState(from: challenges, context: context)
            }
            .onChange(of: challenges) { newChallenges in
                viewModel.syncChallengeState(from: newChallenges, context: context)
            }
            
            .sheet(isPresented: $showSheet) {
                let newVM = NewChallengeViewModel()
                NewChallengeView(viewModel: newVM)
                    .presentationDetents([.medium, .large])
            }
            .alert("🎉 챌린지 완료!", isPresented: $viewModel.shouldShowCompletionPopup) {
                Button("새로운 챌린지 시작하기") {
                    showSheet = true
                }
            } message: {
                Text("정말 멋져요! 챌린지를 끝냈어요.\n새로운 도전을 시작해볼까요?")
            }
            
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Text("계획하신 챌린지가 없어요!\n챌린지를 시작해보아요!")
                .multilineTextAlignment(.center)
                .font(.headline)
            
            Button("챌린지 생성") {
                showSheet = true
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


