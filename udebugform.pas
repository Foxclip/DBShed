unit UDebugForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TDebugForm }

  TDebugForm = class(TForm)
    Memo1: TMemo;
  private
  public
  end;

var
  DebugForm: TDebugForm;

procedure addToDebugLog(str: string);

implementation

{$R *.lfm}

procedure addToDebugLog(str: string);
begin
  DebugForm.Memo1.Append(str);
  DebugForm.Visible := True;
  DebugForm.BringToFront;
end;

end.

