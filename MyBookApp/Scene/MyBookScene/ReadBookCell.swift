//
//  ReadBookCell.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/09.
//

import UIKit

class ReadBookCell: UITableViewCell {
    
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
    
    let readCheckView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: Symbols.checked)
        
        return iv
    }()
    
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
    
    // MARK: - Init
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        contentView.frame = contentView.frame.inset(by: inset)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImageView.image = nil
    }
    
    // MARK: - Setup UI
    
    func setup() {
        setBookCellProperty()
    }
    
    func addViews() {
        contentView.addSubview(readCheckView)
        contentView.addSubview(bookImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorsLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    func setConstraints() {
        readCheckImageViewConstraints()
        bookImageViewConstraints()
        titleLabelConstraints()
        descriptionLabelConstraints()
        authorsLabelConstraints()
    }
    
    // MARK: - Set Constraints
    
    private func readCheckImageViewConstraints() {
        readCheckView.translatesAutoresizingMaskIntoConstraints = false
        
        readCheckView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        readCheckView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
    }
    
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
        descriptionLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}

