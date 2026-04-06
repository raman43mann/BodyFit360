//
//  Untitled.swift
//  BodyFit360
//
//  Created by Ramanjeet Singh on 21/10/24.
//

import UIKit

@IBDesignable
class CustomShapeView: UIView {
    
    @IBInspectable var backgroundColorValue: UIColor = .white {
        didSet {
            backgroundColor = backgroundColorValue
        }
    }

    @IBInspectable var capSize: CGFloat = 40.0 {
        didSet {
            backgroundColor = backgroundColorValue
        }
    }
    

    // This method is called for drawing the view
        override func draw(_ rect: CGRect) {
            
            guard let context = UIGraphicsGetCurrentContext() else { return }

                                       // Create the dome shape path
                                       let path = UIBezierPath()

                                       // Set the radius for the top corners
                                       let cornerRadius: CGFloat = 30.0
                                       // Set the radius for the bottom corners
                                       let bottomCornerRadius: CGFloat = 30.0

                                       // Starting point on the left side with a corner radius
                                       let leftStartPoint = CGPoint(x: cornerRadius, y: capSize)

                                       // Dome peak in the middle at the top (x is the center of the view)
                                       let domePeak = CGPoint(x: self.bounds.width / 2, y: 0)

                                       // Ending point on the right side with a corner radius
                                       let rightEndPoint = CGPoint(x: self.bounds.width - cornerRadius, y: capSize)

                                       // Move to the bottom left corner
                                       path.move(to: CGPoint(x: 0, y: self.bounds.height))

                                       // Add the bottom left corner radius
                                       path.addLine(to: CGPoint(x: 0, y: self.bounds.height - bottomCornerRadius))
                                       path.addQuadCurve(to: CGPoint(x: bottomCornerRadius, y: self.bounds.height), controlPoint: CGPoint(x: 0, y: self.bounds.height))

                                       // Move to the bottom right before the curve
                                       path.addLine(to: CGPoint(x: self.bounds.width - bottomCornerRadius, y: self.bounds.height))

                                       // Add the bottom right corner radius
                                       path.addQuadCurve(to: CGPoint(x: self.bounds.width, y: self.bounds.height - bottomCornerRadius), controlPoint: CGPoint(x: self.bounds.width, y: self.bounds.height))

                                       // Draw a straight line to the top right corner
                                       path.addLine(to: CGPoint(x: self.bounds.width, y: capSize + cornerRadius))

                                       // Top-right corner radius
                                       path.addQuadCurve(to: rightEndPoint, controlPoint: CGPoint(x: self.bounds.width, y: capSize))

                                       // Create a smooth curve to the dome peak (top center)
                                       path.addCurve(to: domePeak,
                                                     controlPoint1: CGPoint(x: domePeak.x + capSize , y: capSize),
                                                     controlPoint2: CGPoint(x: domePeak.x + capSize , y: 0))

                                       // Create a smooth curve from the dome peak back down to the left side
                                       path.addCurve(to: leftStartPoint,
                                                     controlPoint1: CGPoint(x: domePeak.x - capSize, y: 0),
                                                     controlPoint2: CGPoint(x: domePeak.x - capSize, y: capSize))
                                    
                                       // Top-left corner radius
                                       path.addQuadCurve(to: CGPoint(x: 0, y: capSize + cornerRadius), controlPoint: CGPoint(x: 0, y: capSize))

                                       // Close the path to form a complete shape
                                       path.close()

                                       // Set the fill color and fill the path
                                       backgroundColorValue.setFill()
                                       context.addPath(path.cgPath)
                                       context.fillPath()
            
        }

        // This ensures the view is redrawn in Interface Builder
        override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            setNeedsDisplay() // Redraw for live preview in Interface Builder
        }
}


