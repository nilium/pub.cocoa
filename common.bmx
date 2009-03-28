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

Global g_ns_alloc_sel@ Ptr = sel_registerName("alloc")
Global g_ns_allocWithZone_sel@ Ptr = sel_registerName("allocWithZone:")
Global g_ns_init_sel@ Ptr = sel_registerName("init")
Global g_ns_retain_sel@ Ptr = sel_registerName("retain")
Global g_ns_release_sel@ Ptr = sel_registerName("release")

Function cocoa_MethodImpSel@ Ptr(obj@ Ptr, name$, sel@ Ptr Var)
	Local class@ Ptr = object_getClass(obj)
	sel = sel_registerName(name)
	Return class_getMethodImplementation(class, sel)
End Function
