import UIKit

public class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var keyboardDismissTapGesture: UIGestureRecognizer?
    
	public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 5 //Создаем 5 строк в качествн примера
	}
 
	public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("TextInputCell") as! TextInputTableViewCell
		
		cell.configure(text: "", placeholder: "Enter some text!")
        cell.title.text = "\(indexPath.row + 1)"
        
		return cell
	}

//----------------  клавиатура скрывается (keyboard  DisMiss) начало
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: Selector("keyboardWillShow:"), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name: UIKeyboardWillHideNotification, object: nil)
    }
    
    override public func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        super.viewWillDisappear(animated)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if keyboardDismissTapGesture == nil
        {
            keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard:"))
            keyboardDismissTapGesture?.cancelsTouchesInView = false
            view.addGestureRecognizer(keyboardDismissTapGesture!)
                  }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if keyboardDismissTapGesture != nil
        {
            self.view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
    }
    
    func dismissKeyboard(sender: AnyObject) {
        view.endEditing(true)
    }
    //-------------- клавиатура скрывается (keyboard  DisMiss) конец

}