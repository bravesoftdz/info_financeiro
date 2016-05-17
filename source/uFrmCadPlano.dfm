inherited frmCadPlano: TfrmCadPlano
  Left = 229
  Top = 172
  Caption = 'Tabela de Plano de Pagamento'
  ClientHeight = 279
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 250
    ActivePage = TabSheet1
    inherited TabSheet1: TTabSheet
      object Label2: TLabel [0]
        Left = 16
        Top = 64
        Width = 51
        Height = 13
        Caption = 'Descri'#231#227'o:'
        FocusControl = dbeDescricao
      end
      object Label1: TLabel [1]
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [2]
        Left = 16
        Top = 32
        Width = 80
        Height = 22
        AutoSize = True
        Color = clBtnFace
        DataField = 'PLA_CODIGO'
        DataSource = dsPlanos
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      inherited Panel1: TPanel
        Top = 180
      end
      object dbeDescricao: TDBEdit
        Left = 16
        Top = 80
        Width = 450
        Height = 21
        CharCase = ecUpperCase
        DataField = 'PLA_DESCRICAO'
        DataSource = dsPlanos
        TabOrder = 1
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        inherited btnConsultar: TBitBtn
          Left = 412
          Top = 36
          Visible = False
        end
        inherited btnAlterar: TBitBtn
          Top = 16
        end
      end
      inherited Panel3: TPanel
        Height = 162
      end
      inherited grdConsultar: TDBGrid
        Height = 162
        Columns = <
          item
            Expanded = False
            FieldName = 'PLA_CODIGO'
            Title.Caption = 'C'#243'digo'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PLA_DESCRICAO'
            Title.Caption = 'Descri'#231#227'o'
            Width = 443
            Visible = True
          end>
      end
    end
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select * from PLANO_PAGAMENTO'
    MaxBlobSize = -1
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsConsultar: TClientDataSet
    object cdsConsultarPLA_CODIGO: TIntegerField
      FieldName = 'PLA_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarPLA_DESCRICAO: TStringField
      FieldName = 'PLA_DESCRICAO'
      Size = 50
    end
  end
  object dsPlanos: TDataSource
    AutoEdit = False
    DataSet = dmDados.cdsPlanos
    Left = 288
    Top = 176
  end
end
