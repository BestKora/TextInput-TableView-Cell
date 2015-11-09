import UIKit

public class TextInputTableViewCell: UITableViewCell {
	@IBOutlet weak var textField: UITextField!
	
    @IBOutlet weak var title: UILabel!
	public func configure(text text: String?, placeholder: String) {
		textField.text = text
		textField.placeholder = placeholder
		
		textField.accessibilityValue = text
		textField.accessibilityLabel = placeholder
        title.text = "good"
	}
}