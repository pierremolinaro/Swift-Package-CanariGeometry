//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 03/10/2026.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------

extension CanariAffinity {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //MARK: Scaling
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
 Creates an affine transformation matrix from scaling values.
 The matrix takes the following form:

     [ x  0  0 ]
     [ 0  y  0 ]
     [ 0  0  1 ]
 */

  public static func scaling (x inFactorX : CGFloat, y inFactorY : CGFloat) -> CanariAffinity {
    var af = CanariAffinity ()
    af.scale (x: inFactorX, y: inFactorY)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Creates an affine transformation matrix from scaling a single value.
   The matrix takes the following form:

       [ f  0  0 ]
       [ 0  f  0 ]
       [ 0  0  1 ]
  */

  public static func scaling (_ inFactor : CGFloat,
                              horizontalFlip inHorizontalFlip : Bool = false) -> CanariAffinity {
    var af = CanariAffinity ()
    af.mAffineTransform = AffineTransform (
      scaleByX: inHorizontalFlip ? -inFactor : inFactor,
      byY: inFactor
    )
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func scaling (_ inFactor : Double) -> CanariAffinity {
    var af = self
    af.scale (inFactor)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func scaling (_ inFactor : Double, horizontalFlip inHorizontalFlip : Bool) -> CanariAffinity {
    var af = self
    if inHorizontalFlip {
      af.scale (x: -inFactor, y: inFactor)
    }else{
      af.scale (inFactor)
    }
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func scaling (x inX : Double, y inY : Double) -> CanariAffinity {
    var af = self
    af.scale (x: inX, y: inY)
    return af
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Mutates an affine transformation matrix from a scale value.
  */

  public mutating func scale (_ inFactor : CGFloat) {
    self.mAffineTransform .scale (inFactor)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  /**
   Mutates an affine transformation matrix from a x-scale and y-scale values.
  */

  public mutating func scale (x inFactorX : CGFloat, y inFactorY : CGFloat) {
    self.mAffineTransform.scale (x: inFactorX, y: inFactorY)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
