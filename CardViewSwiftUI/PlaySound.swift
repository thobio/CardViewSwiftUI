//
//  PlaySound.swift
//  CardViewSwiftUI
//
//  Created by Zerone on 06/01/20.
//  Copyright © 2020 Zerone. All rights reserved.
//

import AVFoundation
import Foundation

//MARK:- AUDIO PLAYER

var audioPlayer:AVAudioPlayer?

func playSound(sound:String,type:String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Could not find the paly the sound file")
        }
    }
}
