unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Windows, DebugUnit;

type

  TWindow = class(TObject)
    Handle: HWND;
    cName: string;
    //Title: string;
    Visible: boolean;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    ButtonOK: TButton;
    Memo1: TMemo;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;
const
  DS=DirectorySeparator;
  LE=LineEnding;
var
  Form1: TForm1;
  h: THandle;
  WindowList: TStringList;
implementation

{$R *.lfm}

{ methods }
procedure GetWinTitle(title: string);
begin
  h:=FindWindow(nil,PChar(title));
   Form1.Memo1.Lines.Add('FindWindow by title  :'+IntToStr(h));
end;
function getWindows(Handle: HWND; Info: Pointer): BOOL; stdcall;
  begin
    Result:= True;
    //WindowList.Add(Pointer(Handle));
  end;
function EnumWindowsProc5(Wnd: HWnd; lParam: LPARAM): bool; stdcall;
{not unicode}
var
  Buffer: array[0..99] of char;
begin
  GetWindowText(Wnd, Buffer, 100);
  if StrLen(Buffer) <> 0 then
    Form1.Memo1.Append(StrPas(Buffer));
  Result := True;
end;
function EnumWindowsProc4(WHandle: HWND; LParM: LParam): LongBool;StdCall;Export;
var
  Title,ClassName:array[0..128] of char;
  sTitle,sClass,sLine:STRING ;
  aHWND: array[0..80] of HWND;
  i: integer;
  Win: TWindow;
begin
  Result:=True;
  i:=0;

  GetWindowText(wHandle, Title,128);
  GetClassName(wHandle, ClassName,128);
  aHWND[i]:=wHandle;
  Inc(i);

  sTitle:=Title;
  sClass:=ClassName;

  Win:=TWindow.Create;

  Win.Handle:=wHandle;
  Win.cName:=sClass;
    //Title: string;
  Win.Visible:=IsWindowVisible(wHandle);

 if IsWindowVisible(wHandle) then
 begin
  //ok sLine:=sClass+', '+sTitle+', '+IntToHex(wHandle,4);
  //sLine:='Class1='+sClass+', Title1='+sTitle+', '+IntToHex(wHandle,4);
  //Form1.Memo1.Append(sLine);
  WindowList.AddObject(sTitle, Win);
 end;
 //Form1.Memo1.Append('dbg'+Length(aHWND).ToString);

 Win.Free;
end;
function EnumWindowsProc3(Handle: HWnd; lParam: LPARAM): Bool; stdcall;
var
  S: WideString;
  Len: LongInt;
  U: String;

  T,C: PWideChar;
  sTitle,sClass,sLine:STRING ;
begin
  //Win: TWindow;

//WindoList.AddObject (sClass, Pst);

  SetLength(S, 255);
  //SetLength(C, 128);

  //ok Len := GetWindowTextW(Handle, @S[1], Length(S));
  Len := GetWindowTextW(Handle, LPWSTR(S), Length(S));
  if Len > 0 then
    //sTitle:=UTF8Encode(S);
    //sTitle:=PWChar(S);
    sTitle:=StrPas(PWChar(S));

  //if IsWindowVisible(Handle) then
    //Form1.Memo1.Append('TITLE3=['+sTitle+']');
    //Form1.Memo1.Append('TITLE3=['+PWChar(S)+']');
    //ShowMessage('TITLE3='+U+'[end]');

  Len := GetClassNameW(Handle, LPWSTR(S), Length(S));
  if Len > 0 then
    sClass:=StrPas(PWChar(S));
    //sClass:=PWChar(S);

  //if IsWindowVisible(Handle) then
    //Form1.Memo1.Append('CLASS='+sClass);

   if IsWindowVisible(Handle) then begin
   sLine:='Class3='+Trim(sClass)+', Title3='+Trim(sTitle)+', '+IntToHex(Handle,4);
    Form1.Memo1.Append(sLine);
  end;

  {
  if (Len > 0) and IsWindowVisible(Handle) then begin
   sLine:=UTF8Encode(S);
   //ok Form1.Memo1.Append(UTF8Encode(S));
   Form1.Memo1.Append(sLine);
  end;
  }
  Result := True;
end;
function EnumWindowsProc2(WHandle: HWND; LParM: LParam): LongBool;StdCall;Export;
var Title,ClassName:array[0..128] of char;
    sTitle,sClass,sLine:STRING ;
    aHWND: array[0..80] of HWND;
    i: integer;
    CN: PChar;
begin
 Result:=True;
 i:=0;

 GetWindowText(wHandle, Title,128);

 GetClassName(wHandle, CN,128);
 aHWND[i]:=wHandle;
 Inc(i);

 //sTitle:=Title;
 sTitle:=StrPas(CN);
 sClass:=ClassName;

 if IsWindowVisible(wHandle) then
 begin
  sLine:=sClass+', '+sTitle+', '+IntToHex(wHandle,4);
  Form1.Memo1.Append(sLine);
 end;
 //Form1.Memo1.Append('dbg'+Length(aHWND).ToString);

end;
function EnumWindowsProc(WHandle: HWND; LParM: LParam): LongBool;StdCall;Export;
var Title,ClassName:array[0..128] of char;
    sTitle,sClass,sLine:STRING ;
    aHWND: array[0..80] of HWND;
    i: integer;
  p: PChar;
begin
 Result:=True;
 i:=0;


 GetWindowText(wHandle, Title,128);
 GetClassName(wHandle, ClassName,128);
 aHWND[i]:=wHandle;
 Inc(i);

 sTitle:=Title;
 sClass:=ClassName;

 if IsWindowVisible(wHandle) then
 begin
  //ok sLine:=sClass+', '+sTitle+', '+IntToHex(wHandle,4);
  sLine:='Class1='+sClass+', Title1='+sTitle+', '+IntToHex(wHandle,4);
  Form1.Memo1.Append(sLine);
 end;
 //Form1.Memo1.Append('dbg'+Length(aHWND).ToString);

end;
{
function GetHandle (windowtitle: string): HWND;
var
  h, TopWindow: HWND;
  Dest: array[0..80] of char;
  i: integer;
  s: string;
  Param: LParam;
  li: LongInt;
  Handle: HWND;
  Info: Pointer;
begin
  result:= 0;

  try
    WindowList:= TList.Create;
    EnumWindows(@getWindows, LOngInt(0)));
    i:= 0;
    while (i < WindowList.Count) and (result = 0) do
      begin
        GetWindowText(HWND(WindowList[i]), Dest, sizeof(Dest) - 1);
        s:= dest;
        if length(s) > 0 then
          begin
            if (Pos(UpperCase(Windowtitle), UpperCase(s)) >= 1) then
              begin
                h:= HWND(WindowList[i]);
                if IsWindow(h) then
                  result:= h
             end
           end;
        inc(i)
      end
    finally
      WindowList.Free;
    end;
end;
}
{ TForm1 }


procedure TForm1.ButtonOKClick(Sender: TObject);
var
  i: integer;
  sLine: string;
  Win: TWindow;
begin
  Memo1.Clear;

  Memo1.Append('1-----');
  EnumWindows(@EnumWindowsProc,0);

  Memo1.Append('3----');
  EnumWindows(@EnumWindowsProc3,0);

  Memo1.Append('2-----');

  for i:=0 to WindowList.Count-1 do begin
    //  Pst := TPst(SL.Objects[CurrPos]);
    //Win:=WindowList.Objects[i];
    //sLine:='Class1='+Win.cName;
    //', Title1='+sTitle+', '+IntToHex(wHandle,4);

    //Win.Handle:=wHandle;
    //Win.ClassName:=sClass;
      //Title: string;
    //Win.Visible:=IsWindowVisible(wHandle);
    Memo1.Append(WindowList[i]);
  end;

  //GetWinTitle('Notepad++');

  h:=FindWindow(nil,'Untitled - Notepad'); //exact match
  Form1.Memo1.Lines.Add('FindWindow by title  :'+IntToHex(h,4));

  //getWindows


  {
  h:= getHandle('Notepad++');
  if (h = 0)
    ShowMessage('Found handle')
  else
    ShowMessage('Did NOT Find handle');
    }

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  WindowList:=TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  WindowList.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
DebugForm.Show;
Debugln('Ready');
end;
end.

