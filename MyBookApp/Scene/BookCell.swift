//
//  BookCell.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class BookCell: UITableViewCell {
    
    // MARK: - Set Item Values
    
    var item: Item? {
        didSet {
            guard let item = self.item else { return }
            
            titleLabel.text = item.volumeInfo.title
            authorsLabel.text = item.volumeInfo.authors?.joined(separator: ", ") ?? Text.noInfo
            descriptionLabel.text = item.volumeInfo.description ?? ""
        }
    }
    
    // MARK: - Create UI Component
    
    let bookImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.setCornerRadius()
        iv.contentMode = .scaleToFill
        
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        
        lb.font = .systemFont(ofSize: 12, weight: .semibold)
        lb.textColor = ColorTheme.customLightPink.color
        lb.textAlignment = .left
        
        return lb
    }()
    
    let readCheckImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red // TODO: データセット以降、削除予定
        
        return iv
    }()
    
    let authorsLabel: UILabel = {
        let lb = UILabel()
        
        lb.font = .systemFont(ofSize: 11)
        lb.textColor = ColorTheme.customLightPink.color
        lb.textAlignment = .left
        
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        
        lb.font = .systemFont(ofSize: 9)
        lb.textColor = ColorTheme.customLightPink.color
        lb.textAlignment = .left
        lb.numberOfLines = 4
        
        return lb
    }()
    
    // MARK: - init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError(ErrorMessage.unavailable)
    }
    
    // MARK: - Setup UI
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        contentView.frame = contentView.frame.inset(by: inset)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImageView.image = nil
    }
    
    func setup() {
        configureBookCell()
    }
    
    func addViews() {
        contentView.addSubview(bookImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(readCheckImageView)
        contentView.addSubview(authorsLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    func setConstraints() {
        bookImageViewConstraints()
        readCheckImageViewConstraints()
        titleLabelConstraints()
        descriptionLabelConstraints()
        authorsLabelConstraints()
    }
    
    // MARK: - Set Constraints
    
    private func bookImageViewConstraints() {
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        bookImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant: 95).isActive = true
        bookImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func titleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 15).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func readCheckImageViewConstraints() {
        readCheckImageView.translatesAutoresizingMaskIntoConstraints = false
        
        readCheckImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5).isActive = true
        readCheckImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 3).isActive = true
    }
    
    private func authorsLabelConstraints() {
        authorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorsLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 15).isActive = true
        authorsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        authorsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        authorsLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func descriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 15).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
}
