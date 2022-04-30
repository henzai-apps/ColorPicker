import UIKit

public class ScopeColorPicker {
    let pickerWindow: ScopeColorPickerWindow
    var continuation: CheckedContinuation<UIColor, Never>? = nil
    
    public init(windowScene: UIWindowScene) {
        self.pickerWindow = .init(windowScene: windowScene)
        pickerWindow.delegate = self
        pickerWindow.dataSource = self
    }
    
    public func pickColor() async -> UIColor {
        await withCheckedContinuation { [weak self] continuation in
            self?.continuation = continuation
        }
    }
}

extension ScopeColorPicker: ScopeColorPickerDelegate {
    func scopePickerDidFinishColorPick(_ color: UIColor) {
        continuation?.resume(with: .success(color))
    }
}

extension ScopeColorPicker: ScopeColorPickerDataSource {
    func colors(at location: CGPoint, context: CGContext) {
        let keyWindow = pickerWindow.windowScene!.keyWindow!
        context.translateBy(x: -location.x, y: -location.y)
        keyWindow.layer.render(in: context)
    }
}