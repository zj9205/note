# Lazy

 - You can’t use lazy with let.
 - You can’t use it with `computed properties`.  Because, a computed property returns the value every time we try to access it after executing the code inside the computation block.
 - You can use lazy only with members of struct and class.
 - Lazy variables are not initialised atomically and so is `not` thread safe.
 - You can use `self` inside the closure of a lazy property.  It will not cause any retain cycles.  The reason is that the immediately applied closure {}() is considered `@noescape`.  It does not retain the captured self.

