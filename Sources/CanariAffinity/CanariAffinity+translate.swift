//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 03/10/2026.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

extension CanariAffinity {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //MARK: Translation
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Creates an affine transformation matrix from translation values.
   The matrix takes the following form:

       [ 1  0  0 ]
       [ 0  1  0 ]
       [ x  y  1 ]
   */

  public static func translating (_ inPoint : CanariPoint) -> CanariAffinity {
    var af = CanariAffinity ()
    af.translate (inPoint)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public static func translating (x inDx : CanariLength = .zero,
                                  y inDy : CanariLength = .zero) -> CanariAffinity {
    var af = CanariAffinity ()
    af.translate (x: inDx, y: inDy)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func translating (x inDx : CanariLength = .zero,
                           y inDy : CanariLength = .zero) -> CanariAffinity {
    var af = self
    af.translate (x: inDx, y: inDy)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func translating (_ inPoint : CanariPoint) -> CanariAffinity {
    var af = self
    af.translate (x: inPoint.x, y: inPoint.y)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Mutates an affine transformation matrix from x and y translation values.
  */

  public mutating func translate (x inDx : CanariLength = .zero,
                                  y inDy : CanariLength = .zero) {
    self.mAffineTransform.translate (x: inDx.ptValue, y: inDy.ptValue)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public mutating func translate (_ inPoint : CanariPoint) {
    self.translate (x: inPoint.x, y: inPoint.y)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
