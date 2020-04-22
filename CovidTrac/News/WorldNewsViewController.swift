//
//  WorldNewsViewController.swift
//  CovidTrac
//
//  Created by RUPAM LAHA on 22/04/20.
//  Copyright © 2020 RUPAM LAHA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage
import SafariServices

class WorldNewsViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var titleArray = [String]()
    var contentArray = [String]()
    var imgUrlArray = [NSURL]()
    var sourceUrlArray = [NSURL]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        api()
    }
    
    func api(){
        
        let ai = UIActivityIndicatorView(style: .large)
        ai.color = UIColor.gray
        self.view.addSubview(ai)
        ai.frame = self.view.frame
        ai.center = self.view.center
        ai.startAnimating()
        
    let url = "http://newsapi.org/v2/top-headlines?q=corona&q=covid19&q=covid&q=coronavirus&sortBy=popularity&apiKey=f2209aa52ab44682b244dc0c2643d077"
    
                Alamofire.request(url).responseJSON{ response in
    
                    if let data = response.result.value {
    
                        let json = JSON(data)
    
                        for i in 0...(json["articles"].count) - 1{
    
                            let title = json["articles"][i]["title"].stringValue
                            let content = json["articles"][i]["description"].stringValue
                            let imgUrl = json["articles"][i]["urlToImage"].url ?? NSURL(string: "")! as URL
                            let sourceUrl = json["articles"][i]["url"].url
    
    
                            self.titleArray.append(title)
                            self.contentArray.append(content)
                            self.imgUrlArray.append(imgUrl as NSURL)
                            self.sourceUrlArray.append(sourceUrl! as NSURL)
                        }
    
                        self.table.reloadData()
                        ai.stopAnimating()
                    }
    
                    else{
                        print(response.error?.localizedDescription as Any)
                    }
    
                }
    }

}

extension WorldNewsViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 440
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return titleArray.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorldNewsTableViewCell
    
            cell.title.text = titleArray[indexPath.row]
            cell.descripNews.text = contentArray[indexPath.row]
            cell.img.sd_setImage(with: imgUrlArray[indexPath.row] as URL, placeholderImage: UIImage(named: "CovidTracBanner.png"))
    
            return cell
        }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            let sf = SFSafariViewController(url: sourceUrlArray[indexPath.row] as URL)
    
            present(sf, animated: false)
        }
    
    
}
