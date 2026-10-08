//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 08/10/2026.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

public func abs <GRID : CanariGridLengthProtocol> (_ inValue : CanariGridLength <GRID>) -> CanariGridLength <GRID> {
  return CanariGridLength <GRID> (int: abs (inValue.value))
}

//--------------------------------------------------------------------------------------------------

//public func square <GRID : CanariGridLengthProtocol> (_ inValue : CanariGridLength <GRID>) -> CanariArea {
//  return inValue * inValue
//}

//--------------------------------------------------------------------------------------------------
