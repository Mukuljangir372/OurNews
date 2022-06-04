//
//  Article.swift
//  OurNews
//
//  Created by Mukul Jangir on 03/06/22.
//

import Foundation

struct Article: Codable, Identifiable{
    let id = UUID()
    var title: String?
    var description: String?
    var url: String?
    
    private enum CodingKeys: String, CodingKey {
        case title,description,url
    }
}
