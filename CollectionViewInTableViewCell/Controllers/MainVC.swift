//
//  ViewController.swift
//  CollectionViewInTableViewCell
//
//  Created by SawPyaeHtun on 12/28/18.
//  Copyright © 2018 SawPyaeHtun. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    var numberOfRow : Int?
    var photoArray = [Photo] ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableView.register(CollectionViewHolderTableViewCell.self, forCellReuseIdentifier: String(describing: CollectionViewHolderTableViewCell.self))
        NetworkingService.networkCall.getPhotoList{ (photos) in
            self.numberOfRow = photos.photo?.count
            print(String(describing: photos.photo?.count))
            self.photoArray = photos.photo!
            self.myTableView.reloadData()
        }
    }
}

extension MainVC : UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CollectionViewHolderTableViewCell.self)) as! CollectionViewHolderTableViewCell
        let photo = photoArray[indexPath.row]
        cell.setupCell(farm_id: String(describing : photo.farm!), sever_id: photo.server!, id: photo.id!, secret: photo.secret!)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

