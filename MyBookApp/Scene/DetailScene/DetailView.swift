//
//  DetailView.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/07.
//

import UIKit

class DetailView: UIView {
    
    // MARK: - Set Item Values
    
    var item: Item? {
        didSet {
            guard let item = self.item else { return }
            
            FirebaseService.shared.searchBookInfo(item.id) { result in
                ReadStatus.shared.isRead = result
                
                if ReadStatus.shared.isRead {
                    self.readCheckButton.setImage(UIImage(named: Symbols.checked), for: .normal)
                } else {
                    self.readCheckButton.setImage(UIImage(named: Symbols.nonChecked), for: .normal)
                }
            }
            
            titleButton.setTitle(item.volumeInfo.title, for: .normal)
            authorsLabel.text = item.volumeInfo.authors?.joined(separator: ", ") ?? Text.noInfo
            let currencyCode = item.saleInfo?.retailPrice?.currencyCode ?? ""
            let retailPrice = item.saleInfo?.retailPrice?.amount?.description ?? Text.noInfo
            retailPriceLabel.text = "\(currencyCode) \(retailPrice.description)"
            descriptionTextView.text = item.volumeInfo.description ?? Text.noInfo
            
            detailInfoStackView.categoriesView.mainTitleLabel.text = Text.categoriesView
            detailInfoStackView.categoriesView.contentLabel.text = item.volumeInfo.categories?.joined(separator: ", ") ?? Text.noInfo
            detailInfoStackView.publisherView.mainTitleLabel.text = Text.publisherView
            detailInfoStackView.publisherView.contentLabel.text = item.volumeInfo.publisher ?? Text.noInfo
            detailInfoStackView.publishedDateView.mainTitleLabel.text = Text.publishedDateView
            detailInfoStackView.publishedDateView.contentLabel.text = item.volumeInfo.publishedDate ?? Text.noInfo
            detailInfoStackView.pageCountView.mainTitleLabel.text = Text.pageCountView
            detailInfoStackView.pageCountView.contentLabel.text = item.volumeInfo.pageCount?.description ?? Text.noInfo
        }
    }
    
    // MARK: - Create UI
    
    let contentScrollView: UIScrollView = {
        let sv = UIScrollView()
        return sv
    }()
    
    let readCheckButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: Symbols.nonChecked), for: .normal)
        
        return bt
    }()
    
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.setCornerRadius()
        iv.contentMode = .scaleToFill
        
        return iv
    }()
    
    let titleButton: UIButton = {
        let bt = UIButton()
        
        bt.titleLabel?.adjustsFontSizeToFitWidth = true
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        bt.setTitleColor(ColorTheme.customLightPink.color, for: .normal)
        
        return bt
    }()
    
    let authorsLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = ColorTheme.customDarkPink.color
        lb.textAlignment = .center
        
        return lb
    }()
    
    let retailPriceLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.backgroundColor = ColorTheme.customLightBlue.color
        lb.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        lb.textColor = .white
        lb.textAlignment = .center
        lb.setCornerRadius(cornerRadius: 7)
        
        return lb
    }()
    
    let descriptionTextView: UITextView = {
        let tv = UITextView()
        
        tv.backgroundColor = ColorTheme.customLightNavi.color
        tv.setCornerRadius()
        tv.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        tv.textAlignment = .justified
        tv.textColor = ColorTheme.customDarkPink.color
        tv.isUserInteractionEnabled = true
        tv.isEditable = false
        
        return tv
    }()
    
    let detailInfoStackView: DetailInfoStackView = DetailInfoStackView()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError(ErrorMessage.unavailable)
    }
    
    // MARK: - Setup UI
    
    func setup() {
        setViewBackgroundColor(ViewName.detailView)
    }
    
    func addViews() {
        addSubview(contentScrollView)
        contentScrollView.addSubview(readCheckButton)
        contentScrollView.addSubview(mainImageView)
        contentScrollView.addSubview(titleButton)
        contentScrollView.addSubview(authorsLabel)
        contentScrollView.addSubview(descriptionTextView)
        contentScrollView.addSubview(retailPriceLabel)
        contentScrollView.addSubview(detailInfoStackView)
    }
    
    func setConstraints() {
        contentScrollViewConstraints()
        readCheckImageViewConstraints()
        mainImageViewConstraints()
        titleButtonConstraints()
        authorsLabelConstraints()
        descriptionTextViewConstraints()
        retailPriceLabelConstraints()
        detailInfoStackViewConstraints()
    }
    
    // MARK: - Set Constraints
    
    private func contentScrollViewConstraints() {
        contentScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        contentScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        contentScrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentScrollView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        contentScrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func readCheckImageViewConstraints() {
        readCheckButton.translatesAutoresizingMaskIntoConstraints = false
        
        readCheckButton.topAnchor.constraint(equalTo: contentScrollView.topAnchor, constant: 30).isActive = true
        readCheckButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckButton.centerXAnchor.constraint(equalTo: titleButton.trailingAnchor, constant: -30).isActive = true
    }
    
    private func mainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        mainImageView.topAnchor.constraint(equalTo: readCheckButton.bottomAnchor, constant: 30).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
    }
    
    private func titleButtonConstraints() {
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20).isActive = true
        titleButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        titleButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleButton.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
    }
    
    private func authorsLabelConstraints() {
        authorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorsLabel.topAnchor.constraint(equalTo: titleButton.bottomAnchor, constant: 3).isActive = true
        authorsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        authorsLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        authorsLabel.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
    }
    
    private func retailPriceLabelConstraints() {
        retailPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        retailPriceLabel.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 15).isActive = true
        retailPriceLabel.widthAnchor.constraint(equalToConstant: 80).isActive = true
        retailPriceLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        retailPriceLabel.centerXAnchor.constraint(equalTo: authorsLabel.trailingAnchor, constant: -50).isActive = true
    }
    
    private func descriptionTextViewConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionTextView.topAnchor.constraint(equalTo: retailPriceLabel.bottomAnchor, constant: 40).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
    }
    
    private func detailInfoStackViewConstraints() {
        detailInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        detailInfoStackView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 30).isActive = true
        detailInfoStackView.widthAnchor.constraint(equalTo: descriptionTextView.widthAnchor).isActive = true
        detailInfoStackView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        detailInfoStackView.centerXAnchor.constraint(equalTo: contentScrollView.centerXAnchor).isActive = true
    }
    
}

