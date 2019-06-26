# @synthesize
How to use
- @synthesize propertyName = _propertyName  
When use
- readwrite property with custom getter and setter
- readonly property with custom getter
- when using @dynamic propertyName, the property won't be automatically synthesized (pretty obvious, since @dynamic and @synthesize are mutually exclusive)
- properties declared in a @protocol
- properties declared in a category
- overridden properties (new since clang-600.0.51, shipping with Xcode 6, thanks Marc Schlüpmann)

