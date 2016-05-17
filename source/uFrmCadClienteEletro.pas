unit uFrmCadClienteEletro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, StdCtrls, Mask, Buttons;

type
  TfrmCadClienteEletro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    dsCadastro: TDataSource;
    Label2: TLabel;
    cmbDescricao: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClienteEletro: TfrmCadClienteEletro;

implementation

uses udmDados;

{$R *.dfm}

procedure TfrmCadClienteEletro.BitBtn2Click(Sender: TObject);
begin
      dmDados.cdsClienteEletro.Cancel;
      //
      close;
end;

procedure TfrmCadClienteEletro.BitBtn1Click(Sender: TObject);
begin
   if (dsCadastro.DataSet.State in [dsInsert, dsEdit]) Then
   begin
       if (dmDados.GetVerificaEletroCliente(dsCadastro.DataSet.fieldByname('CLE_CLIENTE').AsInteger,
                        dsCadastro.DataSet.fieldByname('CLE_ELETRO').AsInteger)) Then
       begin
            Application.MessageBox('Descri��o j� foi cadastrada!!!','ATEN��O',
                    MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
            cmbDescricao.SetFocus;
            Exit;
       End;
       dmDados.cdsClienteEletro.ApplyUpdates(0);
       //
       close;
   End;
end;

end.
