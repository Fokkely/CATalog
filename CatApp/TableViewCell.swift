//
//  TableViewCell.swift
//  CatApp
//
//  Created by Анита Самчук on 14.01.2022.
//

import UIKit
import SnapKit


class TableViewCell: UITableViewCell {

    static let identifier = "TableViewCell"
    
    private let breedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let breedNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    func typeset() {
        
        contentView.addSubview(breedNameLabel)
        breedNameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(60)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
        }
        
        contentView.addSubview(breedImageView)
        breedImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.equalToSuperview().inset(7)
            make.right.equalTo(breedNameLabel.snp.left).offset(-12.5)
            make.height.equalTo(breedNameLabel)
            make.width.equalTo(40)
        }


    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        typeset()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: TableViewCellViewModel) {
        breedNameLabel.text = viewModel.name
        breedImageView.image = viewModel.image
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        breedNameLabel.text = nil
        breedImageView.image = nil
    }

}
