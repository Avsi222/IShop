//
//  AbstractErrorParser.swift
//  IShop
//
//  Created by Арсений Дорогин on 26/04/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import Foundation

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
