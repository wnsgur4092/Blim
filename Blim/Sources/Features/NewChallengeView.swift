//
//  NewChallengeView.swift
//  Blim
//
//  Created by jun on 4/9/25.
//

import SwiftUI

struct NewChallengeView: View {
    @State var challenge: String = ""
    @State var startDate: Date = Date()
    @State var endDate : Date = Date()
    
    var body: some View {
        VStack{
            GroupBox{
                TextField("예: 영어공부하기!", text: $challenge)
                    .textFieldStyle(.roundedBorder)
                
                DatePicker("시작", selection: $startDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                DatePicker("종료", selection: $endDate, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
            } label: {
                Label("새로운 챌린지", systemImage: "figure.run")
                    .foregroundStyle(.pink)
            }
            
            HStack{
                Button {
                    print("챌린지 시작 버튼 클릭")
                } label: {
                    Text("챌린지 시작")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
            }
            
            
        }
        .padding()
    }
}

#Preview {
    NewChallengeView()
}
