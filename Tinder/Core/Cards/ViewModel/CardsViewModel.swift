//
//  CardsViewModel.swift
//  Tinder
//
//  Created by Almir Khialov on 02.08.2024.
//

import Foundation
@MainActor
class CardsViewModel: ObservableObject {
    @Published var cardModels = [CardModel]()
    @Published var buttonSwipeAction: SwipeAction?
    
    private let service: CardService
    
    init(service:CardService){
        self.service = service
        Task { await fetchCardModel()}
    }
    
    func fetchCardModel() async {
        do{
            self.cardModels = try await service.fetchCardModels()
        } catch {
            print("DEBUG: Failed to fetch cards with error: \(error)")
        }
    }
    func removerCard(_ card: CardModel) {
            guard let index = cardModels.firstIndex(where: {$0.id == card.id }) else { return }
            cardModels.remove(at: index)
        }
    }

