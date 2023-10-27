//
//  ARDesigneble.swift
//  ARMVVMStrucutre
//
//  Created by Rinkl on 27/06/23.
//

import UIKit
import Foundation

@IBDesignable
class ARView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

@IBDesignable
class ARLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

@IBDesignable
class ARButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

@IBDesignable
class ARImageView: UIImageView {
    var maskImageView = UIImageView()
    
    @IBInspectable var maskImage: UIImage? {
        didSet {
            self.maskImageView.image = self.maskImage
            self.updateView()
        }
    }
    
    // This updates mask size when changing device orientation (portrait/landscape)
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateView()
    }
    
    func updateView() {
        if self.maskImageView.image != nil {
            self.maskImageView.frame = self.bounds
            self.mask = self.maskImageView
        }
    }
}

@IBDesignable
public class ARRadiusView: UIView {

    @IBInspectable public var topLeft: Bool = false      { didSet { setNeedsLayout() } }
    @IBInspectable public var topRight: Bool = false     { didSet { setNeedsLayout() } }
    @IBInspectable public var bottomLeft: Bool = false   { didSet { setNeedsLayout() } }
    @IBInspectable public var bottomRight: Bool = false  { didSet { setNeedsLayout() } }
    @IBInspectable public var cornerRadius1: CGFloat = 0  { didSet { setNeedsLayout() } }

    public override func layoutSubviews() {
        super.layoutSubviews()

        var options = UIRectCorner()

        if topLeft     { options.formUnion(.topLeft) }
        if topRight    { options.formUnion(.topRight) }
        if bottomLeft  { options.formUnion(.bottomLeft) }
        if bottomRight { options.formUnion(.bottomRight) }

        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: options,
                                cornerRadii: CGSize(width: cornerRadius1, height: cornerRadius1))

        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}
 
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    @IBInspectable var maskToBounds: Bool {
        get {
            return self.layer.masksToBounds
        }
        set {
            self.layer.masksToBounds = newValue
        }
    }
}

@IBDesignable extension UIButton {
    @IBInspectable var adjustsFontSizeToFitWidth: Bool {
        get {
            return self.titleLabel?.adjustsFontSizeToFitWidth ?? false
        }
        set {
            self.titleLabel?.adjustsFontSizeToFitWidth = newValue
        }
    }
    
    @IBInspectable var numberOfLines: Int {
        get {
            return self.titleLabel?.numberOfLines ?? 1
        }
        set {
            self.titleLabel?.numberOfLines = newValue
        }
    }
    
    @IBInspectable var imageViewContentMode: Int {
        get {
            return self.imageView?.contentMode.rawValue ?? 0
        }
        set {
            self.imageView?.contentMode = UIView.ContentMode(rawValue: newValue) ?? .scaleToFill
        }
    }
    
    @IBInspectable var textAlignment: Int {
        get {
            return self.titleLabel?.textAlignment.rawValue ?? 0
        }
        set {
            self.titleLabel?.textAlignment = NSTextAlignment(rawValue: newValue) ?? .left
        }
    }
    
//    @IBInspectable var sizeImage: CGSize {
//        get {
//            return self.imageView?.image?.size ?? CGSize.zero
//        }
//        set {
//            if let image = self.imageView?.image {
//                let imgUpdate = image.resizedImage(Size: newValue)
//                self.setImage(imgUpdate, for: .normal)
//            }
//        }
//    }
}

@IBDesignable extension UIImageView
{
    @IBInspectable var templateImage: Bool {
        get {
            return (self.image?.renderingMode == .alwaysTemplate)
        }
        set {
            self.image = self.image?.withRenderingMode(newValue ? .alwaysTemplate : .automatic)
        }
    }
}

@IBDesignable extension UILabel {
    @IBInspectable var adjustsFontSizeToFitWidthText: Bool {
        get {
            return self.adjustsFontSizeToFitWidth
        }
        set {
            self.adjustsFontSizeToFitWidth = newValue
        }
    }
}

@IBDesignable public class ARTextField: UITextField {

    @IBInspectable var padding : CGPoint = CGPoint.zero

    
    required public override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        if padding.equalTo(CGPoint.zero) == false{
            return getBoundsPadding()
        }else{
            return super.placeholderRect(forBounds: self.bounds)
        }
    }
    
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        if padding.equalTo(CGPoint.zero) == false{
            return bounds.insetBy(dx: padding.x, dy: padding.y)
        }else{
            return super.textRect(forBounds: self.bounds)
        }
    }
    
    override public func borderRect(forBounds bounds: CGRect) -> CGRect {
        if padding.equalTo(CGPoint.zero) == false{
            return getBoundsPadding()
        }else{
            return super.borderRect(forBounds: self.bounds)
        }
    }
    
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        if padding.equalTo(CGPoint.zero) == false{
            return getBoundsPadding()
        }else{
            return super.editingRect(forBounds: self.bounds)
        }
    }
    
    override public func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        if padding.equalTo(CGPoint.zero) == false{
            return getBoundsPadding()
        }else{
            return super.clearButtonRect(forBounds: self.bounds)
        }
    }
    
    func  getBoundsPadding() -> CGRect{
        return bounds.inset(by: UIEdgeInsets(top: 0, left: padding.x, bottom: 0, right: padding.y))
    }
}

@IBDesignable
class ARTextView: UITextView {
    private struct Constants {
        static let defaultiOSPlaceholderColor = UIColor(red: 0.0, green: 0.0, blue: 0.0980392, alpha: 0.22)
    }

    public let placeholderLabel: UILabel = UILabel()

    private var placeholderLabelConstraints = [NSLayoutConstraint]()

    @IBInspectable open var placeholder: String = "" {
        didSet {
            placeholderLabel.text = placeholder
        }
    }

    @IBInspectable open var placeholderColor: UIColor = ARTextView.Constants.defaultiOSPlaceholderColor {
        didSet {
            placeholderLabel.textColor = placeholderColor
        }
    }

    override open var font: UIFont! {
        didSet {
            if placeholderFont == nil {
                placeholderLabel.font = font
            }
        }
    }

    open var placeholderFont: UIFont? {
        didSet {
            let font = (placeholderFont != nil) ? placeholderFont : self.font
            placeholderLabel.font = font
        }
    }

    override open var textAlignment: NSTextAlignment {
        didSet {
            placeholderLabel.textAlignment = textAlignment
        }
    }

    override open var text: String! {
        didSet {
            textDidChange()
        }
    }

    override open var attributedText: NSAttributedString! {
        didSet {
            textDidChange()
        }
    }

    override open var textContainerInset: UIEdgeInsets {
        didSet {
            updateConstraintsForPlaceholderLabel()
        }
    }

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        #if swift(>=4.2)
        let notificationName = UITextView.textDidChangeNotification
        #else
        let notificationName = NSNotification.Name.UITextView.textDidChangeNotification
        #endif

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textDidChange),
                                               name: notificationName,
                                               object: nil)

        placeholderLabel.font = font
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.textAlignment = textAlignment
        placeholderLabel.text = placeholder
        placeholderLabel.numberOfLines = 0
        placeholderLabel.backgroundColor = UIColor.clear
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(placeholderLabel)
        updateConstraintsForPlaceholderLabel()
    }

    private func updateConstraintsForPlaceholderLabel() {
        var newConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-(\(textContainerInset.left + textContainer.lineFragmentPadding))-[placeholder]",
            options: [],
            metrics: nil,
            views: ["placeholder": placeholderLabel])
        newConstraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-(\(textContainerInset.top))-[placeholder]",
            options: [],
            metrics: nil,
            views: ["placeholder": placeholderLabel])
        newConstraints.append(NSLayoutConstraint(
            item: placeholderLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: self,
            attribute: .width,
            multiplier: 1.0,
            constant: -(textContainerInset.left + textContainerInset.right + textContainer.lineFragmentPadding * 2.0)
        ))
        removeConstraints(placeholderLabelConstraints)
        addConstraints(newConstraints)
        placeholderLabelConstraints = newConstraints
    }

    @objc private func textDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
        self.layoutIfNeeded()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        placeholderLabel.preferredMaxLayoutWidth = textContainer.size.width - textContainer.lineFragmentPadding * 2.0
    }

    deinit {
        #if swift(>=4.2)
        let notificationName = UITextView.textDidChangeNotification
        #else
        let notificationName = NSNotification.Name.UITextView.textDidChangeNotification
        #endif

        NotificationCenter.default.removeObserver(self,
                                                  name: notificationName,
                                                  object: nil)
    }
}

@IBDesignable extension UITextView {

    @IBInspectable var topPadding: CGFloat {
        get {
            return contentInset.top
        }
        set {
            self.contentInset = UIEdgeInsets(top: newValue,
                                             left: self.contentInset.left,
                                             bottom: self.contentInset.bottom,
                                             right: self.contentInset.right)
        }
    }

    @IBInspectable var bottomPadding: CGFloat {
        get {
            return contentInset.bottom
        }
        set {
            self.contentInset = UIEdgeInsets(top: self.contentInset.top,
                                             left: self.contentInset.left,
                                             bottom: newValue,
                                             right: self.contentInset.right)
        }
    }

    @IBInspectable var leftPadding: CGFloat {
        get {
            return contentInset.left
        }
        set {
            self.contentInset = UIEdgeInsets(top: self.contentInset.top,
                                             left: newValue,
                                             bottom: self.contentInset.bottom,
                                             right: self.contentInset.right)
        }
    }

    @IBInspectable var rightPadding: CGFloat {
        get {
            return contentInset.right
        }
        set {
            self.contentInset = UIEdgeInsets(top: self.contentInset.top,
                                             left: self.contentInset.left,
                                             bottom: self.contentInset.bottom,
                                             right: newValue)
        }
    }
    
}

extension UITextField {
   @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    
    @IBInspectable var leftViewWidth: CGFloat {
        get {
            return leftView?.frame.width ?? 0
        }
        set {
            let viewGap = UIView.init(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.height))
            self.leftView = viewGap
            self.leftViewMode = .always
        }
    }
    
    @IBInspectable var rightViewWidth: CGFloat {
        get {
            return rightView?.frame.width ?? 0
        }
        set {
            let viewGap = UIView.init(frame: CGRect(x: 0, y: 0, width: newValue, height: self.frame.height))
            self.rightView = viewGap
            self.rightViewMode = .always
        }
    }
}
