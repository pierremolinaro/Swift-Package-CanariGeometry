//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 08/09/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

public func sin (_ inAngle : CanariAngle) -> Double {
  return sin (inAngle.value (in: .radian))
}

//--------------------------------------------------------------------------------------------------

public func sin (degrees inAngle : Double) -> Double {
  return sin (inAngle * .pi / 180.0)
}

//--------------------------------------------------------------------------------------------------

public func cos (_ inAngle : CanariAngle) -> Double {
  return cos (inAngle.value (in: .radian))
}

//--------------------------------------------------------------------------------------------------

public func cos (degrees inAngle : Double) -> Double {
  return cos (inAngle * .pi / 180.0)
}

//--------------------------------------------------------------------------------------------------

public func tan (_ inAngle : CanariAngle) -> Double {
  return sin (inAngle) / cos (inAngle)
}

//--------------------------------------------------------------------------------------------------

public func tan (degrees inAngle : Double) -> Double {
  return sin (degrees: inAngle) / cos (degrees: inAngle)
}

//--------------------------------------------------------------------------------------------------

public func atan2 (dy inDy : CanariLength, dx inDx : CanariLength) -> CanariAngle {
  let angle_rd = atan2 (inDy.mmValue, inDx.mmValue)
  return .radian (angle_rd)
}

//--------------------------------------------------------------------------------------------------
