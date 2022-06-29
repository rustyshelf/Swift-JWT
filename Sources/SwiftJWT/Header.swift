/**
 * Copyright IBM Corporation 2018
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation

// MARK: Header

/**
 A representation of a JSON Web Token header.
 https://tools.ietf.org/html/rfc7515#section-4.1
 ### Usage Example: ###
 ```swift
 struct MyClaims: Claims {
    var name: String
 }
 let myHeader = Header(kid: "keyID")
 let jwt = JWT(header: myHeader, claims: MyClaims(name: "Kitura"))
 ```
 */
public struct Header: Codable {
    /// Type Header Parameter
    public var typ: String? = "JWT"
    /// Algorithm Header Parameter
    public var alg: String?
    /// JSON Web Token Set URL Header Parameter
    public var jku : String?
    /// JSON Web Key Header Parameter
    public var jwk: String?
    /// Key ID Header Parameter
    public var kid: String?
    /// X.509 URL Header Parameter
    public var x5u: String?
    /// X.509 Certificate Chain Header Parameter
    public var x5c: [String]?
    /// X.509 Certificate SHA-1 Thumbprint Header Parameter
    public var x5t: String?
    /// X.509 Certificate SHA-256 Thumbprint Header Parameter
    public var x5tS256: String?
    /// Content Type Header Parameter
    public var cty: String?
    /// Critical Header Parameter
    public var crit: [String]?
    /// Custom field, id
    public var id: String?
    
    public init() {}
    
    func encode() throws -> String  {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.dateEncodingStrategy = .secondsSince1970
        let data = try jsonEncoder.encode(self)
        return JWTEncoder.base64urlEncodedString(data: data)
    }
}
