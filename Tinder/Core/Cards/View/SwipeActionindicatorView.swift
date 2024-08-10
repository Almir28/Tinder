//
//  SwipeActionindicator.swift
//  Tinder
//
//  Created by Almir Khialov on 30.07.2024.
//

import SwiftUI

struct SwipeActionindicatorView: View {
    @Binding var xOffset: CGFloat
 
    
    
    
    
    var body: some View {
        HStack{
            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay{
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffset / SizeConstants.screenCutoff))
            
            Spacer()
            
            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay{
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffset / SizeConstants.screenCutoff) * -1)
        }
        .padding(45)
    }
}

#Preview {
    SwipeActionindicatorView(xOffset: .constant(20))
}
