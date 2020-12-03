//
//  Backend.swift
//  R3chn3r
//
//  Created by Dietrich Poensgen on 12.11.20.
//

import Foundation
import Darwin


func Backend(rawData: String) -> String {

    
    var rawArrow: Array<Any> = []
    var result: String = " "
    
    if rawData.contains("+"){
        rawArrow = rawData.components(separatedBy: "+")
        
        let oneString = rawArrow[0]
        let twoString = rawArrow[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one + two
        result = String(resultDouble)
    }
    
    if rawData.contains("-"){
        rawArrow = rawData.components(separatedBy: "-")
        
        let oneString = rawArrow[0]
        let twoString = rawArrow[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one - two
        result = String(resultDouble)
    }
    
    if rawData.contains("*"){
        rawArrow = rawData.components(separatedBy: "*")
        
        let oneString = rawArrow[0]
        let twoString = rawArrow[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one * two
        result = String(resultDouble)
    }
    
    if rawData.contains("/"){
        rawArrow = rawData.components(separatedBy: "/")
        
        let oneString = rawArrow[0]
        let twoString = rawArrow[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one / two
        result = String(resultDouble)
    }
    
    if rawData.contains("^"){
        rawArrow = rawData.components(separatedBy: "^")
        
        let oneString = rawArrow[0]
        let twoString = rawArrow[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = Double(pow(one, two))
        result = String(resultDouble)
    }
    
    if rawData.contains("√"){
        rawArrow = rawData.components(separatedBy: "√")
        
        let oneString = rawArrow[1]
        
        let one = Double(oneString as! String) ?? 0.0
        
        let resultDouble = Double(sqrt(one))
        result = String(resultDouble)
    }
    
    
    
    return result
}
