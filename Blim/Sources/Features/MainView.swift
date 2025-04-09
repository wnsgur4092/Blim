import SwiftUI

public struct MainView: View {
    @State private var showNewChallengeView : Bool = false
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack{
                Text("아직 챌린지가 없어요")
                Text("챌린지 만들기")
                
                Button {
                    showNewChallengeView = true
                } label: {
                    Text("챌린지 작성하기")
                }
                .buttonStyle(.borderedProminent)
                .sheet(isPresented: $showNewChallengeView) {
                    NewChallengeView()
                        .presentationDetents([.medium,.large])
                }
            }
            
        }
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


