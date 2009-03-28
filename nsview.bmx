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

Rem
' http://developer.apple.com/documentation/Cocoa/Reference/ApplicationKit/Classes/NSView_Class/Reference/NSView.html
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
