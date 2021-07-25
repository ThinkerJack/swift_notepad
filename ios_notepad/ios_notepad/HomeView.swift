//
//  HomeView.swift
//  ios_notepad
//
//  Created by orangelab on 2021/7/22.
//

import UIKit

class HomeView: UIScrollView {
    
    var homeButtonDelegate:HomeButtomDelegate?
    
    let interitemSpacing = 15
    let lineSpacing = 25
    var dataArray:Array<String>?
    var itemArray:Array<UIButton> = Array<UIButton>()
    func updateLayout(){
        let itemWidth = (self.frame.size.width-CGFloat(4*interitemSpacing))/3
        let itemHeight = itemWidth/3*4
        itemArray.forEach({
            (element) in element.removeFromSuperview()
        })
        itemArray.removeAll()
        if dataArray != nil && dataArray!.count>0{
            for index in 0..<dataArray!.count{
                let btn = UIButton(type: .system)
                btn.setTitle(dataArray![index], for: .normal)
                btn.frame = CGRect(
                    x:CGFloat(interitemSpacing)+CGFloat(index%3)*(itemWidth+CGFloat(interitemSpacing)),
                    y:CGFloat(interitemSpacing)+CGFloat(index/3)*(itemHeight+CGFloat(lineSpacing)),
                    width: itemWidth,
                    height: itemHeight)
                btn.layer.masksToBounds = true
                btn.layer.cornerRadius = 15
                btn.backgroundColor = UIColor(red:1,green:242/255.0,blue:216/255.0,alpha:1)
                btn.setTitleColor(UIColor.gray, for: .normal)
                btn.tag = index
                btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
                self.addSubview(btn)
                itemArray.append(btn)
            }
            self.contentSize = CGSize(width: 0, height: itemArray.last!.frame.origin.y+itemArray.last!.frame.size.height + CGFloat(lineSpacing))
        }
    }

   @objc func btnClick(btn:UIButton){
        homeButtonDelegate?.homeButtomClick(title: dataArray![btn.tag])
    }

}
