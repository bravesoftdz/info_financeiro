unit uFrmVisualizarPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls,
  DBCtrls, Mask, Buttons;

type
  TfrmVisualizarPC = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qryConsulta: TSQLQuery;
    dspConsulta: TDataSetProvider;
    cdsConsulta: TClientDataSet;
    dsConsulta: TDataSource;
    cdsConsultaREC_SEQUENCIA: TIntegerField;
    cdsConsultaREC_LOJA: TIntegerField;
    cdsConsultaREC_CREDITO: TIntegerField;
    cdsConsultaREC_PARCELA: TIntegerField;
    cdsConsultaREC_CLIENTE: TIntegerField;
    cdsConsultaREC_NRVENDA: TIntegerField;
    cdsConsultaREC_DATAEMISSAO: TDateField;
    cdsConsultaREC_DATAVENCIMENTO: TDateField;
    cdsConsultaREC_DATAPAGAMENTO: TDateField;
    cdsConsultaREC_VALORPARCELA: TFMTBCDField;
    cdsConsultaREC_VALORJUROS: TFMTBCDField;
    cdsConsultaREC_PAGO: TFMTBCDField;
    cdsConsultaREC_DESCRICAO: TMemoField;
    cdsConsultaREC_TIPOMODALIDADE: TIntegerField;
    cdsConsultaCLI_FANTASIA: TStringField;
    cdsConsultaCLI_RAZAO: TStringField;
    cdsConsultaMOD_NOME: TStringField;
    cdsConsultaEMP_FANTASIA: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBMemo1: TDBMemo;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    BtSair: TBitBtn;
    cdsConsultaREC_NRCONTA: TStringField;
    cdsConsultaREC_BANCO: TStringField;
    cdsConsultaREC_AGENCIA: TStringField;
    cdsConsultaREC_NRCHEQUE: TStringField;
    cdsConsultaATRASO: TFloatField;
    Label18: TLabel;
    DBEdit17: TDBEdit;
    procedure BtSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisualizarPC: TfrmVisualizarPC;
  ISequencia : Integer;

implementation

uses Udm;

{$R *.dfm}

procedure TfrmVisualizarPC.BtSairClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmVisualizarPC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if (cdsConsulta.Active) Then
       cdsConsulta.close;
end;

procedure TfrmVisualizarPC.cdsConsultaCalcFields(DataSet: TDataSet);
begin
     If (cdsConsultaREC_DATAPAGAMENTO.AsDateTime <
         cdsConsultaREC_DATAVENCIMENTO.AsDateTime) Then
         cdsConsultaATRASO.AsFloat :=
         cdsConsultaREC_DATAPAGAMENTO.AsDateTime - cdsConsultaREC_DATAVENCIMENTO.AsDateTime
     Else
         cdsConsultaATRASO.AsFloat :=
           cdsConsultaREC_DATAVENCIMENTO.AsDateTime - cdsConsultaREC_DATAPAGAMENTO.AsDateTime;
end;

end.
