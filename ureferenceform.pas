unit ureferenceform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  DBGrids, UConnectionForm, UDebugForm, sqldb, DB;

type

  FormType = (classrooms, courses, groups, groupscourses, lessons, pairs,
    teachers, teacherscourses, weekdays);

  { TReferenceForm }

  TReferenceForm = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    SQLQuery1: TSQLQuery;
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
  newForm.SQLQuery1.Close;
  newForm.SQLQuery1.SQL.Text := 'select * from ' + tableName + ';';
  newForm.SQLQuery1.Open;
  ReferenceFormArray[High(ReferenceFormArray)] := newForm;
  newForm.Show;
  newForm.BringToFront;
end;

end.
