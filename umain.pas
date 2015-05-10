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
    Classrooms: TMenuItem;
    Courses: TMenuItem;
    Groups: TMenuItem;
    GroupsCourses: TMenuItem;
    Lessons: TMenuItem;
    ShowAll: TMenuItem;
    WindowMenu: TMenuItem;
    Pairs: TMenuItem;
    Teachers: TMenuItem;
    TeachersCourses: TMenuItem;
    Weekdays: TMenuItem;
    ReferenceItem: TMenuItem;
    procedure ReferenceMenuItemClick(Sender: TObject);
    procedure ShowAllClick(Sender: TObject);
    function FindFormByTag(itemTag: integer): integer;
  end;

const
  newFormFirstOffset = 100;
  newFormOffset = 50;
  tableNamesArray: array [0..8] of string =
    ('classrooms', 'courses', 'groups', 'groups_courses', 'lessons',
    'pairs', 'teachers', 'teachers_courses', 'weekdays');

var
  MainForm: TMainForm;
  ReferenceFormArray: array of TReferenceForm;

implementation

{$R *.lfm}

procedure TMainForm.ReferenceMenuItemClick(Sender: TObject);
var
  newForm: TReferenceForm;
  formIndex: integer;
begin
  formIndex := FindFormByTag((Sender as TMenuItem).Tag);
  if formIndex = -1 then
  begin
    SetLength(ReferenceFormArray, Length(ReferenceFormArray) + 1);
    newForm := TReferenceForm.Create(tableNamesArray[(Sender as TMenuItem).Tag]);
    ReferenceFormArray[High(ReferenceFormArray)] := newForm;
    newForm.SetBounds(
      Left + newFormFirstOffset + newFormOffset * (Length(ReferenceFormArray) - 1),
      Top + newFormFirstOffset + newFormOffset * (Length(ReferenceFormArray) - 1),
      newForm.Width, newForm.Height);
    with newForm do
    begin
      Caption := (Sender as TMenuItem).Caption;
      Show;
      BringToFront;
    end;
  end
  else
  begin
    ReferenceFormArray[formIndex].Show;
    ReferenceFormArray[formIndex].BringToFront;
  end;
end;

procedure TMainForm.ShowAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to High(ReferenceFormArray) do
    ReferenceFormArray[i].BringToFront;
end;

function TMainForm.FindFormByTag(itemTag: integer): integer;
var
  i: integer;
begin
  Result := -1;
  for i := 0 to High(ReferenceFormArray) do
    if ReferenceFormArray[i].tableName = tableNamesArray[itemTag] then
    begin
      Result := i;
      break;
    end;
end;

end.
