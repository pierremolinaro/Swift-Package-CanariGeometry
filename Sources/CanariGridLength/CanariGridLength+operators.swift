//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 08/10/2026.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
//  Operators
//--------------------------------------------------------------------------------------------------

public func + <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>,
                                                 _ inRight : CanariGridLength <GRID>) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (adding: inLeft, inRight)
}

//--------------------------------------------------------------------------------------------------

public func += <GRID : CanariGridLengthProtocol> (_ ioLeft : inout CanariGridLength <GRID>,
                                                  _ inRight : CanariGridLength <GRID>) {
  ioLeft = CanariGridLength <GRID> (adding: ioLeft, inRight)
}

//--------------------------------------------------------------------------------------------------

public prefix func - <GRID : CanariGridLengthProtocol> (_ inOperand : CanariGridLength <GRID>) -> CanariGridLength <GRID> {
  return inOperand.multipliedBy (-1)
}

//--------------------------------------------------------------------------------------------------

public prefix func + <GRID : CanariGridLengthProtocol> (_ inOperand : CanariGridLength <GRID>) -> CanariGridLength <GRID> {
  return inOperand
}

//--------------------------------------------------------------------------------------------------

public func - <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>, _ inRight : CanariGridLength <GRID>) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (adding: inLeft, -inRight)
}

//--------------------------------------------------------------------------------------------------

public func -= <GRID : CanariGridLengthProtocol> (_ ioLeft : inout CanariGridLength <GRID>, _ inRight : CanariGridLength <GRID>) {
  ioLeft = CanariGridLength <GRID> (adding: ioLeft, -inRight)
}

//--------------------------------------------------------------------------------------------------

public func * <GRID : CanariGridLengthProtocol> (_ inLeft : Double, _ inRight : CanariGridLength <GRID>) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (inRight, multipliedByDouble: inLeft)
}

//--------------------------------------------------------------------------------------------------

public func * <GRID : CanariGridLengthProtocol> (_ inLeft : Int, _ inRight : CanariGridLength <GRID>) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (inRight, multipliedByInt: inLeft)
}

//--------------------------------------------------------------------------------------------------

public func * <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>, _ inRight : Double) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (inLeft, multipliedByDouble: inRight)
}

//--------------------------------------------------------------------------------------------------

public func *= <GRID : CanariGridLengthProtocol> (_ ioLeft : inout CanariGridLength <GRID>, _ inRight : Double) {
  ioLeft = ioLeft * inRight
}

//--------------------------------------------------------------------------------------------------

public func /= <GRID : CanariGridLengthProtocol> (_ ioLeft : inout CanariGridLength <GRID>, _ inRight : Double) {
  ioLeft = ioLeft / inRight
}

//--------------------------------------------------------------------------------------------------

public func * <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>, _ inRight : Int) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (inLeft, multipliedByInt: inRight)
}

//--------------------------------------------------------------------------------------------------

//public func * <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>, _ inRight : CanariGridLength <GRID>) -> CanariArea {
//  return CanariArea.pt2 (inRight.ptValue * inLeft.ptValue)
//}

//--------------------------------------------------------------------------------------------------

//public func / <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>, _ inRight : CanariGridLength <GRID>) -> Double {
//  return inLeft.value (in: .mm) / inRight.value (in: .mm)
//}

//--------------------------------------------------------------------------------------------------

public func / <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>, _ inRight : Double) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (int: Int (Double (inLeft.value) / inRight))
}

//--------------------------------------------------------------------------------------------------

//public func / <GRID : CanariGridLengthProtocol> (_ inLeft : CanariGridLength <GRID>, _ inRight : Int) -> CanariGridLength <GRID> {
//  return .pt (inLeft.ptValue / Double (inRight))
//}

//--------------------------------------------------------------------------------------------------
