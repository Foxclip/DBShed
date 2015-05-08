unit UConnectionForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, DB, FileUtil, Forms, Controls,
  Graphics, Dialogs;

type

  { TConnectionForm }

  TConnectionForm = class(TForm)
    IBConnection1: TIBConnection;
    SQLTransaction1: TSQLTransaction;
  end;

var
  ConnectionForm: TConnectionForm;

implementation

{$R *.lfm}

end.

