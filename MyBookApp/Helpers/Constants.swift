//
//  Constants.swift
//  MyBookApp
//
//  Created by 279c on 2022/02/06.
//

import Foundation

public enum Api {
    static let requestUrl = "https://www.googleapis.com/books/v1/volumes?q="
    static let maxResultParam = "&maxResults=40"
}

public enum Text {
    /// NavigationItem Title
    static let navigationItemTitle = "📖Find a Book"
    
    /// SearchBar Placeholder
    static let searchBarPlaceholder = "ex) Rich Dad Poor Dad"
    
    /// TabBar Title
    static let homeTabBarTitle = "Home"
    static let myBookTabBarTitle = "My Book"
    static let settingTabBarTitle = "Setting"
    
    /// Alert Title, Message
    static let alertTitle = "⚠️"
    static let alertMessage = "と一致する本がありません！"
    
    /// authorsLabel's default Text
    static let noInfo = "No Info"
    
    /// Detail Info View Main Title
    static let categoriesView = "Category"
    static let publisherView = "Publisher"
    static let publishedDateView = "Published Date"
    static let pageCountView = "Page"
}

public enum Cell {
    static let cellIdentifier = "BookCell"
}

public enum Symbols {
    static let star = "star"
    static let starFill = "star.fill"
    static let checkMarkCircle = "checkmark.circle"
    static let checkMarkCircleFill = "checkmark.circle.fill"
    static let gearShape = "gearshape"
    static let gearShapeFill = "gearshape.fill"
    static let nonChecked = "nonChecked.png"
    static let checked = "checked.png"
}

public enum ImageUrl {
    static let defaultThumbnail = "https://books.google.co.jp/googlebooks/images/no_cover_thumb.gif"
}

public enum ErrorMessage {
    static let unavailable = "init(coder:) has not been implemented"
    static let cellIdentifier = "Could not dequeue cell with identifier: BookCell"
}
