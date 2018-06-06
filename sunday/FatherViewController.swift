//
//  FatherViewController.swift
//  sunday
//
//  Created by 锦色年华 on 2018/6/4.
//  Copyright © 2018年 锦色年华. All rights reserved.
//

import UIKit
import Alamofire
extension UIImageView{
    func downloadedFrom(imageurl : String){
        //创建URL对象
        let url = URL(string: imageurl)!
        //创建请求对象
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            if error != nil{
                print(error.debugDescription)
            }else{
                //将图片数据赋予UIImage
                let img = UIImage(data:data!)
                
                // 这里需要改UI，需要回到主线程
                DispatchQueue.main.async {
                    self.image = img
                }
                
            }
        }) as URLSessionTask
        
        //使用resume方法启动任务
        dataTask.resume()
    }
}
extension Notification.Name {
    //用户登录成功处理
    public static let userLogin = Notification.Name(rawValue: "notification.name.userLogin")
    //用户退出登录处理
    public static let userLogout = Notification.Name(rawValue: "notification.name.userLogout")
    //用户被强制退出登录处理
    public static let userForceLogout = Notification.Name(rawValue: "notification.name.userForceLogout")
    
}
extension UIStoryboard{
    public struct Sbname{
        //main
        public static let main = UIStoryboard(name: "Main", bundle: nil)
        
    }
}
class FatherViewController: UIViewController {
    let  SERVERSURL:String = "http://www.pujiante.cn/app/index.php?i=3&c=entry&m=ewei_shopv2&do=mobile&r=app.seedling.index"
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func lzjurl(parameters:Dictionary<String, Any>?,successstr: @escaping (_:Any)->Void,failstr: @escaping (_:Any)->Void)->Void
{
//    Alamofire.request(SERVERSURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//        switch response.result {
//        case .success:
//           successstr(response.result.value as Any)
//        case .failure:
//            failstr(response.error as Any)
//        }
//    }
    //let para = ["i":"3","c":"entry","m":"ewei_shopv2","do":"mobile","r":"app.seedling.index"]
    Alamofire.request(SERVERSURL, method: .post, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
        if(response.error == nil){
            successstr(response.result.value as Any)
        }else{
            failstr(response.error as Any)
        }
    }
    
   
    }
    }


