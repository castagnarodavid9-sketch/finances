unit Conexao;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  FireDAC.Phys.PG;

type
  TConexao = class
  private
    class var FConexao: TFDConnection;
    class var FDriverLink: TFDPhysPgDriverLink;
  public
    class function GetConexao: TFDConnection;
    class procedure Conectar;
    class procedure Desconectar;
    class procedure Liberar;
  end;

implementation

uses
  Winapi.Windows,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Phys,
  FireDAC.Phys.PGDef,
  FireDAC.DApt,
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait;

{ TConexao }

class function TConexao.GetConexao: TFDConnection;
begin
  if not Assigned(FConexao) then
    Conectar;

  if not FConexao.Connected then
    Conectar;

  Result := FConexao;
end;

class procedure TConexao.Conectar;
var
  ACaminhoExe: string;
  ACaminhoLibPQ: string;
begin
  ACaminhoExe := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  ACaminhoLibPQ := ACaminhoExe + 'libpq.dll';
  if not FileExists(ACaminhoLibPQ) then
    raise Exception.Create('libpq.dll não encontrada em: ' + ACaminhoLibPQ);
  // Ajuda o Windows a encontrar as DLLs dependentes da libpq.dll
  SetDllDirectory(PChar(ACaminhoExe));
  if not Assigned(FDriverLink) then begin
    FDriverLink := TFDPhysPgDriverLink.Create(nil);
    FDriverLink.VendorLib := ACaminhoLibPQ;
  end;
  if not Assigned(FConexao) then begin
    FConexao := TFDConnection.Create(nil);
    FConexao.LoginPrompt := False;
    FConexao.Params.Clear;
    FConexao.Params.Values['DriverID'] := 'PG';
    FConexao.Params.Values['Server'] := 'localhost';
    FConexao.Params.Values['Port'] := '5432';
    FConexao.Params.Values['Database'] := 'finances';
    FConexao.Params.Values['User_Name'] := 'postgres';
    FConexao.Params.Values['Password'] := '03032011';
    FConexao.Params.Values['CharacterSet'] := 'UTF8';
  end;
  if not FConexao.Connected then begin
    try
      FConexao.Connected := True;
    except
      on E: Exception do
        raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
    end;
  end;
end;

class procedure TConexao.Desconectar;
begin
  if Assigned(FConexao) then
  begin
    if FConexao.Connected then
      FConexao.Connected := False;
  end;
end;

class procedure TConexao.Liberar;
begin
  if Assigned(FConexao) then
  begin
    if FConexao.Connected then
      FConexao.Connected := False;
    FConexao.Free;
    FConexao := nil;
  end;
  if Assigned(FDriverLink) then
  begin
    FDriverLink.Free;
    FDriverLink := nil;
  end;
end;

initialization

finalization
  TConexao.Liberar;

end.
