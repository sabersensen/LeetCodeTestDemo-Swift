//
//  TestThree.swift
//  LeetCodeTestDemo-Swift
//
//  Created by 邹时新 on 2017/9/28.
//  Copyright © 2017年 zoushixin. All rights reserved.
//

import Foundation

/*
 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 */
/*
 Example 1:
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 */
class TestThree {
    
    func findMedianSortedArraysBest(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = nums1.count
        let n = nums2.count
        
        if m > n {
            return findMedianSortedArraysBest(nums2, nums1)
        }
        
        let halfLength: Int = (m + n + 1) >> 1
        var b = 0, e = m
        var maxOfLeft = 0
        var minOfRight = 0
        
        while b <= e {
            let mid1 = (b + e) >> 1
            let mid2 = halfLength - mid1
            
            if mid1 > 0 && mid2 < n && nums1[mid1 - 1] > nums2[mid2] {
                e = mid1 - 1
            } else if mid2 > 0 && mid1 < m && nums1[mid1] < nums2[mid2 - 1] {
                b = mid1 + 1
            } else {
                if mid1 == 0 {
                    maxOfLeft = nums2[mid2 - 1]
                } else if mid2 == 0 {
                    maxOfLeft = nums1[mid1 - 1]
                } else {
                    maxOfLeft = max(nums1[mid1 - 1], nums2[mid2 - 1])
                }
                
                if (m + n) % 2 == 1 {
                    return Double(maxOfLeft)
                }
                
                if mid1 == m {
                    minOfRight = nums2[mid2]
                } else if mid2 == n {
                    minOfRight = nums1[mid1]
                } else {
                    minOfRight = min(nums1[mid1], nums2[mid2])
                }
                
                break
            }
        }
        return Double(maxOfLeft + minOfRight) / 2.0
    }
    
    func findMedianSortedArraysMe(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let  nums1count = nums1.count;
        let  nums2count = nums2.count;
        
        if (nums1count>nums2count){
            return findMedianSortedArraysMe(nums2,nums1);
        }
        
        if (nums1count==0){
            if(nums2count%2==0){
                return Double(nums2[nums2count/2]+nums2[nums2count/2-1])/2
            }else{
                return Double((nums2[nums2count/2]))
            }
        }
        
        let num1start = nums1[0]
        let num1end = nums1[nums1count-1];
        let num2start = nums2[0]
        let num2end = nums2[nums2count-1]
        let allcount = nums1count+nums2count
        
        let countcha = nums2count - nums1count;
        if (num1end<=num2start) {
            if (countcha>0){
                if(countcha%2==0){
                    return Double(nums2[countcha/2]+nums2[countcha/2-1])/2
                }else{
                    return Double(nums2[countcha/2])
                }
            }else{
                return Double(num1end+num2start)/2
            }
        }else if(num1start>=num2end){
            if (countcha>0){
                if(countcha%2==0){
                    return Double(nums2[nums2count-countcha/2-1]+nums2[nums2count-countcha/2])/2
                }else{
                    return Double(nums2[nums2count-countcha/2-1])
                }
            }else{
                return Double(num1start+num2end)/2
            }
        }else{
            var nums3 = nums1+nums2;
            nums3 = nums3.sorted();
            if(allcount%2==0){
                return Double(nums3[allcount/2]+nums3[allcount/2-1])/2
            }else{
                return Double((nums3[allcount/2]))
            }
        }
    }
}
