//
//  Books.swift
//  MachineTest_03_26
//
//  Created by csuftitan on 3/26/24.
//

import Foundation

struct Books:Decodable{
    var books : [BooksData]
}

struct BooksData:Decodable{
    var isbn13 : String
    var price : String
    var image : String
}
