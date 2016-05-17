inherited frmCadModalidades: TfrmCadModalidades
  Left = 171
  Top = 58
  Caption = 'Cadastro Forma de Pagamentos'
  ClientHeight = 458
  ClientWidth = 582
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 582
    Height = 429
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 9
        Width = 36
        Height = 13
        Caption = 'C'#243'digo:'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 52
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
        FocusControl = dbeNMMODA
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 130
        Width = 48
        Height = 13
        Caption = 'Comiss'#227'o:'
        FocusControl = DBEdit3
        Transparent = True
      end
      object Label4: TLabel [3]
        Left = 16
        Top = 169
        Width = 22
        Height = 13
        Caption = 'Fixa:'
        Transparent = True
      end
      object DBText1: TDBText [4]
        Left = 16
        Top = 25
        Width = 79
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'MOD_CODIGO'
        DataSource = Dm.dsModalidades
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel [5]
        Left = 168
        Top = 130
        Width = 44
        Height = 13
        Caption = 'Parcelas:'
        FocusControl = dbeQTPARC
      end
      object Label6: TLabel [6]
        Left = 16
        Top = 331
        Width = 85
        Height = 13
        Caption = 'Conta Caixa Geral'
      end
      object Label7: TLabel [7]
        Left = 16
        Top = 252
        Width = 80
        Height = 13
        Caption = 'Pasta Envia TEF'
        FocusControl = DBEdit1
      end
      object Label8: TLabel [8]
        Left = 16
        Top = 292
        Width = 91
        Height = 13
        Caption = 'Pasta Recede TEF'
        FocusControl = DBEdit2
      end
      inherited Panel1: TPanel
        Top = 359
        Width = 574
        TabOrder = 9
      end
      object dbeNMMODA: TDBEdit
        Left = 16
        Top = 68
        Width = 394
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MOD_NOME'
        DataSource = Dm.dsModalidades
        TabOrder = 0
        OnExit = dbeNMMODAExit
      end
      object DBEdit3: TDBEdit
        Left = 16
        Top = 146
        Width = 145
        Height = 21
        DataField = 'MOD_PECOMISSAO'
        DataSource = Dm.dsModalidades
        TabOrder = 2
      end
      object dbeQTPARC: TDBEdit
        Left = 168
        Top = 146
        Width = 145
        Height = 21
        DataField = 'MOD_NRPARCELA'
        DataSource = Dm.dsModalidades
        MaxLength = 2
        TabOrder = 3
        OnExit = dbeQTPARCExit
      end
      object cmbFixa2: TComboBox
        Left = 16
        Top = 185
        Width = 200
        Height = 22
        Style = csOwnerDrawFixed
        Enabled = False
        ItemHeight = 16
        TabOrder = 4
        Items.Strings = (
          'DINHEIRO'
          'CHEQUE'
          'CARTAO'
          'TICKER'
          'DUPLICATA')
      end
      object rbTipoModalidade: TDBRadioGroup
        Left = 16
        Top = 91
        Width = 305
        Height = 38
        Caption = '[ Tipo de Modalidade ]'
        Columns = 2
        DataField = 'MOD_AVISTA'
        DataSource = Dm.dsModalidades
        Items.Strings = (
          '&Avista'
          'A &prazo')
        TabOrder = 1
        Values.Strings = (
          'A'
          'P')
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 16
        Top = 345
        Width = 200
        Height = 21
        DataField = 'MOD_NM_CONTA'
        DataSource = Dm.dsModalidades
        TabOrder = 8
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 211
        Width = 199
        Height = 37
        Caption = '[ Exige TEF ]'
        Columns = 2
        DataField = 'MOD_FLXTEF'
        DataSource = Dm.dsModalidades
        Items.Strings = (
          '&Sim'
          '&N'#227'o')
        TabOrder = 5
        Values.Strings = (
          'S'
          'N')
      end
      object DBEdit1: TDBEdit
        Left = 16
        Top = 268
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MOD_PASTA_ENVIA_TEF'
        DataSource = Dm.dsModalidades
        TabOrder = 6
      end
      object DBEdit2: TDBEdit
        Left = 16
        Top = 308
        Width = 400
        Height = 21
        CharCase = ecUpperCase
        DataField = 'MOD_PASTA_RECEBE_TEF'
        DataSource = Dm.dsModalidades
        TabOrder = 7
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 574
        inherited btnConsultar: TBitBtn
          Left = 404
          Top = 28
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 18
        end
      end
      inherited Panel3: TPanel
        Left = 540
        Height = 341
      end
      inherited grdConsultar: TDBGrid
        Width = 540
        Height = 341
        Columns = <
          item
            Expanded = False
            FieldName = 'MOD_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOD_NOME'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 455
            Visible = True
          end>
      end
    end
  end
  inherited Panel4: TPanel
    Width = 582
  end
  inherited dsConsultar: TDataSource
    Left = 300
    Top = 218
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select MOD_CODIGO, MOD_NOME from MODALIDADE'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    Left = 380
    Top = 218
  end
  inherited dspConsultar: TDataSetProvider
    Left = 460
    Top = 218
  end
  inherited cdsConsultar: TClientDataSet
    Left = 532
    Top = 218
    object cdsConsultarMOD_CODIGO: TIntegerField
      FieldName = 'MOD_CODIGO'
      Required = True
      DisplayFormat = '00'
    end
    object cdsConsultarMOD_NOME: TStringField
      FieldName = 'MOD_NOME'
      Size = 30
    end
  end
end
