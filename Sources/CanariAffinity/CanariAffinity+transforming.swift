//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 03/10/2026.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

extension CanariAffinity {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func transforming (_ inPoint : CanariPoint) -> CanariPoint {
    let nsPoint = self.affineTransform.transform (inPoint.ptValue)
    return CanariPoint (pt: nsPoint)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func transforming (x inX : CanariLength = .zero,
                            y inY : CanariLength = .zero) -> CanariPoint {
    let nsPoint = self.affineTransform.transform (NSPoint (x: inX.ptValue, y: inY.ptValue))
    return CanariPoint (pt: nsPoint)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
