//
//  FirstViewController.swift
//  AngolaSA
//
//  Created by Vaibhav Kapur on 18/10/2016.
//  Copyright © 2016 AgeAnalytics. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class NewsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    static var arrRes = [NewsModel]()
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        newsTableView.dataSource = self
        newsTableView.delegate = self
        
        getNewsList()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getNewsList(){
        _ = Alamofire.request(Router.Read("newsWS")).responseCollection { (response: DataResponse<[NewsModel]>) in
            if response.result.value != nil {
                NewsViewController.arrRes = response.result.value!
                for newsDetails in NewsViewController.arrRes{                    
                    NewsVariable.newsTitleList.append(newsDetails.newstitle)
                    NewsVariable.newsDescription.append(newsDetails.newsDescription)
                }
                self.newsTableView.reloadData()
            }
        }

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
       newsTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsViewController.arrRes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let newsCellData = self.newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        newsCellData.newsTitle?.text = NewsVariable.newsTitleList[indexPath.row]
        newsCellData.newsDescription?.text = NewsVariable.newsDescription[indexPath.row]
        return newsCellData

    }
    
    
}
