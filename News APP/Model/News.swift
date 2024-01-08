//
//  News.swift
//  News APP
//
//  Created by Nazrin on 10.11.23.
//

import Foundation

struct News: Codable {
    var title: String?
    var image: String?
    var about: About
}

struct About: Codable {
    var newsImage: String?
    var newsLabel: String?
}
