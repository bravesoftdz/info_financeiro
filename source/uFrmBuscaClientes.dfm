inherited frmBuscaClientes: TfrmBuscaClientes
  Left = 251
  Top = 198
  Caption = 'Localizar Loja\Comodat'#225'rio\Locat'#225'rio'
  ClientWidth = 428
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 428
    inherited edtConsultar: TEdit
      Width = 385
    end
    inherited btnConsultar: TBitBtn
      Left = 325
      Top = -7
      Visible = False
    end
  end
  inherited grdConsultar: TDBGrid
    Width = 428
    OnKeyPress = grdConsultarKeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CLI_FANTASIA'
        Title.Caption = 'DESCRI'#199#195'O'
        Width = 298
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLI_NRBOX'
        Title.Caption = 'BOX\MESA'
        Width = 97
        Visible = True
      end>
  end
  inherited dstBusca: TSQLDataSet
    CommandText = 
      'Select CLI_CODIGO, CLI_FANTASIA, CLI_NRBOX from CLIENTES'#13#10'Where ' +
      'CLI_FANTASIA like :pNOME'#13#10'order by CLI_FANTASIA'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    SQLConnection = Dm.SqlAdmin
  end
  inherited cdsBusca: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'pNOME'
        ParamType = ptInput
        Value = ''
      end>
    object cdsBuscaCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
    end
    object cdsBuscaCLI_FANTASIA: TStringField
      FieldName = 'CLI_FANTASIA'
      Size = 50
    end
    object cdsBuscaCLI_NRBOX: TStringField
      FieldName = 'CLI_NRBOX'
    end
  end
end
