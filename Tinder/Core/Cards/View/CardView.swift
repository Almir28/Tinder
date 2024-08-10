//
//  CardView.swift
//  Tinder
//
//  Created by Almir Khialov on 22.07.2024.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var matchManager: MatchManager
    @ObservedObject var viewModel: CardsViewModel
    
    
    @State private var xOffset: CGFloat = 0
    @State private var degrees: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModal = false
    
  
    let model: CardModel
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top){
                Image(user.profileImageURL[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount)
                    }
                CardImageIndicatorView(currentImageIndex: currentImageIndex, imageCount: imageCount)
                
                SwipeActionindicatorView(xOffset: $xOffset)
            }
                
            UserInfoView(showProfileModal: $showProfileModal, user: user)
            }
        .fullScreenCover(isPresented: $showProfileModal) {
            UserProfileView(user: user)
        }
        
        .onReceive(viewModel.$buttonSwipeAction, perform: {action in
            onRecieveSwipeAction(action)
            
            
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(x: xOffset)
            .rotationEffect(.degrees(degrees))
            .animation(.snappy, value: xOffset)
            .gesture(
                DragGesture()
                    .onChanged(onDragChanged)
                    .onEnded(onDragEnded)
            )
        }
    }

private extension CardView {
    var user: User {
        return model.user
    }
    var imageCount: Int {
        return user.profileImageURL.count
    }
}
private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degrees = 0
    }
    func swipeRight () {
        withAnimation {
            xOffset = 500
            degrees = 12
        }completion: {
            viewModel.removerCard(model)
            matchManager.checkForMatch(withUser: user)
        }
    }
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degrees = -12
        }completion: {
            viewModel.removerCard(model)
        }
    }
    func onRecieveSwipeAction(_ action: SwipeAction?) {
        guard let action else {return}
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case.reject:
                swipeLeft()
            case.like:
                swipeRight()
            }
        }
    }
}
    
    private extension CardView {
        func onDragChanged(_ value: DragGesture.Value) {
            xOffset = value.translation.width
            degrees = Double(value.translation.width / 25)
        }
        
        func onDragEnded(_ value: DragGesture.Value) {
            let width = value.translation.width
            
            if abs(width) <= abs(SizeConstants.screenCutoff) {
                returnToCenter()
return            }
            if width >= SizeConstants.screenCutoff {
                swipeRight()
            }else{
                swipeLeft()
            }
        }
    }


#Preview {
    CardView(
        viewModel: CardsViewModel(service: CardService()),
        model: CardModel(user: MockData.users[1])
    )
}
