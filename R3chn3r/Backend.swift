//
//  Backend.swift
//  R3chn3r
//
//  Created by Dietrich Poensgen on 12.11.20.
//

import Foundation
import Darwin


func Backend(rawData: String) -> String {

    
    var rawArray: Array<Any> = []
    var result: String = " "
    
    if rawData.contains("+"){
        rawArray = rawData.components(separatedBy: "+")
        
        let oneString = rawArray[0]
        let twoString = rawArray[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one + two
        result = String(resultDouble)
    }
    
    if rawData.contains("-"){
        rawArray = rawData.components(separatedBy: "-")
        
        let oneString = rawArray[0]
        let twoString = rawArray[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one - two
        result = String(resultDouble)
    }
    
    if rawData.contains("*"){
        rawArray = rawData.components(separatedBy: "*")
        
        let oneString = rawArray[0]
        let twoString = rawArray[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one * two
        result = String(resultDouble)
    }
    
    if rawData.contains("/"){
        rawArray = rawData.components(separatedBy: "/")
        
        let oneString = rawArray[0]
        let twoString = rawArray[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = one / two
        result = String(resultDouble)
    }
    
    if rawData.contains("^"){
        rawArray = rawData.components(separatedBy: "^")
        
        let oneString = rawArray[0]
        let twoString = rawArray[1]
        
        let one = Double(oneString as! String) ?? 0.0
        let two = Double(twoString as! String) ?? 0.0
        
        let resultDouble = Double(pow(one, two))
        result = String(resultDouble)
    }
    
    if rawData.contains("√"){
        rawArray = rawData.components(separatedBy: "√")
        
        let oneString = rawArray[1]
        
        let one = Double(oneString as! String) ?? 0.0
        
        let resultDouble = Double(sqrt(one))
        result = String(resultDouble)
    }
    
    
    
    return result
}
