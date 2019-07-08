# Change Height of UIProgressView in Swift
### By Code
masteryProgress.transform = masteryProgress.transform.scaledBy(x: 1, y: 20)

### By SB/IB
Set Height Constraint from Interface Builder

### adding it as an extension to UIProgressView
```Swift
extension UIProgressView {
    @IBInspectable var barHeight : CGFloat {
        get {
            return transform.d * 2.0
        }
        set {
            // 2.0 Refers to the default height of 2
            let heightScale = newValue / 2.0
            let c = center
            transform = CGAffineTransformMakeScale(1.0, heightScale)
            center = c
        }
    }   
}
```

### Create a custom class of UIProgressView and override func layoutSubviews() to add a custom mask layer:
```Swift
    override func layoutSubviews() {
        super.layoutSubviews()

        let maskLayerPath = UIBezierPath(roundedRect: bounds, cornerRadius: 4.0)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskLayerPath.cgPath
        layer.mask = maskLayer
    }
```
