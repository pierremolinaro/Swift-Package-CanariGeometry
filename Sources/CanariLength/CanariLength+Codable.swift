//--------------------------------------------------------------------------------------------------
//  Created by Pierre Molinaro on 19/09/2025.
//--------------------------------------------------------------------------------------------------

import AppKit

//--------------------------------------------------------------------------------------------------

extension CanariLength : Codable {

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
    try container.encode (self.stringValueEncodedWithUnit)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  public var stringValueEncodedWithUnit : String {
    if self == .zero {
      return "0"
    }else if self.isAligned (on: CanariLengthUnit.inch.length) {
      return "\(self.cuValue / CanariLengthUnit.inch.length.cuValue)in"
    }else if self.isAligned (on: CanariLengthUnit.cm.length) {
      return "\(self.cuValue / CanariLengthUnit.cm.length.cuValue)cm"
    }else if self.isAligned (on: CanariLengthUnit.mm.length) {
      return "\(self.cuValue / CanariLengthUnit.mm.length.cuValue)mm"
    }else if self.isAligned (on: CanariLengthUnit.pt.length) {
      return "\(self.cuValue / CanariLengthUnit.pt.length.cuValue)pt"
    }else if self.isAligned (on: CanariLengthUnit.mil.length) {
      return "\(self.cuValue / CanariLengthUnit.mil.length.cuValue)mil"
    }else if self.isAligned (on: CanariLengthUnit.µm.length) {
      return "\(self.cuValue / CanariLengthUnit.µm.length.cuValue)µm"
    }else{
      return "\(self.cuValue)"
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

internal extension Scanner {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func scanCanariLengthEncodedWithUnit (_ inContainer : SingleValueDecodingContainer) throws -> CanariLength {
    if let v = self.scanCanariLengthEncodedWithUnit () {
      return v
    }else{
      throw DecodingError.dataCorruptedError (in: inContainer, debugDescription: "Invalid Canari Length")
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func scanCanariLengthEncodedWithUnit () -> CanariLength? {
    if let v = self.scanInt () {
      if self.scanString ("mm") != nil {
        return .mm (v)
      }else if self.scanString ("cm") != nil {
        return .cm (v)
      }else if self.scanString ("µm") != nil {
        return .µm (v)
      }else if self.scanString ("in") != nil {
        return .inch (v)
      }else if self.scanString ("mil") != nil {
        return .mil (v)
      }else if self.scanString ("pt") != nil {
        return .pt (v)
      }else{
        return .cu (v)
      }
    }else{
      return nil
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------

public extension String {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  func decodedCanariLengthWithUnit (_ inContainer : SingleValueDecodingContainer) throws -> CanariLength {
    let scanner = Scanner (string: self)
    return try scanner.scanCanariLengthEncodedWithUnit (inContainer)
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

}

//--------------------------------------------------------------------------------------------------
