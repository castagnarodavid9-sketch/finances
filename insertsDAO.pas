unit insertsDAO;

interface

uses
  Vcl.Forms, FireDAC.Comp.Client, System.SysUtils;

function InsertTableMovimentacoes(_AConexao: TFDConnection; const ADescricao, AOperacao: string; AValor: Double): Boolean;

implementation

function InsertTableMovimentacoes(_AConexao: TFDConnection; const ADescricao, AOperacao: string; AValor: Double): Boolean;
var
  AQuery : TFDQuery;
begin
  Result := False;
  AQuery := TFDQuery.Create(nil);
  try
    AQuery.Connection := _AConexao;
    AQuery.Close;
    AQuery.SQL.Text :=
      'INSERT INTO movimentacoes ' +
      '(descricao, operacao, vlr_operacao, created_at, updated_at) ' +
      'VALUES (:descricao, :operacao, :vlr_operacao, :created_at, :updated_at)';
    AQuery.ParamByName('descricao').AsString := ADescricao;
    AQuery.ParamByName('operacao').AsString := AOperacao;
    AQuery.ParamByName('vlr_operacao').AsFloat := AValor;
    AQuery.ParamByName('created_at').AsDateTime := Now;
    AQuery.ParamByName('updated_at').AsDateTime := Now;
    AQuery.ExecSQL;
    Result := True;
  except
    Result := False;
  end;
end;

end.
