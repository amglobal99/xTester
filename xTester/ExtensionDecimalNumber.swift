//
//  ExtensionDecimalNumber.swift
//  xTester
//
//  Created by Dad on 1/14/17.
//  Copyright © 2017 Natsys. All rights reserved.
//

import Foundation


extension NSDecimalNumber: Comparable {


static public func ==(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
  return lhs.compare(rhs) == .orderedSame
}

static public func <(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
  return lhs.compare(rhs) == .orderedAscending
}

// MARK: - Arithmetic Operators
static public prefix func -(value: NSDecimalNumber) -> NSDecimalNumber {
  return value.multiplying(by: NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true))
}

static public func +(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
  return lhs.adding(rhs)
}

static public func -(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
  return lhs.subtracting(rhs)
}

static public func *(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
  return lhs.multiplying(by: rhs)
}

static public func /(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
  return lhs.dividing(by: rhs)
}

static public func ^(lhs: NSDecimalNumber, rhs: Int) -> NSDecimalNumber {
  return lhs.raising(toPower: rhs)
}




}
