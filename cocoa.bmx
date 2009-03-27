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

Strict

Module Pub.Cocoa

ModuleInfo "Version: 1.00"
ModuleInfo "Author: Noel Cower"
ModuleInfo "License: zlib/libpng License"
ModuleInfo "Copyright: Noel Cower"
ModuleInfo "LD_OPTS:-framework Cocoa"

Import Pub.ObjectiveC

Public

Type NSRect
	Field x#
	Field y#
	Field width#
	Field height#
End Type

Private
Function methodImpSel@ Ptr(obj@ Ptr, name$, sel@ Ptr Var)
	Local class@ Ptr = object_getClass(obj)
	sel = sel_registerName(name)
	Return class_getMethodImplementation(class, sel)
End Function

Global ns_alloc_sel@ Ptr = sel_registerName("alloc")
Global ns_allocWithZone_sel@ Ptr = sel_registerName("allocWithZone")
Global ns_init_sel@ Ptr = sel_registerName("init")
Global ns_retain_sel@ Ptr = sel_registerName("retain")
Global ns_release_sel@ Ptr = sel_registerName("release")

Public

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
		Local obj@ Ptr = objc_msgSend(nsobject_class, ns_alloc_sel)
		If obj = Null Then
			Return Null
		EndIf
		
		Local nso:NSObject = New NSObject
		nso._obj = obj
		Return nso
	End Function
	
	Function allocWithZone:NSObject( zone@ Ptr )
		Local obj@ Ptr = objc_msgSend(nsobject_class, ns_allocWithZone_sel, Int(zone))
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
		_obj = objc_msgSend(_obj, ns_init_sel)
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
		cb = methodImpSel(_obj, "isEqual:", sel)
		Local other@ Ptr = Null
		If anObject Then
			other = anObject.Raw()
		EndIf
		Return cb(_obj, sel, other)
	End Method
	
	Method hash%()
		Local sel@ Ptr
		Local cb%(t@ Ptr, s@ Ptr)
		cb = methodImpSel(_obj, "hash", sel)
		Return cb(_obj, sel)
	End Method
	
	Method retain:NSObject()
		_obj = objc_msgSend(_obj, ns_retain_sel)
		Return Self
	End Method
	
	Method release_()
		objc_msgSend(_obj, ns_release_sel)
	End Method
End Type
NSObject.nsobject_class = objc_getClass("NSObject")

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
	
	Function fromBBString:NSString(str$)
		Local sel@ Ptr = sel_registerName("stringWithCharacters:length:")
		Local strbuf@ Ptr
		Local nss:NSString
		
		strbuf = str.ToWString()
		
		nss = New NSString
		nss._obj = objc_msgSend(nsstring_class, sel, Int strbuf, str.Length, 0)
		
		MemFree(strbuf)
		strbuf = Null
		
		Return nss
	End Function
	
	Method UTF8String@ Ptr()
		Local sel@ Ptr, cb@ Ptr(t@ Ptr, s@ Ptr)
		cb = methodImpSel(_obj, "UTF8String", sel)
		Return cb(_obj, sel)
	End Method
	
End Type
NSString.nsstring_class = objc_getClass("NSString")

Rem
Type NSControl Extends NSObject
	Global nscontrol_class@ Ptr
	Global nscontrol_init@ Ptr(t@ Ptr, s@ Ptr), nscontrol_init_sel@ Ptr
	
	Method New()
	End Method
	
	Method Delete()
	End Method
	
	Function Alloc:NSControl()
	End Function
	
	Method Init:NSControl()
		Return NSControl(Super.init())
	End Method
End Type

Type NSView Extends NSObject
	Global nsview_class@ Ptr
	Global nsview_initWithFrame@ Ptr(t@ Ptr, s@ Ptr, f@ Ptr), nsview_initWithFrame_sel@ Ptr
	
	Function alloc:NSView()
		nsview_alloc(nsview_class, nsview_alloc_sel)
	End Function
	
	Method init:NSView()
		_obj = nsview_init(_obj, nsview_init_sel)
		If _obj = Null Then
			Return Null
		EndIf
		Return Self
	End Method
	
	Method initWithFrame:NSView( frame:NSRect )
		_obj = nsview_initWithFrame(_obj, nsview_initWithFrame_sel, frame)
		If _obj = Null Then
			Return Null
		EndIf
		Return Self
	End Method
End Type
EndRem
