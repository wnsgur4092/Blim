import SwiftUI
import SwiftData

struct MainView: View {
    @Query private var challenges: [Challenge]
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = MainViewModel()
    @State private var showSheet = false

    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                if let challenge = viewModel.activeChallenge {
                    ChallengeCardView(challenge: challenge)
                } else if viewModel.hasNoChallenge {
                    emptyState
                }
            }
            .padding()
            .navigationTitle("Blim")
            .onAppear {
                viewModel.syncChallengeState(from: challenges, context: context)
            }
            .sheet(isPresented: $showSheet) {
                let newVM = NewChallengeViewModel()
                NewChallengeView(viewModel: newVM)
                    .presentationDetents([.medium, .large])
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


