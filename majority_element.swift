//
//  majority_element.swift
//  "Majority Element" Swift program
//
//
//  @name: Robert Maloy
//  @date: 28 Sep. 2018
//
//

import Foundation

var exampleArray_1 = [Int](arrayLiteral: 3,2,3)
var exampleArray_2 = [Int](arrayLiteral: 2,2,1,1,1,2,2)

func majorityElement(_ nums: [Int]) -> Int {
  let EA_CLONE = nums
  let uniqueVal = Array(Set(EA_CLONE))
  var countingIndex = [Int](repeating: 0, count: uniqueVal.count)
  var i = 0
  var k = 0
  while i < uniqueVal.count {
    print("i=",i)
    while k < EA_CLONE.count {
      if (uniqueVal[i] == EA_CLONE[k]) {
        countingIndex[i] = countingIndex[i] + 1
      }
      print("k=",k)
      k = k+1
    }
    i = i+1
    k=0
  }
  print(EA_CLONE)
  print(uniqueVal)
  print(countingIndex)
  return 0
}

majorityElement(exampleArray_1)
