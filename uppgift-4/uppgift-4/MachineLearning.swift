//
//  MachineLearning.swift
//  uppgift-4
//
//  Created by Andreas Lymalm on 2023-10-21.
//

import Foundation
import UIKit
import Vision

class MachineLearning {
    static func PredictImage(image: UIImage) -> String? {
        
        let defaultConfig = MLModelConfiguration()
        let imageClassifierWrapper = try? MobileNetV2(configuration: defaultConfig)
                
        let imageBuffer = Helper.Buffer(from: image)!
        
        do {
            var output = try imageClassifierWrapper!.prediction(image: imageBuffer)
            return "\(output.classLabel) (\(Helper.ToPercent(decimalNumber: output.classLabelProbs[output.classLabel]!)))"
        } catch {
            return nil
        }
    }
}
