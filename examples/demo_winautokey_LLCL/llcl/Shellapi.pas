{Modified for LLCL

    This file is part of the Free Pascal run time library.
    This unit contains the record definition for the Win32 API
    Copyright (c) 1999-2002 by Marco van de Voort,
    member of the Free Pascal development team.

    See the file COPYING.FPC, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

 ************************************************************************}

{ leave out unused functions so the unit can be used on win2000 as well }
{$ifndef NO_SMART_LINK}
{$smartlink on}
{$endif}

{$PACKRECORDS C}
{$calling stdcall}
{$mode objfpc}

{$ifdef FPC_OS_UNICODE}
  {$define UNICODE}
{$endif}

Unit ShellApi;

//+-------------------------------------------------------------------------
//
//  Microsoft Windows
//  Copyright (c) Microsoft Corporation. All rights reserved.
//
//  File: shellapi.h
//
//  Header translation by Marco van de Voort for Free Pascal Platform
//  SDK dl'ed January 2002
//
//--------------------------------------------------------------------------

Interface

Uses Windows{, ActiveX};

const
   shell32 =  'shell32.dll';

Function ShellExecuteA(HWND: hwnd;lpOperation : LPCSTR ; lpFile : LPCSTR ; lpParameters : LPCSTR; lpDirectory:  LPCSTR; nShowCmd:LONGINT):HInst; external shell32 name 'ShellExecuteA';
Function ShellExecuteW(hwnd: HWND;lpOperation : LPCWSTR ; lpFile : LPCWSTR ; lpParameters : LPCWSTR; lpDirectory:  LPCWSTR; nShowCmd:LONGINT):HInst; external shell32 name 'ShellExecuteW';
Function ShellExecute(HWND: hwnd;lpOperation : LPCSTR ; lpFile : LPCSTR ; lpParameters : LPCSTR; lpDirectory:  LPCSTR; nShowCmd:LONGINT):HInst; external shell32 name 'ShellExecuteA';
Function ShellExecute(hwnd: HWND;lpOperation : LPCWSTR ; lpFile : LPCWSTR ; lpParameters : LPCWSTR; lpDirectory:  LPCWSTR; nShowCmd:LONGINT):HInst; external shell32 name 'ShellExecuteW';

implementation

end.
