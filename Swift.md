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
