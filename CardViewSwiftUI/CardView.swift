//
//  CardView.swift
//  CardViewSwiftUI
//
//  Created by Zerone on 06/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import SwiftUI

struct CardView: View {
    //MARK:- Properties
    var card:Card
    
    @State private var fadeIn:Bool = false
    @State private var moveDownward:Bool = false
    @State private var moveUpward:Bool = false
    @State private var showAlert: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    //MARK:- Card
    var body: some View {
        ZStack{
            Image(card.imageName)
                .opacity(fadeIn ? 1.0 : 0.0)
            VStack{
                Text(card.title)
                    .foregroundColor(Color.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                Text(card.headline)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                .italic()
            }
            .offset(y:moveDownward ? -218 : -300)
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                self.hapticImpact.impactOccurred()
                self.showAlert.toggle()
            }) {
                HStack {
                    Text(card.callToAction)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .accentColor(Color.white)
                    Image(systemName: "arrow.right.circle")
                        .font(Font.title.weight(.medium))
                        .accentColor(Color.white)
                }.padding(.vertical)
                    .padding(.horizontal,24)
                    .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y:moveUpward ? 210 : 300)
        }.frame(width: 355, height: 545)
            .background(LinearGradient(gradient: Gradient(colors: card.gradientColors), startPoint: .top, endPoint: .bottom))
        .shadow(radius: 8)
        .cornerRadius(16)
            .onAppear(){
                withAnimation(.linear(duration: 1.2)) {
                    self.fadeIn.toggle()
                }
                withAnimation(.linear(duration: 0.8)) {
                    self.moveDownward.toggle()
                    self.moveUpward.toggle()
                }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(card.title), message: Text(card.message), dismissButton: .default(Text("OK")))
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardData[1])
            .previewLayout(.sizeThatFits)
    }
}
