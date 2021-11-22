//
//  UserDefaultsStorage.swift
//  MemoryCardsProject
//
//  Created by alaattinbulut on 15.11.2021.
//

import Foundation

@propertyWrapper
struct UserDefaultsStorage<T> {
  let key: String
  let defaultValue: T
 
  var wrappedValue: T {
    get {
      return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
    }
    set {
      UserDefaults.standard.set(newValue, forKey: key)
    }
  }
}


@propertyWrapper
struct UserDefaultsStorageForEnum<T: RawRepresentable> {
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            if let rawValue = UserDefaults.standard.object(forKey: key) as? T.RawValue {
                return T(rawValue: rawValue) ?? defaultValue
            }
            return defaultValue
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: key)
        }
    }
}





