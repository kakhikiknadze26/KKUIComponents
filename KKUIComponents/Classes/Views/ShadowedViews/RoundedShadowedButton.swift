//
//  RoundedShadowedButton.swift
//  KKUIComponents
//
//  Created by Kakhi Kiknadze on 9/20/20.
//

import UIKit

/// Use this class to create shadowed button with corner radius on both the view and the shadow.
@IBDesignable
public class RoundedShadowedButton: UIButton {

    public override class var layerClass: AnyClass {
        return CAShapeLayer.self
    }

    private var shadowLayer = CAShapeLayer()
    private lazy var backgroundLayer = configure(CAShapeLayer()) { $0.fillColor = UIColor.white.cgColor }

    /// Color of view's first layer. Default is `UIColor.white`
    @IBInspectable public var backgroundLayerColor: UIColor = .white { didSet { backgroundLayer.fillColor = backgroundLayerColor.cgColor } }
    /// Stroke color of view's first layer. Default is `UIColor.white`
    @IBInspectable public var backgroundLayerStrokeColor: UIColor = .white { didSet{ backgroundLayer.strokeColor = backgroundLayerStrokeColor.cgColor } }
    /// Line width of view's first layer. Default is `0`
    @IBInspectable public var backgroundLayerLineWidth: CGFloat = .zero { didSet { backgroundLayer.lineWidth = backgroundLayerLineWidth } }
    /// Color of shadow. Default is `.black`
    @IBInspectable public var shadowColor: UIColor = .black { didSet { shadowLayer.shadowColor = shadowColor.cgColor } }
    /// Opacity of shadow. Default is `1.0`
    @IBInspectable public var shadowAlpha: Float = 1.0 { didSet { shadowLayer.shadowOpacity = shadowAlpha } }
    /// Offset of shadow. Default is `(0, -3.0)`
    @IBInspectable public var shadowOffset: CGSize = CGSize(width: .zero, height: -3.0) { didSet { shadowLayer.shadowOffset = shadowOffset } }
    /// Radius of shadow. Default is `3.0`
    @IBInspectable public var shadowRadius: CGFloat = 3.0 { didSet { shadowLayer.shadowRadius = shadowRadius } }
    /// Radius of corner. Default is `0`
    @IBInspectable public var cornerRadius: CGFloat = .zero { didSet { setNeedsLayout(); layoutIfNeeded() } }
    /// Adjusts shadow offset to fit device's screen by multiplying it on screen factor.
    /// - Warning: You must set screen factor first. E.g. when the app finishes launching.
    /// ```
    /// screenFactor = UIScreen.main.bounds.size.width/414
    /// ```
    @IBInspectable public var adjustShadowOffsetToFitDevice: Bool { get { false } set { if(newValue) { fitShadowOffsetToDevice() } } }
    /// Adjusts shadow radius to fit device's screen by multiplying it on screen factor
    /// - Warning: You must set screen factor first. E.g. when the app finishes launching.
    /// ```
    /// screenFactor = UIScreen.main.bounds.size.width/414
    /// ```
    @IBInspectable public var adjustShadowRadiusToFitDevice: Bool { get { false } set { if(newValue) { fitShadowRadiusToDevice() } } }
    /// Adjusts corner radius to fit device's screen by multiplying it on screen factor
    /// - Warning: You must set screen factor first. E.g. when the app finishes launching.
    /// ```
    /// screenFactor = UIScreen.main.bounds.size.width/414
    /// ```
    @IBInspectable public var adjustCornerRadiusToFitDevice: Bool { get { false } set { if(newValue) { fitCornerRadiusToDevice() } } }
    /// Adjusts background layer's line width to fit device's screen by multiplying it on screen factor
    /// - Warning: You must set screen factor first. E.g. when the app finishes launching.
    /// ```
    /// screenFactor = UIScreen.main.bounds.size.width/414
    /// ```
    @IBInspectable public var adjustLineWidthToFitDevice: Bool { get { false } set { if(newValue) { fitLineWidthToDevice() } } }
    /// Corners available to round. Default is `.allCorners`
    public var roundingCorners: UIRectCorner = .allCorners { didSet { setNeedsLayout(); layoutIfNeeded() } }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }

    private func initialize() {
        backgroundColor = .clear
        addShadowAndBackground()
        if let imageView = imageView {
            bringSubviewToFront(imageView)
        }
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }

    public override func layoutSubviews() {
        super.layoutSubviews()
        superview?.layoutIfNeeded()
        setPaths()
    }

    private func addShadowAndBackground() {
        layer.insertSublayer(shadowLayer, at: 0)
        layer.insertSublayer(backgroundLayer, at: 1)
    }

    public func updateLayers() {
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowOpacity = shadowAlpha
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowRadius = shadowRadius
        backgroundLayer.fillColor = backgroundLayerColor.cgColor
    }

    private func setPaths() {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        shadowLayer.shadowPath = path.cgPath
        backgroundLayer.path = path.cgPath
    }

}

public extension RoundedShadowedButton {

    func fitShadowOffsetToDevice() {
        shadowOffset = CGSize(width: shadowOffset.width * screenFactor, height: shadowOffset.height * screenFactor)
    }

    func fitShadowRadiusToDevice() {
        shadowRadius *= screenFactor
    }

    func fitCornerRadiusToDevice() {
        cornerRadius *= screenFactor
    }

    func fitLineWidthToDevice() {
        backgroundLayer.lineWidth *= screenFactor
    }

}
