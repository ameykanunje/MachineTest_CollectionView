//
//  BooksCollectionViewCell.swift
//  MachineTest_03_26
//
//  Created by csuftitan on 3/26/24.
//

import UIKit

class BooksCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
