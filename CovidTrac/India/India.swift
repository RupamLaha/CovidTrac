//
//  India.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 16/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class India: UIViewController {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var totalInndia: UILabel!
    @IBOutlet weak var recoveredIndia: UILabel!
    @IBOutlet weak var deathsIndia: UILabel!
    @IBOutlet weak var lastUpdated: UILabel!
    
    var statesArray = [String]()
    var activeS = [String]()
    var recoveredS = [String]()
    var deathS = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiCalling()
    }
    
    func apiCalling() {
        
        let actInd = UIActivityIndicatorView(style: .large)
        actInd.color = UIColor.gray
        self.view.addSubview(actInd)
        actInd.frame = self.view.frame
        actInd.center = self.view.center
        actInd.startAnimating()
        
        let url = "https://api.covid19india.org/data.json"
        
        Alamofire.request(url, method: .get).responseJSON{ response in
            
            if let data = response.result.value{
                
                let json = JSON(data)
                
                self.totalInndia.text = json["statewise"][0]["active"].stringValue
                self.recoveredIndia.text = json["statewise"][0]["recovered"].stringValue
                self.deathsIndia.text = json["statewise"][0]["deaths"].stringValue
                self.lastUpdated.text = "Last updated: " + json["statewise"][0]["lastupdatedtime"].stringValue
//                print(json["statewise"].count)
//                print(json["statewise"][3]["state"].stringValue)
        
                for i in 1...(json["statewise"].count)-1{
                    let state = json["statewise"][i]["state"].stringValue
                    self.statesArray.append(state)
                    }
                for i in 1...(json["statewise"].count)-1{
                let ac = json["statewise"][i]["active"].stringValue
                self.activeS.append(ac)
                }
                for i in 1...(json["statewise"].count)-1{
                let re = json["statewise"][i]["recovered"].stringValue
                self.recoveredS.append(re)
                }
                for i in 1...(json["statewise"].count)-1{
                let de = json["statewise"][i]["deaths"].stringValue
                self.deathS.append(de)
                }
                
                    self.table.reloadData()
                    actInd.stopAnimating()
                //print(self.statesArray)
            }
            
            else{
                print(response.error?.localizedDescription as Any)
            }
            
        }
        
    }
    
}

//MARK:- TableView Delegate and DataSource

extension India: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! IndiaTableViewCell
        
        cell.stateNames.text = statesArray[indexPath.row]
        cell.activeInStates.text = activeS[indexPath.row]
        cell.recoveredInStates.text = recoveredS[indexPath.row]
        cell.deathsInStates.text = deathS[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if (indexPath.row <= 36){
        let vc = storyboard?.instantiateViewController(withIdentifier: "StateDetails") as! StateDetails
        
//        if (indexPath.row <= 36){
        vc.navTitle = statesArray[indexPath.row]
        
//        print(indexPath.row)

        self.navigationController?.pushViewController(vc, animated: true)
    }
    }
    
    
}
