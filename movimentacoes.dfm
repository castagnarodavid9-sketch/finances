object frmMovimentacoes: TfrmMovimentacoes
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#245'es'
  ClientHeight = 205
  ClientWidth = 345
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  TextHeight = 15
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 71
    Height = 15
    Caption = 'Valor em R$ : '
  end
  object Label2: TLabel
    Left = 21
    Top = 39
    Width = 60
    Height = 15
    Caption = 'Descri'#231#227'o : '
  end
  object lblDepositos: TLabel
    Left = 8
    Top = 176
    Width = 58
    Height = 15
    Caption = 'Dep'#243'sitos :'
  end
  object lblSaques: TLabel
    Left = 120
    Top = 176
    Width = 43
    Height = 15
    Caption = 'Saques :'
  end
  object lblCaixa: TLabel
    Left = 227
    Top = 176
    Width = 53
    Height = 15
    Caption = 'Em caixa :'
  end
  object eValor: TEdit
    Left = 84
    Top = 8
    Width = 253
    Height = 23
    TabOrder = 0
  end
  object eOperacaoGroup: TPanel
    Left = 10
    Top = 66
    Width = 327
    Height = 65
    TabOrder = 2
    object eDeposito: TRadioButton
      Left = 68
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Dep'#243'sito'
      TabOrder = 0
    end
    object eSaque: TRadioButton
      Left = 156
      Top = 24
      Width = 73
      Height = 17
      Caption = 'Saque'
      TabOrder = 1
    end
  end
  object eDescricao: TEdit
    Left = 84
    Top = 37
    Width = 253
    Height = 23
    TabOrder = 1
  end
  object bExecutar: TButton
    Left = 102
    Top = 137
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 3
    OnClick = bExecutarClick
  end
  object bLimpar: TButton
    Left = 183
    Top = 138
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 4
    OnClick = bLimparClick
  end
  object FDMovimentacoes: TFDQuery
    Left = 42
    Top = 58
  end
  object DSMovimentacoes: TDataSource
    DataSet = FDMovimentacoes
    Left = 136
    Top = 56
  end
end
