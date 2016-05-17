inherited frmCadCidades: TfrmCadCidades
  Left = 204
  Top = 176
  Caption = 'Cadastro de Cidades'
  ClientHeight = 269
  ClientWidth = 582
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 582
    Height = 240
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object Label2: TLabel [1]
        Left = 16
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNMCIDADE
        Transparent = True
      end
      object Label3: TLabel [2]
        Left = 16
        Top = 96
        Width = 14
        Height = 13
        Caption = 'UF'
        Transparent = True
      end
      object DBText1: TDBText [3]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'CID_CODIGO'
        DataSource = Dm.DsCidades
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      inherited Panel1: TPanel
        Top = 170
        Width = 574
      end
      object dbeNMCIDADE: TDBEdit
        Left = 16
        Top = 72
        Width = 524
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CID_NOME'
        DataSource = Dm.DsCidades
        TabOrder = 1
      end
      object cmbUFCLIE: TDBComboBox
        Left = 16
        Top = 111
        Width = 61
        Height = 22
        Style = csOwnerDrawFixed
        DataField = 'CID_UF'
        DataSource = Dm.DsCidades
        ItemHeight = 16
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PR'
          'PI'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
        TabOrder = 2
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 574
        inherited btnConsultar: TBitBtn
          Left = 412
          Top = 36
          Visible = False
          OnClick = btnConsultarClick
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Left = 540
        Height = 152
      end
      inherited grdConsultar: TDBGrid
        Width = 540
        Height = 152
        Columns = <
          item
            Expanded = False
            FieldName = 'CID_CODIGO'
            Title.Caption = 'CODIGO'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CID_NOME'
            Title.Caption = 'CIDADE'
            Width = 447
            Visible = True
          end>
      end
    end
  end
  inherited Panel4: TPanel
    Width = 582
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select CID_CODIGO, CID_NOME from CIDADES order by CID_NOME'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
    object datasetConsultarCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      Required = True
    end
    object datasetConsultarCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object datasetConsultarCID_UF: TStringField
      FieldName = 'CID_UF'
      FixedChar = True
      Size = 2
    end
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarCID_CODIGO: TIntegerField
      FieldName = 'CID_CODIGO'
      Required = True
      DisplayFormat = '00000'
    end
    object cdsConsultarCID_NOME: TStringField
      FieldName = 'CID_NOME'
      Size = 40
    end
    object cdsConsultarCID_UF: TStringField
      FieldName = 'CID_UF'
      FixedChar = True
      Size = 2
    end
  end
end
