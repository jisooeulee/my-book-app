//
//  DetailView.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/07.
//

import UIKit

class DetailView: UIView {
    
    /// 読んだ本かどうかのFlag
    var isRead = false
    
    var item: Item? {
        didSet {
            guard let item = self.item else { return }
            
            FirebaseProcessor.shared.searchBookInfo(keyword: item.id) { result in
                self.isRead = result
                
                if self.isRead {
                    self.readCheckButton.setImage(UIImage(named: Symbols.checked), for: .normal)
                } else {
                    self.readCheckButton.setImage(UIImage(named: Symbols.nonChecked), for: .normal)
                }
            }
            titleButton.setTitle(item.volumeInfo.title, for: .normal)
            authorsLabel.text = item.volumeInfo.authors?.joined(separator: ", ") ?? Text.noInfo
            let currencyCode = item.saleInfo.retailPrice?.currencyCode ?? ""
            let retailPrice = item.saleInfo.retailPrice?.amount?.description ?? Text.noInfo
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
    
    let readCheckButton: UIButton = {
        let bt = UIButton()
        bt.setImage(UIImage(named: Symbols.nonChecked), for: .normal)
        
        return bt
    }()
    
    let mainImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.contentMode = .scaleToFill
        iv.cellDropShadow()
        
        return iv
    }()
    
    let titleButton: UIButton = {
        let bt = UIButton()
        
        bt.titleLabel?.adjustsFontSizeToFitWidth = true
        bt.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        bt.setTitleColor(.systemBlue, for: .normal)
        
        return bt
    }()
    
    let authorsLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        lb.textAlignment = .center
        
        return lb
    }()
    
    let retailPriceLabel: UILabel = {
        let lb = UILabel()
        
        lb.adjustsFontSizeToFitWidth = true
        lb.backgroundColor = ColorTheme.customLightBlue.color
        lb.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        lb.textColor = .white
        lb.textAlignment = .center
        lb.setCornerRadius(cornerRadius: 7)
        
        return lb
    }()
    
    let descriptionTextView: UITextView = {
        let tv = UITextView()
        
        tv.backgroundColor = .systemGray
        tv.setCornerRadius()
        tv.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        tv.textAlignment = .justified
        tv.textColor = .white
        tv.isUserInteractionEnabled = true
        tv.isEditable = false
        
        return tv
    }()
    
    let detailInfoStackView: DetailInfoStackView = DetailInfoStackView()
    
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
    
    func setup() {
        backgroundColor = .systemBackground
    }
    
    func addViews() {
        addSubview(mainImageView)
        addSubview(titleButton)
        addSubview(readCheckButton)
        addSubview(authorsLabel)
        addSubview(descriptionTextView)
        addSubview(retailPriceLabel)
        addSubview(detailInfoStackView)
    }
    
    func setConstraints() {
        mainImageViewConstraints()
        titleButtonConstraints()
        readCheckImageViewConstraints()
        authorsLabelConstraints()
        descriptionTextViewConstraints()
        publishedDateLabelConstraints()
        detailInfoStackViewConstraints()
    }
    
    private func readCheckImageViewConstraints() {
        readCheckButton.translatesAutoresizingMaskIntoConstraints = false
        
        readCheckButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        readCheckButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        readCheckButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        readCheckButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
    
    private func mainImageViewConstraints() {
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        mainImageView.topAnchor.constraint(equalTo: readCheckButton.bottomAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func titleButtonConstraints() {
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleButton.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 10).isActive = true
        titleButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        titleButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        titleButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func authorsLabelConstraints() {
        authorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorsLabel.topAnchor.constraint(equalTo: titleButton.bottomAnchor, constant: 5).isActive = true
        authorsLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        authorsLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        authorsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func publishedDateLabelConstraints() {
        retailPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        retailPriceLabel.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 5).isActive = true
        retailPriceLabel.widthAnchor.constraint(equalToConstant: 90).isActive = true
        retailPriceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        retailPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    private func descriptionTextViewConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionTextView.topAnchor.constraint(equalTo: retailPriceLabel.bottomAnchor, constant: 15).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func detailInfoStackViewConstraints() {
        detailInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        detailInfoStackView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20).isActive = true
        detailInfoStackView.widthAnchor.constraint(equalTo: descriptionTextView.widthAnchor).isActive = true
        detailInfoStackView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        detailInfoStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}

