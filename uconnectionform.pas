unit UConnectionForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, DB, FileUtil, Forms, Controls,
  Graphics, Dialogs;

type

  { TConnectionForm }

  TConnectionForm = class(TForm)
    DataSource1: TDataSource;
    IBConnection1: TIBConnection;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  end;

var
  ConnectionForm: TConnectionForm;

implementation

{$R *.lfm}

end.

