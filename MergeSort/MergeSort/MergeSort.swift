//
//  MergeSort.swift
//  MergeSort
//
//  Created by Ivan Ruiz Monjo on 25/04/2020.
//  Copyright © 2020 Ivan Ruiz Monjo. All rights reserved.
//

import Foundation

func mergesort<T: Comparable>(_ arr: [T]) -> [T] {
    guard arr.count > 1 else {
        return arr
    }
    let middle = arr.count / 2
    let left = Array(arr[..<middle])
    let right = Array(arr[middle...])
    let leftMergeSort = mergesort(left)
    let rightMergeSort = mergesort(right)
    return merge(left: leftMergeSort, right: rightMergeSort)
}

private func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var output = [T]()
    output.reserveCapacity(left.count +  right.count)
    var leftIndex = 0
    var rightIndex = 0
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        if leftElement < rightElement {
            output.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            output.append(rightElement)
            rightIndex += 1
        } else {
            output.append(leftElement)
            output.append(rightElement)
            leftIndex += 1
            rightIndex += 1
        }
    }
    while leftIndex < left.count {
        output.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        output.append(right[rightIndex])
        rightIndex += 1
    }
    return output
}
