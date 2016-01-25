//
//  main.swift
//  UnusualProblems
//
//  Created by 纬洲 冯 on 1/9/16.
//  Copyright © 2016 dopcn. All rights reserved.
//

import Foundation


//================================
//sorted array is iterated faster
//================================

let sorted = [false, true]

for isSorted in sorted {
    var datas = Array(count: 32768, repeatedValue: 0).map { (n) -> Int in
        return n + Int(arc4random_uniform(UInt32(256)))
    }
    if isSorted {
        datas.sortInPlace(<)
    }
    let start = NSDate()
    
    var sum = 0
    for _ in 0...100000 {
        for n in datas {
//            if n > 128 {
//                sum += n
//            }
            sum += n>128 ? n : 0
        }
    }

    print("Time elapsed when \(isSorted ? "sorted":"unsorted"): \(NSDate().timeIntervalSinceDate(start))")
}


//=================
//abnormal floating
//=================

let floating = [false, true]

for isFloat in floating {
    let x = [1.1,1.2,1.3,1.4,1.5,1.6,1.7,1.8,1.9,2.0,2.1,2.2,2.3,2.4,2.5,2.6]
    
    let z = [1.123,1.234,1.345,156.467,1.578,1.689,1.790,1.812,1.923,2.034,2.145,2.256,2.367,2.478,2.589,2.690]
    
    var y = Array(count: 16, repeatedValue: 0.0)
    
    for (index, n) in x.enumerate() {
        y[index] = n
    }
    
    let start = NSDate()
    for j in 0...9000000 {
        for i in 0...15 {
            y[i]*=x[i]
            y[i]/=z[i]
            if isFloat {
                y[i]=y[i]+0.1
                y[i]=y[i]-0.1
            } else {
                y[i]=y[i]+0
                y[i]=y[i]-0
            }
            if j == 100000 {
                print("\(y[i])  ")
            }
        }
    }
    print("Time elapsed when \(isFloat ? "floating":"unfloating"): \(NSDate().timeIntervalSinceDate(start))")
}

//loop interchange

var data1 = Array(count: 10000, repeatedValue: Array(count: 10000, repeatedValue: 0))
let start1 = NSDate()
for i in 0..<10000 {
    for j in 0..<10000 {
        data1[i][j] = i+j
    }
}
print("Time elapsed: \(NSDate().timeIntervalSinceDate(start1))")
var data2 = Array(count: 10000, repeatedValue: Array(count: 10000, repeatedValue: 0))
let start2 = NSDate()
for j in 0..<10000 {
    for i in 0..<10000 {
        data2[i][j] = i+j
    }
}
print("Time elapsed: \(NSDate().timeIntervalSinceDate(start2))")
