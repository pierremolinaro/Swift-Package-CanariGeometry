//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 09/05/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// struct CanariLength
//--------------------------------------------------------------------------------------------------

public struct CanariLength : Comparable, Hashable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public let cuValue : Int

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (cu inValue : Int) {
    self.cuValue = inValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (cu inValue : Double) {
    self.cuValue = Int (inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt inValue : Int) {
    self.cuValue = inValue * CanariLengthUnit.pt.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt inValue : Double) {
    self.cuValue = Int (inValue * Double (CanariLengthUnit.pt.cuValue))
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Double, in inLengthUnit : CanariLengthUnit) {
    self.cuValue = Int (inValue * Double (inLengthUnit.cuValue))
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Int, in inLengthUnit : CanariLengthUnit) {
    self.cuValue = inValue * inLengthUnit.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  internal init (adding inA : CanariLength, _ inB : CanariLength) {
    self.cuValue = inA.cuValue + inB.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariLength, multipliedByDouble inOperand : Double) {
    self.cuValue = Int (inOperand * Double (inFactor.cuValue))
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariLength, multipliedByInt inOperand : Int) {
    self.cuValue = inOperand * inFactor.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero     : Bool { self.cuValue == 0 }
  public var isPositive : Bool { self.cuValue >  0 }
  public var isNegative : Bool { self.cuValue <  0 }
  public var isPositiveOrZero : Bool { self.cuValue >= 0 }
  public var isNegativeOrZero : Bool { self.cuValue <= 0 }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static var zero : CanariLength { CanariLength (pt: 0.0) }
  public static var max  : CanariLength { CanariLength (cu: .max / 2) }
  public static var min  : CanariLength { CanariLength (cu: .min / 2) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func m    (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .m) }
  public static func cm   (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .cm) }
  public static func mm   (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .mm) }
  public static func µm   (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .µm) }
  public static func inch (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .inch) }
  public static func mil  (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .mil) }
  public static func pt   (_ inValue : Int) -> CanariLength { CanariLength (pt: inValue) }
  public static func cu   (_ inValue : Int) -> CanariLength { CanariLength (cu: inValue) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func m    (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .m) }
  public static func cm   (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .cm) }
  public static func mm   (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .mm) }
  public static func µm   (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .µm) }
  public static func inch (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .inch) }
  public static func mil  (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .mil) }
  public static func pt   (_ inValue : Double) -> CanariLength { CanariLength (pt: inValue) }
  public static func cu   (_ inValue : Double) -> CanariLength { CanariLength (cu: inValue) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func multipliedBy (_ inValue : Double) -> CanariLength {
    CanariLength (self, multipliedByDouble: inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func multipliedBy (_ inValue : Int) -> CanariLength {
    CanariLength (self, multipliedByInt: inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var ptValue : Double {
    Double (self.cuValue) / Double (CanariLengthUnit.pt.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cmValue : Double {
    Double (self.cuValue) / Double (CanariLengthUnit.cm.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var mmValue : Double {
    Double (self.cuValue) / Double (CanariLengthUnit.mm.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var inchValue : Double {
    Double (self.cuValue) / Double (CanariLengthUnit.inch.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var milValue : Double {
    Double (self.cuValue) / Double (CanariLengthUnit.mil.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var µmValue : CGFloat {
    Double (self.cuValue) / Double (CanariLengthUnit.µm.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func value (in inUnit : CanariLengthUnit) -> Double {
    Double (self.cuValue) / Double (inUnit.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func string (in inUnit : CanariLengthUnit, fractionDigits inCount : Int) -> String {
    self.value (in: inUnit).strf (inCount) + " " + inUnit.unitString
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //  Hashable Protocol
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func hash (into hasher: inout Hasher) {
    self.cuValue.hash (into: &hasher)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func == (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
    return inLeft.cuValue == inRight.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func != (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
    return inLeft.cuValue != inRight.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func <= (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
    return inLeft.cuValue <= inRight.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func >= (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
    return inLeft.cuValue >= inRight.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func < (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
    return inLeft.cuValue < inRight.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func > (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
    return inLeft.cuValue > inRight.cuValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
