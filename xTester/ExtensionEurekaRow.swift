///  RowExtensions.swift
//  Protect
//
//  Created by Jack Patil on 3/28/17.
//  Copyright © 2017 Sea Pine Technologies. All rights reserved.
//

/// Extend the Row from the Eureka library
/// Allows us to specify max length for a field
/// On your Form, specify max length as follows
/// $0.maxLength = 5



import Eureka

var extensionPropertyStorage: [String: [String: Any]] = [:]

var maxLength_ = "maxLength"

extension Row {
  
  public var maxLength: Int? {
    get {
      return didSetMaxLength
    }
    set {
      didSetMaxLength = newValue
    }
  }
  
  private var didSetMaxLength: Int? {
    get {
      return extensionPropertyStorage[self.tag!]?[maxLength_] as? Int
    }
    set {
      var selfDictionary = extensionPropertyStorage[self.tag!] ?? [String: Any]()
      selfDictionary[maxLength_] = newValue
      extensionPropertyStorage[self.tag!] = selfDictionary
    }
  }
}
