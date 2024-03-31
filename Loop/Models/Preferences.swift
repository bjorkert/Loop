//
//  Preferences.swift
//  Loop
//
//  Created by Jonas Björkert on 2024-01-27.
//  Copyright © 2024 LoopKit Authors. All rights reserved.
//

import Foundation
import LoopKit

struct Preferences : PreferencesProvider {
    
    static var shared = Preferences()
    
    private init() {}
    
    // Maximum Future Time for Carb Entries
    var maxCarbEntryFutureTime: TimeInterval {
        get {
            // Check if a custom value has been set by the user
            let key = "maxCarbEntryFutureTime"
            if UserDefaults.standard.object(forKey: key) != nil {
                // Fetch and return the custom value
                return UserDefaults.standard.double(forKey: key)
            } else {
                // Fallback to the default value defined in LoopConstants
                return LoopConstants.maxCarbEntryFutureTime
            }
        }
        set {
            // Validate and save the new value to UserDefaults
            // Ensure the value is within a reasonable range, not allowing negative values
            let key = "maxCarbEntryFutureTime"
            let validatedValue = max(0, newValue)
            UserDefaults.standard.set(validatedValue, forKey: key)
        }
    }
}
