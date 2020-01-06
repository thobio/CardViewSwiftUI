//
//  CardModel.swift
//  CardViewSwiftUI
//
//  Created by Zerone on 06/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import SwiftUI

//MARK: - CARD MODEL

struct Card:Identifiable {
    var id = UUID()
    var title:String
    var headline:String
    var imageName:String
    var callToAction:String
    var message:String
    var gradientColors: [Color]
}
