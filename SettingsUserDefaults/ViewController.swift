import UIKit

class ViewController: UIViewController
{
	@IBOutlet weak var onOffSwitch: UISwitch!
	@IBOutlet weak var onOffLabel: UILabel!
	@IBOutlet weak var themeSegment: UISegmentedControl!
	
	let userDefaults = UserDefaults.standard
	
	let ON_OFF_KEY = "onOffKey"
	let THEME_KEY = "themeKey"
	let DARK_THEME = "darkTheme"
	let LIGHT_THEME = "lightTheme"
	let RED_THEME = "redTheme"
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		checkSwitchState()
		updateTheme()
	}
	
	func checkSwitchState()
	{
		if(userDefaults.bool(forKey: ON_OFF_KEY))
		{
			onOffSwitch.setOn(true, animated: false)
			onOffLabel.text = "ON"
		}
		else
		{
			onOffSwitch.setOn(false, animated: false)
			onOffLabel.text = "OFF"
		}
	}
	
	func updateTheme()
	{
		let theme = userDefaults.string(forKey: THEME_KEY)
		if(theme == LIGHT_THEME)
		{
			themeSegment.selectedSegmentIndex = 0
			view.backgroundColor = UIColor.white
		}
		else if(theme == DARK_THEME)
		{
			themeSegment.selectedSegmentIndex = 1
			view.backgroundColor = UIColor.gray
		}
		else if(theme == RED_THEME)
		{
			themeSegment.selectedSegmentIndex = 2
			view.backgroundColor = UIColor.red
		}
	}
	
	@IBAction func switchChanged(_ sender: Any)
	{
		if(onOffSwitch.isOn)
		{
			userDefaults.set(true, forKey: ON_OFF_KEY)
			onOffLabel.text = "ON"
		}
		else
		{
			userDefaults.set(false, forKey: ON_OFF_KEY)
			onOffLabel.text = "OFF"
		}
	}
	
	@IBAction func segmentChanged(_ sender: Any)
	{
		switch themeSegment.selectedSegmentIndex
		{
			case 0:
				userDefaults.set(LIGHT_THEME, forKey: THEME_KEY)
			case 1:
				userDefaults.set(DARK_THEME, forKey: THEME_KEY)
			case 2:
				userDefaults.set(RED_THEME, forKey: THEME_KEY)
			default:
				userDefaults.set(LIGHT_THEME, forKey: THEME_KEY)
		}
		updateTheme()
	}
	
}

