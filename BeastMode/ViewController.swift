//
//  ViewController.swift
//  BeastMode
//
//  Created by Ashwin Mahesh on 7/9/18.
//  Copyright © 2018 AshwinMahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tasks=["Go to the gym", "Create a wireframe", "Make an ERD"]

    
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
                tasks.append(newTask)
            }
        }
        tableView.reloadData()
        taskTextField.text=""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int)->Int{
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath)->UITableViewCell{
        let cell=tableView.dequeueReusableCell(withIdentifier:"MyCell", for: indexPath)
        cell.textLabel?.text=tasks[indexPath.row]
        return cell
    }
}

