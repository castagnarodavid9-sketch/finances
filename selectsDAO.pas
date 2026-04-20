unit selectsDAO;

interface

uses
  Vcl.Forms, FireDAC.Comp.Client, System.SysUtils, System.Classes;

function SelectSUMDepositos(_AQuery: TFDQuery): Double;
function SelectSUMDepositosPrincipal(_AConnection: TFDConnection): Double;

implementation

function SelectSUMDepositos(_AQuery: TFDQuery): Double;
begin
  Result := 0;
  _AQuery.Close;
  _AQuery.SQL.Text := 'SELECT SUM(m.vlr_operacao) as total_depositos FROM movimentacoes m WHERE m.operacao = :operacao';
  _AQuery.ParamByName('operacao').AsString := 'Deposito';
  _AQuery.Open;
  Result := _AQuery.FieldByName('total_depositos').AsFloat;
end;

function SelectSUMDepositosPrincipal(_AConnection: TFDConnection): Double;
var
  AQuery : TFDQuery;
begin
  Result := 0;
  AQuery := TFDQuery.Create(nil);
  Try
    AQuery.Connection := _AConnection;
  Finally
    AQuery.SQL.Text := 'SELECT SUM(m.vlr_operacao) as total_depositos FROM movimentacoes m WHERE m.operacao = :operacao';
    AQuery.ParamByName('operacao').AsString := 'Deposito';
    AQuery.Open;
    Result := AQuery.FieldByName('total_depositos').AsFloat;
  End;
end;

end.
