//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 09/05/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// struct CanariAngle
//--------------------------------------------------------------------------------------------------

public struct CanariAngle : Equatable, Hashable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public let πValue : Double // -1 ... 1: -1 --> -π, +1 --> +π

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //MARK: init
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (π inValue : Double) {
    self.πValue = πNormalized (inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Double, in inAngleUnit : CanariAngleUnit) {
    self.πValue = πNormalized (inValue * inAngleUnit.πValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (adding inFirst : CanariAngle, _ inSecond : CanariAngle) {
    self.πValue = πNormalized (inFirst.πValue + inSecond.πValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inAngle : CanariAngle, multiplyBy inValue : Double) {
    self.πValue = πNormalized (inAngle.πValue * inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (from inStartPoint : CanariPoint, to inTargetPoint : CanariPoint) {
    let dyMM = (inTargetPoint.y - inStartPoint.y).ptValue
    let dxMM = (inTargetPoint.x - inStartPoint.x).ptValue
    self.πValue = Darwin.atan2 (dyMM, dxMM) / .pi
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (from inStartPoint : NSPoint, to inTargetPoint : NSPoint) {
    let dyMM = (inTargetPoint.y - inStartPoint.y)
    let dxMM = (inTargetPoint.x - inStartPoint.x)
    self.πValue = Darwin.atan2 (dyMM, dxMM) / .pi
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func degree (_ inValue : Double) -> CanariAngle { CanariAngle (inValue, in: .degree) }
//  public static func degree (_ inValue : Int) -> CanariAngle { CanariAngle (inValue, in: .degree) }

  public static func radian (_ inValue : Double) -> CanariAngle { CanariAngle (inValue, in: .radian) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var signedDegreeValue : Double {
    self.πValue * 180.0
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var unsignedDegreeValue : Double {
    var r = self.πValue * 180.0
    if r < 0.0 {
      r += 360.0
    }
    return r
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var signedRadianValue : Double {
    self.πValue * .pi
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func value (in inUnit : CanariAngleUnit) -> Double {
    self.πValue / inUnit.πValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero : Bool { return self.πValue == 0.0 }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static var zero : CanariAngle { return CanariAngle (π: 0.0) }

  public static var degrees45 : CanariAngle { return CanariAngle (π: 45.0 / 180.0) }

  public static var degrees90 : CanariAngle { return CanariAngle (π: 90.0 / 180.0) }

  public static var degrees135 : CanariAngle { return CanariAngle (π: 135.0 / 180.0) }

  public static var degrees180 : CanariAngle { return CanariAngle (π: 180.0 / 180.0) }

  public static var degrees225 : CanariAngle { return CanariAngle (π: 225.0 / 180.0) }

  public static var degrees270 : CanariAngle { return CanariAngle (π: 270.0 / 180.0) }

  public static var degrees315 : CanariAngle { return CanariAngle (π: 315.0 / 180.0) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func string (in inUnit : CanariAngleUnit, fractionDigits inCount : Int) -> String {
    return self.value (in: inUnit).strf (inCount) + inUnit.unitString
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

fileprivate func πNormalized (_ inAngle : Double) -> Double {
  var angle = inAngle
  while angle < -1.0 {
    angle += 2.0
  }
  while angle > 1.0 {
    angle -= 2.0
  }
  return angle
}

//--------------------------------------------------------------------------------------------------
