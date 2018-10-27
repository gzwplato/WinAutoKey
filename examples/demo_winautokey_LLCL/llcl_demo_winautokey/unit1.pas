unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Dialogs, StdCtrls, LLCLType,
  ShellApi, JWAWinUser,
  WinAutoKey,
  DebugUnit;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnOK: TButton;
    Memo1: TMemo;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnOKClick(Sender: TObject);
var
  hNotepad, hMsg, hTest: HWND;
begin

  ShellExecute(Handle, 'open', 'notepad.exe', nil, nil, SW_SHOWNORMAL);

  hTest:=hWin('Untitled');

  //ok h:=WinWait('Untitled - Notepad','','',2);
  hNotepad:=WinWait('ACTIVE','','',2);

  Send(['The rain in Spain']);  //String
  Send([VK_RETURN]); //array
  Send(VK_RETURN);  //word

  WinMinimize(hNotepad);

  ShowMessage('Press ENTER to close Notepad');

  WinRestore(hNotepad);
  Send([VK_ALT_DN, VK_F4, VK_ALT_UP, VK_N]); //Close Window, no save

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  DebugForm.Show;
  Debugln('Ready');
  SetActiveWindow(Self.Handle);
end;

end.

