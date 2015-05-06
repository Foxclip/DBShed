unit UMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  Menus, UConnectionForm, ureferenceform, UDebugForm;

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
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

procedure TMainForm.ReferenceMenuItemClick(Sender: TObject);
var
  i: integer;
  tableName: string;
  formisAlreadyOpened: boolean = False;
begin

  case (Sender as TMenuItem).Tag of
    0: tableName := 'classrooms';
    1: tableName := 'courses';
    2: tableName := 'groups';
    3: tableName := 'groups_courses';
    4: tableName := 'lessons';
    5: tableName := 'pairs';
    6: tableName := 'teachers';
    7: tableName := 'teachers_courses';
    8: tableName := 'weekdays';
  end;

  for i := 0 to High(ReferenceFormArray) do
  begin
    if ReferenceFormArray[i].tableName = tableName then
    begin
      formisAlreadyOpened := True;
      ReferenceFormArray[i].Show;
      ReferenceFormArray[i].BringToFront;
      break;
    end;
  end;

  if not formisAlreadyOpened then
    createReferenceForm(tableName);

end;

procedure TMainForm.ShowAllClick(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to High(ReferenceFormArray) do
    ReferenceFormArray[i].BringToFront;
end;

end.
