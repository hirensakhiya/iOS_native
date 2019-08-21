//
//  ProfileViewModel.swift
//  MVVMTableviewDemo
//
//  Created by Qodors on 05/08/19.
//  Copyright © 2019 Qodors. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
    let profile: Profile
    
    // MARK - Initialization
    
    init(withProfile profile: Profile) {
        self.profile = profile
    }
    
    func timeForProfile() -> String {
        return stringFromTimeInterval(timeInterval: profile.duration)
    }
    
    private func stringFromTimeInterval(timeInterval: Double) -> String {
        let timeInterval = Int(timeInterval)
        
        let hours = (timeInterval / 3600)
        let seconds = (timeInterval % 60)
        let minutes = ((timeInterval / 60) % 60)
        
        if hours  > 0 {
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        } else {
            return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    func numberOfRowsForSegmentOfType(type: SegmentType) -> Int {
        var result = 1
        
        guard let segment = profile.segmentOfType(type: type) else { return result }
        
        switch type {
        case .WarmUp:
            result = segment.enabled ? 2 : 1
        default:
            result = 1
        }
        
        return result
    }
    
    func segmentOfTypeEnabled(type: SegmentType) -> Bool {
        guard let segment = profile.segmentOfType(type: type) else { return false }
        return segment.enabled
    }
    
    func timeForSegmentOfType(type: SegmentType) -> String {
        guard let segment = profile.segmentOfType(type: type) else { return "00:00" }
        return stringFromTimeInterval(timeInterval: segment.duration)
    }
}
