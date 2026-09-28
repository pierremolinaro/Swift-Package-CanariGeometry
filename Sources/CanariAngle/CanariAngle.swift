//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 09/05/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// struct CanariAngle
//--------------------------------------------------------------------------------------------------

public struct CanariAngle : Hashable, Comparable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public let radianValue : Double // -π ... π

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (fromPoint inStartPoint : CanariPoint, toPoint inTargetPoint : CanariPoint) {
    let dyMM = (inTargetPoint.y - inStartPoint.y).ptValue
    let dxMM = (inTargetPoint.x - inStartPoint.x).ptValue
    self.radianValue = Darwin.atan2 (dyMM, dxMM)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inValue : Double, in inAngleUnit : CanariAngleUnit) {
    self.radianValue = radiansNormalized (inValue * inAngleUnit.radian ())
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (adding inFirst : CanariAngle, _ inSecond : CanariAngle) {
    self.radianValue = radiansNormalized (inFirst.radianValue + inSecond.radianValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inAngle : CanariAngle, multiplyBy inValue : Double) {
    self.radianValue = radiansNormalized (inAngle.radianValue * inValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func < (inLeft : CanariAngle, inRight : CanariAngle) -> Bool { // Comparable protocol
    return inLeft.radianValue < inRight.radianValue
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func degree (_ inValue : Double) -> CanariAngle { CanariAngle (inValue, in: .degree) }
  public static func radian (_ inValue : Double) -> CanariAngle { CanariAngle (inValue, in: .radian) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var degreeValue : Double {
    self.radianValue / CanariAngleUnit.degree.radian ()
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func value (in inUnit : CanariAngleUnit) -> Double {
    self.radianValue / inUnit.radian ()
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero : Bool { return self.radianValue == 0.0 }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static var zero : CanariAngle { return CanariAngle (0, in: .degree) }

  public static var degrees45 : CanariAngle { return CanariAngle (45, in: .degree) }

  public static var degrees90 : CanariAngle { return CanariAngle (90, in: .degree) }

  public static var degrees135 : CanariAngle { return CanariAngle (135, in: .degree) }

  public static var degrees180 : CanariAngle { return CanariAngle (180, in: .degree) }

  public static var degrees225 : CanariAngle { return CanariAngle (225, in: .degree) }

  public static var degrees270 : CanariAngle { return CanariAngle (270, in: .degree) }

  public static var degrees315 : CanariAngle { return CanariAngle (315, in: .degree) }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func sinus () -> Double {
    return sin (self.radianValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func cosinus () -> Double {
    return cos (self.radianValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func string (in inUnit : CanariAngleUnit, fractionDigits inCount : Int) -> String {
    return self.value (in: inUnit).strf (inCount) + inUnit.unitString
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

fileprivate func radiansNormalized (_ inRadians : Double) -> Double {
  let twoPi = 2.0 * .pi
  var radian = inRadians
  while radian <= -.pi {
    radian += twoPi
  }
  while radian > .pi {
    radian -= twoPi
  }
  return radian
}

//--------------------------------------------------------------------------------------------------
