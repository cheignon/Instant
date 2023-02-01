//
//  ApiProtocol.swift
//  Instant
//
//  Created by dorian cheignon on 31/01/2023.
//

import Foundation

/// oblige to make any class wich respect  this protocol like a class  plug and play
/// the ``@objc`` permit to make the functionallity optional
///  if  you want to secure your protocol
///   - on your classe do that:
///   - example:
///   ``` extension MyClass where Self: ApiProtocol {}```
@objc protocol ApiProtocol {
    @objc optional func getHeadLine()
    @objc optional func getNewsOfThisDay()
    @objc optional func getNewsWithThisSearch(text: String)
    
}
