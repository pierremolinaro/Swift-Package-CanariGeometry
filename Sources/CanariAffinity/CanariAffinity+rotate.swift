//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 03/10/2026.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

extension CanariAffinity {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //MARK: Rotation
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Creates an affine transformation matrix from rotation value.
   The matrix takes the following form:

       [  cos α   sin α  0 ]
       [ -sin α   cos α  0 ]
       [    0       0    1 ]
   */

  public static func rotating (by inAngle : CanariAngle) -> CanariAffinity {
    var af = CanariAffinity ()
    af.rotate (by: inAngle)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func rotating (by inAngle : CanariAngle) -> CanariAffinity {
    var af = self
    af.rotate (by: inAngle)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Mutates an affine transformation matrix from a rotation value.
  */

  public mutating func rotate (by inAngle : CanariAngle) {
    self.mAffineTransform.rotate (byRadians: inAngle.signedRadianValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
