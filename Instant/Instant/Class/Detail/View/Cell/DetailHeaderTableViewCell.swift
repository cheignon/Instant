//
//  DetailHeaderTableViewCell.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit
import AlamofireImage
class DetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var imagePreviewView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// this function permit to fille cell with dat
    /// - parameters:
    ///    - article: ``Article`` object ,  this object contain all information to  fille every object of this cel
    func didReceiveAn(article: Article) {
        self.setupImageViewWith(article: article)
    }
    
    func setupImageViewWith(article: Article, defaultImage: UIImage = UIImage(named: "news")!) {
    
        guard let imageUrlString = article.urlToImage, let imageUrl = URL(string: imageUrlString) else {
            self.imagePreviewView.image = defaultImage
            return
        }
        let size = self.bounds.size
        self.imagePreviewView.af.setImage(withURL: imageUrl, placeholderImage: defaultImage, imageTransition: UIImageView.ImageTransition.crossDissolve(0.37), runImageTransitionIfCached: true)
    }

}
