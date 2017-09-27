//
//  TestOne.swift
//  LeetCodeTestDemo-Swift
//
//  Created by 邹时新 on 2017/9/26.
//  Copyright © 2017年 zoushixin. All rights reserved.
//

import Foundation

/*
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 */
/*
 Example
 Given nums = [2, 7, 11, 15], target = 9,
 
 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 */
class TestOne {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int:Int]();
        for (index,num) in nums.enumerated() {
            let otherNum = target-num;
            if let i = dic[otherNum]{
                return [index,i];
            }else{
                dic[num] = index;
            }
        }
        return [];
    }
}




