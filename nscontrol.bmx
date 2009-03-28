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
' http://developer.apple.com/documentation/Cocoa/Reference/ApplicationKit/Classes/NSControl_Class/Reference/Reference.html
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
EndRem
