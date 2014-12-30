//
//  ViewController.swift
//  SwiftNews
//
//  Created by Mafuyu Kamono on 2014/12/28.
//  Copyright (c) 2014年 Mafuyu Kamono. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let newsUrlString = "http://www.apple.com"
    
    // ニュースのアドレス
    @IBAction func refresh(sender: AnyObject) {
        // NSURLを作る
        var url = NSURL(string: newsUrlString)!
        
        // データをダウンロードする
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { data, response, error in
            // ダウンロードサイズを表示する（テスト用）
            println("done, length \(data.length)")
        })
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        // テーブルの行数を返す
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) ->UITableViewCell {
        // セルを取得する
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
        
        // セルにテキストを設定する
        cell.textLabel?.text = "Swift News"
        
        return cell
    }


}

