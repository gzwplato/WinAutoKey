{ from C:\lazarus\184\lcl\lcltype.pp
  Modified for LLCL
}

unit LLCLType;

{$mode objfpc}{$H+}
{$macro on}

interface

uses  Windows, Classes, SysUtils;

type
  UINT = LongWord;
  UINT_PTR = PtrUInt;

  HKEY  = Windows.HKEY;
  HDC   = Windows.HDC;
  HHOOK = Windows.HHOOK;
  HFONT = Windows.HFont;
  HGDIOBJ = Windows.HGDIOBJ;
  HPEN    = Windows.HPEN;
  HRGN    = Windows.HRGN;
  HINST   = Windows.HINST;
  HICON   = Windows.HICON;
  HIMAGELIST = Windows.HIMAGELIST;
  HCURSOR = HICON;
  BOOL    = Windows.BOOL;
  HGLOBAL = Windows.HGLOBAL;
  Short   = Windows.Short;
  HWND    = Windows.HWND;
  HMENU   = Windows.HMENU;
  HBITMAP = Windows.HBITMAP;
  HPALETTE = Windows.HPALETTE;
  HBRUSH = Windows.HBRUSH;
  HMONITOR = HANDLE;

  WPARAM = Windows.WPARAM;
  LPARAM = Windows.LPARAM;
  LRESULT = Windows.LRESULT;

  PHKEY = ^HKEY;

const
  INVALID_HANDLE_VALUE  = HANDLE(-1); // prior to 1.1 it was 0, see for example FileOpen

  MAXBYTE  = Byte($FF);
  MAXWORD  = Word($FFFF);
  MAXDWORD = DWord($FFFFFFFF);

  MINCHAR  = $80;
  MAXCHAR  = $7F;
  MINSHORT = $8000;
  MAXSHORT = $7FFF;
  MINLONG  = DWord($80000000);
  MAXLONG  = $7FFFFFFF;


const

//==============================================
// Menu constants
//==============================================

  MF_BYCOMMAND       = 0;
  MF_BYPOSITION      = $400;
  MF_BYHANDLE        = $800; // introduced by the LCL

  MF_SEPARATOR       = $800;

  MF_ENABLED         = 0;
  MF_GRAYED          = 1;
  MF_DISABLED        = 2;

  MF_UNCHECKED       = 0;
  MF_CHECKED         = 8;
  MF_USECHECKBITMAPS = $200;

  MF_STRING          = 0;
  MF_BITMAP          = 4;
  MF_OWNERDRAW       = $100;

  MF_POPUP           = $10;
  MF_MENUBARBREAK    = $20;
  MF_MENUBREAK       = $40;

  MF_UNHILITE        = 0;
  MF_HILITE          = $80;

  MF_DEFAULT         = $1000;
  MF_SYSMENU         = $2000;
  MF_HELP            = $4000;
  MF_RIGHTJUSTIFY    = $4000;

  MF_MOUSESELECT     = $8000;

  MF_UNSUPPORTED     = $FFFFFFFF;

//==============================================
// Keyboard constants
//==============================================

//------------
// KeyFlags (High word part !!!)
//------------
  KF_EXTENDED = $100;
  KF_DLGMODE = $800;
  KF_MENUMODE = $1000;
  KF_ALTDOWN = $2000;
  KF_REPEAT = $4000;
  KF_UP = $8000;

// TShortCut additions:
  scMeta = $1000;

//-------------
// Virtual keys
//-------------
//
// Basic keys up to $FF have values and meaning compatible with the Windows API as described here:
// http://msdn.microsoft.com/library/default.asp?url=/library/en-us/winui/WinUI/WindowsUserInterface/UserInput/VirtualKeyCodes.asp
//
// Starting with $100 and upwards the key constants are LCL additions
//
  VK_UNKNOWN    = 0; // defined by LCL
  VK_LBUTTON    = 1;
  VK_RBUTTON    = 2;
  VK_CANCEL     = 3;
  VK_MBUTTON    = 4;
  VK_XBUTTON1   = 5;
  VK_XBUTTON2   = 6;
  VK_BACK       = 8;  // The "Backspace" key, dont confuse with the
                      // Android BACK key which is mapped to VK_ESCAPE
  VK_TAB        = 9;
  VK_CLEAR      = 12;
  VK_RETURN     = 13; // The "Enter" key, also used for a keypad center press
  VK_SHIFT      = 16; // See also VK_LSHIFT, VK_RSHIFT
  VK_CONTROL    = 17; // See also VK_LCONTROL, VK_RCONTROL
  VK_MENU       = 18; // The ALT key. Also called "Option" in Mac OS X. See also VK_LMENU, VK_RMENU
  VK_PAUSE      = 19; // Pause/Break key
  VK_CAPITAL    = 20; // CapsLock key
  VK_KANA       = 21;
  VK_HANGUL     = 21;
  VK_JUNJA      = 23;
  VK_FINAL      = 24;
  VK_HANJA      = 25;
  VK_KANJI      = 25;
  VK_ESCAPE     = 27; // Also used for the hardware Back key in Android
  VK_CONVERT    = 28;
  VK_NONCONVERT = 29;
  VK_ACCEPT     = 30;
  VK_MODECHANGE = 31;
  VK_SPACE      = 32;
  VK_PRIOR      = 33; // Page Up
  VK_NEXT       = 34; // Page Down
  VK_END        = 35;
  VK_HOME       = 36;
  VK_LEFT       = 37;
  VK_UP         = 38;
  VK_RIGHT      = 39;
  VK_DOWN       = 40;
  VK_SELECT     = 41;
  VK_PRINT      = 42; // PrintScreen key
  VK_EXECUTE    = 43;
  VK_SNAPSHOT   = 44;
  VK_INSERT     = 45;
  VK_DELETE     = 46;
  VK_HELP       = 47;
  VK_0          = $30;
  VK_1          = $31;
  VK_2          = $32;
  VK_3          = $33;
  VK_4          = $34;
  VK_5          = $35;
  VK_6          = $36;
  VK_7          = $37;
  VK_8          = $38;
  VK_9          = $39;
  //3A-40 Undefined
  VK_A          = $41;
  VK_B          = $42;
  VK_C          = $43;
  VK_D          = $44;
  VK_E          = $45;
  VK_F          = $46;
  VK_G          = $47;
  VK_H          = $48;
  VK_I          = $49;
  VK_J          = $4A;
  VK_K          = $4B;
  VK_L          = $4C;
  VK_M          = $4D;
  VK_N          = $4E;
  VK_O          = $4F;
  VK_P          = $50;
  VK_Q          = $51;
  VK_R          = $52;
  VK_S          = $53;
  VK_T          = $54;
  VK_U          = $55;
  VK_V          = $56;
  VK_W          = $57;
  VK_X          = $58;
  VK_Y          = $59;
  VK_Z          = $5A;

  VK_LWIN       = $5B; // In Mac OS X this is the Apple, or Command key. Windows Key in PC keyboards
  VK_RWIN       = $5C; // In Mac OS X this is the Apple, or Command key. Windows Key in PC keyboards
  VK_APPS       = $5D; // The PopUp key in PC keyboards
  // $5E reserved
  VK_SLEEP      = $5F;

  VK_NUMPAD0    = 96; // $60
  VK_NUMPAD1    = 97;
  VK_NUMPAD2    = 98;
  VK_NUMPAD3    = 99;
  VK_NUMPAD4    = 100;
  VK_NUMPAD5    = 101;
  VK_NUMPAD6    = 102;
  VK_NUMPAD7    = 103;
  VK_NUMPAD8    = 104;
  VK_NUMPAD9    = 105;
  VK_MULTIPLY   = 106; // VK_MULTIPLY up to VK_DIVIDE are usually in the numeric keypad in PC keyboards
  VK_ADD        = 107;
  VK_SEPARATOR  = 108;
  VK_SUBTRACT   = 109;
  VK_DECIMAL    = 110;
  VK_DIVIDE     = 111;
  VK_F1         = 112;
  VK_F2         = 113;
  VK_F3         = 114;
  VK_F4         = 115;
  VK_F5         = 116;
  VK_F6         = 117;
  VK_F7         = 118;
  VK_F8         = 119;
  VK_F9         = 120;
  VK_F10        = 121;
  VK_F11        = 122;
  VK_F12        = 123;
  VK_F13        = 124;
  VK_F14        = 125;
  VK_F15        = 126;
  VK_F16        = 127;
  VK_F17        = 128;
  VK_F18        = 129;
  VK_F19        = 130;
  VK_F20        = 131;
  VK_F21        = 132;
  VK_F22        = 133;
  VK_F23        = 134;
  VK_F24        = 135; // $87

  // $88-$8F unassigned

  VK_NUMLOCK    = $90;
  VK_SCROLL     = $91;

  // $92-$96  OEM specific
  // $97-$9F  Unassigned

  // not in VCL defined:
  //MWE: And should not be used.
  //     The keys they are on map to another VK

//  VK_SEMICOLON  = 186;
//  VK_EQUAL      = 187; // $BB
//  VK_COMMA      = 188;
//  VK_POINT      = 190;
//  VK_SLASH      = 191;
//  VK_AT         = 192;

  // VK_L & VK_R - left and right Alt, Ctrl and Shift virtual keys.
  // When Application.ExtendedKeysSupport is false, these keys are
  // used only as parameters to GetAsyncKeyState() and GetKeyState().
  // No other API or message will distinguish left and right keys in this way
  //
  // When Application.ExtendedKeysSupport is true, these keys will be sent
  // on KeyDown / KeyUp instead of the generic VK_SHIFT, VK_CONTROL, etc.
  VK_LSHIFT     = $A0;
  VK_RSHIFT     = $A1;
  VK_LCONTROL   = $A2;
  VK_RCONTROL   = $A3;
  VK_LMENU      = $A4; // Left ALT key (also named Option in Mac OS X)
  VK_RMENU      = $A5; // Right ALT key (also named Option in Mac OS X)

  VK_BROWSER_BACK        = $A6;
  VK_BROWSER_FORWARD     = $A7;
  VK_BROWSER_REFRESH     = $A8;
  VK_BROWSER_STOP        = $A9;
  VK_BROWSER_SEARCH      = $AA;
  VK_BROWSER_FAVORITES   = $AB;
  VK_BROWSER_HOME        = $AC;
  VK_VOLUME_MUTE         = $AD;
  VK_VOLUME_DOWN         = $AE;
  VK_VOLUME_UP           = $AF;
  VK_MEDIA_NEXT_TRACK    = $B0;
  VK_MEDIA_PREV_TRACK    = $B1;
  VK_MEDIA_STOP          = $B2;
  VK_MEDIA_PLAY_PAUSE    = $B3;
  VK_LAUNCH_MAIL         = $B4;
  VK_LAUNCH_MEDIA_SELECT = $B5;
  VK_LAUNCH_APP1         = $B6;
  VK_LAUNCH_APP2         = $B7;

  // VK_OEM keys are utilized only when Application.ExtendedKeysSupport is false

  // $B8-$B9 Reserved
  VK_OEM_1               = $BA; // Used for miscellaneous characters; it can vary by keyboard.
                                // For the US standard keyboard, the ';:' key
  VK_OEM_PLUS            = $BB; // For any country/region, the '+' key
  VK_OEM_COMMA           = $BC; // For any country/region, the ',' key
  VK_OEM_MINUS           = $BD; // For any country/region, the '-' key
  VK_OEM_PERIOD          = $BE; // For any country/region, the '.' key
  VK_OEM_2               = $BF; // Used for miscellaneous characters; it can vary by keyboard.
                                // For the US standard keyboard, the '/?' key
  VK_OEM_3               = $C0; // Used for miscellaneous characters; it can vary by keyboard.
                                // For the US standard keyboard, the '`~' key
  // $C1-$D7 Reserved
  // $D8-$DA Unassigned
  VK_OEM_4               = $DB; // Used for miscellaneous characters; it can vary by keyboard.
                                // For the US standard keyboard, the '[{' key
  VK_OEM_5               = $DC; // Used for miscellaneous characters; it can vary by keyboard.
                                // For the US standard keyboard, the '\|' key
  VK_OEM_6               = $DD; // Used for miscellaneous characters; it can vary by keyboard.
                                // For the US standard keyboard, the ']}' key
  VK_OEM_7               = $DE; // Used for miscellaneous characters; it can vary by keyboard.
                                // For the US standard keyboard, the 'single-quote/double-quote' key
  VK_OEM_8               = $DF; // Used for miscellaneous characters; it can vary by keyboard.

  // $E0 Reserved
  // $E1 OEM specific
  VK_OEM_102             = $E2; // Either the angle bracket key or the backslash key on the RT 102-key keyboard

  // $E3-$E4 OEM specific

  VK_PROCESSKEY          = $E7; // IME Process key

  // $E8 Unassigned
  // $E9-$F5 OEM specific

  VK_ATTN       = $F6;
  VK_CRSEL      = $F7;
  VK_EXSEL      = $F8;
  VK_EREOF      = $F9;
  VK_PLAY       = $FA;
  VK_ZOOM       = $FB;
  VK_NONAME     = $FC;
  VK_PA1        = $FD;
  VK_OEM_CLEAR  = $FE;

  VK_HIGHESTVALUE = $FFFF;
  VK_UNDEFINED  = $FF; // defined by LCL

//==============================================
// LCL aliases for more clear naming of keys
//==============================================

  VK_LCL_EQUAL       = VK_OEM_PLUS;  // The "=+" Key
  VK_LCL_COMMA       = VK_OEM_COMMA; // The ",<" Key
  VK_LCL_POINT       = VK_OEM_PERIOD;// The ".>" Key
  VK_LCL_SLASH       = VK_OEM_2;     // The "/?" Key
  VK_LCL_SEMI_COMMA  = VK_OEM_1;     // The ";:" Key
  VK_LCL_MINUS       = VK_OEM_MINUS; // The "-_" Key
  VK_LCL_OPEN_BRAKET = VK_OEM_4;     // The "[{" Key
  VK_LCL_CLOSE_BRAKET= VK_OEM_6;     // The "]}" Key
  VK_LCL_BACKSLASH   = VK_OEM_5;     // The "\|" Key
  VK_LCL_TILDE       = VK_OEM_3;     // The "`~" Key
  VK_LCL_QUOTE       = VK_OEM_7;     // The "'"" Key

  VK_LCL_ALT        = VK_MENU;
  VK_LCL_LALT       = VK_LMENU;
  VK_LCL_RALT       = VK_RMENU;

  VK_LCL_CAPSLOCK   = VK_CAPITAL;

//==============================================
// New LCL defined keys
//==============================================

  VK_LCL_POWER      = $100;
  VK_LCL_CALL       = $101;
  VK_LCL_ENDCALL    = $102;
  VK_LCL_AT     = $103; // Not equivalent to anything < $FF, will only be sent by a primary "@" key
                        // but not for a @ key as secondary action of a "2" key for example

  MB_OK = $00000000;
  MB_OKCANCEL = $00000001;
  MB_ABORTRETRYIGNORE = $00000002;
  MB_YESNOCANCEL = $00000003;
  MB_YESNO = $00000004;
  MB_RETRYCANCEL = $00000005;
  MB_CANCELTRYCONTINUE = $00000006; // not yet supported by MessageDlg

  MB_HELP = $00004000; // not yet supported by MessageDlg

  MB_ICONHAND = $00000010;
  MB_ICONQUESTION = $00000020;
  MB_ICONEXCLAMATION = $00000030;
  MB_ICONASTERISK = $00000040;
  MB_ICONWARNING = MB_ICONEXCLAMATION;
  MB_ICONERROR = MB_ICONHAND;
  MB_ICONSTOP = MB_ICONHAND;
  MB_ICONINFORMATION = MB_ICONASTERISK;

  IDOK = 1;     ID_OK = IDOK;
  IDCANCEL = 2; ID_CANCEL = IDCANCEL;
  IDABORT = 3;  ID_ABORT = IDABORT;
  IDRETRY = 4;  ID_RETRY = IDRETRY;
  IDIGNORE = 5; ID_IGNORE = IDIGNORE;
  IDYES = 6;    ID_YES = IDYES;
  IDNO = 7;     ID_NO = IDNO;
  IDCLOSE = 8;  ID_CLOSE = IDCLOSE;
  IDHELP = 9;   ID_HELP = IDHELP;

  MB_DEFBUTTON1 = $00000000;
  MB_DEFBUTTON2 = $00000100;
  MB_DEFBUTTON3 = $00000200;
  MB_DEFBUTTON4 = $00000300;

//==============================================
// Window Styles
//==============================================
  WS_OVERLAPPED = 0;
  WS_POPUP = DWORD($80000000);
  WS_CHILD = DWORD($40000000);
  WS_MINIMIZE = DWORD($20000000);
  WS_VISIBLE = DWORD($10000000);
  WS_DISABLED = DWORD($8000000);
  WS_CLIPSIBLINGS = DWORD($4000000);
  WS_CLIPCHILDREN = DWORD($2000000);
  WS_MAXIMIZE = DWORD($1000000);
  WS_BORDER = DWORD($800000);
  WS_DLGFRAME = DWORD($400000);
  WS_CAPTION = DWORD(WS_BORDER or WS_DLGFRAME);
  WS_VSCROLL = DWORD($200000);
  WS_HSCROLL = DWORD($100000);
  WS_SYSMENU = DWORD($80000);
  WS_THICKFRAME = DWORD($40000);
  WS_GROUP = DWORD($20000);
  WS_TABSTOP = DWORD($10000);

  WS_MINIMIZEBOX = DWORD($20000);
  WS_MAXIMIZEBOX = DWORD($10000);

  WS_TILED = WS_OVERLAPPED;

  WS_ICONIC = WS_MINIMIZE;

  WS_SIZEBOX = WS_THICKFRAME;

  { Common Window Styles }
  WS_OVERLAPPEDWINDOW = (WS_OVERLAPPED or WS_CAPTION or WS_SYSMENU
                         or WS_THICKFRAME or WS_MINIMIZEBOX or WS_MAXIMIZEBOX);
  WS_TILEDWINDOW = WS_OVERLAPPEDWINDOW;
  WS_POPUPWINDOW = (WS_POPUP or WS_BORDER or WS_SYSMENU);
  WS_CHILDWINDOW = (WS_CHILD);

  { Extended Window Styles }
  WS_EX_DLGMODALFRAME = 1;
  WS_EX_NOPARENTNOTIFY = 4;
  WS_EX_TOPMOST = 8;
  WS_EX_ACCEPTFILES = $10;
  WS_EX_TRANSPARENT = $20;
  WS_EX_MDICHILD = $40;
  WS_EX_TOOLWINDOW = $80;
  WS_EX_WINDOWEDGE = $100;
  WS_EX_CLIENTEDGE = $200;
  WS_EX_CONTEXTHELP = $400;

  WS_EX_RIGHT = $1000;
  WS_EX_LEFT = 0;
  WS_EX_RTLREADING = $2000;
  WS_EX_LTRREADING = 0;
  WS_EX_LEFTSCROLLBAR = $4000;
  WS_EX_RIGHTSCROLLBAR = 0;

  WS_EX_CONTROLPARENT = $10000;
  WS_EX_STATICEDGE = $20000;
  WS_EX_APPWINDOW = $40000;
  WS_EX_OVERLAPPEDWINDOW = (WS_EX_WINDOWEDGE or WS_EX_CLIENTEDGE);
  WS_EX_PALETTEWINDOW = (WS_EX_WINDOWEDGE or WS_EX_TOOLWINDOW or WS_EX_TOPMOST);

  { Button styles }
  BS_PUSHBUTTON    = $00000000;
  BS_DEFPUSHBUTTON = $00000001;
  BS_AUTOCHECKBOX  = $00000003;
  BS_RADIOBUTTON   = $00000004;
  BS_3STATE        = $00000005;
  BS_GROUPBOX      = $00000007;
  BS_OWNERDRAW     = $0000000B;
  BS_RIGHTBUTTON   = $00000020;
  BS_PUSHLIKE      = $00001000;

  { Edit styles }
  ES_LEFT          = $0000;
  ES_CENTER        = $0001;
  ES_RIGHT         = $0002;
  ES_MULTILINE     = $0004;
  ES_AUTOVSCROLL   = $0040;
  ES_AUTOHSCROLL   = $0080;
  ES_NOHIDESEL     = $0100;
  ES_NUMBER        = $2000;
  ES_READONLY      = $0800;
  ES_WANTRETURN    = $1000;

  { Combobox style }
  CBS_SIMPLE            = $0001;
  CBS_DROPDOWN          = $0002;
  CBS_DROPDOWNLIST      = $0003;
  CBS_OWNERDRAWFIXED    = $0010;
  CBS_OWNERDRAWVARIABLE = $0020;
  CBS_AUTOHSCROLL       = $0040;
  CBS_SORT              = $0100;
  CBS_HASSTRINGS        = $0200;

  { Listbox style }
  LBS_NOTIFY            = $0001;
  LBS_SORT              = $0002;
  LBS_NOREDRAW          = $0004;
  LBS_MULTIPLESEL       = $0008;
  LBS_OWNERDRAWFIXED    = $0010;
  LBS_OWNERDRAWVARIABLE = $0020;
  LBS_HASSTRINGS        = $0040;
  LBS_USETABSTOPS       = $0080;
  LBS_NOINTEGRALHEIGHT  = $0100;
  LBS_MULTICOLUMN       = $0200;
  LBS_WANTKEYBOARDINPUT = $0400;
  LBS_EXTENDEDSEL       = $0800;
  LBS_DISABLENOSCROLL   = $1000;
  LBS_NODATA            = $2000;
  LBS_NOSEL             = $4000;
  LBS_STANDARD          = $A00003;

const
//==============================================
// SetWindowPos Flags
//==============================================
  HWND_TOP = 0;
  HWND_BOTTOM = 1;
  HWND_TOPMOST = HWND(-1);
  HWND_NOTOPMOST = HWND(-2);

//==============================================
// ShowWindow() Commands
//==============================================
{ in JwaWinUser
  SW_HIDE           = 0;
  SW_SHOWNORMAL     = 1;
  SW_NORMAL         = 1;
  SW_SHOWMINIMIZED  = 2;
  SW_SHOWMAXIMIZED  = 3;
  SW_MAXIMIZE       = 3;
  SW_SHOWNOACTIVATE = 4;
  SW_SHOW           = 5;
  SW_MINIMIZE       = 6;
  SW_SHOWMINNOACTIVE = 7;
  SW_SHOWNA         = 8;
  SW_RESTORE        = 9;
  SW_SHOWDEFAULT    = 10;
  SW_MAX            = 10;
  SW_SHOWFULLSCREEN = 11; // LCL Addition
}

type
  PNMHdr = ^TNMHdr;
  tagNMHDR = record
    hwndFrom: HWND;
    idFrom: PtrUInt;
    code: Integer;
  end;
  TNMHdr = tagNMHDR;
  NMHDR = tagNMHDR;

  PScreenInfo = ^TScreenInfo;
  TScreenInfo = record
    PixelsPerInchX: Integer;
    PixelsPerInchY: Integer;
    ColorDepth: Integer;
    Initialized: boolean;
  end;

  PWindowPos = ^TWIndowPos;
  tagWindowPos = record
    _hwnd : HWND;
    hwndInsertAfter: HWND;
    x : Integer;
    y : Integer;
    cx : Integer;
    cy : Integer;
    flags: UINT;
    end;
  TWindowPos = tagWindowPos;
  WindowPos = tagWindowPos;

  TIconInfo = Windows.TICONINFO;
  PIconInfo = Windows.PICONINFO;

//------------------------------------------------------------------------------
//timer
type
  TTimerProc = procedure(hWnd: HWND; uMsg: UINT; idEvent: UINT_PTR; dwTime: DWORD); stdcall;

  TLMTimer = record
    Msg: Cardinal;
    TimerID: PtrUInt;
    TimerProc: TFarProc;
    Result: LRESULT;
  end;

// key mapping

function HiWord(i: integer): word;
function LoWord(i: integer): word;
function Char2VK(C : Char) : Word;
function VK2Char(AVK: Word): Char;
function MathRound(AValue: ValReal): Int64;
function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer;

implementation


function HiWord(i: integer): word;
begin
  Result:=Hi(i);
end;

function LoWord(i: integer): word;
begin
  Result:=Lo(i);
end;

function Char2VK(C : Char) : Word;
begin
  Case C of
    '0'..'9' :Result := VK_0 + Ord(C) - Ord('0');
    'a'..'z' :Result := VK_A + Ord(C) - Ord('a');
    'A'..'Z' :Result := VK_A + Ord(C) - Ord('A');
  else
    Result:=0;
  end;
end;

function VK2Char(AVK: Word): Char;
begin
  case AVK of
    VK_0..VK_9: Result := chr(ord('0')+AVK-VK_0);
    VK_A..VK_Z: Result := chr(ord('a')+AVK-VK_A);
  else
    Result:='?';
  end;
end;

function MathRound(AValue: ValReal): Int64; inline;
begin
  if AValue >= 0 then
    Result := Trunc(AValue + 0.5)
  else
    Result := Trunc(AValue - 0.5);
end;

function MulDiv(nNumber, nNumerator, nDenominator: Integer): Integer;
begin
  if nDenominator = 0 then
    Result := -1
  else
  if nNumerator = nDenominator then
    Result := nNumber
  else
    Result := MathRound(int64(nNumber) * int64(nNumerator) / nDenominator);
end;


end.
