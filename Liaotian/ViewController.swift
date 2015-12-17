//
//  ViewController.swift
//  Liaotian
//
//  Created by qzp on 15/11/10.
//  Copyright © 2015年 qzp. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    
   
    var dataSource: [Chat]! = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let ct = Chat()
        ct.name = "王晓明"
        ct.date = "2015-09-09"
        ct.message = "sndofnsdoinfoinoiwennsdlnflsdnsdonfoadsol"
        ct.type = MessageType.Text
        ct.photo = "http://pics.sc.chinaz.com/files/pic/pic9/201508/apic14052.jpg"
        ct.picUrls = ["http://pics.sc.chinaz.com/files/pic/pic9/201509/apic14594.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201510/apic15825.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201507/apic13059.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201509/apic14498.jpg"]
        
        
        let ct2 = Chat()
        ct2.name = "东皇太一"
        ct2.date = "2013-12-09"
        ct2.message = "当我们开始解决内存泄露问题时，我们看到 OOM 崩溃率有所降低，但是依然没有达到我们预期。紧接着，我们深入研究 Apple 的 Instruments内"
        ct2.type = MessageType.Text
        ct2.photo = "http://pics.sc.chinaz.com/files/pic/pic9/201509/apic14594.jpg"
        ct2.picUrls = ["http://pics.sc.chinaz.com/files/pic/pic9/201508/apic13785.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201509/apic14594.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201510/apic15825.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201507/apic13059.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201509/apic14498.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201506/apic12753.jpg",
            "http://pics.sc.chinaz.com/files/pic/pic9/201509/apic15230.jpg"]
        
        let ct3 = Chat()
        ct3.name = "Bob"
        ct3.date = "2012-09-09"
        ct3.message = "hello world"
        ct3.photo = "http://pics.sc.chinaz.com/files/pic/pic9/201509/apic15230.jpg"
        ct3.type = MessageType.Text
        
        
        dataSource.append(ct)
        dataSource.append(ct2)
        dataSource.append(ct)
        dataSource.append(ct3)
        
     
        
        
        
        self.automaticallyAdjustsScrollViewInsets = false
//        tableView.registerClass(ChatCell.self, forCellReuseIdentifier: "CHATCELL")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
         return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = tableView.dequeueReusableCellWithIdentifier("CHATCELL") as! ChatCell
        let cell = ChatCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CHATCELL")
        cell.setCell(dataSource[indexPath.row])
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return ChatCell.cellHeight(dataSource[indexPath.row])
    }
}