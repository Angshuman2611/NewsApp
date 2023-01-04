//
//  Pick1.swift
//  NewsApp
//
//  Created by Angshuman Das on 04/01/23.
//

import Foundation

class Pick1 {
    // modify v1 by BR1
    
    var value: Int
    var next: Pick1?
    
    init(value: Int, next: Pick1? = nil) {
        self.value = value
        self.next = next
    }
}
