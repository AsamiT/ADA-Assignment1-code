//
//  max_subarray.swift
//  "Maximum Subarray" Swift program
//
//
//  @name: Robert Maloy
//  @date: 28 Sep. 2018
//
//

import Foundation

/* These are going to be variables used for quick ranges and loops. */
var a = 0
var b = 0
var i = 0
var z = 0

/* bestSum and worstSum */
var bestSum = 0;
var worstSum = 0;

/* our Array */
var nums = [Int](arrayLiteral: -2, 1, -3, 4, -1, 2, 1, -5, 4); //array as given by website
var holdingArray = [Int]() //creates a temporary array that is returned to replace nums.
var numCount = nums.count //count the length of nums

/**
 This function will allow Swift to "shrink" our array by quickly summing up chunks of three or two, thus reducing the size; this makes it easier for us to figure out the best "constant chunk" that is largest.
**/
func shrinkArray(_ nums: [Int]) -> Int {
    var copiedArray = nums //clone the array into a modifable and dynamic array.
    if (numCount % 3 == 0) { //is numCount divisible by 3?
        while i <= numCount { //cycle from i (0) to numCount (nums length)
            if (i % 3 == 0 && i > 0) {

                //These are just debug functions!
                //print("i:",i,"i-3:",(i-3),"i-1:",(i-1))
                //print(nums[i-3], nums[i-1])

                //declare top and bottom functions
                let a = (i-3)
                let b = (i-1)

                holdingArray.append(copiedArray[a...b].reduce(0, +)) //append to second array the sum of all elements between "a" and "b" on the dynamic array.
                if (holdingArray[z] > bestSum ) {
                    bestSum = holdingArray[z] //assign bestSum value to the array
                }
                if (holdingArray[z] < worstSum ) {
                    worstSum = holdingArray[z] //assign worstSum value to the array
                }
                z = z+1
            }
            i = i+1
        }
        let secondCount = holdingArray.count //count the second array
        while a < secondCount {
            if (holdingArray[a] == worstSum) {
                i = a
            }
            a = a+1
        }
        a = i
        b = i+3
        while b > a {
            copiedArray.remove(at: a) //delete elements that are located at index a
            b = b-1 //decrement b
        }
    numCount = copiedArray.count //count copiedArray, and print it to numCount.
    }
    holdingArray.removeAll() //reinitialize holdingArray.
    /* We need to reinitialize some loaded variables. */
    z = 0
    bestSum = 0
    worstSum = 0

    if (numCount % 2 == 0) { //repeat the above, but if divisible by 2.
        while i <= numCount {
            if (i % 2 == 0 && i > 0) {
                /* establish top and bottom values */
                let a = (i-2)
                let b = (i-1)
                holdingArray.append(copiedArray[a...b].reduce(0, +)) //append sum
                if (holdingArray[z] > bestSum) {
                    bestSum = holdingArray[z]
                }
                if (holdingArray[z] < worstSum) {
                    worstSum = holdingArray[z]
                }
                z = z+1
            }
            i = i+1
        }
        let secondCount = holdingArray.count //count the second array
        /* reinitialize a and b */
        a=0
        i=0
        while a < secondCount {
            if (holdingArray[a] == worstSum) {
                i = a
            }
            a = a+1
        }
        /* set a and b to some arbitrary values */
        a = i+2
        b = i+4
        while b > a {
            copiedArray.remove(at: a)
            b = b-1
        }
    }
    /* let us know what the best array is */
    print("your best array set is: ",copiedArray)
    /* assign value to bestSum */
    bestSum = copiedArray.reduce(0, +)
    /* return value to the main trunk */
    return bestSum
}

/**

 This is what the entirety of the "main" code is, it simply does the function and applies it to a total, and then prints it.

 **/
var total = shrinkArray(nums)
print("your sum is: ", total)
