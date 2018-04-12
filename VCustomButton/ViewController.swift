//
//  ViewController.swift
//  VCustomButton
//
//  Created by Leaf on 2018/3/30.
//  Copyright © 2018年 leaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: VNormalButton!
    @IBOutlet weak var button2: VNormalButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button1.layer.borderWidth = 1
        button1.layer.borderColor = UIColor.black.cgColor
        button2.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.black.cgColor
        //调用OC方法，OC方法调用Swift方法
        OCTest.callSwift()
        print("Swift文件中使用OC类")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeType(_ sender: Any) {
        button1.imagePosition = VNormalButton.VNormalButtonImagePosition(rawValue: (button1.imagePosition.rawValue + 1) % 4)!
        button2.imagePosition = VNormalButton.VNormalButtonImagePosition(rawValue: (button2.imagePosition.rawValue + 1) % 4)!
    }
    
    @IBAction func changeAlignment(_ sender: Any) {
        button1.contentHorizontalAlignment = UIControlContentHorizontalAlignment(rawValue: (button1.contentHorizontalAlignment.rawValue + 1) % 4)!
        button2.contentHorizontalAlignment = UIControlContentHorizontalAlignment(rawValue: (button2.contentHorizontalAlignment.rawValue + 1) % 4)!
    }
    
    @IBAction func leftChanged(_ sender: Any) {
        button1.titleEdgeInsets.left = CGFloat((sender as! UISlider).value)
        button2.titleEdgeInsets.left = CGFloat((sender as! UISlider).value)
    }
    @IBAction func rightChanged(_ sender: Any) {
        button1.titleEdgeInsets.right = CGFloat((sender as! UISlider).value)
        button2.titleEdgeInsets.right = CGFloat((sender as! UISlider).value)
    }
    @IBAction func topChanged(_ sender: Any) {
        button1.titleEdgeInsets.top = CGFloat((sender as! UISlider).value)
        button2.titleEdgeInsets.top = CGFloat((sender as! UISlider).value)
    }
    @IBAction func bottomChanged(_ sender: Any) {
        button1.titleEdgeInsets.bottom = CGFloat((sender as! UISlider).value)
        button2.titleEdgeInsets.bottom = CGFloat((sender as! UISlider).value)
    }
}

