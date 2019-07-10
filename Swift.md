# Lazy

 - You can’t use lazy with let.
 - You can’t use it with `computed properties`.  Because, a computed property returns the value every time we try to access it after executing the code inside the computation block.
 - You can use lazy only with members of struct and class.
 - Lazy variables are not initialised atomically and so is `not` thread safe.
 - You can use `self` inside the closure of a lazy property.  It will not cause any retain cycles.  The reason is that the immediately applied closure {}() is considered `@noescape`.  It does not retain the captured self.

<br/>

# @objcMembers and @objc

If you just want to expose a single method or property, you can mark that method using the `@objc` attribute. 

If you want all methods in a class to be exposed to Objective-C you can use a shortcut: the `@objcMembers` keyword:

```Swift
@objcMembers class MyController: UIViewController {
    func login() {

    }
}
```

<br/>
