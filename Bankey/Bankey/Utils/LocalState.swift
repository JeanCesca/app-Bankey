//
//  LocalState.swift
//  Bankey
//
//  Created by Jean Ricardo Cesca on 28/07/22.
//

import Foundation

public class LocalState {
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "hasOnboarded")
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: "hasOnboarded")
        }
    }
}
