//
//  CardStackView.swift
//  Tinder
//
//  Created by Almir Khialov on 02.08.2024.
//

import SwiftUI

struct CardStackView: View {
    @State private var showMatchView = false
    @StateObject var viewModel = CardsViewModel(service: CardService())
    @EnvironmentObject var matchManager: MatchManager

    
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 16){
                    ZStack{
                        ForEach(viewModel.cardModels) { card in
                            CardView(viewModel: viewModel, model:card)
                        }
                    }
                    if !viewModel.cardModels.isEmpty {
                        SwipeActionButtonsView(viewModel: viewModel)
                    }
                }
                
                .blur(radius: showMatchView ? 20 : 0)

                if showMatchView {
                    userMatchesView(show: $showMatchView)
                }
            }
            .animation(.easeInOut, value: showMatchView)
            .onReceive(matchManager.$matchedUser) { user in
                showMatchView = user != nil
            }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image("tinderLogo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 88)
                    }
            }
        }
    }
}


#Preview {
    CardStackView()
        .environmentObject(MatchManager())
}
