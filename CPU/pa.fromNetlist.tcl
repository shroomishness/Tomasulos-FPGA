
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name CPU -dir "E:/All Other Files/Hardware/Research Project/CPU_IMPLEMENTATION/CPU/planAhead_run_1" -part xc3s400ft256-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "E:/All Other Files/Hardware/Research Project/CPU_IMPLEMENTATION/CPU/CU.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {E:/All Other Files/Hardware/Research Project/CPU_IMPLEMENTATION/CPU} }
set_param project.pinAheadLayout  yes
set_param project.paUcfFile  "CU.ucf"
add_files "CU.ucf" -fileset [get_property constrset [current_run]]
open_netlist_design
