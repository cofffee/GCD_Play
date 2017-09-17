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
        
        let a = buildData()
        
        sleep(2)
        
        return a
        
    }
    
    static func getData(completion: ([Data]) -> ()) {
    
        let a = buildData()
        
        sleep(2)
        
        completion(a)
        
    }
    
    static func getDataBackground(completion: @escaping ([Data]) -> ()) {
        print("Step 1")
        
        DispatchQueue.global(qos: .userInteractive).async {
            let a = buildData()
            
            sleep(2)
            
            DispatchQueue.main.async {
                completion(a)
            }
            print("Step 3")
        }
        print("Step 2")
        
    }
    static func buildData() -> [Data]{
        let a: Data = Data()
        let b: Data = Data()
        let c: Data = Data()
        
        var arr: [Data] = [Data]()
        arr.append(a)
        arr.append(b)
        arr.append(c)
        
        return arr
    }
}







