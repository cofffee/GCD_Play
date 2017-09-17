//
//  ModelObject.swift
//  GCD_Play
//
//  Created by Kevin Remigio on 9/17/17.
//  Copyright © 2017 Kevin Remigio. All rights reserved.
//

import Foundation

class Data {
    
    var name: String = "Kevin"
    var description: String = "iOS Developer"
    
    init() { }
    
    static func getData() -> [Data] {
        let a: Data = Data()
        let b: Data = Data()
        let c: Data = Data()
        
        var arr: [Data] = [Data]()
        arr.append(a)
        arr.append(b)
        arr.append(c)
        
        sleep(2)
        
        return arr
    }
    
}
