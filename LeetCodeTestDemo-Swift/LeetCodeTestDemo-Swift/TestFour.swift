//
//  TestFour.swift
//  LeetCodeTestDemo-Swift
//
//  Created by 邹时新 on 2017/9/29.
//  Copyright © 2017年 zoushixin. All rights reserved.
//

import Foundation

class TestFour {
    func longestPalindrome(_ s: String) -> String {
        var maxLenth = 0;
        var maxStartIndex = 0;
        var startIndex = 0;
        var dic:Dictionary! = [Character:Int]()
        var lenth = 0;
        for (index,character) in s.characters.enumerated() {
            if (dic[character] != nil){
                lenth = index-dic[character]!
                startIndex = dic[character]!
            }
            dic[character] = index;
            if(lenth>maxLenth){
                maxLenth = lenth;
                maxStartIndex = startIndex;
            }
        }
        let start = s.index(s.startIndex, offsetBy: maxStartIndex)
        let end = s.index(s.index(s.startIndex, offsetBy: maxStartIndex), offsetBy: maxLenth)
        return String(s[start...s.index(s.index(s.startIndex, offsetBy: maxStartIndex), offsetBy: maxLenth)])
    }
}
