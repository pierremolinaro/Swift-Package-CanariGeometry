//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 20/09/2024.
//--------------------------------------------------------------------------------------------------

import Foundation

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

  public var affineTransform : AffineTransform { self.mAffineTransform } // § --> internal

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (_ inAffineTransform : CGAffineTransform) {
    self.mAffineTransform = AffineTransform (
      m11: inAffineTransform.a,
      m12: inAffineTransform.b,
      m21: inAffineTransform.c,
      m22: inAffineTransform.d,
      tX: inAffineTransform.tx,
      tY: inAffineTransform.ty
    )
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
 
  public var cgAffineTransform : CGAffineTransform { // § internal
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
