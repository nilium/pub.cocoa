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

' http://developer.apple.com/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html
Type NSObject
	Global nsobject_class@ Ptr
	
	Field _obj@ Ptr
	
	Method New()
	End Method
	
	Method Delete()
	End Method
	
	Method Raw@ Ptr()
		Return _obj
	End Method
	
	Function fromObject:NSObject( obj@ Ptr )
		If obj = Null Then
			Return Null
		EndIf
		Local nso:NSObject = New NSObject
		nso._obj = obj
		Return nso
	End Function
	
	Function initialize()
		Global sel@ Ptr = sel_registerName("initialize")
		objc_msgSend(nsobject_class, sel)
	End Function
	
	Function alloc:NSObject()
		Local obj@ Ptr = objc_msgSend(nsobject_class, g_ns_alloc_sel)
		If obj = Null Then
			Return Null
		EndIf
		
		Local nso:NSObject = New NSObject
		nso._obj = obj
		Return nso
	End Function
	
	Function allocWithZone:NSObject( zone@ Ptr )
		Local obj@ Ptr = objc_msgSend(nsobject_class, g_ns_allocWithZone_sel, Int(zone))
		If obj = Null Then
			Return Null
		EndIf
		
		Local nso:NSObject = New NSObject
		nso._obj = obj
		Return nso
	End Function

	Function cancelPreviousPerformRequestsWithTarget( target@ Ptr )
		Global cancelPreviousPerformRequestsWithTarget_sel@ Ptr = sel_registerName("cancelPreviousPerformRequestsWithTarget:")
		objc_msgSend(nsobject_class, cancelPreviousPerformRequestsWithTarget_sel, Int(target))
	End Function
	
	Function cancelPreviousPerformRequestsWithTarget2( target@ Ptr, selector@ Ptr, _object@ Ptr )
		Global cancelPreviousPerformRequestsWithTargetSelectorObject_sel@ Ptr = sel_registerName("cancelPreviousPerformRequestsWithTarget:selector:object:")
		objc_msgSend(nsobject_class, cancelPreviousPerformRequestsWithTargetSelectorObject_sel, Int(target), Int(selector), Int(_object))
	End Function
	
	Function class@ Ptr()
		Return nsobject_class
	End Function
	
	Rem
	Function classFallbacksForKeyedArchiver:NSArray()
		Global classFallbacksForKeyedArchiver_sel@ Ptr = sel_registerName("classFallbacksForKeyedArchiver")
		Return NSArray.fromObject(objc_msgSend(nsobject_class, classFallbacksForKeyedArchiver))
	End Function
	EndRem
	
	Function classForKeyedUnarchiver@ Ptr()
		Global classForKeyedUnarchiver_sel@ Ptr = sel_registerName("classForKeyedUnarchiver")
		Return objc_msgSend(nsobject_class, classForKeyedUnarchiver)
	End Function
	
	Function conformsToProtocol%( protocol@ Ptr )
		Global conformsToProtocol_sel@ Ptr = sel_registerName("conformsToProtocol")
		Return Int(objc_msgSend(nsobject_class, conformsToProtocol_sel, Int(protocol)))
	End Function
	
	Function copyWithZone%( zone@ Ptr )
		Global copyWithZone_sel@ Ptr = sel_registerName("copyWithZone:")
		Return Int objc_msgSend(nsobject_class, copyWithZone_sel, Int zone)
	End Function
	
	Function description$()
		Global description_sel@ Ptr = sel_registerName("description")
		Local nstr:NSString = NSString.fromObject(objc_msgSend(nsobject_class, description_sel))
		Local str$ = String.FromCString(nstr.UTF8String())
		nstr.release_()
		Return str
	End Function
	
	Method init:NSObject()
		_obj = objc_msgSend(_obj, g_ns_init_sel)
		If _obj = Null Then
			Return Null
		EndIf
		Return Self
	End Method
	
	Method superclass:Byte Ptr()
		Return class_getSuperclass(Self.class())
	End Method
	
	Method isEqual%( anObject:NSObject )
		Local sel@ Ptr
		Local cb%(t@ Ptr, s@ Ptr, obj@ Ptr)
		cb = cocoa_MethodImpSel(_obj, "isEqual:", sel)
		Local other@ Ptr = Null
		If anObject Then
			other = anObject.Raw()
		EndIf
		Return cb(_obj, sel, other)
	End Method
	
	Method hash%()
		Local sel@ Ptr
		Local cb%(t@ Ptr, s@ Ptr)
		cb = cocoa_MethodImpSel(_obj, "hash", sel)
		Return cb(_obj, sel)
	End Method
	
	Method retain:NSObject()
		_obj = objc_msgSend(_obj, g_ns_retain_sel)
		Return Self
	End Method
	
	Method release_()
		objc_msgSend(_obj, g_ns_release_sel)
	End Method
End Type
NSObject.nsobject_class = objc_getClass("NSObject")
