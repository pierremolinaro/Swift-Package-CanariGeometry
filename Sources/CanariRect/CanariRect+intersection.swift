//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 20/12/2025.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
//  struct CanariRect
//--------------------------------------------------------------------------------------------------

public extension CanariRect {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func intersects (_ inRect : CanariRect) -> Bool {
    let minX = max (self.minX, inRect.minX)
    let maxX = min (self.maxX, inRect.maxX)
    var result = minX < maxX
    if result {
      let minY = max (self.minY, inRect.minY)
      let maxY = min (self.maxY, inRect.maxY)
      result = minY < maxY
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //   Intersection
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func intersection (_ inOtherRect : CanariRect) -> CanariRect {
    let result : CanariRect
    if self.isEmpty || inOtherRect.isEmpty {
      result = .zero // Empty Rect
    }else{
      let left   = max (self.left, inOtherRect.left)
      let bottom = max (self.bottom, inOtherRect.bottom)
      let right  = min (self.left + self.width,  inOtherRect.left + inOtherRect.width)
      let top    = min (self.bottom + self.height, inOtherRect.bottom + inOtherRect.height)
      result = CanariRect (left: left, bottom: bottom, width: right - left, height: top - bottom)
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

