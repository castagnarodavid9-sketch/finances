unit conexao;

interface

uses
  System.SysUtils,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef;

var
  financesDB: TFDConnection;

function ConectarBanco: Boolean;

implementation

function ConectarBanco: Boolean;
begin
  Result := False;

  try
    if financesDB = nil then
      financesDB := TFDConnection.Create(nil);
    financesDB.Connected := False;
    financesDB.Params.Clear;
    financesDB.Params.Add('DriverID=PG');
    financesDB.Params.Add('Server=localhost');
    financesDB.Params.Add('Database=finances');
    financesDB.Params.Add('User_Name=postgres');
    financesDB.Params.Add('Password=03032011');
    financesDB.Params.Add('Port=5432');
    financesDB.Connected := True;
    Result := True;
  except
    on E: Exception do
      raise Exception.Create('Erro conexão: ' + E.Message);
  end;
end;

initialization
  financesDB := nil;

finalization
  if Assigned(financesDB) then
    financesDB.Free;

end.
