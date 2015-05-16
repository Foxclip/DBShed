unit UMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  Menus, UReferenceForm, UDebugForm;

type

  { TMainForm }

  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    ShowAll: TMenuItem;
    WindowMenu: TMenuItem;
    ReferenceItem: TMenuItem;
    procedure CreateMenuItems;
    procedure FormCreate(Sender: TObject);
    procedure ReferenceMenuItemClick(Sender: TObject);
    procedure ShowAllClick(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

procedure TMainForm.ReferenceMenuItemClick(Sender: TObject);
var
  RefForm: TReferenceForm;
begin
  RefForm := ReferenceFormArray[(Sender as TMenuItem).Tag];
  with RefForm do
  begin
    Show;
    BringToFront;
    SQLQuery1.Open;
  end;
end;

procedure TMainForm.CreateMenuItems;
var
  i: integer;
  newMenuItem: TMenuItem;
begin
  for i := 0 to High(ReferenceFormArray) do
  begin
    newMenuItem := TMenuItem.Create(nil);
    newMenuItem.OnClick := @ReferenceMenuItemClick;
    with newMenuItem do
    begin
      Caption := ReferenceFormArray[i].Caption;
      Tag := i;
    end;
    ReferenceItem.Add(newMenuItem);
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  CreateMenuItems;
end;

procedure TMainForm.ShowAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to High(ReferenceFormArray) do
    ReferenceFormArray[i].BringToFront;
end;

end.
