unit ureferenceform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  DBGrids, UConnectionForm, UDebugForm;

type

  FormType = (classrooms, courses, groups, groupscourses, lessons, pairs,
    teachers, teacherscourses, weekdays);

  TReferenceForm = class(TForm)
    DBGrid1: TDBGrid;
  private
  public
    tableName: string;
  end;

var
  ReferenceFormArray: array of TReferenceForm;

procedure createReferenceForm(tableName: string);

implementation

{$R *.lfm}

procedure createReferenceForm(tableName: string);
var
  newForm: TReferenceForm;
begin
  SetLength(ReferenceFormArray, Length(ReferenceFormArray) + 1);
  newForm := TReferenceForm.Create(nil);
  newForm.tableName := tableName;
  with ConnectionForm do
  begin
    SQLQuery1.Close;
    SQLQuery1.SQL.Text := 'select * from ' + tableName + ';';
    SQLQuery1.Open;
  end;
  ReferenceFormArray[High(ReferenceFormArray)] := newForm;
  newForm.Show;
  newForm.BringToFront;
end;

end.
