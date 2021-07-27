//
//  ViewController.swift
//  ios_notepad
//
//  Created by 吴超 on 2021/7/21.
//

import UIKit
import SnapKit
protocol HomeButtomDelegate {
    func homeButtomClick(title:String)
}
class ViewController: UIViewController, HomeButtomDelegate {
    
    var homeView:HomeView?
    var dataArray:Array<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installDataBase()
        installUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataArray = DataManager.getGroup()
        self.homeView?.dataArray = dataArray
        self.homeView?.updateLayout()
    }
    func installDataBase(){
        DataManager.openDataBase();
    }
    func installUI(){
        self.title = "点滴生活"
        self.edgesForExtendedLayout = UIRectEdge()
        homeView = HomeView(frame: CGRect(x:0,y:0,width: self.view.frame.size.width,height: self.view.frame.size.height-64))
        self.view.addSubview(homeView!) 
        //这句千万不能少
        homeView?.homeButtonDelegate = self
        homeView?.dataArray = dataArray
        homeView?.updateLayout()
        installNavigationItem()
    }
    func installNavigationItem(){
        let item=UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addGroup))
        self.navigationItem.rightBarButtonItem=item
        
    }
    @objc func addGroup(){
        let alertController = UIAlertController(title: "添加记事分组", message:"添加的分组名不能与已有分组重复或为空", preferredStyle: .alert)
        //swift 闭包知识点
        alertController.addTextField{(textFiled) in textFiled.placeholder = "请输入记事分组名称"}
        let alertItem = UIAlertAction(title: "取消", style: .cancel,handler: {(UIAlertAction) in return;})
        let alertItemAdd = UIAlertAction(title: "确定", style: .default, handler:
        {(UIAlertAction) -> Void in
            var exist = false
            self.dataArray?.forEach({(element) in if element == alertController.textFields?.first!.text || alertController.textFields?.first!.text?.count == 0{
                exist = true
            }})
            if exist{
                return
            }
            self.dataArray?.append(alertController.textFields!.first!.text!)
            self.homeView?.dataArray = self.dataArray
            self.homeView?.updateLayout()
            DataManager.saveGroup(name: alertController.textFields!.first!.text!)
            
         })
        alertController.addAction(alertItem)
        alertController.addAction(alertItemAdd)
        self.present(alertController, animated: true, completion: nil)
    }
    func homeButtomClick(title: String) {
        let controller = NodeListTableViewController()
        controller.name = title
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}

