//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 11/05/2024.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------
//  struct CanariPoint
//--------------------------------------------------------------------------------------------------

public struct CanariPoint : Hashable, CustomStringConvertible, Sendable, Equatable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var x : CanariLength
  public var y : CanariLength

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (x inX : CanariLength = .zero, y inY : CanariLength = .zero) {
    self.x = inX
    self.y = inY
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (length inLength : CanariLength, angle inAngle : CanariAngle) {
    let (sin, cos) = sincos (inAngle)
    self.x = inLength * cos
    self.y = inLength * sin
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (pt inPoint : NSPoint, aligned inUnit : CanariLength? = nil) {
    if let unit = inUnit {
      self.x = .pt (inPoint.x).aligning (on: unit)
      self.y = .pt (inPoint.y).aligning (on: unit)
    }else{
      self.x = .pt (inPoint.x)
      self.y = .pt (inPoint.y)
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static var zero : CanariPoint { CanariPoint () }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var isZero : Bool { self.x.isZero && self.y.isZero }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var xMirrored : CanariPoint {
    CanariPoint (x: -self.x, y: self.y)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var yMirrored : CanariPoint {
    CanariPoint (x: self.x, y: -self.y)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func scaled (byX inScaleX : Double, byY inScaleY : Double) -> CanariPoint {
    CanariPoint (x: self.x * inScaleX, y: self.y * inScaleY)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func scaled (by inScale : Double) -> CanariPoint {
    CanariPoint (x: self.x * inScale, y: self.y * inScale)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func moved (angle inAngle : CanariAngle = .zero,
                     x inDx : CanariLength = .zero,
                     y inDy : CanariLength = .zero) -> CanariPoint {
    let (sin, cos) = sincos (inAngle)
    return CanariPoint (
      x: self.x * cos - self.y * sin + inDx,
      y: self.x * sin + self.y * cos + inDy
    )
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func transformed (by inAffinity : CanariAffinity) -> CanariPoint {
    inAffinity.transforming (self)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func distance (to inPoint : CanariPoint) -> CanariLength {
    let dx = self.x - inPoint.x
    let dy = self.y - inPoint.y
    return sqrt (dx * dx + dy * dy)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func squareOfDistance (to inPoint : CanariPoint) -> CanariArea {
    let dx = self.x - inPoint.x
    let dy = self.y - inPoint.y
    return dx * dx + dy * dy
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func mid (with p : CanariPoint) -> CanariPoint {
    CanariPoint (x: (self.x + p.x) / 2, y: (self.y + p.y) / 2)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var ptValue : CGPoint {
    CGPoint (x: self.x.ptValue, y: self.y.ptValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var cmString : String {
    self.x.cmValue.str3f + " cm, " + self.y.cmValue.str3f + " cm"
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var mmString : String {
    self.x.mmValue.str3f + " mm, " + self.y.mmValue.str3f + " mm"
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func string (in inUnit : CanariLengthUnit, fractionDigits inCount : Int) -> String {
    "\(self.x.string (in: inUnit, fractionDigits: inCount)) x \(self.y.string (in: inUnit, fractionDigits: inCount))"
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var burningKitCode : String {
    "Point (x: .mm (" + self.x.mmValue.str3f + "), y : .mm (" + self.y.mmValue.str3f + "))"
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
    A textual representation of this instance.
  */

  public var description : String { // CustomStringConvertible protocol
    return "x: \(self.x), y: \(self.y)"
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func angle (to inPoint : CanariPoint) -> CanariAngle {
    CanariAngle (from: self, to: inPoint)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var angle : CanariAngle {
    CanariAngle (from: .zero, to: self)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func product (_ p1 : CanariPoint, _ p2 : CanariPoint, _ p3 : CanariPoint) -> CanariArea {
    let dx2 = p2.x - p1.x
    let dy2 = p2.y - p1.y
    let dx3 = p3.x - p1.x
    let dy3 = p3.y - p1.y
    return dx2 * dy3 - dx3 * dy2
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
