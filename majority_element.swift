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
var exampleArray_3 = [Int](arrayLiteral: 9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,7)

func majorityElement(_ nums: [Int]) -> Int {
  let EA_CLONE = nums
  let uniqueVal = Array(Set(EA_CLONE))
  var countingIndex = [Int](repeating: 0, count: uniqueVal.count)
  var i = 0
  var k = 0
  while i < uniqueVal.count {
    while k < EA_CLONE.count {
      if (uniqueVal[i] == EA_CLONE[k]) {
        countingIndex[i] = countingIndex[i] + 1
      }
      k = k+1
    }
    i = i+1
    k=0
  }
  let maxIndex = countingIndex.max()!
  let maxIndex_loc = countingIndex.firstIndex(of: maxIndex)
  let commonValue = uniqueVal[maxIndex_loc!]
  print(EA_CLONE)
  print("Largest integer value is:",commonValue)
  print("Largest integer appears in array:", maxIndex, "times")
  return commonValue
}

/* Execute all these functions */
majorityElement(exampleArray_1)
majorityElement(exampleArray_2)
majorityElement(exampleArray_3)
