unit UFrmPesqClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, Grids, DBGrids;

type
  TFrmPesqClientes = class(TForm)
    DBGrid1: TDBGrid;
    Edit2: TEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    MaskEdit1: TMaskEdit;
    Panel1: TPanel;
    procedure Edit2Change(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesqClientes: TFrmPesqClientes;

implementation

uses UdmCon, Udm;

{$R *.dfm}

procedure TFrmPesqClientes.Edit2Change(Sender: TObject);
begin
  if length(edit2.Text) <> 0 then
    begin
    dmcon.CdsEmpresas.Close;
    if RadioButton2.Checked = True then
       begin
       dmcon.sdsClientes.CommandText := 'SELECT CLI_CODIGO,CLI_FANTASIA,CLI_RAZAO FROM CLIENTS WHERE CLI_FANTASIA LIKE :PNOME';
       dmcon.sdsClientes.Params.ParamByName('PNOME').AsString := edit2.Text+'%';
       end;
    if RadioButton3.Checked = True then
       begin
       dmcon.sdsClientes.CommandText := 'SELECT EMP_CNPJ,EMP_FANTASIA,EMP_RAZAO FROM Clientes WHERE CLI_RAZAO LIKE :PRAZAO ORDER BY CLI_RAZAO';
       dmcon.sdsClientes.Params.ParamByName('PRAZAO').AsString := edit2.Text+'%';
       end;
    dmcon.cdsClientes.Open;
    end;

end;

procedure TFrmPesqClientes.RadioButton1Click(Sender: TObject);
begin
  MaskEdit1.Visible := True;
  edit2.Visible := false;
  maskedit1.Left := 8;
  maskedit1.Top := 120;
  maskedit1.SetFocus;
end;

procedure TFrmPesqClientes.RadioButton2Click(Sender: TObject);
begin
  MaskEdit1.Visible := False;
  edit2.Visible := true;
  edit2.setfocus;
end;

procedure TFrmPesqClientes.RadioButton3Click(Sender: TObject);
begin
  MaskEdit1.Visible := False;
  edit2.Visible := true;
  edit2.setfocus;
end;

procedure TFrmPesqClientes.DBGrid1DblClick(Sender: TObject);
begin
  dm.CdsClientes.Close;
  dm.SdsClientes.ParamByName('IdCNPJ').AsString := DBGRID1.Fields[0].AsString;
  dm.CdsClientes.Open;
  modalresult := mrOk;
end;

procedure TFrmPesqClientes.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if (Shift = [ssCtrl]) and (Key = 46) Then
        KEY := 0;
end;

end.
