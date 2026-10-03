//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 20/12/2025.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
//  struct CanariRect
//--------------------------------------------------------------------------------------------------

public extension CanariRect {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  //   CohenSutherlandCodeForPoint
  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func CohenSutherlandCodeForPoint (x inX : CanariLength, y inY : CanariLength) -> UInt8 {
    var result : UInt8 = 0
    if inX < self.minX {
      result |= CohenSutherlandOutcodeLEFT
    }else if inX > self.maxX {
      result |= CohenSutherlandOutcodeRIGHT
    }
    if inY < self.minY {
      result |= CohenSutherlandOutcodeBOTTOM
    }else if inY > self.maxY {
      result |= CohenSutherlandOutcodeTOP
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  // https://en.wikipedia.org/wiki/Cohen–Sutherland_algorithm

  func clippedSegment (p1 inP1 : CanariPoint, p2 inP2 : CanariPoint) -> (CanariPoint, CanariPoint)? {
    var result : (CanariPoint, CanariPoint)? = nil
    var p1 = inP1
    var p2 = inP2
    var loop = true
    while loop {
      let p1OutCode = self.CohenSutherlandCodeForPoint (x: p1.x, y: p1.y)
      let p2OutCode = self.CohenSutherlandCodeForPoint (x: p2.x, y: p2.y)
      if (p1OutCode | p2OutCode) == 0 { // Both points are inside
        result = (p1, p2)
        loop = false
      }else if (p1OutCode & p2OutCode) != 0 { // Both points are outside, no intersection
        loop = false
      }else{ // non trivial case
      // Failed both tests, so calculate the line segment to clip from an outside point to an intersection with clip edge
        let p : CanariPoint
      // At least one endpoint is outside the clip rectangle; pick it.
        let outcode = (p1OutCode != 0) ? p1OutCode : p2OutCode
      // Now find the intersection point;
      // use formulas:
      //   slope = (y2 - y1) / (x2 - x1)
      //   x = x1 + (1 / slope) * (ym - y1), where ym is ymin or ymax
      //   y = y1 + slope * (xm - x1), where xm is xmin or xmax
      // No need to worry about divide-by-zero because, in each case, the
      // outcode bit being tested guarantees the denominator is non-zero
        if (outcode & CohenSutherlandOutcodeTOP) != 0 {           // point is above the clip window
          p = CanariPoint (x: p1.x + (p2.x - p1.x) * (self.maxY - p1.y) / (p2.y - p1.y), y: self.maxY)
        }else if (outcode & CohenSutherlandOutcodeBOTTOM) != 0 { // point is below the clip window
          p = CanariPoint (x: p1.x + (p2.x - p1.x) * (self.minY - p1.y) / (p2.y - p1.y), y: self.minY)
        }else if (outcode & CohenSutherlandOutcodeRIGHT) != 0 {  // point is to the right of clip window
          p = CanariPoint (x: self.maxX, y: p1.y + (p2.y - p1.y) * (self.maxX - p1.x) / (p2.x - p1.x))
        }else{ // if (outcode & CohenSutherlandOutcodeLEFT) != 0 {   // point is to the left of clip window
          p = CanariPoint (x: self.minX, y:p1.y + (p2.y - p1.y) * (self.minX - p1.x) / (p2.x - p1.x))
        }
      // Now we move outside point to intersection point to clip and get ready for next pass.
        if outcode == p1OutCode {
          p1 = p
        }else{
          p2 = p
        }
      }
    }
    return result
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

fileprivate let CohenSutherlandOutcodeLEFT   : UInt8 = 1
fileprivate let CohenSutherlandOutcodeRIGHT  : UInt8 = 2
fileprivate let CohenSutherlandOutcodeBOTTOM : UInt8 = 4
fileprivate let CohenSutherlandOutcodeTOP    : UInt8 = 8

//--------------------------------------------------------------------------------------------------
