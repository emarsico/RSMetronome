//
//  Sounds.swift
//
//  Created by Roel Spruit on 16/10/15.
//  Copyright © 2015 DinkyWonder. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

struct SoundSet {
    
    let downBeat: Sound
    let upBeat: Sound
    let beat: Sound
    
    static var clave = SoundSet(
        downBeat: Sound(fileName: "tick"),
        upBeat: Sound(fileName: "tock"),
        beat: Sound(fileName: "tock")
    )
    
    static var cowbell = SoundSet(
        downBeat: Sound(fileName: "bleep"),
        upBeat: Sound(fileName: "bleep"),
        beat: Sound(fileName: "bleep")
    )
    
    func soundForBeatType(beatType: BeatType) -> Sound {
        switch beatType {
            case .DownBeat: return downBeat
            case .UpBeat: return upBeat
            default: return beat
        }
    }
}

class Sound {
    
    private var audioPlayer: AVAudioPlayer?
    
    init(fileName: String) {
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "caf") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error initializing AVAudioPlayer: \(error)")
            }
        }
    }
    
    func play() {
        audioPlayer?.play()
    }
    
    func stop() {
        audioPlayer?.stop()
    }
}

