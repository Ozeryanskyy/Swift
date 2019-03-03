//
//  TrackList.swift
//  ArtCover
//
//  Created by Anton Ozeryanskyy on 3/3/19.
//  Copyright © 2019 Anton Ozeryanskyy. All rights reserved.
//

import UIKit

class TrackList: UITableViewController {
    
    let imageNameArray = ["Alberto Ruiz - 7 elements (Original mix)",
                          "Dave Wincent - Red Eye (Original Mix)",
                          "E-Spectro - End Station (Original Mix)",
                          "Edna Ann - Phasma (Konstantis Yoodza Remix)",
                          "Ilija Djocovic - Delusion (Original Mix)",
                          "John Baptiste - Myselium (Original Mix)",
                          "Lane 8 - Fingerprint (Original Mix)",
                          "Mac Vaughn - Pink IS My Favorite Color (Alex Stein Remix)",
                          "Metodi Hrislav, Gallya - Badmash (Original Mix)",
                          "Veerus, Maxie Devine - Nightmare (Original Mix)"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)

        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailsVC = segue.destination as! DetailVC
                detailsVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }
    

}
