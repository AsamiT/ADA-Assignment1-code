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

/**
  In this one, we're declaring our arrays for practice. If I were making this for a real world implementation
  I would probably create a dynamically created array through user input, but this is just for theoreticals.
  **/
var exampleArray_1 = [Int](arrayLiteral: 3,2,3)
var exampleArray_2 = [Int](arrayLiteral: 2,2,1,1,1,2,2)
var exampleArray_3 = [Int](arrayLiteral: 9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,7)

/**
  This is our function which does the work.
**/
func majorityElement(_ nums: [Int]) -> Int {
  /* Now we're going to create some clone arrays.
    In the case of EA_CLONE, it's a waste of memory to create this, but I think it's cleaner, without addressing something outside of the function. Ultimately, it uses up so little time and memory, it's useless to really change anything. */
  let EA_CLONE = nums
  let uniqueVal = Array(Set(EA_CLONE))
  var countingIndex = [Int](repeating: 0, count: uniqueVal.count)

  var i = 0 //i  - a basic integer counter.
  var k = 0 //k  - a basic integer counter.
  /* we'll use both of these below. */

  while i < uniqueVal.count { //count from i=0 to i=uniqueVal.count
    while k < EA_CLONE.count { //count from k=0 to k=EA_CLONE.count
      if (uniqueVal[i] == EA_CLONE[k]) { //if they're equal
        countingIndex[i] = countingIndex[i] + 1 //iterate the counting index at the exact spot of the unique values array.
      }
      k = k+1 //iterate k
    }
    i = i+1 //iterate i
    k=0 //reset k so it doesn't overflow
  }
  let maxIndex = countingIndex.max()! //declare maxIndex to be equal to the largest integer value in counting index.
  let maxIndex_loc = countingIndex.index(of: maxIndex) //set this variable to the index position of maxIndex.
  let commonValue = uniqueVal[maxIndex_loc!] //set commonValue to where in uniqueVal the number holds the most positions.
  print(EA_CLONE) //print a copy of the array
  print("Largest integer value is:",commonValue) //tell me what integer exists the most times in that array
  print("Largest integer appears in array:", maxIndex, "times") //tell me how many times it appears.
  return commonValue //tell the compiler everything's okie-dokie
}

/* Execute all these functions */
majorityElement(exampleArray_1)
majorityElement(exampleArray_2)
majorityElement(exampleArray_3)

/* and now we're done! */
