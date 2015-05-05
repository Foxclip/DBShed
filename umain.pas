unit UMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  Menus, UConnectionForm, ureferenceform;

type

  { TMainForm }

  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    Classrooms: TMenuItem;
    Courses: TMenuItem;
    Groups: TMenuItem;
    GroupsCourses: TMenuItem;
    Lessons: TMenuItem;
    Pairs: TMenuItem;
    Teachers: TMenuItem;
    TeachersCourses: TMenuItem;
    Weekdays: TMenuItem;
    ReferenceItem: TMenuItem;
    procedure ReferenceItemClick(Sender: TObject);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}



{ TMainForm }

procedure TMainForm.ReferenceItemClick(Sender: TObject);
var
  i: integer;
  tableName: string;
  formisAlreadyOpened: boolean;
begin

  case (Sender as TMenuItem).Tag of
    0: tableName := 'classrooms';
    1: tableName := 'courses';
    2: tableName := 'groups';
    3: tableName := 'groupscourses';
    4: tableName := 'lessons';
    5: tableName := 'pairs';
    6: tableName := 'teachers';
    7: tableName := 'teacherscourses';
    8: tableName := 'weekdays';
  end;

  for i := 0 to High(ReferenceFormArray) do
  begin
    if ReferenceFormArray[i].tableName = tableName then
    begin
      formisAlreadyOpened := True;
      ReferenceFormArray[i].Show;
      break;
    end;
  end;

  if not formisAlreadyOpened then
    createReferenceForm(tableName);

end;

end.
