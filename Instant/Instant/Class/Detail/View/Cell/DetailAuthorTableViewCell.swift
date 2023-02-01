//
//  DetailAuthorTableViewCell.swift
//  Instant
//
//  Created by dorian cheignon on 01/02/2023.
//

import UIKit

class DetailAuthorTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLable: UILabel!
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
    }

    // this function will configure the label inside the cell
    /// - parameters:
    ///    - article:  ``Article`` Object, this dat permit to file text on this cell
    func setupLabelWith(article: Article) {
        self.authorLable.text = article.author
    }
}
