//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 09/05/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// struct CanariLength
//--------------------------------------------------------------------------------------------------

public struct CanariLength : Comparable, Hashable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public let ptValue : Double

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (cu inValue : Int) {
    self.ptValue = Double (inValue) * CanariLengthUnit.cu.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (cu inValue : Double) {
    self.ptValue = inValue * CanariLengthUnit.cu.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt inValue : Int) {
    self.ptValue = Double (inValue) // * CanariLengthUnit.cu.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt inValue : Double) {
    self.ptValue = inValue // * CanariLengthUnit.cu.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Double, in inLengthUnit : CanariLengthUnit) {
    self.ptValue = inValue * inLengthUnit.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Int, in inLengthUnit : CanariLengthUnit) {
    self.ptValue = Double (inValue) * inLengthUnit.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  internal init (adding inA : CanariLength, _ inB : CanariLength) {
    self.ptValue = inA.ptValue + inB.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariLength, multipliedByDouble inOperand : Double) {
    self.ptValue = inFactor.ptValue * inOperand
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariLength, multipliedByInt inOperand : Int) {
    self.ptValue = inFactor.ptValue * Double (inOperand)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero     : Bool { self.ptValue == 0.0 }
  public var isPositive : Bool { self.ptValue >  0.0 }
  public var isNegative : Bool { self.ptValue <  0.0 }

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
  public static func cu   (_ inValue : Int) -> CanariLength { CanariLength (cu: Double (inValue)) }

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

  public var cuValue : Int {
    Int (self.ptValue / CanariLengthUnit.cu.ptValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cmValue : Double {
    self.ptValue / CanariLengthUnit.cm.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var mmValue : Double {
    self.ptValue / CanariLengthUnit.mm.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var inchValue : Double {
    self.ptValue / CanariLengthUnit.inch.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var milValue : Double {
    self.ptValue / CanariLengthUnit.mil.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var µmValue : CGFloat {
    self.ptValue / CanariLengthUnit.µm.ptValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func value (in inUnit : CanariLengthUnit) -> Double {
    self.ptValue / inUnit.ptValue
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
