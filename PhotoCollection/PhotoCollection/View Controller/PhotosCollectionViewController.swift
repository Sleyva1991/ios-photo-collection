//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Steven Leyva on 8/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTheme()
        collectionView.reloadData()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddSegue" {
            guard let addDetailVC = segue.destination as? PhotosDetailViewController else { return }
            addDetailVC.photoController = photoController
            addDetailVC.themeHelper = themeHelper
            
        } else if segue.identifier == "CellSegue" {
            guard let DetailVC = segue.destination as? PhotosDetailViewController,
                let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            let photo = photoController.photos[indexPath.item]
            DetailVC.photoController = photoController
            DetailVC.themeHelper = themeHelper
            DetailVC.photo = photo
    
        } else if segue.identifier == "ThemeSelect" {
            guard let selectionVC = segue.destination as? ThemeSelectionViewController else { return }
            selectionVC.themeHelper = themeHelper
        }
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotosCollectionViewCell
    
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
    
        return cell
    }
    
    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        if themePreference == "Dark" {
            collectionView.backgroundColor = .darkGray
        } else if themePreference == "Grey" {
            collectionView.backgroundColor = .gray
        }
    }


}
