transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/marti/Documents/curso/shifters {C:/Users/marti/Documents/curso/shifters/shift.v}

vlog -sv -work work +incdir+C:/Users/marti/Documents/curso/shifters/output_files {C:/Users/marti/Documents/curso/shifters/output_files/tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
