unit UReferenceForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  DBGrids, UDebugForm, sqldb, DB;

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

implementation

{$R *.lfm}

constructor TReferenceForm.Create(ATableName: string);
begin
  inherited Create(nil);
  tableName := ATableName;
  SQLQuery1.Close;
  SQLQuery1.SQL.Text := 'select * from ' + tableName + ';';
  SQLQuery1.Open;
end;

end.
