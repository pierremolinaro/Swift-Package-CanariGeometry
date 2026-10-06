//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 07/09/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
//  Operators
//--------------------------------------------------------------------------------------------------

public func + (_ inLeft : CanariLength, _ inRight : CanariLength) -> CanariLength {
  return CanariLength (adding: inLeft, inRight)
}

//--------------------------------------------------------------------------------------------------

public func += (_ ioLeft : inout CanariLength, _ inRight : CanariLength) {
  ioLeft = CanariLength (adding: ioLeft, inRight)
}

//--------------------------------------------------------------------------------------------------

public prefix func - (_ inOperand : CanariLength) -> CanariLength {
  return inOperand.multipliedBy (-1)
}

//--------------------------------------------------------------------------------------------------

public prefix func + (_ inOperand : CanariLength) -> CanariLength {
  return inOperand
}

//--------------------------------------------------------------------------------------------------

public func - (_ inLeft : CanariLength, _ inRight : CanariLength) -> CanariLength {
  return CanariLength (adding: inLeft, -inRight)
}

//--------------------------------------------------------------------------------------------------

public func -= (_ ioLeft : inout CanariLength, _ inRight : CanariLength) {
  ioLeft = CanariLength (adding: ioLeft, -inRight)
}

//--------------------------------------------------------------------------------------------------

public func * (_ inLeft : Double, _ inRight : CanariLength) -> CanariLength {
  return CanariLength (inRight, multipliedByDouble: inLeft)
}

//--------------------------------------------------------------------------------------------------

public func * (_ inLeft : Int, _ inRight : CanariLength) -> CanariLength {
  return CanariLength (inRight, multipliedByInt: inLeft)
}

//--------------------------------------------------------------------------------------------------

public func * (_ inLeft : CanariLength, _ inRight : Double) -> CanariLength {
  return CanariLength (inLeft, multipliedByDouble: inRight)
}

//--------------------------------------------------------------------------------------------------

public func *= (_ ioLeft : inout CanariLength, _ inRight : Double) {
  ioLeft = ioLeft * inRight
}

//--------------------------------------------------------------------------------------------------

public func /= (_ ioLeft : inout CanariLength, _ inRight : Double) {
  ioLeft = ioLeft / inRight
}

//--------------------------------------------------------------------------------------------------

public func * (_ inLeft : CanariLength, _ inRight : Int) -> CanariLength {
  return CanariLength (inLeft, multipliedByInt: inRight)
}

//--------------------------------------------------------------------------------------------------

public func * (_ inLeft : CanariLength, _ inRight : CanariLength) -> CanariArea {
  return CanariArea.cu2 (inRight.ptValue * inLeft.ptValue)
}

//--------------------------------------------------------------------------------------------------

public func / (_ inLeft : CanariLength, _ inRight : CanariLength) -> Double {
  return inLeft.value (in: .mm) / inRight.value (in: .mm)
}

//--------------------------------------------------------------------------------------------------

public func / (_ inLeft : CanariLength, _ inRight : Double) -> CanariLength {
  return .pt (inLeft.ptValue / inRight)
}

//--------------------------------------------------------------------------------------------------

public func / (_ inLeft : CanariLength, _ inRight : Int) -> CanariLength {
  return .pt (inLeft.ptValue / Double (inRight))
}

//--------------------------------------------------------------------------------------------------

public func == (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
  return inLeft.cuValue == inRight.cuValue
}

//--------------------------------------------------------------------------------------------------

public func != (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
  return inLeft.cuValue != inRight.cuValue
}

//--------------------------------------------------------------------------------------------------

public func <= (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
  return inLeft.cuValue <= inRight.cuValue
}

//--------------------------------------------------------------------------------------------------

public func >= (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
  return inLeft.cuValue >= inRight.cuValue
}

//--------------------------------------------------------------------------------------------------

public func < (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
  return inLeft.cuValue < inRight.cuValue
}

//--------------------------------------------------------------------------------------------------

public func > (_ inLeft : CanariLength, _ inRight : CanariLength) -> Bool {
  return inLeft.cuValue > inRight.cuValue
}

//--------------------------------------------------------------------------------------------------
