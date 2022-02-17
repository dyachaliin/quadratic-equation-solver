//
//  main.swift
//  quadratic-equation-solver
//
//  Created by Алина Дьяченко on 17.02.2022.
//

import Foundation

func quadraticEquationSolver(a: Double, b: Double, c: Double) {
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

