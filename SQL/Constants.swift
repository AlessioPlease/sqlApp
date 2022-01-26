//
//  Constants.swift
//  SQL
//
//  Created by Alessio De Gaetano on 17/02/2020.
//  Copyright © 2020 Alessio De Gaetano. All rights reserved.
//

import Foundation

class Constants {
    
    var s: [String] = []
    var q: [String] = []
    var l: [String] = []
    
    init() {
        
        do {
            let path = Bundle.main.path(forResource: "S", ofType: "txt")
            let file = try String(contentsOfFile: path!)
            self.s = file.components(separatedBy: "\n")
        } catch let error {
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
        
        do {
            let path = Bundle.main.path(forResource: "Q", ofType: "txt")
            let file = try String(contentsOfFile: path!)
            self.q = file.components(separatedBy: "\n")
        } catch let error {
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
        
        do {
            let path = Bundle.main.path(forResource: "L", ofType: "txt")
            let file = try String(contentsOfFile: path!)
            self.l = file.components(separatedBy: "\n")
        } catch let error {
            Swift.print("Fatal Error: \(error.localizedDescription)")
        }
    }
    
    func getS() -> [String] {
        return self.s
    }
    
    func getQ() -> [String] {
        return self.q
    }
    
    func getL() -> [String] {
        return self.l
    }
}
