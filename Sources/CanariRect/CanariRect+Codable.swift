//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 20/12/2025.
//--------------------------------------------------------------------------------------------------

import Foundation

//--------------------------------------------------------------------------------------------------
//  struct CanariRect
//--------------------------------------------------------------------------------------------------

extension CanariRect : Codable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (from inDecoder : any Decoder) throws { // Decodable
    let container = try inDecoder.singleValueContainer ()
    let string = try container.decode (String.self)
    let components = string.split (separator: " ")
    if components.count == 4 {
      let x = try String (components [0]).decodedCanariLengthWithUnit (container)
      let y = try String (components [1]).decodedCanariLengthWithUnit (container)
      let width = try String (components [2]).decodedCanariLengthWithUnit (container)
      let height = try String (components [3]).decodedCanariLengthWithUnit (container)
      self.origin = CanariPoint (x: x, y: y)
      self.size = CanariSize (width: width, height: height)
    }else {
      throw DecodingError.dataCorruptedError (in: container, debugDescription: "Invalid rectangle string")
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func encode (to inEncoder : any Encoder) throws { // Encodable
    var container = inEncoder.singleValueContainer ()
    var str = self.origin.x.stringValueEncodedWithUnit
    str += " "
    str += self.origin.y.stringValueEncodedWithUnit
    str += " "
    str += self.size.width.stringValueEncodedWithUnit
    str += " "
    str += self.size.height.stringValueEncodedWithUnit
    try container.encode (str)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
