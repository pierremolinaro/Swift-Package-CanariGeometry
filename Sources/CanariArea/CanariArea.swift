//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 09/05/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// struct CanariArea
//--------------------------------------------------------------------------------------------------

public struct CanariArea : Hashable, Comparable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public let pt2Value : Double

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Double, in inLengthUnit : CanariAreaUnit) {
    self.pt2Value = inValue * inLengthUnit.pt2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt2 inValue : Double) {
    self.pt2Value = inValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt2 inValue : Int) {
    self.pt2Value = Double (inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Int, in inLengthUnit : CanariAreaUnit) {
    self.pt2Value = Double (inValue) * inLengthUnit.pt2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  internal init (adding inA : CanariArea, _ inB : CanariArea) {
    self.pt2Value = inA.pt2Value + inB.pt2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariArea, multipliedByDouble inOperand : Double) {
    self.pt2Value = inFactor.pt2Value * inOperand
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariArea, multipliedByInt inOperand : Int) {
    self.pt2Value = inFactor.pt2Value * Double (inOperand)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero : Bool { return self.pt2Value == 0.0 }
  public var isPositive : Bool { self.pt2Value > 0.0 }
  public var isNegative : Bool { self.pt2Value < 0.0 }
  public var isPositiveOrZero : Bool { self.pt2Value >= 0.0 }
  public var isNegativeOrZero : Bool { self.pt2Value <= 0.0 }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static var zero : CanariArea { return .pt2 (0) }
  public static var max  : CanariArea { CanariArea (.max / 4, in: .cu2) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func cm2   (_ inValue : Int) -> CanariArea { CanariArea (inValue, in: .cm2) }
  public static func mm2   (_ inValue : Int) -> CanariArea { CanariArea (inValue, in: .mm2) }
  public static func µm2   (_ inValue : Int) -> CanariArea { CanariArea (inValue, in: .µm2) }
  public static func inch2 (_ inValue : Int) -> CanariArea { CanariArea (inValue, in: .inch2) }
  public static func mil2  (_ inValue : Int) -> CanariArea { CanariArea (inValue, in: .mil2) }
  public static func pt2   (_ inValue : Int) -> CanariArea { CanariArea (pt2: inValue) }
  public static func cu2   (_ inValue : Int) -> CanariArea { CanariArea (inValue, in: .cu2) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func cm2   (_ inValue : Double) -> CanariArea { CanariArea (inValue, in: .cm2) }
  public static func mm2   (_ inValue : Double) -> CanariArea { CanariArea (inValue, in: .mm2) }
  public static func µm2   (_ inValue : Double) -> CanariArea { CanariArea (inValue, in: .µm2) }
  public static func inch2 (_ inValue : Double) -> CanariArea { CanariArea (inValue, in: .inch2) }
  public static func mil2  (_ inValue : Double) -> CanariArea { CanariArea (inValue, in: .mil2) }
  public static func pt2   (_ inValue : Double) -> CanariArea { CanariArea (pt2: inValue) }
  public static func cu2   (_ inValue : Double) -> CanariArea { CanariArea (inValue, in: .cu2) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func multipliedBy (_ inValue : Double) -> CanariArea {
    CanariArea (self, multipliedByDouble: inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func multipliedBy (_ inValue : Int) -> CanariArea {
    CanariArea (self, multipliedByInt: inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cm2Value : Double {
    self.pt2Value / CanariAreaUnit.cm2.pt2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cu2Value : Double {
    self.pt2Value / CanariAreaUnit.cu2.pt2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var mm2Value : Double {
    self.pt2Value / CanariAreaUnit.mm2.pt2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func value (in inUnit : CanariAreaUnit) -> Double {
    self.pt2Value / inUnit.pt2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func string (in inUnit : CanariAreaUnit, fractionDigits inCount : Int) -> String {
    self.value (in: inUnit).strf (inCount) + " " + inUnit.unitString
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
