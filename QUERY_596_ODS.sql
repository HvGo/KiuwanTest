SELECT TO_CHAR(A.FECPAGO,'YYYYMM') MES_PAGO,
	   A.MESDEVENGUE PER_DEV,
	   A.TIPAPORTE COD_TIPSALDO,
	   A.CODORIGENACREDITACION COD_ORIGEN,
       SUM(A.MTOACREDITADOSOL * decode(tipmovimiento, 10, 1, 0)) AS ABONOS,
       SUM(A.MTOACREDITADOSOL * decode(tipmovimiento, 10, 0, -1)) AS CARGOS,
       SUM(A.MTOACREDITADOSOL * decode(tipmovimiento, 10, 1, -1)) AS SOLES,
	   decode(A.TIPAPORTE,'I008','COMISI�N AFP/CMR','I001','PRIMA DE SEGURO','I002','COMISI�N AFP','I003','COMISION FIJA') DESCRIPCION_SALDO
FROM   UD_ACREDITACIONADM A
WHERE  A.FECACREDITACION BETWEEN '15/abr/2017' AND '18/abr/2017'
AND    A.CODCUENTA > '0'
AND    A.CODESTADOACREDITACION = 'I'
GROUP BY 
TO_CHAR(A.FECPAGO,'YYYYMM'), A.MESDEVENGUE,A.TIPAPORTE,A.CODORIGENACREDITACION
	   
