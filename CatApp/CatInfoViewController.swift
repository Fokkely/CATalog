//
//  CatInfoViewController.swift
//  CatApp
//
//  Created by Анита Самчук on 19.01.2022.
//

import UIKit

class CatInfoViewController: UIViewController {
    
    let catInfo: Cat
    
    init(catInfo: Cat) {
        self.catInfo = catInfo
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let breedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let breedNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let breedDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let breedLifeSpanLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 23)
        return label
    }()
    
    private let breedAltNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 23)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    func typeset() {
        
        view.addSubview(breedImageView)
        breedImageView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(5)
            make.left.equalToSuperview().inset(15)
            make.height.equalTo(breedImageView.snp.width).offset(-80)
            make.width.equalToSuperview().offset(-30)
        }
        
        view.addSubview(breedNameLabel)
        breedNameLabel.snp.makeConstraints { make in
            make.top.equalTo(breedImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        if breedAltNameLabel.text != "Altenative names: "{
            view.addSubview(breedAltNameLabel)
            breedAltNameLabel.snp.makeConstraints { make in
                make.top.equalTo(breedNameLabel.snp.bottom).offset(10)
                make.left.right.equalTo(breedImageView)
                make.centerX.equalToSuperview()
            }
        } else {
            view.addSubview(breedAltNameLabel)
            breedAltNameLabel.font = UIFont.systemFont(ofSize: 0)
            breedAltNameLabel.snp.makeConstraints { make in
                make.top.equalTo(breedNameLabel.snp.bottom)
            }
        }
        
        view.addSubview(breedLifeSpanLabel)
        breedLifeSpanLabel.snp.makeConstraints { make in
            make.top.equalTo(breedAltNameLabel.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        view.addSubview(breedDescriptionLabel)
        breedDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(breedLifeSpanLabel.snp.bottom).offset(30)
            make.left.equalTo(breedImageView).offset(10)
            make.right.equalTo(breedImageView).offset(-7)
//            make.centerY.equalTo(breedLifeSpanLabel.snp.bottom)
//            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }

    func configure(with viewModel: CatInfoViewModel) {
        breedImageView.image = viewModel.image
        breedNameLabel.text = viewModel.name
        breedDescriptionLabel.text = "\(viewModel.description)"
        breedLifeSpanLabel.text = "Life span: \(viewModel.life_span) years"
        breedAltNameLabel.text = "Altenative names: \(viewModel.alt_names ?? "None")"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configure(with: CatInfoViewModel(with: catInfo))
        view.backgroundColor = UIColor.systemBackground
        typeset()
        
    }
}
