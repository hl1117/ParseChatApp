//
//  ChatViewController.swift
//  ParseChat
//
//  Created by Harika Lingareddy on 2/5/18.
//  Copyright © 2018 Harika Lingareddy. All rights reserved.
//

import UIKit
import Parse

private let reuseIdentifier = "Cell"

class ChatViewController: UICollectionViewController {
    
    @IBOutlet weak var TV: UITableView!
    @IBOutlet weak var messageText: UITextField!
    
      var parseObjects: [PFObject]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        TV.dataSource = self
        TV.delegate = self
        
        TV.rowHeight = UITableViewAutomaticDimension
        // Provide an estimated row height. Used for calculating scroll indicator
        TV.estimatedRowHeight = 50
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

   

}
