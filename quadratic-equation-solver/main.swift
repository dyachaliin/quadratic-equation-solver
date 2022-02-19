//
//  main.swift
//  quadratic-equation-solver
//
//  Created by Алина Дьяченко on 17.02.2022.
//

import Foundation

func quadraticEquationSolver(a: Double, b: Double, c: Double) {
    if a == 0 {
        assertionFailure("Error. a cannot be 0")
    }
    
    var discriminantRes: [Double] = []
    print("Equation is: (\(a)) x^2 + (\(b)) x + (\(c)) = 0")
    
    let discriminant = b * b - 4 * a * c
    print("Discriminant is \(discriminant)")
    
    if discriminant > 0 {
        let x1 = (-b + sqrt(b * b - 4 * a * c)) / (2 * a)
        let x2 = (-b - sqrt(b * b - 4 * a * c)) / (2 * a)
        discriminantRes.append(x1)
        discriminantRes.append(x2)
    } else if discriminant == 0 {
        let x = (-b) / (2 * a)
        discriminantRes.append(x)
    }
    print("There are \(discriminantRes.count) roots")
    if discriminantRes.count == 1 {
        print("x1 = \(discriminantRes[0])")
    } else if discriminantRes.count == 2 {
        print("x1 = \(discriminantRes[0])")
        print("x2 = \(discriminantRes[1])")
    }
    
}

func inputCoeff(coefficient: String) -> Double {
    var flag = true
    while flag {
        print("\(coefficient) = ", terminator: "")
        let validCoeff = readLine()!
        if (Double(validCoeff)) != nil {
            flag = false
            return Double(validCoeff)!
        } else {
            print("You've entered \(validCoeff), it's not a real number!")
        }
    }
}

var currentState: String

print("Choose mode: Press 1 for Interactive mode or 2 for Noninteractive")

let mode = Int(readLine()!)

if (mode == 1) {
    print("Enter real numbers")
    
    let a = inputCoeff(coefficient: "a")
    let b = inputCoeff(coefficient: "b")
    let c = inputCoeff(coefficient: "c")
    
    quadraticEquationSolver(a: a, b: b, c: c)
    
} else if mode == 2 {
    print("Enter path to file")
    
    let path = readLine()!
    
    let filemgr = FileManager.default
    if filemgr.fileExists(atPath: path) {
        print("File exists")
        let readFile = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
        let arrayFromString = readFile.components(separatedBy: [" ", "\n"])
        
        
        var a: Double, b: Double, c: Double
        
        if Double(arrayFromString[0]) != nil {
            a = Double(arrayFromString[0])!
            if Double(arrayFromString[1]) != nil {
                b = Double(arrayFromString[1])!
                if Double(arrayFromString[2]) != nil {
                    c = Double(arrayFromString[2])!
                    quadraticEquationSolver(a: a, b: b, c: c)
                }
            }
        }  else {
            print("Error. Something wrong with the numbers in file")
        }
    }
    else {
        print("File does not exist")
    }
} else {
    print("Error. You've missclicked.")
}
