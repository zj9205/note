# Lazy

 - You can’t use lazy with let.
 - You can’t use it with `computed properties`.  Because, a computed property returns the value every time we try to access it after executing the code inside the computation block.
 - You can use lazy only with members of struct and class.
 - Lazy variables are not initialised atomically and so is `not` thread safe.
 - You can use `self` inside the closure of a lazy property.  It will not cause any retain cycles.  The reason is that the immediately applied closure {}() is considered `@noescape`.  It does not retain the captured self.



# @objcMembers and @objc

If you just want to expose a single method or property, you can mark that method using the `@objc` attribute. 

If you want all methods in a class to be exposed to Objective-C you can use a shortcut: the `@objcMembers` keyword:

```Swift
@objcMembers class MyController: UIViewController {
    func login() {

    }
}
```



# AnyObject and Any

`AnyObject` refers to any instance of a class, and is equivalent to id in Objective-C. It’s useful when you specifically want to work with a reference type, because it won’t allow any of Swift’s structs or enums to be used. AnyObject is also used when you want to restrict a protocol so that it can be used only with classes.

`Any` refers to any instance of a class, struct, or enum – literally anything at all.

```Swift
let values: [Any] = [1, 2, "Fish"]
```



# Int vs NSNumber vs NSInteger

`NSInteger` is a type definition that describes an integer
```Swift
typedef long NSInteger
```
When building 32-bit applications, NSInteger is a 32-bit integer. A 64-bit application treats NSInteger as a 64-bit integer. Most of the time you can replace int with NSInteger

`NSNumber` is a subclass of NSValue that offers a value as any C scalar (numeric) type
```Swift
class NSNumber : NSValue
```
It helps you to store numeric types as object. It has methods to convert between different types and methods to retrieve a string representation of your numeric value.



# Weak and Unowned

According to Apple, you should always use unowned references when your object **can't outlive** its reference:
> 
> Use an unowned reference only when you are sure that the reference always refers to an instance that has not been deallocated.
> 
> If you try to access the value of an unowned reference after that instance has been deallocated, you’ll get a runtime error.
> 
> If the captured reference will never become nil, it should always be captured as an unowned reference, rather than a weak reference.
```Swift
// weak
class HomeView: UIView {
    weak var delegate: HomeViewDelegate?
    func renderView() {
        guard let delegate = delegate else { return }
        delegate.homeViewDidUpdate()
    }
}

// unowned
class HomeView: UIView {
    private unowned let delegate: HomeViewDelegate

    init(delegate: HomeViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
    }

    func renderView() {
        delegate.homeViewDidUpdate()
    }
}
```



# closeAppElegantly.swift

```Swift
func showMessageResetApp() {
    let message = "We need to restart the app. \n Please reopen the app after this."
    let exitAppAlert = UIAlertController(title: "Restart is needed",
                                         message: message,
                                         preferredStyle: .alert)
    
    let resetApp = UIAlertAction(title: "Close Now", style: .destructive) { (alert) -> Void in
        // home button pressed programmatically - to thorw app to background
        UIControl().sendAction(#selector(URLSessionTask.suspend), to: UIApplication.shared, for: nil)
        // terminaing app in background
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
            exit(EXIT_SUCCESS)
        })
    }
    
    let laterAction = UIAlertAction(title: "Later", style: .cancel) { (alert) -> Void in
        self.dismiss(animated: true, completion: nil)
    }
    
    exitAppAlert.addAction(resetApp)
    exitAppAlert.addAction(laterAction)
    present(exitAppAlert, animated: true, completion: nil)
}
```



# Swift Style Guide

## Delegates
When creating custom delegate methods, an unnamed first parameter should be the delegate source. (UIKit contains numerous examples of this.)
```Swift
func namePickerView(_ namePickerView: NamePickerView, didSelectName name: String)
func namePickerViewShouldReload(_ namePickerView: NamePickerView) -> Bool
```

## Code Organization
Use `extensions` to organize your code into logical blocks of functionality. 

Each extension should be set off with a `// MARK: - ` comment to keep things well-organized.
```Swift
// MARK: - UITableViewDataSource
```

## Function Declarations
Don't use `(Void)` to represent the lack of an input; simply use `()`. Use `Void` instead of `()` for closure and function outputs.

```Swift
func updateConstraints() -> Void {
  // magic happens here
}

typealias CompletionHandler = (result) -> Void
```

## Closure Expressions
Use `trailing closure` syntax only if there's a single closure expression parameter at the end of the argument list. Give the closure parameters descriptive names.
```Swift
UIView.animate(withDuration: 1.0) {
  self.myView.alpha = 0
}

UIView.animate(withDuration: 1.0, animations: {
  self.myView.alpha = 0
}, completion: { finished in
  self.myView.removeFromSuperview()
})
```

For single-expression closures where the context is clear, use implicit returns:
```Swift
attendeeList.sort { a, b in
  a > b
}
```

## Constants
```Swift
enum Math {
  static let e = 2.718281828459045235360287
  static let root2 = 1.41421356237309504880168872
}

let hypotenuse = side * Math.root2
```

## Type Inference
```Swift
let message: String = "Click the button"
let currentBounds: CGRect = computeViewBounds()
var names: [String] = []
var lookup: [String: Int] = [:]
var faxNumber: Int?
```

## Functions vs Methods
Preferred
```Swift
let sorted = items.mergeSorted()  // easily discoverable
rocket.launch()  // acts on the model
```
Free Function Exceptions

```Swift
let tuples = zip(a, b)  // feels natural as a free function (symmetry)
let value = max(x, y, z)  // another free function that feels natural
```

## Extending object lifetime
`[weak self]` is preferred to `[unowned self]`
```Swift
resource.request().onComplete { [weak self] response in
  guard let self = self else {
    return
  }
  let model = self.updateModel(response)
  self.updateUI(model)
}
```

## Control Flow
Prefer the `for-in` style of for loop over the `while-condition-increment` style.

```Swift
for _ in 0..<3 {
  print("Hello three times")
}

for (index, person) in attendeeList.enumerated() {
  print("\(person) is at position #\(index)")
}

for index in stride(from: 0, to: items.count, by: 2) {
  print(index)
}

for index in (0...3).reversed() {
  print(index)
}
```

## Ternary Operator
```Swift
let value = 5
result = value != 0 ? x : y

let isHorizontal = true
result = isHorizontal ? x : y
```

## Failing Guards
`return, throw, break, continue, fatalError(), defer`

