object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Finances'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = eMenu
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object lblDepositos: TLabel
    Left = 8
    Top = 408
    Width = 92
    Height = 25
    Caption = 'Dep'#243'sitos :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblSaques: TLabel
    Left = 232
    Top = 408
    Width = 69
    Height = 25
    Caption = 'Saques :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object lblCaixa: TLabel
    Left = 440
    Top = 408
    Width = 49
    Height = 25
    Caption = 'Total :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object eMenu: TMainMenu
    Left = 16
    Top = 16
    object Movimentaes1: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object EntradaSada1: TMenuItem
        Caption = 'Entrada / Sa'#237'da - F2'
        OnClick = EntradaSada1Click
      end
    end
  end
  object DSMovimentacoes: TDataSource
    DataSet = FDMovimentacoes
    Left = 208
    Top = 16
  end
  object FDMovimentacoes: TFDQuery
    Left = 98
    Top = 18
  end
end
