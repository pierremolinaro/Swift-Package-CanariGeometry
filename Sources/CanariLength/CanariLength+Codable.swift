//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 19/09/2025.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

extension CanariLength : Codable {


  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

//  public init (from inDecoder : any Decoder) throws { // Decodable
//    let container = try inDecoder.singleValueContainer ()
//    let v = try container.decode (Int.self)
//    self = CanariLength (cu: v)
//  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public init (from inDecoder : any Decoder) throws { // Decodable
    let container = try inDecoder.singleValueContainer ()
    let string = try container.decode (String.self)
    self = try string.decodedCanariLengthWithUnit (container)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public func encode (to inEncoder : any Encoder) throws { // Encodable
    var container = inEncoder.singleValueContainer ()
//    try container.encode (self.cuValue)
    try container.encode (self.valueEncodedWithUnit)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
