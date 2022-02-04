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
        
        iv.backgroundColor = .gray // TODO: データセット以降、削除予定
        iv.contentMode = .scaleAspectFit
        
        return iv
    }()
    
    let titleLabel: UILabel = {
        let lb = UILabel()
        
        lb.backgroundColor = .yellow // TODO: データセット以降、削除予定
        lb.adjustsFontSizeToFitWidth = true
        lb.font = .systemFont(ofSize: 15, weight: .semibold)
        lb.textColor = ColorTheme.customLightBlue.color
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
        
        lb.backgroundColor = .orange // TODO: データセット以降、削除予定
        lb.adjustsFontSizeToFitWidth = true
        lb.font = .systemFont(ofSize: 13)
        lb.textColor = .lightGray
        lb.textAlignment = .left
        
        return lb
    }()
    
    let descriptionLabel: UILabel = {
        let lb = UILabel()
        
        lb.backgroundColor = .lightGray // TODO: データセット以降、削除予定
        lb.font = .systemFont(ofSize: 13)
        lb.textColor = .darkGray
        lb.textAlignment = .left
        lb.numberOfLines = 0
        
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        addViews()
        setConstraints()
    }
    
    @available(*, unavailable, message: "init(coder:) has not been implemented")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let inset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        contentView.frame = contentView.frame.inset(by: inset)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        bookImageView.image = nil
    }
    
    func setup() {
        selectionStyle = .none
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.dropShadow(color: .lightGray, opacity: 0.3, offset: CGSize(width: 0, height: 0), radius: 8)
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
        
        bookImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
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
