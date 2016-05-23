//
//  LKMessage.swift
//  Flyingground
//
//  Created by 邱文武 on 16/5/14.
//  Copyright © 2016年 Tonny. All rights reserved.
//

import Foundation

public class LKMessage
{
    var message:String;
    
    public init(_ message:String)
    {
        self.message = message;
    }
    
    public func printMessage()
    {
        print(message);
    }
}