//
//  TableViewCell.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"
    
    private let catBreedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let breedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(catBreedImageView)
        contentView.addSubview(breedLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: TableViewCellViewModel) {
        breedLabel.text = viewModel.breed
        catBreedImageView.image = viewModel.image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height-10
        catBreedImageView.frame = CGRect(x: 5, y: 5, width: imageWidth, height: imageWidth)
        breedLabel.frame = CGRect(x: imageWidth+10, y: 0,
                                  width: contentView.frame.size.width-imageWidth,
                                  height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        breedLabel.text = nil
        catBreedImageView.image = nil
    }
}
