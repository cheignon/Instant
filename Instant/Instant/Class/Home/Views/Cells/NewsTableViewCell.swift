//
//  NewsTableViewCell.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit
import AlamofireImage
class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    let dateFormatterOutput = DateFormatter()

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
        self.setupLabelWith(article: article)
        self.setupImageViewWith(article: article)
    }
    
    /// this function will configure the label inside the cell
    /// - parameters:
    ///    - article:  ``Article`` Object, this dat permit to file text on this cell
    func setupLabelWith(article: Article) {
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.description ?? article.content
        
        if let date = article.convertPublishAtToDate() {
            self.dateFormatterOutput.dateFormat = "dd MMM yyyy"
            let newDateString = self.dateFormatterOutput.string(from: date)
            self.dateLabel.text = newDateString
        }
    }
    
    /// this function will fetch the image it the url or article is set and with ``AlamofireImage`` framwork this image
    /// will be put on the cache so the future displaying will be faster
    /// - Parameters:
    ///    - article: ``Article`` Objectt, the object wich contain the url of image to fetch
    ///    - defaultImage: ``UIImage`` Object ,  this image will be put during the process of downloading, and if the
    ///    the url is not set
    func setupImageViewWith(article: Article, defaultImage: UIImage = UIImage(named: "news")!) {
        self.previewImageView.layer.cornerRadius = 10
        self.previewImageView.clipsToBounds = true
        guard let imageUrlString = article.urlToImage, let imageUrl = URL(string: imageUrlString) else {
            self.previewImageView.image = defaultImage
            return
        }
        let screenWidth = UIScreen.main.bounds.width - (2 * 20)
        let size = CGSize(width: screenWidth, height: screenWidth * 1.778)
        self.previewImageView.af.setImage(withURL: imageUrl, placeholderImage: defaultImage, imageTransition: UIImageView.ImageTransition.crossDissolve(0.37), runImageTransitionIfCached: true)
    }

}
