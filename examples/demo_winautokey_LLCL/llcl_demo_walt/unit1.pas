unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, StdCtrls,
  Windows, WinAutoKey, DebugUnit;
type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonOK: TButton;
    Memo1: TMemo;
    procedure ButtonOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;
const

  SEARCH_TEXT='edit environment variables for your account';
  OPTIONS_TITLE='Skype for Business - Options';
  SKYPE_EXE='"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\'+
    'Microsoft Office 2013\Skype for Business 2015.lnk"';

var
  Form1: TForm1;

implementation

{$R *.lfm}

procedure Memoln(MemoCtrl: TMemo; Fmt: String; Args: array of Const);
begin
  MemoCtrl.Lines.Add(Format(Fmt, Args));
end;

{ TForm1 }

procedure TForm1.ButtonOKClick(Sender: TObject);
var
  hw, hc: HWND;
begin

  //%appdata%
  //%localappdata%
  //%temp%

  //shell:startup
  //shell:common startup

  //SetTitleMatchMode(mtExact);
  //SetTextMatchMode(mtExact);

  //ok hw:=hWin('Program Manager');
  hw:=hWin('','','Shell_TrayWnd');
  Memoln(Memo1, 'hw=%x',[hw]);

  hc:=hCtl(hw,'Type here to search','TrayButton', 4103);
  Memoln(Memo1, 'hc=%x',[hc]);

  { NO for LLCL }
  ControlClick(hc,[]);
  WinSleep(WAK.WinDelay);

  Send(SEARCH_TEXT);
  Send(VK_RETURN);

  WinSleep(1000);
  Send(VK_ESCAPE);
Exit;

  ControlClick(hc,[]);
  WinSleep(WAK.WinDelay);

  Send('%appdata%');
  Send(VK_RETURN);

  Send([VK_ALT_DN,VK_T,VK_ALT_UP]);   // Tools


end;

procedure TForm1.FormShow(Sender: TObject);
begin
  DebugForm.Show;
  //Debugln('Ready');
  ButtonOK.SetFocus;
end;
end.

