Rem:license
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
EndRem

' http://developer.apple.com/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html
Type NSString Extends NSObject
	Global nsstring_class@ Ptr
	
	Function fromObject:NSString(obj@ Ptr)
		If obj = Null Then
			Return Null
		EndIf
		
		Local nss:NSString = New NSString
		nss._obj = obj
		Return nss
	End Function
	
	Function class@ Ptr()
		Return nsstring_class
	End Function
	
	Function fromBBString:NSString(str$)
		Local strbuf@ Ptr
		Local nss:NSString
		
		strbuf = str.ToWString()
		
		nss = NSString.stringWithCharacters(strbuf, str.Length)
		
		MemFree(strbuf)
		strbuf = Null
		
		Return nss
	End Function
	
	Function stringWithCharacters:NSString( chars@ Ptr, length% )
		Local sel@ Ptr = sel_registerName("stringWithCharacters:length:")
		Local nss:NSString
		
		nss = New NSString
		nss._obj = objc_msgSend(nsstring_class, sel, Int chars, length, 0)
		
		Return nss
	End Function
	
	Method UTF8String@ Ptr()
		Local sel@ Ptr, cb@ Ptr(t@ Ptr, s@ Ptr)
		cb = cocoa_MethodImpSel(_obj, "UTF8String", sel)
		Return cb(_obj, sel)
	End Method
	
End Type
NSString.nsstring_class = objc_getClass("NSString")