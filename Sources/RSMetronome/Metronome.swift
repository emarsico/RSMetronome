//
//  Metronome.swift
//
//  Created by Roel Spruit on 16/10/15.
//  Copyright © 2015 DinkyWonder. All rights reserved.
//

import Foundation

public class Metronome {

    public var settings: Settings = Settings() {
        didSet{
            patternPlayer?.settings = settings
        }
    }
    
    var beatListener: ((_ beatType: BeatType, _ index: Int) -> ())?
    var stateListener: ((_ playing: Bool) -> ())?
    
    private var patternPlayer: PatternPlayer?
    private var soundSet = SoundSet.clave
    
    public init(stateListener: ((_ playing: Bool) -> ())? = nil, beatListener: ((_ beatType: BeatType, _ index: Int) -> ())? = nil){
        self.beatListener = beatListener
        self.stateListener = stateListener
    }
    
    /// Start the metronome
    public func start(){
        
        // Make sure it's stopped first
        stop()
        
        patternPlayer = PatternPlayer(settings: settings, soundSet: soundSet)
        patternPlayer?.stateListener = stateListener
        patternPlayer?.beatListener = beatListener
        patternPlayer?.play()
    }
    
    /// Stop the metronome
    public func stop(){
        
        if let player = patternPlayer {
            player.stop()
        }
    }
    
    /// Toggle the playing of the metronome
    public func toggle(){
        
        if isPlaying {
            stop()
        }else{
            start()
        }
    }
    
    /// Returns a boolean indicating if the metronome is currently playing
    public var isPlaying: Bool {
        
        if let player = patternPlayer {
            return player.isPlaying
        }
        
        return false
    }
    
}
