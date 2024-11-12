-- SGHVBDS.VW_ADM_PACIENTE source

CREATE OR REPLACE FORCE VIEW "SGHVBDS"."VW_ADM_PACIENTE" ("CODIGO", "NOMBRE_PACIENTE", "ID_PACIENTE", "ID_PACIENTE_F2", "ID_PACIENTE_FRIS", "PRIMER_NOMBRE", "FECHA_NACIMIENTO", "SEGUNDO_NOMBRE", "PRIMER_APELLIDO", "SEGUNDO_APELLIDO", "APELLIDO_DE_CASADA", "PROVINCIA", "SIGLA", "TOMO", "ASIENTO", "SEXO", "ESTADO_CIVIL", "NACIONALIDAD", "TIPO_ID_PACIENTE", "PASAPORTE", "NUMERO_DE_HIJOS", "LUGAR_NACIMIENTO", "ZONA_POSTAL", "APARTADO_POSTAL", "RESIDENCIA_DIRECCION", "RESIDENCIA_COMUNIDAD", "RESIDENCIA_CORREGIMIENTO", "RESIDENCIA_DISTRITO", "RESIDENCIA_PROVINCIA", "RESIDENCIA_PAIS", "TELEFONO", "SEGURO_SOCIAL", "JUBILADO", "PERSONA_DE_URGENCIA", "DIRECCION_DE_URGENCIA", "TELEFONO_URGENCIA", "TELEFONO_TRABAJO_URGENCIA", "NOMBRE_MADRE", "NOMBRE_PADRE", "LUGAR_TRABAJO", "PUESTO_QUE_OCUPA", "TELEFONO_TRABAJO", "EXTENSION_OFICINA", "PERIODOS_LABORADOS", "TRABAJO_DIRECCION", "TRABAJO_CORREGIMIENTO", "TRABAJO_DISTRITO", "TRABAJO_PROVINCIA", "TRABAJO_PAIS", "DEPARTAMENTO_DONDE_LABORA", "NOMBRE_JEFE_INMEDIATO", "IDENTIFICACION_CONYUGUE", "TIPO_IDENTIFICACION_CONYUGUE", "NOMBRE_CONYUGUE", "LUGAR_TRABAJO_CONYUGUE", "TELEFONO_TRABAJO_CONYUGUE", "CONYUGUE_NACIONALIDAD", "FAX", "E_MAIL", "CREDITO_PROMEDIO", "FALLECIDO", "FECHA_FALLECIDO", "RELIGION", "TIPO_SANGRE", "RH", "USUARIO_ADICIONA", "FECHA_ADICIONA", "USUARIO_MODIFICA", "FECHA_MODIFICA", "D_CEDULA", "CLASE_PAMD", "GRUPO_PAMD", "SECTOR_PAMD", "INGRESO_MEN", "CHEQUE", "NO_ADMITIR", "ESTATUS", "TIPO_ID_OTRO", "NOMBRE_PAMD", "CEDULA_PAMD", "HORA_NAC", "NUMERO_ID", "PAC_INASA", "VIP", "TIPO_RESIDENCIA", "DATOS_CORRECTOS", "APROBACION_HNA", "LIMITE", "RESIDENCIAL", "DATA_CORRECTA", "DIAG_HNA", "FECHA_VENCIM", "PASE", "DATOS_ADJUNTOS", "PAC_UNICO", "PASE_K", "REGPAC", "DATOS_PRUEBA", "PAC_ID", "TELEFONO_MOVIL", "EDAD", "EDAD_MES", "EDAD_DIAS", "EXP_ID", "NOMBRE_PACIENTE2", "COMIDA_ID", "F_NAC", "EXCLUIDO", "ID_PACIENTE_F3", "AVATAR", "CEDULA_PAC", "CODIGO_UBICACION_FE") AS 
  SELECT codigo,
             primer_nombre
          || DECODE (segundo_nombre, NULL, '', ' ' || segundo_nombre)
          || DECODE (primer_apellido, NULL, '', ' ' || primer_apellido)
          || DECODE (segundo_apellido, NULL, '', ' ' || segundo_apellido)
          || DECODE (
                sexo,
                'F', DECODE (apellido_de_casada,
                             NULL, '',
                             ' DE ' || apellido_de_casada))
             AS nombre_paciente,
             DECODE (
                tipo_id_paciente,
                'P', pasaporte,
                provincia || '-' || sigla || '-' || tomo || '-' || asiento)
          || '-'
          || d_cedula
             id_paciente,                      /* <--id_Paciente-- id normal*/
             DECODE (
                tipo_id_paciente,
                'P', pasaporte,
                   DECODE (provincia,  0, '',  00, '',  provincia)
                || DECODE (sigla,  '00', '',  '0', '',  sigla)
                || '-'
                || tomo
                || '-'
                || asiento)
          || '-'
          || d_cedula
             id_paciente_f2, /* <--id_paciente_f2-- no lleva los ceros de la sigla*/
          DECODE (
             tipo_id_paciente,
             'P', pasaporte,
                provincia
             || '-'
             || sigla
             || '-'
             || tomo
             || '-'
             || asiento
             || '-'
             || d_cedula)
             id_paciente_fris, /* <--id_Paciente_fRIS--  pasaportes sin campo d_cedula*/
          primer_nombre,
          fecha_nacimiento,
          segundo_nombre,
          primer_apellido,
          segundo_apellido,
          apellido_de_casada,
          provincia,
          sigla,
          tomo,
          asiento,
          sexo,
          estado_civil,
          nacionalidad,
          tipo_id_paciente,
          pasaporte,
          numero_de_hijos,
          lugar_nacimiento,
          zona_postal,
          apartado_postal,
          residencia_direccion,
          residencia_comunidad,
          residencia_corregimiento,
          residencia_distrito,
          residencia_provincia,
          residencia_pais,
          telefono,
          seguro_social,
          jubilado,
          persona_de_urgencia,
          direccion_de_urgencia,
          telefono_urgencia,
          telefono_trabajo_urgencia,
          nombre_madre,
          nombre_padre,
          lugar_trabajo,
          puesto_que_ocupa,
          telefono_trabajo,
          extension_oficina,
          periodos_laborados,
          trabajo_direccion,
          trabajo_corregimiento,
          trabajo_distrito,
          trabajo_provincia,
          trabajo_pais,
          departamento_donde_labora,
          nombre_jefe_inmediato,
          identificacion_conyugue,
          tipo_identificacion_conyugue,
          nombre_conyugue,
          lugar_trabajo_conyugue,
          telefono_trabajo_conyugue,
          conyugue_nacionalidad,
          fax,
          e_mail,
          credito_promedio,
          fallecido,
          fecha_fallecido,
          religion,
          tipo_sangre,
          rh,
          usuario_adiciona,
          fecha_adiciona,
          usuario_modifica,
          fecha_modifica,
          d_cedula,
          clase_pamd,
          grupo_pamd,
          sector_pamd,
          ingreso_men,
          cheque,
          no_admitir,
          estatus,
          tipo_id_otro,
          nombre_pamd,
          cedula_pamd,
          hora_nac,
          numero_id,
          pac_inasa,
          vip,
          tipo_residencia,
          datos_correctos,
          aprobacion_hna,
          limite,
          residencial,
          data_correcta,
          diag_hna,
          fecha_vencim,
          pase,
          datos_adjuntos,
          pac_unico,
          pase_k,
          regpac,
          datos_prueba,
          pac_id,
          telefono_movil,
          NVL (
             TRUNC (
                  MONTHS_BETWEEN (nvl(fecha_fallecido,SYSDATE),
                                  COALESCE (f_nac, fecha_nacimiento))
                / 12),
             0)
             AS edad,
          NVL (
             MOD (
                TRUNC (
                   MONTHS_BETWEEN (nvl(fecha_fallecido,SYSDATE),
                                   COALESCE (f_nac, fecha_nacimiento))),
                12),
             0)
             AS edad_mes,
          TRUNC (
               nvl(fecha_fallecido,SYSDATE)
             - ADD_MONTHS (
                  COALESCE (f_nac, fecha_nacimiento),
                  (    NVL (
                          TRUNC (
                               MONTHS_BETWEEN (
                                  nvl(fecha_fallecido,SYSDATE),
                                  COALESCE (f_nac, fecha_nacimiento))
                             / 12),
                          0)
                     * 12
                   + NVL (
                        MOD (
                           TRUNC (
                              MONTHS_BETWEEN (
                                 nvl(fecha_fallecido,SYSDATE),
                                 COALESCE (f_nac, fecha_nacimiento))),
                           12),
                        0))))
             AS edad_dias,
          exp_id,
             primer_nombre
          || DECODE (segundo_nombre, NULL, '', ' ' || segundo_nombre)
          || DECODE (primer_apellido, NULL, '', ' ' || primer_apellido)
          || DECODE (segundo_apellido, NULL, '', ' ' || segundo_apellido)
          || CASE
                WHEN sexo = 'F' AND apellido_de_casada IS NOT NULL
                THEN
                   ' DE ' || apellido_de_casada
                ELSE
                   ''
             END
             AS nombre_paciente2,
          comida_id,
          NVL (f_nac, fecha_nacimiento) AS f_nac,
          excluido,
          DECODE (
             tipo_id_paciente,
             'P', pasaporte,
                DECODE (provincia,  0, '',  00, '',  provincia)
             || DECODE (sigla,  '00', '',  '0', '',  sigla)
             || '-'
             || tomo
             || '-'
             || asiento)
             id_paciente_f3,
             avatar,
             CASE 
             WHEN tipo_id_paciente = 'P' THEN 
             pasaporte
             WHEN tipo_id_paciente = 'C' AND sigla = '00' THEN 
              provincia || '-' || tomo || '-' || asiento
             WHEN  tipo_id_paciente = 'C' AND sigla != '00' THEN 
             provincia || '-' || sigla || '-' || tomo || '-' || asiento
             END As cedula_pac  ,  
             CODIGO_UBICACION_FE

     FROM tbl_adm_paciente;

COMMENT ON COLUMN SGHVBDS.VW_ADM_PACIENTE.ID_PACIENTE_F2 IS 'ID_PACIENTE_F2 para obtener el id con esta especificacion solicitada por la direccion medica  que no aparezca los ceros de tomo.';