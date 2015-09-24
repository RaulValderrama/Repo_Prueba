/*libname fonacot "C:\Users\admin\Documents\prueba";*/

%macro generardatos(creditos, atrasos);
data ConsumoNoRevolvente;
length empleado_id 5. salario 8. retencion 4. tipo_credito $15.
	plazo 3. tasa_anual 6. /*monto_exigible pago_realido 
	importe_original saldo_credito 10. dias_atraso 3. antiguedad 5.*/;

*Genera de 1 a n cantidad de creditos, simula salario;
do i=1 to &creditos;
	empleado_id=i;
	random=ranuni(1);
	salario=100000*random;

	*Selecciona aleatoriamente un tipo de credito no revolvente;
	if random le 0.2 then do;
		tipo_credito='CONVENCIONAL';
		if random le 1/30 then plazo=6;
		else if random le 2/30 then plazo=9;
		else if random le 3/30 then plazo=12;
		else if random le 4/30 then plazo=18;
		else if random le 5/30 then plazo=24;
		else plazo=36;	
	end;
	else if random le 0.4 then do;
		tipo_credito='MOTO';
		if random le 7/30 then plazo=6;
		else if random le 8/30 then plazo=9;
		else if random le 9/30 then plazo=12;
		else if random le 10/30 then plazo=18;
		else if random le 11/30 then plazo=24;
		else plazo=36;
	end;
	else if random le 0.6 then do;
		tipo_credito='MUJER';
		if random le 13/30 then plazo=6;
		else if random le 14/30 then plazo=9;
		else if random le 15/30 then plazo=12;
		else if random le 16/30 then plazo=18;
		else if random le 17/30 then plazo=24;
		else plazo=36;
	end;
	else if random le 0.8 then do;
		tipo_credito='DAMNIFICADOS';
		if random le 10/15 then plazo=6;
		else if random le 11/15 then plazo=9;
		else plazo=36;
	end;
	else do;
		tipo_credito='IMPREVISTOS';
		if random le 25/30 then plazo=6;
		else if random le 26/30 then plazo=9;
		else if random le 27/30 then plazo=12;
		else if random le 28/30 then plazo=18;
		else if random le 29/30 then plazo=24;
		else plazo=36;
	end;

	*Asigna retenciones;
	if random*ranuni(2) le 1/4 then retencion=0.10;
	else if random*ranuni(2) le 2/4 then retencion=0.15;
	else retencion=0.20;

	*Selecciona caracteristicas del credito otorgado;
	if tipo_credito='DAMNIFICADOS' then do;
		if plazo=12 and retencion=0.10 then tasa_anual=0.1568;
		if plazo=18 and retencion=0.10 then tasa_anual=0.1785;
		if plazo=24 and retencion=0.10 then tasa_anual=0.1998;
		if plazo=12 and retencion=0.15 then tasa_anual=0.1805;
		if plazo=18 and retencion=0.15 then tasa_anual=0.2040;
		if plazo=24 and retencion=0.15 then tasa_anual=0.2210;
		if plazo=12 and retencion=0.20 then tasa_anual=0.2138;
		if plazo=18 and retencion=0.20 then tasa_anual=0.2295;
		if plazo=24 and retencion=0.20 then tasa_anual=0.2380; 
	end;
	else if tipo_credito='EFECTIVO' then do;
		if plazo=6 and retencion=0.10 then tasa_anual=0.2250;
		if plazo=9 and retencion=0.10 then tasa_anual=0.2350;
		if plazo=12 and retencion=0.10 then tasa_anual=0.2350;
		if plazo=18 and retencion=0.10 then tasa_anual=0.2600;
		if plazo=24 and retencion=0.10 then tasa_anual=0.2850;
		if plazo=36 and retencion=0.10 then tasa_anual=0.2900;
		if plazo=6 and retencion=0.15 then tasa_anual=0.2300;
		if plazo=9 and retencion=0.15 then tasa_anual=0.2400;
		if plazo=12 and retencion=0.15 then tasa_anual=0.2500;
		if plazo=18 and retencion=0.15 then tasa_anual=0.2650;
		if plazo=24 and retencion=0.15 then tasa_anual=0.2900;
		if plazo=36 and retencion=0.15 then tasa_anual=0.3000;
		if plazo=6 and retencion=0.20 then tasa_anual=0.2350;
		if plazo=9 and retencion=0.20 then tasa_anual=0.2450;
		if plazo=12 and retencion=0.20 then tasa_anual=0.2650;
		if plazo=18 and retencion=0.20 then tasa_anual=0.2750;
		if plazo=24 and retencion=0.20 then tasa_anual=0.3000;
		if plazo=36 and retencion=0.20 then tasa_anual=0.3150;
	end;
	else do;
		if plazo=6 and retencion=0.10 then tasa_anual=0.1000;
		if plazo=9 and retencion=0.10 then tasa_anual=0.1400;
		if plazo=12 and retencion=0.10 then tasa_anual=0.1650;
		if plazo=18 and retencion=0.10 then tasa_anual=0.2100;
		if plazo=24 and retencion=0.10 then tasa_anual=0.2350;
		if plazo=36 and retencion=0.10 then tasa_anual=0.2650;
		if plazo=6 and retencion=0.15 then tasa_anual=0.1650;
		if plazo=9 and retencion=0.15 then tasa_anual=0.1700;
		if plazo=12 and retencion=0.15 then tasa_anual=0.1900;
		if plazo=18 and retencion=0.15 then tasa_anual=0.2400;
		if plazo=24 and retencion=0.15 then tasa_anual=0.2600;
		if plazo=36 and retencion=0.15 then tasa_anual=0.2900;
		if plazo=6 and retencion=0.20 then tasa_anual=0.1900;
		if plazo=9 and retencion=0.20 then tasa_anual=0.1950;
		if plazo=12 and retencion=0.20 then tasa_anual=0.2250;
		if plazo=18 and retencion=0.20 then tasa_anual=0.2700;
		if plazo=24 and retencion=0.20 then tasa_anual=0.2800;
		if plazo=36 and retencion=0.20 then tasa_anual=0.3100;
	end;

	*Calcula monto y pago del credito;
	pago_nivelado=salario*retencion;
	monto=min(4*salario,pago_nivelado*(1-((1+(tasa_anual/12))**(-plazo)))/(tasa_anual/12));
	meses=floor(plazo-(plazo*ranuni(5)));

	*Calcula fechas del credito;
	if tipo_credito='DAMNIFICADOS' then	originacion=intnx('Month', today(), -(meses+5),'end');
	else originacion=intnx('Month', today(), -(meses+4),'end');
	antiguedad=min(15*ranuni(3),25*ranuni(4),35*ranuni(5));

	*Inicializa valores en ceros para cada credito;
	intereses=0;
	pagado=0;
	retrasos=0;
	dias_atraso=0;
	adeudo=0;
	adicional=0;
	j=0;

	*Amortizacion del credito;
	do until (saldo le 0.001);
		j+1;
		if tipo_credito='DAMNIFICADOS' and j=1 then	fecha=intnx('Month', originacion, 4,'end');
		else if tipo_credito ne 'DAMNIFICADOS' and j=1 then fecha=intnx('Month', originacion, 3, 'end');
		else fecha=intnx('Month', fecha, 1, 'end');
		if j=1 then do;
		monto_exigible=pago_nivelado;
			*Sin pago en j=1   Bien;
			if ranuni(6) ge 0.9433 and ranuni(6) le 0.9435 then do;
				retrasos+1;
				dias_atraso=dias_atraso+day(fecha);
				intereses=0;
				pago_hecho=0;
				pagado=0;
				saldo=monto-pagado;
				adeudo=pago_nivelado;
			end;
			*Pago menor al nivelado en j=1   Bien;
			else if ranuni(6) ge 0.1377 and ranuni(6) le 0.1379 then do;
				intereses=tasa_anual/12*monto;
				pago_hecho=intereses+ranuni(7)*abs(pago_hecho-intereses);
				pagado=pago_hecho-intereses;
				saldo=monto-pagado;
				retrasos+1;
				dias_atraso=dias_atraso+day(fecha);
				adeudo=pago_nivelado-pago_hecho;
			end; 
			*Pago mayor al nivelado en j=1   Bien;
			else if ranuni(6) ge 0.435 and ranuni(6) le 0.535 then do;
				intereses=tasa_anual/12*monto;
				pago_hecho=(1+ranuni(7))*pago_nivelado;
				pagado=pago_hecho-intereses;
				saldo=monto-pagado;
			end;
			*Pago nivelado en j=1   Bien;
			else do;
				intereses=tasa_anual/12*monto;
				pago_hecho=pago_nivelado;
				pagado=pago_hecho-intereses;
				saldo=monto-pagado;
			end;
		end;
		else if j ne 1 and retrasos lt &atrasos then do;
		monto_exigible=pago_nivelado+adeudo;
			*Sin pago   Bien;
			if ranuni(6) ge 0.9433 and ranuni(6) le 0.9435 then do;
				retrasos+1;
				dias_atraso=dias_atraso+day(fecha);
				intereses=0;
				pago_hecho=0;
				pagado=0;
				saldo=saldo-pagado;
				adeudo=adeudo+pago_nivelado;
				adicional=0;
			end;
			*Pago menor al nivelado   mas o menos;
			else if ranuni(6) ge 0.1377 and ranuni(6) le 0.1379 then do;
				intereses=tasa_anual/12*saldo;
				pago_hecho=intereses+ranuni(7)*abs(pago_hecho-intereses);
				pagado=pago_hecho-intereses;								
				if pagado ge saldo then do;
					pago_hecho=saldo+intereses;
					pagado=pago_hecho-intereses;
					saldo=saldo-pagado;
					adicional=adeudo;
					adeudo=adeudo-adicional;
					retrasos=0;
					dias_atraso=0;
				end;
				else do;
					saldo=saldo-pagado;
					retrasos+1;
					dias_atraso=dias_atraso+day(fecha);
					adeudo=adeudo+pago_nivelado-pago_hecho;
					adicional=0;
				end;
			end;
			*Pago mayor al nivelado   ;
			else if ranuni(6) ge 0.435 and ranuni(6) le 0.535 then do;
				intereses=tasa_anual/12*saldo;
				pago_hecho=(1+ranuni(7))*pago_nivelado;
				pagado=pago_hecho-intereses;
				if pagado ge saldo then do;
					pago_hecho=saldo+intereses;
					pagado=pago_hecho-intereses;
					saldo=saldo-pagado;
					*adicional=adeudo;
					*adeudo=adeudo-adicional;
					*retrasos=0;
					*dias_atraso=0;
				end;
				else do;
					if retrasos=0 then saldo=saldo-pagado;
					else do;
						adicional=pago_hecho-pago_nivelado;
						if adicional ge adeudo then do;
							saldo=saldo-(pagado-adicional)-(adicional-adeudo);
							adeudo=0;
							retrasos=0;
							dias_atraso=0;
						end;
						else do;
							saldo=saldo-pagado;
							retrasos=ceil((adeudo-adicional)*retrasos/adeudo);
							dias_atraso=ceil((adeudo-adicional)*dias_atraso/adeudo);
							adeudo=adeudo-adicional;
						end;
					end;	
				end;
			end;
			*Pago nivelado   Creo que bien;
			else do;
				intereses=tasa_anual/12*saldo;
				pago_hecho=pago_nivelado;
				pagado=pago_hecho-intereses;
				if pagado ge saldo then do;
					pago_hecho=saldo+intereses;
					pagado=pago_hecho-intereses;
					saldo=saldo-pagado;
					adicional=0;
					*adeudo=adeudo-adicional;
					*retrasos=0;
					*dias_atraso=0;
				end;
				else do;
					saldo=saldo-pagado;
					adicional=0;
				end;
			end; 
		end;
		else do;
		monto_exigible=pago_nivelado+adeudo;
			*Pago mayor al nivelado despues de cuatro atrasos   ;
			if ranuni(6) ge 0.435 and ranuni(6) le 0.535 then do;
				intereses=tasa_anual/12*saldo;
				pago_hecho=(1+ranuni(7))*pago_nivelado;
				pagado=pago_hecho-intereses;
				if pagado ge saldo then do;
					pago_hecho=saldo+intereses;
					pagado=pago_hecho-intereses;
					saldo=saldo-pagado;
					adicional=pago_hecho-pago_nivelado;
					adeudo=adeudo-adicional;
					retrasos=0;
					dias_atraso=0;
				end;
				else do;
					adicional=pago_hecho-pago_nivelado;
					if adicional ge adeudo then do;
						saldo=saldo-pagado;
						adeudo=0;
						retrasos=0;
						dias_atraso=0;
					end;
					else do;
						saldo=saldo-pagado;
						retrasos=ceil((adeudo-adicional)*retrasos/adeudo);
						dias_atraso=ceil((adeudo-adicional)*dias_atraso/adeudo);
						adeudo=adeudo-adicional;
					end;
				end;
			end;
			*Pago nivelado despues de cuatro atrasos   Creo que bien;
			else do;	
				intereses=tasa_anual/12*saldo;
				pago_hecho=pago_nivelado;
				pagado=pago_hecho-intereses;
				if pagado ge saldo then do;
					pago_hecho=saldo+intereses;
					pagado=pago_hecho-intereses;
					saldo=saldo-pagado;
					adicional=0;
					*adeudo=adeudo-adicional;
					*retrasos=0;
					*dias_atraso=0;
				end;
				else do;
					saldo=saldo-pagado;
					adicional=0;
				end;
			end;
		end;
		
		output;
	end;
	format fecha originacion date9. antiguedad 5.2 saldo salario pago_nivelado monto intereses pagado adeudo adicional pago_hecho monto_exigible comma20.2;
end;
run;
%mend generardatos;
%generardatos(200, 10)
proc contents data=ConsumoNoRevolvente;
run;
proc means data=ConsumoNoRevolvente;run;

%macro Calculo_Reservas(creditos, retrasos, fecha_calc);
%generardatos(&creditos, &retrasos)
data Extraccion;
	set ConsumoNoRevolvente (keep=j empleado_id antiguedad fecha monto monto_exigible pago_hecho saldo retrasos dias_atraso);
	porc_pago=pago_hecho/monto_exigible;
	where fecha le "&fecha_calc"d and fecha gt intnx('Month', "&fecha_calc"d, -4, 'end');
run;

proc means data=Extraccion max mean noprint;
	var retrasos porc_pago;
	by empleado_id;
	output out=stats;
run;
	
data AuxReservas;
	set ConsumoNoRevolvente (keep=j empleado_id antiguedad originacion fecha monto monto_exigible pago_hecho saldo retrasos dias_atraso);
	where fecha le "&fecha_calc"d and fecha gt intnx('Month', "&fecha_calc"d, -1, 'end');
run;
	
proc sql;
	create table ReservasTemp as 
		select aux.empleado_id, antiguedad, originacion, fecha, monto, monto_exigible, pago_hecho,
			saldo, aux.retrasos, aux.dias_atraso, _freq_ as frecuencia, st.retrasos as max_retrasos
		from AuxReservas as aux, stats as st
		where aux.empleado_id=st.empleado_id and _stat_='MAX';

	create table ReservasTemp as 
		select aux.empleado_id, antiguedad, originacion, fecha, monto, monto_exigible, pago_hecho,
			saldo, aux.retrasos, aux.dias_atraso, _freq_ as frecuencia, max_retrasos, st.porc_pago as porcentaje
		from ReservasTemp as aux, stats as st
		where aux.empleado_id=st.empleado_id and _stat_='MEAN'; 
quit;

data Reservas;
	set ReservasTemp;
	do i=1 to &creditos;
		if frecuencia=1 then porc_ajustado=porcentaje;
		else porc_ajustado=(porcentaje*frecuencia+4-frecuencia)/4;
		if ranuni(40) gt 0.5 then do;
			afiliacion=1;
			if afiliacion=1 then do;
				if ranuni(41) gt 0.5 then segsocial=0;
				else segsocial=1;
			end;	
		end;
		else do;
			afiliacion=0;
			segsocial=0;
		end;
		if retrasos ge 4 or dias_atraso gt 90 then proba_inc=1;
		else if retrasos lt 4 then do;
			factor=2.7552+0.4219*retrasos+0.1616*max_retrasos-2.0773*porc_ajustado-0.0632*antiguedad-2.2506*afiliacion-0.4127*segsocial;
			proba_inc=1/sum(1,exp(-factor));
		end;
		if retrasos ge 10 then sev_perdida=1;
		else do;
			if afiliacion=1 then sev_perdida=0.32;
			else sev_perdida=0.71;
		end;
		expos_incumplimiento=saldo;
		reserva=proba_inc*sev_perdida*expos_incumplimiento;
	end;
run;

title 'Monto total de reservas a constituir';
proc means data=Reservas mean sum;
	var reserva;
run; 
title;
%mend Calculo_Reservas;

%Calculo_Reservas(10000,15,31Jul2015)


/*********INICIO*******/
data filtro;
	set ConsumoNoRevolvente;
	where plazo=36 and fecha le today();
run;

proc sql noprint;
	select retrasos
	into :Atr1 - :Atr36
	from filtro
	where empleado_id=1;
	create table conteo as
	select distinct empleado_id 
	from filtro;
quit;

/*proc print data=conteo; run;*/

data matriz_atrasos;
	array matr(36);
	set conteo;
	do j=1 to 36;
		matr[j]=symget(compress('atr'||j));
			
	end;
run;


%put _GLOBAL_;
