//
//  PreviewPage.swift
//  ArtCover2
//
//  Created by Anton Ozeryanskyy on 3/3/19.
//  Copyright © 2019 Anton Ozeryanskyy. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ArtCover"

class PreviewPage: UICollectionViewController {
    
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
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPaths = self.collectionView.indexPathsForSelectedItems, let indexPath = indexPaths.first {
                let detailVc = segue.destination as! DetailVC
                detailVc.trackName = imageNameArray[indexPath.row]
            }
        }
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNameArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ArtCoverCell
        cell.coverImageView.image = UIImage(named: imageNameArray[indexPath.row])
        return cell
    }

}
