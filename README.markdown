# Pub.Cocoa

### About

This is a module for BlitzMax that wraps the Cocoa classes.  There is a heavy dependency on my [Objective-C runtime module](http://github.com/nilium/pub.objectivec) due to almost all of the interaction with Cocoa classes being through the runtime's API.

The goal of this module is to implement a wrapper that provides proper interop between Cocoa's classes/Objective-C 2.0 and BlitzMax, such that objects between the two are almost interchangeable.  I don't expect to make this flawless, but I would like to be able, at the least, to write classes in BlitzMax that can extend the existing Cocoa classes.  Most of this will likely be done through BlitzMax's reflection module.

You should install the module in pub.mod/cocoa.mod (e.g., BlitzMax/mod/pub.mod/cocoa.mod).  Anywhere else and you will have to modify the code, possibly including changing how the framework is linked if you decide to forego using it as a module and simply import the source code itself.

### License

The module is licensed under the zlib/libpng license.

	Copyright (c) 2009 Noel R. Cower
	
	This software is provided 'as-is', without any express or implied
	warranty. In no event will the authors be held liable for any damages
	arising from the use of this software.
	
	Permission is granted to anyone to use this software for any purpose,
	including commercial applications, and to alter it and redistribute it
	freely, subject to the following restrictions:
	
	1. The origin of this software must not be misrepresented; you must not
	claim that you wrote the original software. If you use this software
	in a product, an acknowledgment in the product documentation would be
	appreciated but is not required.
	
	2. Altered source versions must be plainly marked as such, and must not be
	misrepresented as being the original software.
	
	3. This notice may not be removed or altered from any source
	distribution.

### Links

[Objective-C 2.0 Runtime Module](http://github.com/nilium/pub.objectivec)
[The Objective-C 2.0 Runtime Reference](http://developer.apple.com/DOCUMENTATION/Cocoa/Reference/ObjCRuntimeRef/Reference/reference.html)
