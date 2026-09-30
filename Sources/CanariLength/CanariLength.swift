//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 09/05/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// struct CanariLength
//--------------------------------------------------------------------------------------------------

public struct CanariLength : Hashable, Comparable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public let cuValue : Int // Temporaire, ---> internal

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (cu inValue : Int) {
    self.cuValue = inValue
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
    self.cuValue = Int (Double (inFactor.cuValue) * inOperand)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inFactor : CanariLength, multipliedByInt inOperand : Int) {
    self.cuValue = inFactor.cuValue * inOperand
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero : Bool { return self.cuValue == 0 }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static var zero : CanariLength { return .cu (0) }
  public static var max  : CanariLength { CanariLength (cu: .max) }
  public static var min  : CanariLength { CanariLength (cu: .min) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func cm   (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .cm) }
  public static func mm   (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .mm) }
  public static func µm   (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .µm) }
  public static func inch (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .inch) }
  public static func mil  (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .mil) }
  public static func pt   (_ inValue : Int) -> CanariLength { CanariLength (inValue, in: .pt) }
  public static func cu   (_ inValue : Int) -> CanariLength { CanariLength (cu: inValue) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func cm   (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .cm) }
  public static func mm   (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .mm) }
  public static func µm   (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .µm) }
  public static func inch (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .inch) }
  public static func mil  (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .mil) }
  public static func pt   (_ inValue : Double) -> CanariLength { CanariLength (inValue, in: .pt) }
  public static func cu   (_ inValue : Double) -> CanariLength { CanariLength (cu: Int (inValue)) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func multipliedBy (_ inValue : Double) -> CanariLength {
    CanariLength (self, multipliedByDouble: inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func multipliedBy (_ inValue : Int) -> CanariLength {
    CanariLength (self, multipliedByInt: inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cmValue : Double {
    return Double (self.cuValue) / Double (CanariLengthUnit.cm.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var mmValue : Double {
    return Double (self.cuValue) / Double (CanariLengthUnit.mm.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var inchValue : Double {
    return Double (self.cuValue) / Double (CanariLengthUnit.inch.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var ptValue : CGFloat {
    return Double (self.cuValue) / Double (CanariLengthUnit.pt.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var µmValue : CGFloat {
    return Double (self.cuValue) / Double (CanariLengthUnit.µm.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func value (in inUnit : CanariLengthUnit) -> Double {
    return Double (self.cuValue) / Double (inUnit.cuValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func string (in inUnit : CanariLengthUnit, fractionDigits inCount : Int) -> String {
    self.value (in: inUnit).strf (inCount) + " " + inUnit.unitString
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
