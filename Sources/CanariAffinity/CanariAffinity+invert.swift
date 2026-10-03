//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 03/10/2026.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

extension CanariAffinity {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Inverts the transformation matrix if possible. Matrices with a determinant that is less than
   the smallest valid representation of a double value greater than zero are considered to be
   invalid for representing as an inverse. If the input AffineTransform can potentially fall into
   this case then the inverted() method is suggested to be used instead since that will return
   an optional value that will be nil in the case that the matrix cannot be inverted.

   D = (m11 * m22) - (m12 * m21)

   D < ε the inverse is undefined and will be nil
  */
  public mutating func invert () {
    self.mAffineTransform = self.mAffineTransform.inverted ()!
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Inverts the transformation matrix if possible. If not possible, returns nil.Matrices with
   a determinant that is less than
   the smallest valid representation of a double value greater than zero are considered to be
   invalid for representing as an inverse.

   D = (m11 * m22) - (m12 * m21)

   D < ε the inverse is undefined and will be nil
  */

  public func inverted () -> CanariAffinity? {
    if let af = self.mAffineTransform.inverted () {
      return CanariAffinity (af)
    }else{
      return nil
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
