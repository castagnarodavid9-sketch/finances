unit selectsDAO;

interface

uses
  Vcl.Forms, FireDAC.Comp.Client, System.SysUtils, System.Classes,
  conexao;

function SelectSUMDepositosAndSaques(_AConexao: TFDConnection; _AOperacao: Boolean): Double;
function SelectTotalDepositosAndSaques(_AConexao: TFDConnection): Double;

implementation

function SelectSUMDepositosAndSaques(_AConexao: TFDConnection; _AOperacao: Boolean): Double;
var
  AQuery: TFDQuery;
begin
  Result := 0;
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.Connection := _AConexao;
    AQuery.Close;
    AQuery.SQL.Text :=
      'SELECT COALESCE(SUM(m.vlr_operacao), 0) AS total_depositos ' +
      'FROM movimentacoes m ' +
      'WHERE m.operacao = :operacao';
    if _AOperacao then
      AQuery.ParamByName('operacao').AsString := 'Deposito'
    else
      AQuery.ParamByName('operacao').AsString := 'Saque';
    AQuery.Open;
    Result := AQuery.FieldByName('total_depositos').AsFloat;
  finally
    AQuery.Free;
  end;
end;

function SelectTotalDepositosAndSaques(_AConexao: TFDConnection): Double;
var
  AQuery: TFDQuery;
  ADepositos: Double;
  ASaques: Double;
begin
  Result := 0;
  ADepositos := 0;
  ASaques := 0;
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.Connection := _AConexao;
    AQuery.Close;
    AQuery.SQL.Text :=
      'SELECT COALESCE(SUM(m.vlr_operacao), 0) AS total_depositos ' +
      'FROM movimentacoes m ' +
      'WHERE m.operacao = :operacao';
    AQuery.ParamByName('operacao').AsString := 'Deposito';
    AQuery.Open;
    ADepositos := AQuery.FieldByName('total_depositos').AsFloat;
    AQuery.Close;
    AQuery.SQL.Text :=
      'SELECT COALESCE(SUM(m.vlr_operacao), 0) AS total_saques ' +
      'FROM movimentacoes m ' +
      'WHERE m.operacao = :operacao';
    AQuery.ParamByName('operacao').AsString := 'Saque';
    AQuery.Open;
    ASaques := AQuery.FieldByName('total_saques').AsFloat;
    Result := ADepositos - ASaques;
  finally
    AQuery.Free;
  end;
end;

end.
