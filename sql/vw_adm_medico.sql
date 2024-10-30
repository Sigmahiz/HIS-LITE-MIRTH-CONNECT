-- MEDICOS CON ESPECIALIDADES AGRUPADAS
SELECT VM.cod_registro_med, VM.registro_med, VM.identificacion, VM.tipo_identificacion, VM.fecha_de_nacimiento, VM.primer_nombre, VM.primer_apellido, VM.forma_pago, VM.observaciones, VM.segundo_nombre, VM.segundo_apellido, VM.direccion, VM.cuenta_bancaria, VM.tipo_cuenta, VM.telefono, VM.celular, VM.e_mail, LISTAGG(EM.cod_especialidad, ',') WITHIN GROUP (ORDER BY EM.cod_especialidad) AS especialidades FROM VW_ADM_MEDICO VM LEFT JOIN VW_ADM_MEDICO_ESPECIALIDAD EM ON VM.registro_med = EM.registro_med GROUP BY VM.cod_registro_med, VM.registro_med, VM.identificacion, VM.tipo_identificacion, VM.primer_nombre, VM.primer_apellido, VM.forma_pago, VM.fecha_de_nacimiento, VM.observaciones, VM.segundo_nombre, VM.segundo_apellido, VM.direccion, VM.cuenta_bancaria, VM.tipo_cuenta, VM.telefono, VM.celular, VM.e_mail;

-- SGHVBDS.VW_ADM_MEDICO source

CREATE OR REPLACE FORCE VIEW "SGHVBDS"."VW_ADM_MEDICO" ("COD_REGISTRO_MED", "REGISTRO_MED", "TIPO_IDENTIFICACION", "IDENTIFICACION", "FECHA_DE_NACIMIENTO", "DV", "PRIMER_NOMBRE", "SEGUNDO_NOMBRE", "PRIMER_APELLIDO", "SEGUNDO_APELLIDO", "OBSERVACIONES", "DIRECCION", "FORMA_PAGO", "RUTA_TRANSITO", "NOMBRE_BANCO", "CUENTA_BANCARIA", "TIPO_CUENTA", "PAGAR_A", "COD_EMPRESA", "NOMBRE", "RUC_EMPRESA", "DV_EMPRESA", "TELEFONO", "CELULAR", "E_MAIL", "USUARIO", "ESTADO") AS 
  SELECT 
    A.CODIGO AS COD_REGISTRO_MED, 
    CASE WHEN A.REG_MEDICO IS NULL THEN A.CODIGO ELSE A.REG_MEDICO END AS REGISTRO_MED, 
    A.TIPO_ID AS TIPO_IDENTIFICACION,
    CASE WHEN A.TIPO_ID = 'C' THEN (DECODE (A.provincia_ced,  0, '',  '00', '',  A.provincia_ced) || 
        DECODE (A.sigla,  '00', '',  '0', '',  A.sigla) || 
        '-' || A.tomo || 
        '-' || A.asiento)
        ELSE A.IDENTIFICACION END AS IDENTIFICACION,
    A.FECHA_DE_NACIMIENTO,
    A.DIGITO_VERIFICADOR AS DV,
    A.PRIMER_NOMBRE,
    A.SEGUNDO_NOMBRE,
    A.PRIMER_APELLIDO,
    A.SEGUNDO_APELLIDO,
    A.OBSERVACIONES,
    A.DIRECCION,
    CASE WHEN A.FORMA_PAGO = 1 THEN 'CHEQUE' ELSE 'ACH' END AS FORMA_PAGO,
    A.RUTA_TRANSITO,
    R.NOMBRE_BANCO,
    A.CUENTA_BANCARIA,
    CASE WHEN A.TIPO_CUENTA = '03' THEN 'CORRIENTE' WHEN A.TIPO_CUENTA = '04' THEN 'AHORRO' WHEN A.TIPO_CUENTA = '07' THEN 'PRESTAMO' WHEN A.TIPO_CUENTA = '43' THEN 'TARJ. CREDITO' ELSE '-' END AS TIPO_CUENTA,
    A.PAGAR_BEN AS PAGAR_A,
    A.COD_EMPRESA,
    E.NOMBRE,
    E.RUC AS RUC_EMPRESA,
    E.DIGITO_VERIFICADOR AS DV_EMPRESA,
    A.TELEFONO,
    A.CELULAR,
    A.E_MAIL,
    A.USUARIO,
    A.ESTADO

FROM TBL_ADM_MEDICO A
LEFT JOIN TBL_ADM_RUTA_TRANSITO R
    ON A.RUTA_TRANSITO = R.RUTA 
LEFT JOIN TBL_ADM_EMPRESA E
    ON A.COD_EMPRESA = E.CODIGO;