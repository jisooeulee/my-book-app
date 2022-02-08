//
//  BookCell.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/04.
//

import UIKit

class BookCell: UITableViewCell {
    
    let bookImageView: UIImageView = {
        let iv = UIImageView()
        
        iv.layer.cornerRadius = 15
        iv.dropShadow(color: .systemGray2, opacity: 0.2, offset: CGSize(width: 0, height: 0), radius: 13)
        iv.contentMode = .scaleToFill
        
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        
        lb.font = .systemFont(ofSize: 12, weight: .semibold)
        lb.textColor = .systemBlue
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
        lb.textColor = .systemGray
        lb.textAlignment = .left
        
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        
        lb.font = .systemFont(ofSize: 10)
        lb.textColor = .systemGray2
        lb.textAlignment = .left
        lb.numberOfLines = 4
        
        return lb
    }()
    
    /// item情報が変更されるたびに値を更新する
    var item: Item? {
        didSet {
            guard let item = self.item else { return }
            
            titleLabel.text = item.volumeInfo.title
            authorsLabel.text = item.volumeInfo.authors?.joined(separator: ", ") ?? Text.authorsLabelDefault
            descriptionLabel.text = item.volumeInfo.description ?? ""
        }
    }
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let inset = UIEdgeInsets(top: 14, left: 14, bottom: 14, right: 14)
        contentView.frame = contentView.frame.inset(by: inset)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImageView.image = nil
    }
    
    func setup() {
        selectionStyle = .none
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .systemBackground
        contentView.dropShadow(color: .systemGray2, opacity: 0.3, offset: CGSize(width: 0, height: 0), radius: 8)
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
    
    private func bookImageViewConstraints() {
        bookImageView.translatesAutoresizingMaskIntoConstraints = false
        
        bookImageView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        bookImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        bookImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func titleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func readCheckImageViewConstraints() {
        readCheckImageView.translatesAutoresizingMaskIntoConstraints = false
        
        readCheckImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        readCheckImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: -5).isActive = true
        readCheckImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 3).isActive = true
    }
    
    private func authorsLabelConstraints() {
        authorsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorsLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10).isActive = true
        authorsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        authorsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        authorsLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func descriptionLabelConstraints() {
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 10).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 5).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }
    
}
