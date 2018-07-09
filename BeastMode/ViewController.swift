//
//  ViewController.swift
//  BeastMode
//
//  Created by Ashwin Mahesh on 7/9/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableData:[String]=[String]()

    
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBAction func beastButtonPushed(_ sender: UIButton) {
        if let newTask=taskTextField.text{
            var allSpaces=true
            for char in newTask{
                if char != " "{
                    allSpaces=false
                    break;
                }
            }
            if !allSpaces{
                tableData.append(newTask)
            }
        }
        tableView.reloadData()
        taskTextField.text=""
//        Hides the keyboard
        taskTextField.resignFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int)->Int{
        return tableData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath)->UITableViewCell{
        let cell=tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        cell.textLabel?.text=tableData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section), Row: \(indexPath.row)")
        tableData.remove(at: indexPath.row)
        tableView.reloadData()
        showToast(message: "Task completed!")
    }
}

