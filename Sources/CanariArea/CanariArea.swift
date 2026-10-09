//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 09/05/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// struct CanariArea
//--------------------------------------------------------------------------------------------------

public struct CanariArea : Hashable, Comparable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public let cu2Value : Int

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Double, in inLengthUnit : CanariAreaUnit) {
    self.cu2Value = Int (inValue * Double (inLengthUnit.cu2Value))
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt2 inValue : Double) {
    self.cu2Value = Int (inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt2 inValue : Int) {
    self.cu2Value = inValue * CanariAreaUnit.pt2.cu2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Int, in inLengthUnit : CanariAreaUnit) {
    self.cu2Value = inValue * inLengthUnit.cu2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  internal init (adding inA : CanariArea, _ inB : CanariArea) {
    self.cu2Value = inA.cu2Value + inB.cu2Value
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariArea, multipliedByDouble inOperand : Double) {
    self.cu2Value = Int (Double (inFactor.cu2Value) * inOperand)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariArea, multipliedByInt inOperand : Int) {
    self.cu2Value = inFactor.cu2Value * inOperand
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero : Bool { return self.cu2Value == 0 }
  public var isPositive : Bool { self.cu2Value > 0 }
  public var isNegative : Bool { self.cu2Value < 0 }
  public var isPositiveOrZero : Bool { self.cu2Value >= 0 }
  public var isNegativeOrZero : Bool { self.cu2Value <= 0 }

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
    Double (self.cu2Value / CanariAreaUnit.cm2.cu2Value)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var mm2Value : Double {
    Double (self.cu2Value / CanariAreaUnit.mm2.cu2Value)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func value (in inUnit : CanariAreaUnit) -> Double {
    Double (self.cu2Value / inUnit.cu2Value)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func string (in inUnit : CanariAreaUnit, fractionDigits inCount : Int) -> String {
    self.value (in: inUnit).strf (inCount) + " " + inUnit.unitString
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
