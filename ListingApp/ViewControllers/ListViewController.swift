//
//  ListViewController.swift
//  ListingApp
//
//  Created by Bharti Sharma on 05/02/18.
//  Copyright © 2018 Bharti Sharma. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var tblListView:UITableView!
    var arrList = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let appdel = UIApplication.shared.delegate!
        tblListView = UITableView(frame: CGRect(x: 0, y: 64, width: (appdel.window??.bounds.width)!, height: self.view.frame.height-64))
        tblListView.delegate = self
        tblListView.dataSource = self
        view.addSubview(tblListView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ProductCell")
        cell.textLabel?.text = arrList[indexPath.row].title
        cell.detailTextLabel?.text = arrList[indexPath.row].description
        return cell
    }
}
