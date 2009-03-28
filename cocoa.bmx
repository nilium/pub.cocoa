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

?MacOS

ModuleInfo "LD_OPTS:-framework Cocoa"

Import Pub.ObjectiveC

' Common
Include "common.bmx"

' Classes
Include "nsobject.bmx"
Include "nsstring.bmx"
Include "nscontrol.bmx"
Include "nsview.bmx"

' Structs
Include "nsrect.bmx"

?
