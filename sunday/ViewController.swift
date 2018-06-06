//
//  ViewController.swift
//  sunday
//
//  Created by 锦色年华 on 2018/6/1.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

import UIKit

class ViewController: FatherViewController,UITableViewDataSource,UITableViewDelegate {
    var maintableview = UITableView()
    var dataarr = NSMutableArray()
     var modelArr:NSMutableArray = []
//    lazy var maintableview :UITableView = {
//        () -> UITableView in
//
//        maintableview.delegate = self
//        maintableview.dataSource = self
//        return maintableview
//    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maintableview = UITableView(frame:self.view.bounds, style:UITableViewStyle.grouped);
        self.view.backgroundColor = UIColor.white
        maintableview.delegate = self;
        maintableview.dataSource = self;
        self.lzj()
        let bb = self.lv(zj: 100)
        print("lzj\(bb)")
        let userscore = [1,2,3,4,5,6]
        print("啦啦啦\(self.makescore(scores: userscore))")
        var array = Array<String>()
        array.append("10")
        print("数组\(array)")
        var dict:Dictionary<String,String> = ["第一":"0","第二":"1"]
        print("字典\(String(describing: dict["第二"]))")
        for(index,item) in userscore.enumerated()
        {
            print("数组\(index):\(item)")
        }
        let vv = {(aa:Int,bb:Int)->Bool in
            return aa<bb
        }
        let ss = vv(1,2)
        print("大小\(ss)")
        let sortNumbers = userscore.sorted(by: { $0<$1 })
        print("numbers -" + "\(sortNumbers)")
        NotificationCenter.default.post(name: Notification.Name.userLogin, object: nil)
        self.view .addSubview(maintableview)
        maintableview.register(UINib(nibName:"LzjTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        self.lzjurl(parameters:["i":"3","c":"entry","m":"ewei_shopv2","do":"mobile","r":"app.seedling.index"], successstr: { (object:Any) in
           // print("得出:\(object)")
            
            let items = object as? Dictionary<String, AnyObject>
            let arr = items!["banner"] as? NSArray
            for dict1 in arr!
            {
                let ll = dict1 as! NSDictionary
//                print(index as Any )
//                self.modelArr.add(ll["thumb"] as Any)
                 let models = lzjmodel()
                models.advname = ll["thumb"] as! String
                self.modelArr.add(models)
            }
            
            // 刷新tableview
            self.maintableview.reloadData()
            
        }) { (failstr:Any) in
            
        }
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func lzj() -> Void {
        let lv:(Int,Float,String,Int) = (1,8.88,"lzj",1)
        print(lv.0)
    }
    func lv(zj:Int) -> Int {
        let aa = zj
        return aa
    }
    func makescore(scores:[Int]) -> (maxscore:Int,minscore:Int) {
        var maxS = scores[0]
        var minS = scores[0]
        for score in scores[1..<scores.count] {
            maxS = max(maxS,score)
            minS = min(minS,score)
        }
        return(maxscore:maxS,minscore:minS)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.modelArr.count
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        return 170
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:LzjTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LzjTableViewCell
        cell.title.text = ( self.modelArr[indexPath.row] as! lzjmodel ).advname
        cell.lzjimg.downloadedFrom(imageurl: String(format: "%@%@", arguments:["http://www.pujiante.cn/attach/",( self.modelArr[indexPath.row] as! lzjmodel ).advname]))
        
        return cell;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

