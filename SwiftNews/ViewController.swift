//
//  ViewController.swift
//  SwiftNews
//
//  Created by Mafuyu Kamono on 2014/12/28.
//  Copyright (c) 2014年 Mafuyu Kamono. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    // エントリーの配列
    var entries = NSArray()
    
    // ニュースサイトのアドレス
    let newsUrlString = "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.dailynews.yahoo.co.jp/fc/rss.xml&num=8"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // エントリーの数を返す
        return entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // セルを取得する
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
        
        // エントリーを取得する
        var entry = entries[indexPath.row] as NSDictionary
        
        // セルにタイトルを設定する
        cell.textLabel!.text = entry["title"] as? String
        
        return cell
    }
    
    // ニュースのアドレス
    @IBAction func refresh(sender: AnyObject) {
        // NSURLを作る
        let url = NSURL(string: newsUrlString)!

        // データをダウンロードする
        var task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { data, response, error in
            
            // JSONデータを辞書に変換する
            var dict: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary
            
            // /responseData/feed/entriesを取得する
            if var responseData = dict?["responseData"] as? NSDictionary {
                if var feed = responseData["feed"] as? NSDictionary {
                    if var entries = feed["entries"] as? NSArray {
                        // エントリーの配列を設定する
                        self.entries = entries
                    }
                }
            }
            
            // テーブルビューの更新をするため、マルチスレッドにスイッチする
            dispatch_async(dispatch_get_main_queue(), {
                // テーブルビューの更新をする
                self.tableView.reloadData()
            })
        })
        task.resume()
    }
}