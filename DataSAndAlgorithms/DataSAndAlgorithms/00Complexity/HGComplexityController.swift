//
//  HGComplexityController.swift
//  DataSAndAlgorithms
//
//  Created  by hong.zhu on 2019/6/8.
//  Copyright © 2019 HG. All rights reserved.
//

import UIKit
import os

class HGComplexityController: HGBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// 斐波那契数列 -> 递归
    func fib_recarsive(data:Int) -> Int {
        if data <= 1 {
            return data
        }
        return fib_recarsive(data: (data-1)) + fib_recarsive(data: (data-2))
    }

    /// 斐波那契数列 -> 优化
    func fib_optimize(data:Int) -> Int {
        if data <= 1 {
            return data
        }
        
        var first = 0
        var second = 1
        for _ in 0...(data-2) {
            let sum = first + second
            first = second
            second = sum
        }
        
        return second
    }

    /// 斐波那契数列 -> 优化 (减少了一个变量的开销)
    func fib_optimize_best(data:Int) -> Int {
        if data <= 1 {
            return data
        }
        
        var first = 0
        var second = 1
        
        // Swift 可以这么玩
        var data = data
        
        repeat {
            second += first
            first = second - first
            data -= 1
        } while data > 1
        
        return second
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        
        // log 句柄
        let parsingLog = OSLog(subsystem: "com.hg.data", category: "Complexity")
        // 开始
        os_signpost(.begin, log: parsingLog, name: "Complexity", "started")
        
        let data = 45
        var result:Int
        
        var funName:String
        
        if indexPath.row == 0 {
            // 递归
            result = fib_recarsive(data:data)
            funName = "fib_recarsive"
        } else if indexPath.row == 1 {
            // 优化
            result = fib_optimize(data:data)
            funName = "fib_optimize"
        } else {
            // 最优
            result = fib_optimize_best(data:data)
            funName = "fib_optimize_best"
        }
        
        // 结束
        os_signpost(.end, log: parsingLog, name: "Complexity", "finished data = %d funName = %s", data, funName)
    }
}
