//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 07/06/2026.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

extension CanariSize : Codable {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (from inDecoder : any Decoder) throws { // Decodable
    let container = try inDecoder.singleValueContainer ()
    let string = try container.decode (String.self)
    let components = string.split (separator: " ")
    if components.count == 2 {
      let width  = try String (components [0]).decodedCanariLengthWithUnit (container)
      let height = try String (components [1]).decodedCanariLengthWithUnit (container)
      self = CanariSize (width: width, height: height)
    }else {
      throw DecodingError.dataCorruptedError (in: container, debugDescription: "Invalid CanariSize string")
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func encode (to inEncoder : any Encoder) throws { // Encodable
    var container = inEncoder.singleValueContainer ()
    try container.encode ("\(self.width.valueEncodedWithUnit) \(self.height.valueEncodedWithUnit)")
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

