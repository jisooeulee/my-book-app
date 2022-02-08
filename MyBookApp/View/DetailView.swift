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
            authorsLabel.text = item.volumeInfo.authors?.joined(separator: ", ") ?? Text.authorsLabelDefault
            descriptionTextView.text = item.volumeInfo.description ?? ""
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
        iv.dropShadow()
        
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
    
    let commentLabel: UILabel = {
        let lb = UILabel()
        
        lb.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        lb.textAlignment = .left
        lb.textColor = .systemRed
        lb.text = Text.commentLabel
        
        return lb
    }()
    
    let commentView: UITextView = {
        let tf = UITextView()
        
        tf.backgroundColor = .systemGray2
        tf.setCornerRadius()
        tf.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        tf.textAlignment = .justified
        tf.textColor = .white
        tf.isEditable = true
        
        return tf
    }()
    
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
        addSubview(commentLabel)
        addSubview(commentView)
    }
    
    func setConstraints() {
        mainImageViewConstraints()
        titleButtonConstraints()
        readCheckImageViewConstraints()
        authorsLabelConstraints()
        descriptionTextViewConstraints()
        commentLabelConstraints()
        commentViewConstraints()
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
    
    private func descriptionTextViewConstraints() {
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        
        descriptionTextView.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 15).isActive = true
        descriptionTextView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    private func commentLabelConstraints() {
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        
        commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        commentLabel.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 10).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func commentViewConstraints() {
        commentView.translatesAutoresizingMaskIntoConstraints = false
        
        commentView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 5).isActive = true
        commentView.widthAnchor.constraint(equalTo: descriptionTextView.widthAnchor).isActive = true
        commentView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        commentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
}

