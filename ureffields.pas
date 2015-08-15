unit URefFields;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

  TRefField = record
    firstTableName: string;
    firstFieldName: string;
    secondTableName: string;
    secondFieldName: string;
  end;

var
  RefFields: array of TRefField;

implementation

procedure RegisterRefField(tableAName: string; fieldAName: string;
          tableBName: string; fieldBName: string);
var
  newRefField: TRefField;
begin
  newRefField.firstTableName := tableAName;
  newRefField.firstFieldName := fieldAName;
  newRefField.secondTableName := tableBName;
  newRefField.secondFieldName := fieldBName;
  SetLength(RefFields, Length(RefFields) + 1);
  RefFields[High(RefFields)] := newRefField;
end;

initialization

  RegisterRefField('groups_courses', 'group_id', 'groups', 'name');
  RegisterRefField('groups_courses', 'course_id', 'courses', 'name');
  RegisterRefField('lessons', 'weekday_id', 'weekdays', 'weekday');
  RegisterRefField('lessons', 'group_id', 'groups', 'name');
  RegisterRefField('lessons', 'course_id', 'courses', 'name');
  RegisterRefField('lessons', 'class_id', 'classrooms', 'classroom');
  RegisterRefField('lessons', 'teacher_id', 'teachers', 'name');
  RegisterRefField('teachers_courses', 'teacher_id', 'teachers', 'name');
  RegisterRefField('teachers_courses', 'courses_id', 'courses', 'name');

end.



