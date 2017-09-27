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


/*
 Given a string, find the length of the longest substring without repeating characters.
 */
/*
 Examples:
 
 Given "abcabcbb", the answer is "abc", which the length is 3.
 
 Given "bbbbb", the answer is "b", with the length of 1.
 
 Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 */
/*
 上面是根据c++ 写的 感觉懵逼
 下面是自己写的 超时
 */
class TestTwo {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var dic = [Character:Int]();
        var start = -1;
        var maxLegth:Int = 0;
        for (index,sss) in s.characters.enumerated() {
            if (dic[sss] != nil){
                if(dic[sss]!>start){
                    start = dic[sss]!
                }
            }
            dic[sss] = index;

            maxLegth = max(maxLegth, index-start)
            
        }
        return maxLegth;
    }
    
    func lengthOfLongestSubstring01(_ s: String) -> Int {
        var set = Set<Character>()
        var num = 0;
        var index = 0;
        for sss in s.characters {
            if(set.insert(sss).inserted==false){
                
                if(set.count>num){
                    num = set.count
                }
                set.removeAll();
                
                let endIndex = s.index(s.startIndex, offsetBy: index)
                let text:String? = String(s[s.startIndex...endIndex]);
                
                for ssss in (text?.characters.reversed())!{
                    if (set.insert(ssss).inserted==false){
                        break;
                    }
                }
            }else if(index == s.characters.count-1){
                if(set.count>num){
                    num = set.count
                }
            }
            index += 1;
        }
        
        return num;
    }
    
    
    
    
}

