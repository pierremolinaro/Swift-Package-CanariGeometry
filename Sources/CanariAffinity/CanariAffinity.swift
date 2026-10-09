//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 20/09/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
// https://en.wikipedia.org/wiki/Affine_transformation
//--------------------------------------------------------------------------------------------------

public nonisolated struct CanariAffinity : Equatable, Sendable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  internal var mAffineTransform : AffineTransform

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init () {
    self.mAffineTransform = AffineTransform ()
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inAffineTransform : AffineTransform) {
    self.mAffineTransform = inAffineTransform
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//  public init (multipling inLeft : CanariAffinity, by inRight : CanariAffinity) {
//    self.mAffineTransform = inLeft.mAffineTransform
//    self.mAffineTransform.append (inRight.mAffineTransform)
//  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var affineTransform : AffineTransform { self.mAffineTransform }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
  internal var cgAffineTransform : CGAffineTransform { // § internal
    CGAffineTransform (
      a: self.mAffineTransform.m11,
      b: self.mAffineTransform.m12,
      c: self.mAffineTransform.m21,
      d: self.mAffineTransform.m22,
      tx: self.mAffineTransform.tX,
      ty: self.mAffineTransform.tY
    )
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public mutating func append (_ inTransform : CanariAffinity) {
    self.mAffineTransform.append (inTransform.mAffineTransform)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public mutating func prepend (_ inTransform : CanariAffinity) {
    self.mAffineTransform.prepend (inTransform.mAffineTransform)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var angle : CanariAngle {
    let p1 = self.transforming (CanariPoint ())
    let p2 = self.transforming (CanariPoint (x: .pt (1)))
    return p1.angle (to: p2)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
