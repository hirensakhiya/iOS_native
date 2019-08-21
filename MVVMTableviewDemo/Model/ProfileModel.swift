//
//  ProfileModel.swift
//  MVVMTableviewDemo
//
//  Created by Qodors on 05/08/19.
//  Copyright © 2019 Qodors. All rights reserved.
//

import Foundation

class Profile {
    var name = "Profile"
    var segments = [Segment]()
    var duration: TimeInterval = 450.0
    
    init() {
        // Create Main Segment
        let segment = Segment(type: .Main)
        
        // Add Segment to Profile
        self.segments.append(segment)
    }
    
    func segmentOfType(type: SegmentType) -> Segment? {
        var result: Segment? = nil
        
        for segment in segments {
            if segment.type == type {
                result = segment
            }
        }
        
        return result
    }
    
}

enum SegmentType {
    case Main
    case WarmUp
    case CoolDown
}

class Segment {
    var enabled: Bool
    var type: SegmentType
    var sounds = [Sound]()
    var duration: Double = 300
    
    init(type: SegmentType) {
        self.type = type
        self.enabled = true
    }
    
    func soundOfType(type: SoundType) -> Sound? {
        var result: Sound? = nil
        
        for sound in sounds {
            if sound.type == type {
                result = sound
            }
        }
        
        return result
    }
    
}
enum SoundType {
    case Repeat
    case Begin
    case End
}

class Sound {
    var enabled: Bool
    var type: SoundType
    var name: String = ""
    var iterations: Int = 0
    var timeInterval: Double = 300
    
    // MARK - Initialization
    
    init(type: SoundType) {
        self.type = type
        self.enabled = true
    }
    
}
