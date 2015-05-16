unit UReferenceForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  DBGrids, UDebugForm, sqldb, DB, Menus;

type
  TReferenceForm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SQLQuery1: TSQLQuery;
  private
  public
    tableName: string;
    constructor Create(ATableName: string);
  end;

const
  newFormFirstOffset = 100;
  newFormOffset = 50;

var
  ReferenceFormArray: array of TReferenceForm;
  ReferenceMenuItem: TMenuItem;
  RefClickEvent: TNotifyEvent;

procedure RegisterReferenceForm(ATableName: string; ACaption: string);

implementation

{$R *.lfm}

constructor TReferenceForm.Create(ATableName: string);
begin
  inherited Create(nil);
  tableName := ATableName;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from ' + tableName + ';';
end;

procedure RegisterReferenceForm(ATableName: string; ACaption: string);
var
  newForm: TReferenceForm;
  formPos: integer;
begin
  SetLength(ReferenceFormArray, Length(ReferenceFormArray) + 1);
  newForm := TReferenceForm.Create(ATableName);
  ReferenceFormArray[High(ReferenceFormArray)] := newForm;
  formPos := newFormFirstOffset + newFormOffset * (Length(ReferenceFormArray) - 1);
  with newForm do
  begin
    SetBounds(formPos, formPos, Width, Height);
    Caption := ACaption;
  end;
end;

initialization
  RegisterReferenceForm('classrooms', 'Аудитории');
  RegisterReferenceForm('courses', 'Предметы');
  RegisterReferenceForm('groups', 'Группы');
  RegisterReferenceForm('groups_courses', 'Группы и предметы');
  RegisterReferenceForm('lessons', 'Расписание');
  RegisterReferenceForm('pairs', 'Пары');
  RegisterReferenceForm('teachers', 'Преподаватели');
  RegisterReferenceForm('teachers_courses', 'Преподаватели и предметы');
  RegisterReferenceForm('weekdays', 'Дни недели');
end.
