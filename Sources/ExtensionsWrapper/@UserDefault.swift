//
//  @UserDefault.swift
//  
//
//  Created by polykuzin on 15/11/2022.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    public var wrappedValue : T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
            UserDefaults.standard.synchronize()
        }
    }
    
    private let key : String
    
    private let defaultValue : T
}
