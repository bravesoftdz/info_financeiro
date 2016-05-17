unit uFrmCadNewPedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmCadNewPedidos = class(TForm)
    pnlSuperior: TPanel;
    Label1: TLabel;
    Label16: TLabel;
    cmbPagamento: TComboBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    spLocCliente: TSpeedButton;
    Label6: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    edtCDCLIE: TEdit;
    edtNMCLIE: TEdit;
    edtENDER: TEdit;
    edtNumero: TEdit;
    edtBairro: TEdit;
    edtCidade: TEdit;
    cmbTabela: TComboBox;
    GroupBox3: TGroupBox;
    lbl_Pedido: TEdit;
    rbtPedido: TRadioButton;
    rbtOrcamento: TRadioButton;
    Label8: TLabel;
    edtCNPJ: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure tratabotoes(OPCAO : Integer);
    procedure CARREGAR_PAGAMENTO;
    procedure CARREGAR_DADOS_CLIENTE;
    procedure LIMPAR;
    procedure CARREGAR_COMBOS;
  public
    { Public declarations }
  end;

var
  frmCadNewPedidos: TfrmCadNewPedidos;

implementation

uses udmConsulta;

const
    ScreenWidth: LongInt = 800; {I designed my form in 800x600 mode.}
    ScreenHeight: LongInt = 600;


{$R *.dfm}

procedure TfrmCadNewPedidos.CARREGAR_COMBOS;
begin

end;

procedure TfrmCadNewPedidos.CARREGAR_DADOS_CLIENTE;
begin
     //edtNMCLIE.Text := dmConsultas.qryLocCliente.FieldByName('CLI_FANTASIA').AsString;
     edtNMCLIE.Text := dmConsultas.qryLocCliente.FieldByName('CLI_RAZAO').AsString;
     edtENDER.Text  := dmConsultas.qryLocCliente.FieldByName('CLI_ENDERECO').AsString;
     edtNumero.Text := dmConsultas.qryLocCliente.FieldByName('CLI_NUMERO').AsString;
     edtBairro.Text := dmConsultas.qryLocCliente.FieldByName('BAI_NOME').AsString;
     edtCidade.Text := dmConsultas.qryLocCliente.FieldByName('CID_NOME').AsString;
     edtCNPJ.Text   := dmConsultas.qryLocCliente.FieldByName('CLI_CGC').AsString;
end;

procedure TfrmCadNewPedidos.CARREGAR_PAGAMENTO;
begin
     cmbPagamento.Clear;
     dmConsultas.cdsConsulta.Close;
     With dmConsultas.cdsConsulta do
      begin
           Close;
           CommandText := 'Select MOD_NOME from MODALIDADE order by MOD_NOME';
           Open;
           //
           If not (IsEmpty) Then
             begin
                  While not (Eof) do
                    begin
                         cmbPagamento.Items.Add(FieldByName('MOD_NOME').AsString);
                         //
                         Next;
                    End;
             End;
      End;
end;

procedure TfrmCadNewPedidos.FormCreate(Sender: TObject);
begin
      scaled := true;
      if (screen.width <> ScreenWidth) then
      begin
            height := longint(height) * longint(screen.height) DIV ScreenHeight;
            width := longint(width) * longint(screen.width) DIV ScreenWidth;
            scaleBy(screen.width, ScreenWidth);
      end;
      //
      CARREGAR_PAGAMENTO;
      CARREGAR_COMBOS;
      tratabotoes(2);
      //
      {M_TOTALVENDA := 0;
      M_NRITEM := 0;
      lbl_NMPROD.Caption := '';
      edtQUANT.Value     := 1;
      btCompras.Enabled  := False;}
      //NOVO;
      //
      {If (dm2.cdsParcelasVenda.Active = False) Then
         dm2.cdsParcelasVenda.Open;
      dm2.cdsParcelasVenda.EmptyDataSet;}
end;

procedure TfrmCadNewPedidos.LIMPAR;
begin
     edtNMCLIE.Clear;
     edtENDER.Clear;
     edtNumero.Clear;
     edtBairro.Clear;
     edtCidade.Clear;
     //
     {edtCDPROD.Clear;
     edtVLUNIT.Clear;
     edtDesconto.Clear;
     edtQUANT.Clear;
     edtVLSUBT.Clear;
     lbl_NMPROD.Caption := '';}
end;

procedure TfrmCadNewPedidos.tratabotoes(OPCAO: Integer);
begin
     If (OPCAO = 1) then
     begin
         { BtExcluir.Enabled  := True;
          BtCancelar.Enabled := True;
          BtGravar.Enabled   := True;}
     End
     Else
     begin
          {BtExcluir.Enabled  := False;
          BtCancelar.Enabled := False;
          BtGravar.Enabled   := False;}
     End;
end;

end.
