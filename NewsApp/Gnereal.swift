//
//  Gnereal.swift
//  NewsApp
//
//  Created by Angshuman Das on 04/01/23.
//

import Foundation

// created by BR1

class Pick2 {
    
    var value: Int
    var next: Pick1?
    
    init(value: Int, next: Pick1? = nil) {
        self.value = value
        self.next = next
    }
    
}
