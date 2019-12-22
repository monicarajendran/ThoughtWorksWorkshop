//
//  UserDefaultsService.swift
//  ThoughtWorksWorkshop
//
//  Created by Monica on 21/12/19.
//  Copyright © 2019 Monica. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case wishList
    
    var key: String {
        switch self {
            case .wishList:
                return "WishList"
        }
    }
}

class UserDefaultsService {
    
    private let kSuiteName = "group.io.monica.thoughtworksworkshop"
    
    static let shared = UserDefaultsService()
    
    var defaults: UserDefaults
    
    private init() {
        self.defaults = UserDefaults(suiteName: kSuiteName)!
    }
    
    //NOTE: Test purpose
    init?(suiteName: String) {
        guard suiteName != kSuiteName, suiteName != "io.monica.ThoughtWorksWorkshop" else { return nil } //Shouldn't create suite for these bundle id
        self.defaults = UserDefaults(suiteName: suiteName)!
    }
    
    //Setter
    func set(_ value: Any, forKey key: UserDefaultsKeys) {
        defaults.set(value, forKey: key.key)
        defaults.synchronize()
    }
    
    func set(_ value: Any, forKey key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    //Getter
    func get(forKey key: UserDefaultsKeys) -> Any? {
        return defaults.object(forKey: key.key)
    }
    func getData(forKey key: UserDefaultsKeys) -> Data? {
        return defaults.data(forKey: key.key)
    }
    func bool(forKey key: UserDefaultsKeys) -> Bool {
        return defaults.bool(forKey: key.key)
    }
    
    func string(forKey key: UserDefaultsKeys) -> String? {
        return defaults.string(forKey: key.key)
    }
    
    func integer(forKey key: UserDefaultsKeys) -> Int {
        return defaults.integer(forKey: key.key)
    }
    
    //Remove
    func remove(forKey key: UserDefaultsKeys) {
        defaults.removeObject(forKey: key.key)
    }
    
}
