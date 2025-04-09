import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    @Query private var challenges: [Challenge]
    @Environment(\.modelContext) private var context
    @State private var showSheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                if let challenge = viewModel.selectedChallenge {
                    if challenge.isDone {
                        Text("⏰ 챌린지가 종료되었습니다.")
                            .foregroundStyle(.red)
                    } else {
                        VStack {
                            Text("📌 진행 중 챌린지")
                            Text(challenge.title)
                            Text("\(challenge.startDate.formatted()) ~ \(challenge.endDate.formatted())")
                        }
                    }
                } else {
                    Text("아직 챌린지가 없어요")
                }
                
                Button("도전 시작하기") {
                    showSheet = true
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Blim")
            .onAppear {
                viewModel.updateChallengeStatus(challenges: challenges, context: context)
            }
            .sheet(isPresented: $showSheet) {
                NewChallengeView(viewModel: NewChallengeViewModel())
                    .presentationDetents([.medium,.large])
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


