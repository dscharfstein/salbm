all : get Res Main Samps
.PHONY : get Res Main Samps

Main :	
	mmR --no-save --no-restore <  Main.R >  Main.Rout &

Samps :	
	mmR --no-save --no-restore <  samp_parts.R --args ${part} ${NB} ${st} >  samp_parts${part}.Rout &

get :	
	mmR --no-save --no-restore <  get.R >  get.Rout &
