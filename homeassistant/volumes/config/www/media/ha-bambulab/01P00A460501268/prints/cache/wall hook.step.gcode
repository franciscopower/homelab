; HEADER_BLOCK_START
; BambuStudio 02.02.00.85
; model printing time: 17m 48s; total estimated time: 24m 15s
; total layer number: 160
; total filament length [mm] : 857.16
; total filament volume [cm^3] : 2061.71
; total filament weight [g] : 2.56
; filament_density: 1.26,1.24,1.24,1.26
; filament_diameter: 1.75,1.75,1.75,1.75
; max_z_height: 25.20
; filament: 2
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70
; apply_scarf_seam_on_circles = 1
; apply_top_surface_compensation = 0
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_formula = by_first_filament
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_color_penetration_layers = 3
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = outer_only
; brim_width = 3
; chamber_temperatures = 0,0,0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E-{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\n{else}\nM620.11 S0\n{endif}\nM400\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\n{if long_retractions_when_cut[previous_extruder]}\nM620.11 S1 I[previous_extruder] E{retraction_distances_when_cut[previous_extruder]} F{old_filament_e_feedrate}\nM628 S1\nG92 E0\nG1 E{retraction_distances_when_cut[previous_extruder]} F[old_filament_e_feedrate]\nM400\nM629 S1\n{else}\nM620.11 S0\n{endif}\nG92 E0\n{if flush_length_1 > 1}\nM83\n; FLUSH_START\n; always use highest temperature to flush\nM400\n{if filament_type[next_extruder] == "PETG"}\nM109 S260\n{elsif filament_type[next_extruder] == "PVA"}\nM109 S210\n{else}\nM109 S[nozzle_temperature_range_high]\n{endif}\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n\nG91\nG1 X3 F12000; move aside to extrude\nG90\nM83\n\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X105 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\n\nG1 X70 F10000\nG1 X80 F15000\nG1 X60\nG1 X80\nG1 X60\nG1 X80 ; shake to put down garbage\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A\n
; circle_compensation_manual_offset = 0
; circle_compensation_speed = 200,200,200,200
; close_fan_the_first_x_layers = 1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70
; cool_plate_temp = 35,35,35,35
; cool_plate_temp_initial_layer = 35,35,35,35
; counter_coef_1 = 0,0,0,0
; counter_coef_2 = 0.025,0.008,0.008,0.008
; counter_coef_3 = -0.11,-0.041,-0.041,-0.041
; counter_limit_max = 0.05,0.033,0.033,0.033
; counter_limit_min = -0.04,-0.035,-0.035,-0.035
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;;;
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_nozzle_volume_type = Standard
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_floating_vertical_shell = 1
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; diameter_limit = 50,50,50,50
; different_settings_to_system = brim_type;brim_width;enable_support;support_style;support_type;;;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_circle_compensation = 0
; enable_height_slowdown = 0
; enable_long_retraction_when_cut = 2
; enable_overhang_bridge_fan = 1,1,1,1
; enable_overhang_speed = 1
; enable_pre_heating = 0
; enable_pressure_advance = 0,0,0,0
; enable_prime_tower = 0
; enable_support = 1
; enable_wrapping_detection = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,0
; eng_plate_temp_initial_layer = 0,0,0,0
; ensure_vertical_shell_thickness = enabled
; exclude_object = 1
; extruder_ams_count = 1#0|4#0;1#0|4#0
; extruder_clearance_dist_to_rod = 33
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 34
; extruder_clearance_max_radius = 68
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_printable_area = 
; extruder_type = Direct Drive
; extruder_variant_list = "Direct Drive Standard"
; fan_cooling_layer_time = 100,100,100,100
; fan_max_speed = 100,100,100,100
; fan_min_speed = 100,100,100,100
; filament_adhesiveness_category = 0,100,100,100
; filament_change_length = 10,10,10,5
; filament_colour = #161616;#FFFFFF;#FFF144;#3F8E43
; filament_colour_type = 0;0;0;0
; filament_cost = 24.99,20,20,24.99
; filament_density = 1.26,1.24,1.24,1.26
; filament_diameter = 1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n";"; filament end gcode \n\n";"; filament end gcode \n\n";"; filament end gcode \n\n"
; filament_extruder_variant = "Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard";"Direct Drive Standard"
; filament_flow_ratio = 0.98,0.98,0.98,0.98
; filament_flush_temp = 0,0,0,0
; filament_flush_volumetric_speed = 0,0,0,0
; filament_ids = Pdd55ebe;GFL99;GFL99;GFA00
; filament_is_support = 0,0,0,0
; filament_long_retractions_when_cut = 1,nil,nil,1
; filament_map = 1,1,1,1
; filament_map_mode = Auto For Flush
; filament_max_volumetric_speed = 18,12,12,21
; filament_minimal_purge_on_wipe_tower = 15,15,15,15
; filament_multi_colour = #161616;#FFFFFF;#FFF144;#3F8E43
; filament_notes = 
; filament_pre_cooling_temperature = 0,0,0,0
; filament_prime_volume = 45,45,45,30
; filament_printable = 3,3,3,3
; filament_ramming_travel_time = 0,0,0,0
; filament_ramming_volumetric_speed = -1,-1,-1,-1
; filament_retraction_distances_when_cut = 18,nil,nil,18
; filament_scarf_gap = 0%,15%,15%,0%
; filament_scarf_height = 10%,10%,10%,10%
; filament_scarf_length = 10,10,10,10
; filament_scarf_seam_type = none,none,none,none
; filament_self_index = 1,2,3,4
; filament_settings_id = "EVOLT PLA Easy @Bambu Lab P1S 0.4 nozzle";"Generic PLA";"Generic PLA";"Bambu PLA Basic @BBL X1C"
; filament_shrink = 100%,100%,100%,100%
; filament_soluble = 0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\nM142 P1 R35 S40\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;PLA
; filament_vendor = EVOLT;Generic;Generic;"Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,588,513,370,180,0,280,208,227,359,0,284,136,480,486,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 250
; gcode_add_line_number = 0
; gcode_flavor = marlin
; grab_length = 0
; has_scarf_joint_seam = 0
; head_wrap_detect_zone = 
; hole_coef_1 = 0,0,0,0
; hole_coef_2 = -0.025,-0.008,-0.008,-0.008
; hole_coef_3 = 0.28,0.23415,0.23415,0.23415
; hole_limit_max = 0.25,0.22,0.22,0.22
; hole_limit_min = 0.08,0.088,0.088,0.088
; host_type = octoprint
; hot_plate_temp = 55,55,55,55
; hot_plate_temp_initial_layer = 55,55,55,55
; hotend_cooling_rate = 2
; hotend_heating_rate = 2
; impact_strength_z = 0,10,10,13.8
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_lock_depth = 1
; infill_rotate_step = 0
; infill_shift_step = 0.4
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; initial_layer_travel_acceleration = 6000
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 300
; interface_shells = 0
; interlocking_beam = 0
; interlocking_beam_layer_count = 2
; interlocking_beam_width = 0.8
; interlocking_boundary_avoidance = 2
; interlocking_depth = 2
; interlocking_orientation = 22.5
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_direction = 45
; ironing_flow = 10%
; ironing_inset = 0.21
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; is_infill_first = 0
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
; line_width = 0.42
; locked_skeleton_infill_pattern = zigzag
; locked_skin_infill_pattern = crosszag
; long_retractions_when_cut = 0
; long_retractions_when_ec = 0,0,0,0
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_prepare_compensation_time = 260
; machine_start_gcode = ;===== machine: P1S ========================\n;===== date: 20231107 =====================\n;===== turn on the HB fan & MC board fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\nM710 A1 S255 ;turn on MC fan by default(P1S)\n;===== reset machine status =================\nM290 X40 Y40 Z2.6666666\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_extruder]}\n\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X230 Y15\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_extruder]=="PLA"}\n    {if (bed_temperature[initial_extruder] >45)||(bed_temperature_initial_layer[initial_extruder] >45)}\n    M106 P3 S180\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n\nM104 S{nozzle_temperature_initial_layer[initial_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== fmech mode fast check============================\n\n\n;===== nozzle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature_initial_layer[initial_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X18 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\n
; machine_switch_extruder_time = 0
; machine_unload_filament_time = 28
; master_extruder_id = 1
; max_bridge_length = 0
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; mmu_segmented_region_interlocking_depth = 0
; mmu_segmented_region_max_width = 0
; nozzle_diameter = 0.4
; nozzle_flush_dataset = 0
; nozzle_height = 4.2
; nozzle_temperature = 220,220,220,220
; nozzle_temperature_initial_layer = 220,220,220,220
; nozzle_temperature_range_high = 240,240,240,240
; nozzle_temperature_range_low = 190,190,190,190
; nozzle_type = stainless_steel
; nozzle_volume = 107
; nozzle_volume_type = Standard
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; other_layers_print_sequence = 0
; other_layers_print_sequence_nums = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 60
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,50%
; overhang_threshold_participating_cooling = 95%,95%,95%,95%
; overhang_totally_speed = 10
; override_filament_scarf_seam_setting = 0
; physical_extruder_map = 0
; post_process = 
; pre_start_fan_time = 0,0,0,0
; precise_outer_wall = 0
; precise_z_height = 0
; pressure_advance = 0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_enable_framework = 0
; prime_tower_extra_rib_length = 0
; prime_tower_fillet_wall = 1
; prime_tower_flat_ironing = 0
; prime_tower_infill_gap = 150%
; prime_tower_lift_height = -1
; prime_tower_lift_speed = 90
; prime_tower_max_speed = 90
; prime_tower_rib_wall = 1
; prime_tower_rib_width = 8
; prime_tower_skip_points = 1
; prime_tower_width = 35
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle"
; print_extruder_id = 1
; print_extruder_variant = "Direct Drive Standard"
; print_flow_ratio = 1
; print_sequence = by layer
; print_settings_id = 0.20mm Strength @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_extruder_id = 1
; printer_extruder_variant = "Direct Drive Standard"
; printer_model = Bambu Lab P1S
; printer_notes = 
; printer_settings_id = Bambu Lab P1S 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_authorization_type = key
; printhost_ssl_ignore_revoke = 0
; printing_by_object_gcode = 
; process_notes = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = -1
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_distances_when_cut = 18
; retraction_distances_when_ec = 10,0,0,0
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; role_base_wipe_speed = 1
; scan_first_layer = 0
; scarf_angle_threshold = 155
; seam_gap = 15%
; seam_placement_away_from_overhangs = 0
; seam_position = aligned
; seam_slope_conditional = 1
; seam_slope_entire_loop = 0
; seam_slope_gap = 0
; seam_slope_inner_walls = 1
; seam_slope_min_length = 10
; seam_slope_start_height = 10%
; seam_slope_steps = 10
; seam_slope_type = none
; silent_mode = 0
; single_extruder_multi_material = 1
; skeleton_infill_density = 25%
; skeleton_infill_line_width = 0.45
; skin_infill_density = 25%
; skin_infill_depth = 2
; skin_infill_line_width = 0.45
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1
; slow_down_layer_time = 4,8,8,4
; slow_down_min_speed = 20,20,20,20
; slowdown_end_acc = 100000
; slowdown_end_height = 400
; slowdown_end_speed = 1000
; slowdown_start_acc = 100000
; slowdown_start_height = 0
; slowdown_start_speed = 1000
; small_perimeter_speed = 50%
; small_perimeter_threshold = 0
; smooth_coefficient = 150
; smooth_speed_discontinuity_area = 1
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 25%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
; sparse_infill_speed = 270
; spiral_mode = 0
; spiral_mode_max_xy_smoothing = 200%
; spiral_mode_smooth = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; supertack_plate_temp = 45,45,45,45
; supertack_plate_temp_initial_layer = 45,45,45,45
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_not_for_body = 1
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_first_layer_gap = 0.2
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = snug
; support_threshold_angle = 30
; support_top_z_distance = 0.2
; support_type = normal(auto)
; symmetric_infill_y_axis = 0
; temperature_vitrification = 45,45,45,45
; template_custom_gcode = 
; textured_plate_temp = 55,55,55,55
; textured_plate_temp_initial_layer = 55,55,55,55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = ;========Date 20250206========\n; SKIPPABLE_START\n; SKIPTYPE: timelapse\nM622.1 S1 ; for prev firmware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\nM1004 S5 P1  ; external shutter\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400\nM1004 S5 P1  ; external shutter\nM400 P300\nM971 S11 C11 O0\nG92 E0\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; SKIPPABLE_END
; timelapse_type = 0
; top_area_threshold = 200%
; top_color_penetration_layers = 5
; top_one_wall_type = all top
; top_shell_layers = 5
; top_shell_thickness = 1
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.42
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_acceleration = 10000
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_diameter_angle = 5
; tree_support_branch_distance = 5
; tree_support_wall_count = -1
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1E 0.4 nozzle";"Bambu Lab A1 0.4 nozzle";"Bambu Lab H2D 0.4 nozzle";"Bambu Lab H2D Pro 0.4 nozzle"
; use_firmware_retraction = 0
; use_relative_e_distances = 1
; vertical_shell_speed = 80%
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_loops = 6
; wall_sequence = inner wall/outer wall
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 165
; wipe_tower_y = 216.972
; wrapping_detection_gcode = 
; wrapping_detection_layers = 20
; wrapping_exclude_area = 
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_direction_outwall_speed_continuous = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R24
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: P1S ========================
;===== date: 20231107 =====================
;===== turn on the HB fan & MC board fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
M710 A1 S255 ;turn on MC fan by default(P1S)
;===== reset machine status =================
M290 X40 Y40 Z2.6666666
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp



;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
G1 X60 F12000
G1 Y245
G1 Y265 F3000
M620 M
M620 S1A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T1
    G1 X54 F12000
    G1 Y265
    M400
M621 S1A
M620.1 E F299.339 T240


M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
M73 P2 R23
G1 E50 F200
M400
M104 S220
G92 E0
M73 P20 R19
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P21 R19
G1 E-0.5 F300

M73 P22 R18
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
M73 P23 R18
G1 Z10
G1 F30000
G1 X230 Y15
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================


;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X118.378 Y109.392 I17.7207 J37.2166
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead


M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== fmech mode fast check============================


;===== nozzle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F1809.98
G0 Y11 E0.700 F452.496
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X18 E15 F1809.98
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
; MACHINE_START_GCODE_END
; filament start gcode
M106 P3 S150


;VT1
G90
G21
M83 ; use relative distances for extrusion
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/160
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S6000
G1 Z.4 F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.191 Y109.75
G1 Z.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X121.111 Y109.784 E.04024
G1 X121.124 Y109.744 E.00156
G1 X122.126 Y109.744 E.0373
M204 S6000
G1 X122.634 Y110.213 F30000
; FEATURE: Support interface
; LINE_WIDTH: 0.42
G1 F3000
M204 S500
M73 P24 R18
G1 X123.085 Y110.213 E.01384
M204 S6000
G1 X124.458 Y108.675 F30000
; FEATURE: Support
; LINE_WIDTH: 0.5
G1 F3000
M204 S500
G1 X135.834 Y124.923 E.73877
G1 X135.423 Y127.255 E.08823
G1 X133.382 Y128.684 E.09279
G1 X131.049 Y128.273 E.08823
G1 X122.77 Y116.449 E.53762
G2 X122.77 Y110.987 I-132.926 J-2.727 E.20348
G1 X122.761 Y110.76 E.00844
G1 X122.939 Y110.938 E.00937
G1 X123.568 Y109.957 E.0434
G3 X122.366 Y109.094 I.387 J-1.807 E.0567
G1 X121.345 Y109.094 E.03804
G1 X121.793 Y107.772 E.052
G1 X124.393 Y108.653 E.10225
M204 S6000
M73 P25 R18
G1 X135.11 Y127.224 F30000
G1 F3000
M204 S500
G1 X135.11 Y124.605 E.09752
G1 X134.602 Y123.88 E.03298
G1 X134.602 Y127.328 E.12843
G1 X134.094 Y127.684 E.02309
G1 X134.094 Y123.155 E.16868
G1 X133.586 Y122.429 E.03298
G1 X133.586 Y128.039 E.20894
G1 X133.286 Y128.25 E.01367
G1 X133.079 Y128.213 E.00784
G1 X133.079 Y121.704 E.24244
G1 X132.571 Y120.979 E.03298
G1 X132.571 Y128.124 E.26612
G1 X132.063 Y128.034 E.01921
G1 X132.063 Y120.254 E.2898
G1 X131.555 Y119.528 E.03298
G1 X131.555 Y127.945 E.31348
M73 P25 R17
G1 X131.289 Y127.898 E.01007
G1 X131.047 Y127.553 E.01568
G1 X131.047 Y118.803 E.3259
G1 X130.539 Y118.078 E.03298
M73 P26 R17
G1 X130.539 Y126.827 E.3259
G1 X130.031 Y126.102 E.03298
G1 X130.031 Y117.352 E.3259
G1 X129.524 Y116.627 E.03298
G1 X129.524 Y125.377 E.3259
G1 X129.016 Y124.652 E.03298
G1 X129.016 Y115.902 E.3259
G1 X128.508 Y115.176 E.03298
G1 X128.508 Y123.926 E.3259
G1 X128 Y123.201 E.03298
G1 X128 Y114.451 E.3259
G1 X127.492 Y113.726 E.03298
G1 X127.492 Y122.476 E.3259
G1 X126.984 Y121.75 E.03298
G1 X126.984 Y113.001 E.3259
G1 X126.476 Y112.275 E.03298
G1 X126.476 Y121.025 E.3259
G1 X125.969 Y120.3 E.03298
G1 X125.969 Y111.55 E.3259
G1 X125.461 Y110.825 E.03298
G1 X125.461 Y119.574 E.3259
G1 X124.953 Y118.849 E.03298
G1 X124.953 Y110.099 E.3259
G1 X124.445 Y109.374 E.03298
G1 X124.445 Y118.124 E.3259
G1 X123.937 Y117.399 E.03298
G1 X123.937 Y108.933 E.31531
G1 X123.429 Y108.761 E.01997
G1 X123.429 Y109.476 E.02663
G3 X122.921 Y109.16 I.16 J-.824 E.02278
G1 X122.921 Y108.589 E.02127
G1 X122.414 Y108.416 E.01997
G1 X122.414 Y108.888 E.01757
M204 S6000
G1 X123.429 Y117.032 F30000
G1 F3000
M204 S500
G1 X123.429 Y110.554 E.24126
; WIPE_START
G1 X123.429 Y112.554 E-.76
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X120.892 Y110.663 Z.6 F30000
G1 Z.2
G1 E.8 F1800
; FEATURE: Brim
G1 F3000
M204 S500
G1 X120.892 Y141.766 E1.15848
G1 X120.916 Y141.882 E.00442
G1 X120.992 Y141.977 E.00453
G1 X120.992 Y142.656 E.02529
G1 X121.04 Y142.797 E.00555
G1 X121.22 Y142.885 E.00745
G1 X122.22 Y142.885 E.03725
G1 X122.361 Y142.836 E.00555
G1 X122.422 Y142.763 E.00354
G1 X122.512 Y142.594 E.00715
G1 X122.535 Y142.446 E.00555
G1 X122.463 Y142.317 E.00552
G1 X122.256 Y142.13 E.01038
G1 X122.461 Y141.966 E.00979
G1 X122.543 Y141.825 E.00607
G1 X122.64 Y141.224 E.02266
G1 X122.649 Y117.667 E.87741
G1 X122.968 Y117.567 E.01248
G1 X124.934 Y120.374 E.12764
G1 X124.923 Y141.319 E.78014
G1 X124.887 Y141.711 E.01466
G1 X124.775 Y142.319 E.02303
G1 X124.624 Y142.786 E.01826
M73 P27 R17
G1 X124.392 Y143.206 E.01785
G1 X124.082 Y143.577 E.01804
G1 X123.893 Y143.746 E.00944
G1 X123.39 Y144.09 E.02268
G1 X122.949 Y144.271 E.01777
G1 X122.479 Y144.365 E.01787
G1 X121.23 Y144.38 E.04651
G1 X120.743 Y144.333 E.01821
G1 X120.281 Y144.197 E.01794
G1 X119.924 Y144.021 E.01484
G1 X119.524 Y143.747 E.01806
G1 X119.187 Y143.406 E.01785
G1 X118.923 Y143.009 E.01777
G1 X118.707 Y142.465 E.02178
G1 X118.606 Y141.75 E.0269
G1 X118.606 Y110.245 E1.17344
G1 X118.653 Y109.757 E.01826
G1 X118.789 Y109.295 E.01794
G1 X118.965 Y108.937 E.01484
G1 X119.239 Y108.538 E.01806
G1 X119.58 Y108.201 E.01785
G1 X119.977 Y107.936 E.01777
G1 X120.521 Y107.721 E.02178
G1 X121.236 Y107.62 E.0269
G1 X121.339 Y107.62 E.00383
G1 X120.41 Y110.361 E.10778
G1 X120.411 Y110.51 E.00555
G1 X120.503 Y110.627 E.00555
G1 X120.626 Y110.663 E.00478
G1 X120.832 Y110.663 E.00765
M204 S6000
G1 X120.349 Y111.054 F30000
G1 F3000
M204 S500
G1 X120.435 Y111.181 E.0057
G1 X120.435 Y141.755 E1.13877
G1 X120.467 Y141.963 E.00782
G1 X120.535 Y142.138 E.007
G1 X120.535 Y142.645 E.01888
G1 X120.604 Y142.933 E.01103
G1 X120.707 Y143.105 E.00749
G1 X120.852 Y143.214 E.00674
G1 X121.006 Y143.289 E.00639
G1 X121.236 Y143.342 E.00878
G1 X122.209 Y143.342 E.03625
G1 X122.493 Y143.274 E.01087
G1 X122.72 Y143.117 E.0103
G1 X122.831 Y142.968 E.00692
G1 X122.911 Y142.818 E.00634
G1 X122.965 Y142.653 E.00647
G1 X122.985 Y142.531 E.0046
G1 X122.974 Y142.327 E.00762
G1 X122.92 Y142.195 E.0053
G1 X122.918 Y142.094 E.00376
G1 X122.997 Y141.884 E.00836
G1 X123.09 Y141.308 E.02174
G1 X123.105 Y118.994 E.83111
G1 X123.153 Y118.89 E.00426
G1 X123.263 Y118.858 E.00426
G1 X123.355 Y118.915 E.00402
G1 X124.452 Y120.482 E.07126
G1 X124.477 Y120.561 E.00307
G1 X124.466 Y141.304 E.7726
G1 X124.432 Y141.654 E.0131
G1 X124.328 Y142.216 E.02127
G1 X124.196 Y142.615 E.01565
G1 X124.005 Y142.957 E.01458
G1 X123.759 Y143.251 E.01428
G1 X123.618 Y143.379 E.00712
G1 X123.184 Y143.677 E.01958
G1 X122.803 Y143.834 E.01536
G1 X122.418 Y143.909 E.01462
G1 X121.256 Y143.922 E.04325
G1 X120.844 Y143.883 E.01545
G1 X120.459 Y143.773 E.0149
G1 X120.147 Y143.62 E.01296
G1 X119.809 Y143.385 E.01532
G1 X119.552 Y143.125 E.01361
G1 X119.338 Y142.808 E.01428
G1 X119.15 Y142.331 E.01907
G1 X119.063 Y141.708 E.02343
G1 X119.063 Y110.273 E1.17083
G1 X119.103 Y109.857 E.01556
G1 X119.213 Y109.473 E.0149
G1 X119.366 Y109.161 E.01296
G1 X119.584 Y108.843 E.01435
G1 X119.861 Y108.566 E.01458
G1 X120.179 Y108.352 E.01428
G1 X120.401 Y108.26 E.00895
G1 X120.515 Y108.266 E.00426
G1 X120.585 Y108.357 E.00426
G1 X120.581 Y108.432 E.00279
G1 X119.981 Y110.203 E.06967
G1 X119.953 Y110.375 E.00647
G1 X119.953 Y110.498 E.0046
G1 X119.996 Y110.695 E.00748
G1 X120.14 Y110.902 E.00941
G1 X120.294 Y111.031 E.0075
M204 S6000
G1 X119.928 Y111.321 F30000
G1 F3000
M204 S500
G1 X119.978 Y111.427 E.00433
G1 X119.978 Y141.746 E1.1293
G1 X120.014 Y142.024 E.01042
G1 X120.078 Y142.249 E.00872
G1 X120.078 Y142.638 E.0145
G1 X120.03 Y142.742 E.00426
G1 X119.92 Y142.774 E.00426
G1 X119.827 Y142.715 E.0041
G1 X119.753 Y142.606 E.00491
G1 X119.601 Y142.23 E.01511
G1 X119.521 Y141.667 E.02116
G1 X119.521 Y111.248 E1.13301
G1 X119.568 Y111.144 E.00426
G1 X119.678 Y111.112 E.00426
G1 X119.759 Y111.155 E.0034
G1 X119.886 Y111.279 E.0066
; WIPE_START
G1 X119.978 Y111.427 E-.06601
G1 X119.978 Y113.253 E-.69399
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X123.459 Y120.045 Z.6 F30000
G1 X123.609 Y120.338 Z.6
G1 Z.2
G1 E.8 F1800
G1 F3000
M204 S500
G1 X123.719 Y120.307 E.00426
G1 X123.811 Y120.363 E.00402
G1 X123.995 Y120.626 E.01196
G1 X124.02 Y120.705 E.00307
G1 X124.009 Y141.276 E.76618
G1 X123.978 Y141.597 E.012
G1 X123.881 Y142.111 E.01948
G1 X123.77 Y142.441 E.013
G1 X123.698 Y142.57 E.00549
G1 X123.605 Y142.638 E.00426
G1 X123.494 Y142.611 E.00426
G1 X123.441 Y142.51 E.00426
G1 X123.431 Y142.315 E.00726
G1 X123.4 Y142.176 E.00533
G1 X123.547 Y141.298 E.03314
G1 X123.561 Y120.442 E.77681
G1 X123.584 Y120.393 E.00203
; WIPE_START
G1 X123.719 Y120.307 E-.06085
G1 X123.811 Y120.363 E-.041
G1 X123.995 Y120.626 E-.12199
G1 X124.02 Y120.705 E-.03136
G1 X124.019 Y122.034 E-.5048
; WIPE_END
G1 E-.04 F1800
M204 S6000
G1 X122.374 Y114.58 Z.6 F30000
G1 X121.47 Y110.484 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Outer wall
G1 F3000
M204 S500
G1 X122.02 Y110.484 E.02047
G1 X122.024 Y110.503 E.00072
G3 X122.07 Y111.005 I-2.845 J.516 E.01879
G1 X122.07 Y140.995 E1.11703
G3 X122.02 Y141.516 I-4.097 J-.135 E.0195
G1 X121.47 Y141.516 E.02046
G1 X121.47 Y110.544 E1.15358
M204 S6000
G1 X121.765 Y110.779 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.159984
G1 F3000
M204 S500
G1 X121.794 Y110.746 E.00042
; LINE_WIDTH: 0.13043
G1 X121.823 Y110.714 E.00031
M204 S6000
G1 X121.765 Y110.779 F30000
; LINE_WIDTH: 0.185767
G1 F3000
M204 S500
G3 X121.77 Y111.011 I-4.184 J.216 E.0027
G1 X121.77 Y140.989 E.34896
G3 X121.761 Y141.287 I-4.067 J.016 E.00347
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F3000
G1 X121.77 Y140.989 E-.11326
G1 X121.77 Y139.288 E-.64674
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 2/160
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M204 S10000
G17
G3 Z.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.129 Y110.034
G1 Z.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X122.139 Y110.06 E.00084
G1 F1200
G3 X122.272 Y110.56 I-2.918 J1.04 E.01592
G3 X122.31 Y111.004 I-2.549 J.446 E.01373
G1 X122.301 Y141.218 E.92838
G3 X122.222 Y141.67 I-2.749 J-.246 E.01413
G1 F600
G1 X122.139 Y141.94 E.00865
G1 X122.129 Y141.966 E.00086
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X122.078 Y142.096 E.00463
G1 X121.43 Y142.096 E.02147
G1 X121.43 Y141.966 E.00431
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X121.43 Y141.781 E.00567
G1 X121.43 Y141.597 E.00567
G1 X121.43 Y141.197 E.01229
G1 X121.43 Y110.803 E.93392
G1 X121.43 Y110.403 E.01229
G1 X121.43 Y110.219 E.00567
G1 F600
G1 X121.43 Y110.034 E.00567
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X121.43 Y109.904 E.00431
G1 X122.079 Y109.904 E.02151
G1 X122.108 Y109.978 E.00263
M204 S10000
G1 X121.783 Y110.1 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.432945
G1 F1200
G1 X121.832 Y110.431 E.01063
; LINE_WIDTH: 0.476443
G1 X121.854 Y110.632 E.00716
; LINE_WIDTH: 0.530554
G3 X121.87 Y111.014 I-4.412 J.381 E.01518
G1 X121.87 Y140.986 E1.19097
G3 X121.854 Y141.368 I-4.435 J0 E.01519
; LINE_WIDTH: 0.476518
G1 X121.832 Y141.568 E.00712
; LINE_WIDTH: 0.432338
G1 X121.782 Y141.9 E.01064
; CHANGE_LAYER
; Z_HEIGHT: 0.477778
; LAYER_HEIGHT: 0.0777778
; WIPE_START
G1 F9244.571
G1 X121.832 Y141.568 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 3/160
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
G17
G3 Z.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z.478
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1304
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
M73 P28 R17
G1 X123.409 Y111.615 E.0302
G1 X123.409 Y110.557 E.04314
G1 X124.042 Y111.46 E.04498
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.122222
; WIPE_START
G1 F7192.241
G1 X123.409 Y110.557 E-.41905
G1 X123.409 Y111.454 E-.34095
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 4/160
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
G17
G3 Z.878 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y110.467
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1304
G1 X122.041 Y110.443 E.00728
G1 X122.088 Y110.662 E.00743
G3 X122.118 Y111.013 I-2.014 J.35 E.0117
G1 X122.118 Y140.987 E.9943
G3 X122.041 Y141.557 I-2.433 J-.042 E.01911
G1 X121.822 Y141.533 E.00728
G1 X121.822 Y110.527 E1.02856
G1 X121.43 Y109.863 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
M204 S5000
G1 X121.43 Y109.554 E.0095
G1 X122.095 Y109.554 E.02042
G1 F1304
G1 X122.154 Y109.668 E.00396
G1 X122.268 Y109.916 E.00837
G1 X122.361 Y110.158 E.00798
G3 X122.475 Y110.595 I-2.699 J.935 E.01389
G3 X122.51 Y111.004 I-2.348 J.411 E.01264
G1 X122.501 Y141.2 E.92784
G3 X122.429 Y141.617 I-2.534 J-.227 E.01302
G1 X122.361 Y141.842 E.00721
G1 X122.268 Y142.084 E.00797
G1 X122.155 Y142.331 E.00835
G1 F600
G1 X122.094 Y142.446 E.004
G1 X121.43 Y142.446 E.02039
G1 F1304
G1 X121.43 Y142.137 E.0095
G1 X121.43 Y141.737 E.01229
G1 X121.43 Y109.923 E.97754
; CHANGE_LAYER
; Z_HEIGHT: 0.755556
; LAYER_HEIGHT: 0.155556
; WIPE_START
G1 F3600
M204 S10000
G1 X121.43 Y109.554 E-.14032
G1 X122.095 Y109.554 E-.25256
G1 X122.154 Y109.668 E-.04895
G1 X122.268 Y109.916 E-.10351
G1 X122.361 Y110.158 E-.09866
G1 X122.438 Y110.454 E-.116
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 5/160
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
G17
G3 Z1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X124.042 Y111.46
G1 Z.756
G1 E.8 F1800
; FEATURE: Support
; LAYER_HEIGHT: 0.277778
G1 F1575
G1 X123.485 Y110.665 E.03959
G1 X123.509 Y110.988 E.01319
G3 X123.509 Y111.615 I-14.936 J.318 E.02557
G1 X124.15 Y111.615 E.02614
G1 X126.164 Y114.492 E.14326
G1 X123.766 Y114.492 E.09782
G1 X125.78 Y117.369 E.14326
G1 X128.179 Y117.369 E.09782
G1 X130.193 Y120.246 E.14326
G1 X127.795 Y120.246 E.09782
G1 X129.81 Y123.123 E.14326
G1 X132.208 Y123.123 E.09782
G1 X133.786 Y125.377 E.11222
G1 X133.676 Y126 E.02581
G1 X131.824 Y126 E.07554
G1 X132.177 Y126.504 E.02507
G1 X132.928 Y126.636 E.03112
G1 X133.606 Y126.162 E.03373
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.0444444
; WIPE_START
G1 F7192.241
G1 X132.928 Y126.636 E-.31427
G1 X132.177 Y126.504 E-.28994
G1 X131.942 Y126.168 E-.15579
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 6/160
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
G17
G3 Z1.156 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y109.959
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1575
G1 X122.014 Y109.916 E.00651
G1 X122.128 Y110.162 E.00897
G3 X122.318 Y111.013 I-2.02 J.899 E.02913
G1 X122.318 Y140.987 E.99429
G3 X122.014 Y142.084 I-2.629 J-.139 E.03805
G1 X121.822 Y142.041 E.00651
G1 X121.822 Y110.019 E1.06226
G1 X121.43 Y109.513 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X121.43 Y109.285 E.00702
G1 X122.103 Y109.285 E.02068
G1 F1575
G1 X122.23 Y109.494 E.00751
G1 X122.377 Y109.766 E.00951
G1 X122.489 Y110.009 E.00823
G1 X122.574 Y110.231 E.00729
G3 X122.678 Y110.63 I-2.472 J.856 E.0127
G3 X122.71 Y111.005 I-2.15 J.376 E.01156
G1 X122.702 Y141.183 E.9273
G3 X122.636 Y141.564 I-2.31 J-.207 E.01189
G1 X122.574 Y141.769 E.00659
G1 X122.489 Y141.991 E.00729
G1 X122.376 Y142.234 E.00824
G1 X122.23 Y142.506 E.00948
G1 F1200
G1 X122.102 Y142.715 E.00754
G1 X121.43 Y142.715 E.02065
G1 F1575
G1 X121.43 Y142.487 E.00702
G1 X121.43 Y142.087 E.01229
G1 X121.43 Y109.573 E.99907
; WIPE_START
G1 F3600
M204 S10000
G1 X121.43 Y109.285 E-.10958
G1 X122.103 Y109.285 E-.25572
G1 X122.23 Y109.494 E-.0929
G1 X122.377 Y109.766 E-.11755
G1 X122.489 Y110.009 E-.10178
G1 X122.567 Y110.212 E-.08248
; WIPE_END
G1 E-.04 F1800
G1 X122.05 Y110.66 Z1.2 F30000
G1 Z.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.131407
G1 F1575
G3 X122.07 Y111.018 I-3.434 J.374 E.00259
G1 X122.07 Y140.982 E.21605
G3 X122.05 Y141.34 I-3.468 J-.016 E.00259
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.07 Y140.982 E-.13641
G1 X122.07 Y139.341 E-.6236
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 7/160
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
G17
G3 Z1.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y109.66
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
M73 P29 R17
G1 F1308
G1 X122.001 Y109.61 E.00614
G1 X122.134 Y109.829 E.00852
G1 X122.191 Y109.935 E.00399
G3 X122.518 Y111.012 I-2.042 J1.208 E.0377
G1 X122.518 Y140.988 E.99434
G3 X122.134 Y142.171 I-2.368 J-.115 E.04175
G1 X122.001 Y142.39 E.00851
G1 X121.822 Y142.34 E.00614
G1 X121.822 Y109.72 E1.08207
G1 X121.43 Y109.244 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1308
M204 S5000
G1 X121.43 Y109.069 E.00535
G1 X122.112 Y109.069 E.02095
G1 X122.127 Y109.09 E.00077
G1 X122.302 Y109.351 E.00966
G1 X122.474 Y109.634 E.01019
G1 X122.607 Y109.881 E.00863
G1 X122.71 Y110.103 E.00749
G1 X122.787 Y110.304 E.00662
G3 X122.899 Y110.801 I-2.422 J.808 E.0157
G3 X122.91 Y111.004 I-1.449 J.182 E.00625
G1 X122.904 Y141.159 E.92657
G3 X122.843 Y141.51 I-2.634 J-.275 E.01097
G1 X122.787 Y141.696 E.00597
G1 X122.71 Y141.898 E.00662
G1 X122.607 Y142.119 E.00748
G1 X122.474 Y142.366 E.00863
G1 X122.302 Y142.649 E.01018
G1 X122.127 Y142.91 E.00967
G1 X122.112 Y142.931 E.00077
G1 X121.43 Y142.931 E.02095
G1 X121.43 Y142.756 E.00535
G1 X121.43 Y109.304 E1.02791
M204 S10000
G1 X121.626 Y109.386 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.238518
G1 F1308
G1 X121.838 Y109.357 E.00341
; LINE_WIDTH: 0.205872
G1 X122.05 Y109.328 E.00284
G1 X122.055 Y110.137 F30000
; LINE_WIDTH: 0.198566
G1 F1308
G1 X122.091 Y110.333 E.00253
; LINE_WIDTH: 0.229589
G1 X122.127 Y110.529 E.00303
; LINE_WIDTH: 0.26557
G1 X122.147 Y110.668 E.00255
; LINE_WIDTH: 0.33135
G3 X122.17 Y111.02 I-2.848 J.361 E.00829
G1 X122.17 Y140.98 E.70417
G3 X122.147 Y141.332 I-2.869 J-.01 E.00829
; LINE_WIDTH: 0.265564
G1 X122.127 Y141.471 E.00256
; LINE_WIDTH: 0.229566
G1 X122.091 Y141.667 E.00303
; LINE_WIDTH: 0.198589
G1 X122.055 Y141.863 E.00252
G1 X122.05 Y142.672 F30000
; LINE_WIDTH: 0.205862
G1 F1308
G1 X121.838 Y142.643 E.00284
; LINE_WIDTH: 0.238506
G1 X121.626 Y142.614 E.00341
; CHANGE_LAYER
; Z_HEIGHT: 1.03333
; LAYER_HEIGHT: 0.0333333
; WIPE_START
G1 F15000
G1 X121.838 Y142.643 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 8/160
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
G17
G3 Z1.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z1.033
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1580
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.166667
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 9/160
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
G17
G3 Z1.433 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y109.432
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1580
G1 X121.995 Y109.379 E.00599
G1 X122.233 Y109.731 E.01411
G3 X122.618 Y110.474 I-4.239 J2.667 E.02779
G1 X122.618 Y141.526 E1.03004
G3 X121.995 Y142.621 I-4.382 J-1.768 E.04193
G1 X121.822 Y142.568 E.00599
M73 P29 R16
G1 X121.822 Y109.492 E1.09721
G1 X121.43 Y109.028 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1580
M204 S5000
G1 X121.43 Y108.889 E.00429
G1 X122.116 Y108.889 E.02106
G1 X122.362 Y109.221 E.01271
G1 X122.563 Y109.519 E.01105
G1 X122.719 Y109.774 E.00916
G1 X122.839 Y109.997 E.00779
G1 X122.926 Y110.186 E.00639
G3 X123.01 Y110.412 I-1.909 J.839 E.00742
G1 X123.01 Y141.588 E.95794
G1 X122.986 Y141.662 E.00238
G1 X122.926 Y141.814 E.00504
G1 X122.839 Y142.003 E.00639
G1 X122.718 Y142.226 E.00779
G1 X122.563 Y142.481 E.00915
G1 X122.362 Y142.779 E.01105
G1 X122.115 Y143.111 E.01273
G1 X121.43 Y143.111 E.02103
G1 X121.43 Y142.972 E.00429
G1 X121.43 Y109.088 E1.04113
M204 S10000
M73 P30 R16
G1 X121.626 Y109.184 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.193196
G1 F1580
G1 X121.835 Y109.152 E.00258
; LINE_WIDTH: 0.150787
G1 X122.044 Y109.121 E.00185
G1 X122.097 Y109.898 F30000
; LINE_WIDTH: 0.431276
G1 F1580
G1 X122.22 Y110.55 E.02099
G1 X122.22 Y141.45 E.97789
G1 X122.097 Y142.102 E.02098
G1 X122.043 Y142.879 F30000
; LINE_WIDTH: 0.150978
G1 F1580
G1 X121.835 Y142.848 E.00186
; LINE_WIDTH: 0.193254
G1 X121.626 Y142.816 E.00258
; CHANGE_LAYER
; Z_HEIGHT: 1.31111
; LAYER_HEIGHT: 0.111111
; WIPE_START
G1 F15000
G1 X121.835 Y142.848 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 10/160
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
G17
G3 Z1.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z1.311
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1611
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.0888889
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 11/160
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
G17
G3 Z1.711 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.236 Y109.527
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1611
G1 X122.324 Y109.648 E.00496
G3 X122.618 Y110.103 I-6.337 J4.421 E.01798
G1 X122.618 Y141.897 E1.05465
G3 X121.986 Y142.8 I-9.42 J-5.926 E.03658
G1 X121.822 Y142.742 E.00574
G1 X121.822 Y109.257 E1.11078
G1 X121.986 Y109.2 E.00576
G1 X122.097 Y109.34 E.00592
G1 X122.2 Y109.479 E.00575
G1 X122.551 Y109.294 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1611
M204 S5000
G1 X122.645 Y109.421 E.00484
G1 X122.824 Y109.687 E.00985
G1 X122.973 Y109.932 E.00882
G1 X123.01 Y110.002 E.00242
G1 X123.01 Y110.288 E.00879
G1 X123.01 Y141.312 E.95329
G1 X123.01 Y141.712 E.01229
G1 X123.01 Y141.998 E.00879
G1 X122.973 Y142.068 E.00242
G1 X122.824 Y142.313 E.00882
G1 X122.645 Y142.579 E.00986
G1 X122.409 Y142.898 E.01219
G1 X122.119 Y143.26 E.01425
G1 X121.43 Y143.26 E.02117
G1 X121.43 Y143.152 E.00332
G1 X121.43 Y109.248 E1.04178
G1 X121.43 Y108.848 E.01229
G1 X121.43 Y108.74 E.00332
G1 X122.122 Y108.74 E.02125
G1 X122.134 Y108.754 E.00057
G1 X122.409 Y109.101 E.0136
G1 X122.515 Y109.246 E.00553
M204 S10000
G1 X122.014 Y108.958 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.121078
G1 F1611
G1 X121.82 Y108.991 E.00125
; LINE_WIDTH: 0.169413
G1 X121.626 Y109.024 E.00203
; WIPE_START
G1 F15000
G1 X121.82 Y108.991 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y109.857 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; LINE_WIDTH: 0.43172
G1 F1611
G1 X122.22 Y142.143 E1.02289
G1 X122.016 Y143.042 F30000
; LINE_WIDTH: 0.121332
G1 F1611
G1 X121.821 Y143.008 E.00126
; LINE_WIDTH: 0.170154
G1 X121.626 Y142.975 E.00205
; CHANGE_LAYER
; Z_HEIGHT: 1.58889
; LAYER_HEIGHT: 0.188889
; WIPE_START
G1 F15000
G1 X121.821 Y143.008 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 12/160
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
G17
G3 Z1.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z1.589
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1601
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.0111111
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
M73 P31 R16
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 13/160
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
G17
G3 Z1.989 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.401 Y109.581
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1601
G1 X122.618 Y109.865 E.01184
G1 X122.618 Y142.135 E1.07047
G3 X121.822 Y143.135 I-15.8 J-11.761 E.0424
G1 X121.822 Y108.862 E1.13689
G1 X122.139 Y109.239 E.01632
G1 X122.365 Y109.534 E.01231
G1 X122.715 Y109.334 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1601
M204 S5000
G1 X122.72 Y109.34 E.00024
G1 X122.914 Y109.602 E.01001
G1 X123.01 Y109.744 E.00528
G1 X123.01 Y109.915 E.00526
G1 X123.01 Y142.085 E.9885
G1 X123.01 Y142.256 E.00526
G1 X122.914 Y142.398 E.00528
G1 X122.72 Y142.66 E.01
G1 X122.443 Y143.009 E.01371
G1 X122.123 Y143.387 E.0152
G1 X121.43 Y143.387 E.02128
G1 X121.43 Y143.301 E.00263
G1 X121.43 Y108.699 E1.06323
G1 X121.43 Y108.613 E.00263
G1 X122.124 Y108.613 E.02133
G1 X122.154 Y108.648 E.0014
G1 X122.443 Y108.991 E.01377
G1 X122.678 Y109.287 E.01161
M204 S10000
G1 X122.22 Y109.669 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1601
G1 X122.22 Y142.331 E1.03483
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.331 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 14/160
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
G17
G3 Z2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.506 Y109.554
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1351
G1 X122.618 Y109.69 E.00586
G1 X122.618 Y142.31 E1.08203
G3 X121.822 Y143.244 I-15.007 J-11.971 E.04073
G1 X121.822 Y108.755 E1.14406
G1 X122.165 Y109.142 E.01714
G1 X122.468 Y109.508 E.01576
G1 X122.816 Y109.308 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1351
M204 S5000
G1 X123.01 Y109.555 E.00965
G1 X123.01 Y109.671 E.00358
G1 X123.01 Y142.329 E1.00349
G1 X123.01 Y142.445 E.00358
G1 X122.791 Y142.724 E.0109
G1 X122.461 Y143.114 E.0157
G1 X122.126 Y143.493 E.01555
G1 X121.43 Y143.493 E.02137
G1 X121.43 Y143.428 E.00201
G1 X121.43 Y108.572 E1.071
G1 X121.43 Y108.507 E.00201
G1 X122.126 Y108.507 E.02138
G1 X122.161 Y108.546 E.0016
G1 X122.461 Y108.886 E.01394
G1 X122.778 Y109.261 E.0151
M204 S10000
G1 X122.22 Y109.523 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1351
G1 X122.22 Y142.477 E1.04403
; CHANGE_LAYER
; Z_HEIGHT: 1.86667
; LAYER_HEIGHT: 0.0666667
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.477 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 15/160
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
G17
G3 Z2.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z1.867
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1621
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 16/160
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
G17
G3 Z2.267 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.566 Y109.493
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1621
M73 P32 R16
G1 X122.618 Y109.552 E.0026
G1 X122.618 Y142.448 E1.09125
G3 X121.822 Y143.334 I-28.068 J-24.419 E.0395
G1 X121.822 Y108.666 E1.15002
G1 X122.17 Y109.044 E.01706
G1 X122.527 Y109.448 E.01786
G1 X122.866 Y109.237 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1621
M204 S5000
G1 X123.01 Y109.408 E.00688
G1 X123.01 Y109.488 E.00248
G1 X123.01 Y142.512 E1.01471
G1 X123.01 Y142.592 E.00248
G1 X122.861 Y142.768 E.00707
G1 X122.462 Y143.218 E.0185
G1 X122.128 Y143.581 E.01514
G1 X121.43 Y143.581 E.02144
G1 X121.43 Y143.534 E.00144
G1 X121.43 Y108.466 E1.07754
G1 X121.43 Y108.419 E.00144
G1 X122.128 Y108.419 E.02145
G1 X122.461 Y108.782 E.01513
G1 X122.826 Y109.192 E.01686
M204 S10000
G1 X122.22 Y109.407 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1621
G1 X122.22 Y142.593 E1.0514
; CHANGE_LAYER
; Z_HEIGHT: 2.14444
; LAYER_HEIGHT: 0.144444
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.593 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 17/160
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
G17
G3 Z2.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z2.144
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.0555556
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 18/160
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
G17
G3 Z2.544 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.612 Y109.439
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y109.446 E.00031
G1 X122.618 Y142.554 E1.09828
G3 X121.822 Y143.406 I-33.525 J-30.541 E.03866
G1 X121.822 Y108.594 E1.15477
G1 X122.149 Y108.939 E.01576
G1 X122.571 Y109.395 E.02062
G1 X122.9 Y109.173 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X122.912 Y109.186 E.00058
G1 X123.01 Y109.295 E.0045
G1 X123.01 Y109.344 E.0015
G1 X123.01 Y142.656 E1.02356
G1 X123.01 Y142.705 E.0015
G1 X122.913 Y142.814 E.0045
G1 X122.436 Y143.329 E.02158
G1 X122.13 Y143.651 E.01364
G1 X121.43 Y143.651 E.0215
G1 X121.43 Y143.622 E.00089
G1 X121.43 Y108.378 E1.08294
G1 X121.43 Y108.349 E.0009
G1 X122.13 Y108.349 E.02151
G1 X122.436 Y108.671 E.01362
G1 X122.859 Y109.129 E.01916
M204 S10000
G1 X122.22 Y109.315 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1627
G1 X122.22 Y142.685 E1.05723
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.685 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 19/160
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
G17
G3 Z2.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.369
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1370
G1 X122.618 Y142.632 E1.10338
G3 X121.822 Y143.462 I-38.84 J-36.449 E.03814
G1 X121.822 Y108.537 E1.15852
G1 X122.577 Y109.326 E.0362
G1 X122.928 Y109.126 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1370
M204 S5000
G1 X123.01 Y109.212 E.00364
G1 X123.01 Y109.234 E.00068
G1 X123.01 Y142.766 E1.03034
G1 X123.01 Y142.789 E.00069
G3 X122.245 Y143.59 I-37.599 J-35.157 E.03406
G1 X122.145 Y143.692 E.00438
G1 X122.132 Y143.706 E.0006
G1 X121.43 Y143.706 E.02155
G1 X121.43 Y143.692 E.00043
G1 X121.43 Y108.308 E1.08725
G1 X121.43 Y108.294 E.00043
G1 X122.131 Y108.294 E.02154
G1 X122.145 Y108.308 E.0006
G1 X122.203 Y108.368 E.00257
M73 P33 R16
G1 X122.4 Y108.574 E.00875
G1 X122.887 Y109.083 E.02164
M204 S10000
G1 X122.22 Y109.247 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1370
G1 X122.22 Y142.754 E1.06158
; CHANGE_LAYER
; Z_HEIGHT: 2.42222
; LAYER_HEIGHT: 0.022222
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.754 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 20/160
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
G17
G3 Z2.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z2.422
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.177778
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 21/160
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
G17
G3 Z2.822 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.31
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.69 E1.10726
G1 X121.822 Y143.503 E.03774
G1 X121.822 Y108.495 E1.16127
G1 X122.576 Y109.267 E.0358
G1 X123.01 Y109.246 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.848 E1.03249
G1 X122.957 Y142.904 E.00236
G1 X122.132 Y143.747 E.03626
G1 X121.43 Y143.747 E.02156
G1 X121.43 Y108.253 E1.09061
G1 X122.133 Y108.253 E.02159
G1 X122.218 Y108.339 E.00371
G1 X122.912 Y109.05 E.03054
G1 X123.01 Y109.152 E.00435
G1 X123.01 Y109.186 E.00103
M204 S10000
G1 X122.22 Y109.194 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1627
G1 X122.22 Y142.805 E1.06488
; CHANGE_LAYER
; Z_HEIGHT: 2.7
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.805 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 22/160
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
G17
G3 Z3 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z2.7
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1621
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
M73 P34 R16
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 23/160
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
G17
G3 Z3.1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
M73 P34 R15
G1 X122.618 Y109.271
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1621
G1 X122.618 Y142.729 E1.10987
G1 X121.822 Y143.53 E.03745
G1 X121.822 Y108.469 E1.16303
G1 X122.576 Y109.228 E.03548
G1 X123.01 Y109.204 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1621
M204 S5000
G1 X123.01 Y142.891 E1.03509
G1 X122.133 Y143.774 E.03825
G1 X121.43 Y143.774 E.02159
G1 X121.43 Y108.226 E1.09226
G1 X122.134 Y108.226 E.02161
G1 X122.17 Y108.262 E.00157
G1 X123.01 Y109.109 E.03666
G1 X123.01 Y109.144 E.00107
M204 S10000
G1 X122.22 Y109.159 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1621
G1 X122.22 Y142.841 E1.06712
; CHANGE_LAYER
; Z_HEIGHT: 2.97778
; LAYER_HEIGHT: 0.177778
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.841 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 24/160
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
G17
G3 Z3.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z2.978
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1622
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.0222223
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 25/160
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
G17
G3 Z3.378 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.253
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1622
G1 X122.618 Y142.747 E1.11105
G1 X121.822 Y143.543 E.03735
G1 X121.822 Y108.458 E1.16385
G1 X122.576 Y109.211 E.03533
G1 X123.01 Y109.178 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1622
M204 S5000
G1 X123.01 Y142.909 E1.03647
G1 X122.133 Y143.787 E.03812
G1 X121.43 Y143.787 E.0216
G1 X121.43 Y108.213 E1.09308
G1 X122.139 Y108.22 E.02176
G1 X123.01 Y109.091 E.03787
G1 X123.01 Y109.118 E.00084
M204 S10000
G1 X122.22 Y109.143 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
M73 P35 R15
G1 F1622
G1 X122.22 Y142.857 E1.06813
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9259.259
G1 X122.22 Y140.857 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 26/160
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
G17
G3 Z3.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1367
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.162 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1367
M204 S5000
G1 X123.01 Y142.913 E1.03707
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.102 E.00047
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1367
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 3.25556
; LAYER_HEIGHT: 0.0555556
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 27/160
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
G17
G3 Z3.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z3.256
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1626
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.144444
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 28/160
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
G17
G3 Z3.656 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
M73 P36 R15
G1 X122.618 Y109.249
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1626
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.149 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1626
M204 S5000
G1 X123.01 Y142.913 E1.03748
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.089 E.00005
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1626
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 3.53333
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 29/160
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
G17
G3 Z3.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z3.533
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 30/160
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
G17
G3 Z3.933 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.136 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03789
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.002 Y109.079 E.03776
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 31/160
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
G17
G3 Z4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.123 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03827
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
M73 P37 R15
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.993 Y109.07 E.03737
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 3.81111
; LAYER_HEIGHT: 0.0111113
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 32/160
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
G17
G3 Z4.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z3.811
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.188889
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 33/160
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
G17
G3 Z4.211 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.111 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03864
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.985 Y109.062 E.03701
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 4.08889
; LAYER_HEIGHT: 0.0888891
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 34/160
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
G17
G3 Z4.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z4.089
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
M73 P38 R15
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.111111
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
M73 P38 R14
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 35/160
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
G17
G3 Z4.489 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.1 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03898
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.977 Y109.054 E.03666
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 4.36667
; LAYER_HEIGHT: 0.166667
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 36/160
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
G17
G3 Z4.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z4.367
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.0333333
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 37/160
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
G17
G3 Z4.767 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.089 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P39 R14
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.0393
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.187 Y108.264 E.00235
G1 X122.97 Y109.046 E.03399
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 38/160
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
G17
G3 Z4.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 4.64444
; LAYER_HEIGHT: 0.0444446
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 39/160
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
G17
G3 Z5 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z4.644
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.155556
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 40/160
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
G17
G3 Z5.044 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
M73 P40 R14
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 4.92222
; LAYER_HEIGHT: 0.122222
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 41/160
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
G17
G3 Z5.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z4.922
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.0777779
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 42/160
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
G17
G3 Z5.322 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 43/160
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
G17
G3 Z5.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z5.2
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
M73 P41 R14
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
G17
G3 Z5.6 I1.018 J-.668 P1  F30000
G1 X122.618 Y109.249 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 44/160
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
G17
G3 Z5.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 5.47778
; LAYER_HEIGHT: 0.0777779
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 45/160
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
G17
G3 Z5.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z5.478
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
M73 P42 R14
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.122222
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 46/160
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
G17
G3 Z5.878 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
M73 P42 R13
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 5.75556
; LAYER_HEIGHT: 0.155556
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 47/160
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
G17
G3 Z6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z5.756
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.0444446
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 48/160
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
G17
G3 Z6.156 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
M73 P43 R13
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 49/160
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
G17
G3 Z6.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 6.03333
; LAYER_HEIGHT: 0.0333333
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 50/160
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
G17
G3 Z6.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z6.033
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.166667
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 51/160
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
G17
G3 Z6.433 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
M73 P44 R13
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.07 Y108.701 E.01162
G1 X122.576 Y109.207 E.02372
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.347 Y108.424 E.0093
G1 X122.968 Y109.045 E.02696
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 6.31111
; LAYER_HEIGHT: 0.111111
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 52/160
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
G17
G3 Z6.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z6.311
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.0888891
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 53/160
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
G17
G3 Z6.711 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 6.58889
; LAYER_HEIGHT: 0.188889
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 54/160
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
G17
G3 Z6.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z6.589
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.0111108
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
M73 P45 R13
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 55/160
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
G17
G3 Z6.989 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 56/160
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
G17
G3 Z7 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 6.86667
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 57/160
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
G17
G3 Z7.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z6.867
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
M73 P46 R13
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02276
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.133333
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 58/160
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
G17
G3 Z7.267 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
M73 P46 R12
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 7.14444
; LAYER_HEIGHT: 0.144444
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 59/160
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
G17
G3 Z7.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z7.144
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.0555553
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 60/160
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
G17
G3 Z7.544 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
M73 P47 R12
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 61/160
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
G17
G3 Z7.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 7.42222
; LAYER_HEIGHT: 0.022222
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 62/160
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
G17
G3 Z7.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z7.422
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.177778
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 63/160
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
G17
G3 Z7.822 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
M73 P48 R12
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 7.7
; LAYER_HEIGHT: 0.0999999
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 64/160
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
G17
G3 Z8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z7.7
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.1
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 65/160
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
G17
G3 Z8.1 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 7.97778
; LAYER_HEIGHT: 0.177778
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 66/160
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
G17
G3 Z8.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z7.978
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1626
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.022222
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
M73 P49 R12
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 67/160
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
G17
G3 Z8.378 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1626
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.23 Y108.861 E.01913
G1 X122.576 Y109.207 E.01622
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1626
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.507 Y108.584 E.01625
G1 X122.968 Y109.045 E.02001
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1626
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 68/160
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
G17
G3 Z8.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 8.25556
; LAYER_HEIGHT: 0.0555553
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 69/160
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
G17
G3 Z8.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z8.256
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
M73 P50 R12
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.144444
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 70/160
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
G17
G3 Z8.656 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 8.53333
; LAYER_HEIGHT: 0.133334
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 71/160
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
G17
G3 Z8.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z8.533
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
M73 P50 R11
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.0666666
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 72/160
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
G17
G3 Z8.933 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y109.087 E0
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.044 E.03626
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
M73 P51 R11
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 73/160
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
G17
G3 Z9 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.092 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03922
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.971 Y109.048 E.03642
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 8.81111
; LAYER_HEIGHT: 0.0111113
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 74/160
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
G17
G3 Z9.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z8.811
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.057 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.188889
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.057 E-.18727
G1 X123.759 Y111.615 E-.21209
G1 X124.15 Y111.615 E-.14851
G1 X124.47 Y112.072 E-.21213
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 75/160
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
G17
G3 Z9.211 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.098 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P52 R11
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03903
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.976 Y109.053 E.03662
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 9.08889
; LAYER_HEIGHT: 0.0888891
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 76/160
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
G17
G3 Z9.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z9.089
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.056 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.111111
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.056 E-.18728
G1 X123.759 Y111.615 E-.2121
G1 X124.15 Y111.615 E-.14852
G1 X124.47 Y112.072 E-.2121
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 77/160
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
G17
G3 Z9.489 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.105 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03883
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.981 Y109.057 E.03682
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 9.36667
; LAYER_HEIGHT: 0.166667
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 78/160
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
G17
G3 Z9.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.606 Y126.162
G1 Z9.367
G1 E.8 F1800
; FEATURE: Support
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1627
G1 X132.928 Y126.636 E.03373
G1 X132.177 Y126.504 E.03112
G1 X131.824 Y126 E.02507
G1 X133.676 Y126 E.07554
G1 X133.786 Y125.377 E.02581
G1 X132.208 Y123.123 E.11222
G1 X129.81 Y123.123 E.09782
G1 X127.795 Y120.246 E.14326
G1 X130.193 Y120.246 E.09782
G1 X128.179 Y117.369 E.14326
G1 X125.78 Y117.369 E.09782
G1 X123.766 Y114.492 E.14326
G1 X126.164 Y114.492 E.09782
G1 X124.15 Y111.615 E.14326
G1 X123.759 Y111.615 E.01594
G1 X123.759 Y111.056 E.02277
G1 X124.042 Y111.46 E.0201
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.0333328
; WIPE_START
G1 F7192.241
G1 X123.759 Y111.056 E-.18728
G1 X123.759 Y111.615 E-.2121
M73 P53 R11
G1 X124.15 Y111.615 E-.14852
G1 X124.47 Y112.072 E-.2121
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 79/160
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
G17
G3 Z9.767 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1627
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.111 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1627
M204 S5000
G1 X123.01 Y142.913 E1.03863
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.985 Y109.062 E.03701
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1627
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 80/160
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
G17
G3 Z9.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1365
G1 X122.618 Y142.751 E1.1113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.118 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1365
M204 S5000
G1 X123.01 Y142.913 E1.03844
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.99 Y109.066 E.03721
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1365
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.48643
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 9.64444
; LAYER_HEIGHT: 0.0444441
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 81/160
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
G17
G3 Z10 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.417 Y126.294
G1 Z9.644
G1 E.8 F1800
; FEATURE: Support transition
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1824
G1 X133.654 Y126.128 E.01178
G1 X133.786 Y125.377 E.03112
G1 X133.262 Y124.629 E.03724
G1 X133.262 Y126.402 E.07232
G1 X132.928 Y126.636 E.01665
G1 X132.385 Y126.54 E.02248
G1 X132.385 Y123.376 E.12906
G1 X131.508 Y122.124 E.06237
G1 X131.508 Y125.549 E.13972
G1 X130.631 Y124.297 E.06237
G1 X130.631 Y120.871 E.13971
G1 X129.754 Y119.619 E.06237
G1 X129.754 Y123.044 E.13971
G1 X128.877 Y121.791 E.06237
M73 P54 R11
G1 X128.877 Y118.366 E.13971
G1 X128 Y117.113 E.06237
G1 X128 Y120.539 E.13971
G1 X127.123 Y119.286 E.06237
G1 X127.123 Y115.861 E.13971
G1 X126.246 Y114.608 E.06237
G1 X126.246 Y118.034 E.13971
G1 X125.369 Y116.781 E.06237
G1 X125.369 Y113.356 E.13971
G1 X124.492 Y112.103 E.06237
G1 X124.492 Y115.529 E.13971
G1 X123.759 Y114.482 E.05212
G1 X123.759 Y111.056 E.13971
G1 X124.384 Y111.949 E.04443
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.155556
; WIPE_START
G1 F3000
G1 X123.759 Y111.056 E-.41396
G1 X123.759 Y111.967 E-.34604
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 82/160
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
G17
G3 Z10.044 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1824
G1 X122.618 Y138.036 E.95492
G1 X122.418 Y138.036 E.00663
G1 X122.418 Y139.581 E.05123
G1 X122.618 Y139.581 E.00663
G1 X122.618 Y142.751 E.10515
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.453 E.0645
G1 X122.39 Y109.021 E.02664
G1 X122.576 Y109.207 E.00871
G1 X123.01 Y109.124 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1824
M204 S5000
G1 X123.01 Y138.428 E.90045
G1 X122.81 Y138.428 E.00615
G1 X122.81 Y139.189 E.02336
G1 X123.01 Y139.189 E.00615
G1 X123.01 Y142.913 E.11444
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.667 Y108.744 E.02321
G1 X122.994 Y109.071 E.01419
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1824
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23172
G1 X122.32 Y137.833 E.42521
G1 X122.32 Y139.784 F30000
; LINE_WIDTH: 0.232321
G1 F1824
G1 X122.32 Y141.806 E.0312
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 9.92222
; LAYER_HEIGHT: 0.122222
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 83/160
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
G17
G3 Z10.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.262 Y126.609
G1 Z9.922
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1762
G1 X133.262 Y124.629 E.08077
G1 X132.385 Y123.376 E.06237
G1 X132.385 Y126.54 E.12906
G1 X132.177 Y126.504 E.00865
G1 X131.508 Y125.549 E.04752
M73 P54 R10
G1 X131.508 Y122.124 E.13972
G1 X130.631 Y120.871 E.06237
G1 X130.631 Y124.297 E.13972
G1 X129.754 Y123.044 E.06237
G1 X129.754 Y119.618 E.13972
G1 X128.877 Y118.366 E.06237
G1 X128.877 Y121.791 E.13972
G1 X128 Y120.539 E.06237
G1 X128 Y117.113 E.13972
G1 X127.123 Y115.861 E.06237
G1 X127.123 Y119.286 E.13972
G1 X126.246 Y118.034 E.06237
G1 X126.246 Y114.608 E.13972
G1 X125.369 Y113.356 E.06237
G1 X125.369 Y116.781 E.13972
G1 X124.492 Y115.529 E.06237
G1 X124.492 Y111.807 E.15179
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.0777779
; WIPE_START
G1 F4800
G1 X124.492 Y113.807 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 84/160
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
G17
G3 Z10.322 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1762
G1 X122.618 Y137.476 E.93634
G1 X122.418 Y137.476 E.00663
G1 X122.418 Y140.055 E.08554
G1 X122.618 Y140.055 E.00663
G1 X122.618 Y142.751 E.08942
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.13 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1762
M204 S5000
G1 X123.01 Y137.868 E.88306
G1 X122.81 Y137.868 E.00615
G1 X122.81 Y139.663 E.05514
G1 X123.01 Y139.663 E.00615
G1 X123.01 Y142.913 E.09987
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.998 Y109.075 E.03758
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1762
M73 P55 R10
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23172
G1 X122.32 Y137.273 E.4166
G1 X122.32 Y140.258 F30000
; LINE_WIDTH: 0.232499
G1 F1762
G1 X122.32 Y141.806 E.0239
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 85/160
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
G17
G3 Z10.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X133.848 Y126
G1 Z10.2
G1 E.8 F1800
; FEATURE: Support interface
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.277778
G1 F1768
G1 X131.824 Y126 E.08257
G1 X131.21 Y125.123 E.04367
G1 X133.608 Y125.123 E.09782
G1 X132.994 Y124.246 E.04367
G1 X130.596 Y124.246 E.09782
G1 X129.982 Y123.369 E.04367
G1 X132.38 Y123.369 E.09782
G1 X131.766 Y122.492 E.04367
G1 X129.367 Y122.492 E.09782
G1 X128.753 Y121.615 E.04367
G1 X131.152 Y121.615 E.09782
G1 X130.538 Y120.738 E.04367
G1 X128.139 Y120.738 E.09782
G1 X127.525 Y119.861 E.04367
G1 X129.923 Y119.861 E.09782
G1 X129.309 Y118.983 E.04367
G1 X126.911 Y118.983 E.09782
G1 X126.297 Y118.106 E.04367
G1 X128.695 Y118.106 E.09782
G1 X128.081 Y117.229 E.04367
G1 X125.683 Y117.229 E.09782
G1 X125.069 Y116.352 E.04367
G1 X127.467 Y116.352 E.09782
G1 X126.853 Y115.475 E.04367
G1 X124.454 Y115.475 E.09782
G1 X123.84 Y114.598 E.04367
G1 X126.239 Y114.598 E.09782
G1 X125.625 Y113.721 E.04367
G1 X123.759 Y113.721 E.0761
G1 X123.759 Y112.844 E.03577
G1 X125.01 Y112.844 E.05105
G1 X124.396 Y111.967 E.04367
G1 X123.759 Y111.967 E.026
G1 X123.759 Y111.09 E.03577
G1 X123.989 Y111.09 E.0094
; WIPE_START
G1 F4800
G1 X123.759 Y111.09 E-.08762
G1 X123.759 Y111.967 E-.33329
G1 X124.396 Y111.967 E-.24228
G1 X124.542 Y112.176 E-.09682
; WIPE_END
G1 E-.04 F1800
G1 X122.618 Y109.249 Z10.6 F30000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
; LAYER_HEIGHT: 0.2
G1 F1768
G1 X122.618 Y133.949 E.81932
G1 X122.418 Y133.949 E.00663
G1 X122.418 Y136.159 E.07333
G1 X122.618 Y136.159 E.00663
G1 X122.618 Y137.172 E.0336
G1 X122.418 Y137.172 E.00663
G1 X122.418 Y140.266 E.10263
G1 X122.618 Y140.266 E.00663
G1 X122.618 Y142.751 E.08242
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.087 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1768
M204 S5000
G1 X123.01 Y134.341 E.77597
G1 X122.81 Y134.341 E.00615
G1 X122.81 Y135.767 E.04383
G1 X123.01 Y135.767 E.00615
G1 X123.01 Y137.564 E.05521
G1 X122.81 Y137.564 E.00615
G1 X122.81 Y139.874 E.07097
G1 X123.01 Y139.874 E.00615
G1 X123.01 Y142.913 E.09339
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.968 Y109.045 E.03627
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1768
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23172
G1 X122.32 Y133.745 E.36232
G1 X122.32 Y136.363 F30000
G1 F1768
G1 X122.32 Y136.968 E.00932
G1 X122.32 Y140.469 F30000
; LINE_WIDTH: 0.232617
G1 F1768
G1 X122.32 Y141.806 E.02065
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 86/160
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
G17
G3 Z10.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.618 Y109.249
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1327
G1 X122.618 Y133.571 E.80678
G1 X122.418 Y133.571 E.00663
G1 X122.418 Y136.404 E.094
G1 X122.618 Y136.404 E.00663
G1 X122.618 Y136.937 E.01768
G1 X122.418 Y136.937 E.00663
G1 X122.418 Y140.398 E.11479
G1 X122.618 Y140.398 E.00663
G1 X122.618 Y142.751 E.07805
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.576 Y109.207 E.03535
G1 X123.01 Y109.141 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1327
M204 S5000
G1 X123.01 Y133.963 E.76271
M73 P56 R10
G1 X122.81 Y133.963 E.00615
G1 X122.81 Y136.012 E.06298
G1 X123.01 Y136.012 E.00615
G1 X123.01 Y137.329 E.04047
G1 X122.81 Y137.329 E.00615
G1 X122.81 Y140.006 E.08223
G1 X123.01 Y140.006 E.00615
G1 X123.01 Y142.913 E.08934
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.006 Y109.083 E.03792
M204 S10000
G1 X122.22 Y109.139 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1327
G1 X122.226 Y110.006 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y110.053 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y110.1 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y110.147 E.00112
; LINE_WIDTH: 0.25532
G1 X122.32 Y110.194 E.00091
; LINE_WIDTH: 0.23172
G1 X122.32 Y133.367 E.35651
G1 X122.32 Y140.601 F30000
; LINE_WIDTH: 0.232711
G1 F1327
G1 X122.32 Y141.806 E.01863
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 87/160
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
G17
G3 Z10.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.837 Y112.797
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8843.478
G1 X122.837 Y112.578 E.00727
G1 X122.837 Y112.178 E.01327
G1 F5560.915
G1 X123.007 Y112.124 E.00594
G1 F3315.902
G1 X123.038 Y112.167 E.00177
G1 F2760
G1 X123.148 Y112.324 E.00634
G1 F1440
G1 X123.253 Y112.474 E.00608
G1 F600
G1 X123.362 Y112.631 E.00634
G1 F3224.182
G1 X123.038 Y112.733 E.01129
G1 F5057.056
G1 X122.894 Y112.779 E.00501
G1 X122.429 Y113.352 F30000
G1 F8843.478
G1 X122.429 Y110.887 E.08178
G1 X122.6 Y110.833 E.00594
G1 X122.808 Y111.13 E.01204
G1 F6876.338
G1 X123.038 Y111.458 E.01327
G1 F2022.872
G1 X123.148 Y111.614 E.00634
G1 F720
G1 X123.311 Y111.847 E.00943
G1 F600
G1 X123.42 Y112.004 E.00634
; FEATURE: Overhang wall
G1 F3000
M204 S5000
G1 X132.952 Y125.617 E.55127
G1 F600
G1 X132.688 Y125.802 E.01072
G1 X123.691 Y112.954 E.5203
G1 X123.42 Y113.039 E.00942
; FEATURE: Inner wall
G1 F1680
M204 S10000
G1 X123.238 Y113.097 E.00634
G1 F1800
G1 X123.22 Y113.103 E.00062
G1 F3668.74
G1 X123.038 Y113.16 E.00634
G1 F8843.478
G1 X122.487 Y113.334 E.01917
G1 X122.618 Y114.107 F30000
G1 F8843.478
G1 X122.618 Y133.287 E.63626
G1 X122.418 Y133.287 E.00663
G1 X122.418 Y140.485 E.23877
G1 X122.618 Y140.485 E.00663
G1 X122.618 Y142.751 E.07515
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y110.149 E.02983
G1 X122.808 Y110.42 E.011
G1 F6876.338
G1 X123.038 Y110.748 E.01327
G1 F2022.872
G1 X123.148 Y110.905 E.00634
G1 F720
G1 X123.311 Y111.138 E.00943
G1 F600
G1 X123.42 Y111.294 E.00634
; FEATURE: Overhang wall

M204 S5000
G1 X133.349 Y125.474 E.5742
G1 X133.276 Y125.888 E.01394
G1 X132.831 Y126.199 E.01801
G1 X132.417 Y126.126 E.01394
G1 X123.529 Y113.432 E.51404
G1 X123.42 Y113.466 E.00377
; FEATURE: Inner wall
G1 F1680
M204 S10000
G1 X123.238 Y113.524 E.00634
G1 F1800
G1 X123.22 Y113.529 E.00062
G1 F3668.74
G1 X123.038 Y113.587 E.00634
G1 F8843.478
G1 X122.618 Y113.719 E.01459
G1 X122.618 Y114.047 E.01086
G1 X123.051 Y113.994 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3600
M204 S5000
G1 X123.01 Y114.007 E.00132
G1 X123.01 Y133.679 E.60449
G1 X122.81 Y133.679 E.00615
G1 X122.81 Y136.18 E.07684
G1 X123.01 Y136.18 E.00615
G1 X123.01 Y137.133 E.0293
G1 X122.81 Y137.133 E.00615
G1 X122.81 Y138.351 E.03741
G1 X122.81 Y138.751 E.01229
G1 F2406.487
G1 X122.851 Y138.751 E.00126
G1 F2040
G1 X123.01 Y138.751 E.00489
G1 X123.01 Y138.816 E.00199
G1 F3600
G1 X122.851 Y138.816 E.00489
G1 X122.81 Y138.816 E.00126
G1 X122.81 Y140.093 E.03925
G1 X123.01 Y140.093 E.00615
G1 X123.01 Y142.913 E.08665
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.625 E.01653
G1 X123.01 Y110.025 E.01229
G1 F2612.974
G1 X123.051 Y110.084 E.0022
G1 F1965.635
G1 X123.157 Y110.235 E.00567
G1 F720
G1 X123.314 Y110.46 E.00843
G1 F600
M73 P57 R10
G1 X123.42 Y110.611 E.00567
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45

G1 X133.763 Y125.382 E.59816
G1 X133.634 Y126.116 E.02472
G1 X132.923 Y126.613 E.02878
G1 X132.189 Y126.484 E.02472
G1 X123.42 Y113.961 E.50713
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 X123.373 Y113.892 E.00256
G1 F2576.188
G1 X123.109 Y113.976 E.00851
M204 S10000
G1 X122.32 Y113.6 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F15000
G1 X122.32 Y133.084 E.29976
; WIPE_START
G1 X122.32 Y131.084 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.714 Y136.376 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.24282
G1 F15000
G1 X122.714 Y136.937 E.00915
; WIPE_START
G1 X122.714 Y136.376 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y140.689 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; LINE_WIDTH: 0.232785
G1 F15000
G1 X122.32 Y141.806 E.01728
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 F13867.49
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 F11734.029
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 F10169.491
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 F9260.475
G1 X122.22 Y142.861 E.02744
G1 X122.395 Y110.684 F30000
; LINE_WIDTH: 0.240751
G1 F15000
G1 X122.32 Y110.194 E.00798
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 F13867.49
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 F11734.029
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 F10169.491
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 F9260.475
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 88/160
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
G17
G3 Z11 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.837 Y113.145
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2309
G1 X122.837 Y111.829 E.04367
G1 X123.007 Y111.775 E.00594
G1 X123.762 Y112.853 E.04367
G1 X122.894 Y113.127 E.03021
G1 X122.429 Y113.701 F30000
G1 F2309
G1 X122.429 Y110.538 E.10491
G1 X122.6 Y110.484 E.00594
G1 X133.083 Y125.454 E.60623
G1 X133.019 Y125.815 E.01214
G1 X132.851 Y125.933 E.00682
G1 X132.49 Y125.869 E.01214
G1 X123.691 Y113.303 E.50888
G1 X122.487 Y113.683 E.04189
; WIPE_START
G1 F8843.478
G1 X122.45 Y111.683 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.022 Y114.61 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
G1 F2309
G1 X122.022 Y110.398 E.13972
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y109.8 E.01827
G1 X133.513 Y125.359 E.63006
G1 X133.391 Y126.051 E.02333
G1 X132.946 Y126.363 E.01801
G1 X132.253 Y126.241 E.02333
G1 X123.529 Y113.781 E.50457
G1 X122.618 Y114.068 E.03167
G1 X122.618 Y133.054 E.62979
G1 X122.418 Y133.054 E.00663
G1 X122.418 Y140.544 E.24846
G1 X122.618 Y140.544 E.00663
G1 X122.618 Y142.751 E.07321
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y114.67 E.89339
; WIPE_START
G1 F8843.478
G1 X122.022 Y112.67 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.051 Y114.342 Z11.2 F30000
G1 Z10.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2309
M204 S5000
G1 X123.01 Y114.355 E.00132
G1 X123.01 Y133.446 E.58659
G1 X122.81 Y133.446 E.00615
G1 X122.81 Y136.302 E.08776
G1 X123.01 Y136.302 E.00615
G1 X123.01 Y136.956 E.02011
G1 X122.81 Y136.956 E.00615
G1 X122.81 Y138.033 E.0331
G1 X122.81 Y138.433 E.01229
G1 X122.851 Y138.433 E.00126
G1 F2040
G1 X123.01 Y138.433 E.00489
G1 F2309
G1 X123.01 Y138.71 E.0085
G1 X123.01 Y138.857 E.00451
G1 X123.01 Y138.969 E.00343
G1 X122.851 Y138.969 E.00489
G1 X122.81 Y138.969 E.00126
G1 X122.81 Y140.152 E.03635
G1 X123.01 Y140.152 E.00615
G1 X123.01 Y142.913 E.08485
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.676 E.01811
G1 X123.051 Y109.735 E.0022
G1 X123.731 Y110.706 E.03641
G1 X124.411 Y111.676 E.03641
G1 X125.09 Y112.647 E.03641
G1 X125.77 Y113.618 E.03641
G1 X126.45 Y114.589 E.03641
G1 X127.13 Y115.559 E.03641
G1 X127.809 Y116.53 E.03641
G1 X128.489 Y117.501 E.03641
G1 X129.169 Y118.472 E.03641
G1 X129.849 Y119.443 E.03641
G1 X130.528 Y120.413 E.03641
G1 X131.208 Y121.384 E.03641
G1 X131.888 Y122.355 E.03641
G1 X132.568 Y123.326 E.03641
G1 F2280
G1 X133.247 Y124.296 E.03641
G1 F2040
G1 X133.927 Y125.267 E.03641
G1 X133.748 Y126.279 E.03159
G1 X133.038 Y126.777 E.02666
G1 X132.025 Y126.599 E.03159
G1 X123.373 Y114.241 E.46354
G1 F2309
G1 X123.109 Y114.324 E.00851
M204 S10000
G1 X122.32 Y113.948 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2309
G1 X122.32 Y132.85 E.2908
G1 X122.32 Y140.747 F30000
; LINE_WIDTH: 0.232841
G1 F2309
G1 X122.32 Y141.806 E.01638
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.371 Y135.585 Z11.2 F30000
G1 X132.757 Y125.709 Z11.2
G1 Z10.8
G1 E.8 F1800
; LINE_WIDTH: 0.359049
G1 F2309
G1 X132.7 Y125.539 E.00463
G1 X123.93 Y113.014 E.39388
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F11387.751
G1 X125.077 Y114.652 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 89/160
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
G17
G3 Z11.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.837 Y113.494
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2506
G1 X122.837 Y111.48 E.0668
G1 X123.007 Y111.426 E.00594
G1 X132.816 Y125.435 E.56728
G1 X132.778 Y125.65 E.00725
G1 X132.563 Y125.612 E.00725
G1 X123.853 Y113.173 E.50371
G1 X122.894 Y113.476 E.03338
G1 X122.429 Y114.049 F30000
G1 F2506
G1 X122.429 Y110.189 E.12805
G1 X122.6 Y110.135 E.00594
G1 X133.246 Y125.34 E.6157
G1 X133.134 Y125.978 E.02152
G1 X132.965 Y126.096 E.00682
G1 X132.326 Y125.984 E.02152
G1 X123.691 Y113.651 E.4994
G1 X122.487 Y114.031 E.04189
; WIPE_START
G1 F8843.478
G1 X122.457 Y112.031 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.022 Y114.958 Z11.4 F30000
G1 Z11
G1 E.8 F1800
G1 F2506
M73 P58 R10
G1 X122.022 Y110.398 E.15128
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y109.451 E.0067
G1 X133.677 Y125.244 E.63954
G1 X133.505 Y126.215 E.03271
G1 X133.061 Y126.527 E.01801
G1 X132.09 Y126.355 E.03271
G1 X123.529 Y114.129 E.49509
G1 X122.618 Y114.417 E.03167
G1 X122.618 Y132.847 E.61136
G1 X122.418 Y132.847 E.00663
G1 X122.418 Y140.582 E.25658
G1 X122.618 Y140.582 E.00663
G1 X122.618 Y142.751 E.07195
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y115.018 E.88183
; WIPE_START
G1 F8843.478
G1 X122.022 Y113.018 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.051 Y114.691 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2506
M204 S5000
G1 X123.01 Y114.704 E.00132
G1 X123.01 Y133.239 E.56952
G1 X122.81 Y133.239 E.00615
G1 X122.81 Y134.587 E.04142
G1 X122.81 Y134.987 E.01229
G1 F2406.487
G1 X122.851 Y134.987 E.00126
G1 F2040
G1 X123.01 Y134.987 E.00489
G1 X123.01 Y135.022 E.0011
G1 F2506
G1 X122.851 Y135.022 E.00489
G1 X122.81 Y135.022 E.00126
G1 X122.81 Y136.398 E.04226
G1 X123.01 Y136.398 E.00615
G1 X123.01 Y136.796 E.01223
G1 X122.81 Y136.796 E.00615
G1 X122.81 Y137.817 E.0314
G1 X122.81 Y138.217 E.01229
G1 F2406.487
G1 X122.851 Y138.217 E.00126
G1 F2040
G1 X123.01 Y138.217 E.00489
G1 F2506
G1 X123.01 Y138.392 E.00538
G1 X123.01 Y139.01 E.01896
G1 X123.01 Y139.037 E.00084
G1 X122.851 Y139.037 E.00489
G1 X122.81 Y139.037 E.00126
G1 X122.81 Y140.189 E.03542
G1 X123.01 Y140.189 E.00615
G1 X123.01 Y142.913 E.08369
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.328 E.0074
G1 X123.051 Y109.386 E.0022
G1 X123.741 Y110.372 E.03696
G1 X124.431 Y111.357 E.03696
G1 X125.121 Y112.342 E.03696
G1 X125.811 Y113.328 E.03696
G1 X126.501 Y114.313 E.03696
G1 X127.191 Y115.299 E.03696
G1 X127.881 Y116.284 E.03696
G1 X128.571 Y117.269 E.03696
G1 X129.261 Y118.255 E.03696
G1 X129.951 Y119.24 E.03696
G1 X130.641 Y120.225 E.03696
G1 X131.331 Y121.211 E.03696
G1 X132.021 Y122.196 E.03696
G1 X132.711 Y123.182 E.03696
G1 F2280
G1 X133.401 Y124.167 E.03696
G1 F2040
G1 X134.091 Y125.152 E.03696
G1 X133.863 Y126.443 E.04028
G1 X133.152 Y126.941 E.02666
G1 X131.862 Y126.713 E.04028
G1 X123.373 Y114.59 E.45477
G1 F2506
G1 X123.109 Y114.673 E.00851
M204 S10000
G1 X122.32 Y114.297 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2506
G1 X122.32 Y132.643 E.28225
; WIPE_START
G1 F15000
G1 X122.32 Y130.643 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.707 Y138.266 Z11.4 F30000
G1 X122.714 Y138.413 Z11.4
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.24282
G1 F2506
G1 X122.714 Y138.841 E.00696
; WIPE_START
G1 F15000
G1 X122.714 Y138.413 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y140.785 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; LINE_WIDTH: 0.232881
G1 F2506
G1 X122.32 Y141.806 E.0158
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
G1 X122.126 Y110.194 F30000
; LINE_WIDTH: 0.254029
G1 F2506
G1 X122.126 Y110.04 E.00266
G1 X122.215 Y109.797 E.00445
; LINE_WIDTH: 0.296555
G1 X122.304 Y109.554 E.00534
; LINE_WIDTH: 0.332379
G1 X122.393 Y109.312 E.0061
G1 X122.22 Y109.139 F30000
; LINE_WIDTH: 0.44282
G1 F2506
G2 X122.299 Y110.017 I2.821 J.188 E.02882
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9002.253
G1 X122.22 Y109.515 E-.43642
G1 X122.22 Y109.139 E-.32358
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 90/160
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
G17
G3 Z11.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y113.288
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2581
G1 X123.244 Y112.51 E.0258
G1 X123.414 Y112.456 E.00594
G1 X123.86 Y113.093 E.0258
G1 X123.301 Y113.27 E.01947
G1 X122.837 Y113.843 F30000
G1 F2581
G1 X122.837 Y111.219 E.08704
G1 X123.007 Y111.165 E.00594
G1 X132.968 Y125.39 E.57604
G1 X132.893 Y125.814 E.01429
G1 X132.469 Y125.739 E.01429
G1 X124.359 Y114.156 E.46905
G1 X124.308 Y114.172 E.00174
G1 X123.853 Y113.522 E.02632
G1 X122.894 Y113.825 E.03338
G1 X122.429 Y114.398 F30000
G1 F2581
G1 X122.429 Y109.991 E.14619
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.398 Y125.294 E.62446
G1 X133.261 Y126.073 E.02621
G1 X133.01 Y126.248 E.01014
G1 X132.232 Y126.111 E.02621
G1 X124.196 Y114.634 E.46474
G1 X124.146 Y114.65 E.00174
G1 X123.691 Y114 E.02632
G1 X122.487 Y114.38 E.04189
G1 X122.618 Y115.221 F30000
G1 F2581
G1 X122.618 Y132.654 E.57829
G1 X122.418 Y132.654 E.00663
G1 X122.418 Y140.599 E.26357
G1 X122.618 Y140.599 E.00663
G1 X122.618 Y142.751 E.07136
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X133.828 Y125.199 E.64026
G1 X133.632 Y126.309 E.0374
G1 X133.106 Y126.678 E.02133
G1 X131.995 Y126.482 E.0374
G1 X124.034 Y115.112 E.46044
G1 X123.984 Y115.128 E.00174
G1 X123.529 Y114.478 E.02632
G1 X122.618 Y114.765 E.03167
G1 X122.618 Y115.161 E.01312
G1 X123.051 Y115.04 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2581
M204 S5000
G1 X123.01 Y115.053 E.00132
G1 X123.01 Y133.046 E.55288
G1 X122.81 Y133.046 E.00615
G1 X122.81 Y134.281 E.03796
G1 X122.81 Y134.681 E.01229
G1 F2406.487
G1 X122.851 Y134.681 E.00126
G1 F2040
G1 X123.01 Y134.681 E.00489
G1 F2581
G1 X123.01 Y134.946 E.00813
G1 X123.01 Y135.063 E.00362
G1 X123.01 Y135.141 E.00237
G1 X122.851 Y135.141 E.00489
G1 X122.81 Y135.141 E.00126
G1 X122.81 Y136.48 E.04114
G1 X123.01 Y136.48 E.00615
G1 X123.01 Y136.649 E.00522
G1 X122.81 Y136.649 E.00615
G1 X122.81 Y137.641 E.03047
G1 X122.81 Y138.041 E.01229
G1 X122.851 Y138.041 E.00126
M73 P58 R9
G1 F2400
G1 X123.01 Y138.041 E.00489
G1 F2581
G1 X123.01 Y138.176 E.00416
G1 X123.01 Y139.063 E.02725
G1 X122.81 Y139.063 E.00615
G1 X122.81 Y140.207 E.03516
G1 X123.01 Y140.207 E.00615
G1 X123.01 Y142.913 E.08314
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.051 Y109.128 E.03989
G1 X123.059 Y109.136 E.00033
G1 X123.758 Y110.134 E.03744
G1 X124.457 Y111.132 E.03744
G1 X125.156 Y112.13 E.03744
G1 X125.855 Y113.128 E.03744
G1 X126.554 Y114.127 E.03744
G1 X127.253 Y115.125 E.03744
G1 X127.952 Y116.123 E.03744
G1 X128.651 Y117.121 E.03744
G1 X129.35 Y118.12 E.03744
G1 X130.049 Y119.118 E.03744
G1 X130.748 Y120.116 E.03744
M73 P59 R9
G1 X131.446 Y121.114 E.03744
G1 X132.145 Y122.113 E.03744
G1 X132.844 Y123.111 E.03744
G1 X133.543 Y124.109 E.03744
G1 X134.242 Y125.107 E.03744
G1 X133.99 Y126.537 E.04462
G1 X133.279 Y127.035 E.02667
G1 X133.197 Y127.092 E.00307
G1 X131.767 Y126.84 E.04462
G1 X127.822 Y121.206 E.21133
G1 X124.107 Y115.9 E.19904
G1 X123.878 Y115.573 E.01229
G1 F2040
G1 X123.828 Y115.588 E.00161
G1 X123.373 Y114.938 E.02438
G1 F2581
G1 X123.109 Y115.022 E.00851
M204 S10000
G1 X122.32 Y114.646 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2581
G1 X122.32 Y132.45 E.27392
; WIPE_START
G1 F15000
G1 X122.32 Y130.45 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.614 Y134.911 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.11047
G1 F2581
G1 X122.814 Y134.911 E.0011
G1 X122.714 Y138.237 F30000
; LINE_WIDTH: 0.24282
G1 F2581
G1 X122.714 Y138.867 E.01026
; WIPE_START
G1 F15000
G1 X122.714 Y138.237 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y140.803 Z11.6 F30000
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.2329
G1 F2581
G1 X122.32 Y141.806 E.01552
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.314 Y135.549 Z11.6 F30000
G1 X132.646 Y125.564 Z11.6
G1 Z11.2
G1 E.8 F1800
; LINE_WIDTH: 0.244889
G1 F2581
G1 X132.646 Y125.461 E.00169
G1 X124.522 Y113.86 E.23309
; LINE_WIDTH: 0.257385
G1 X124.483 Y113.826 E.0009
; LINE_WIDTH: 0.282388
G1 X124.444 Y113.792 E.00101
; LINE_WIDTH: 0.294892
G1 X124.06 Y113.243 E.01374
G1 X124.444 Y113.792 F30000
; LINE_WIDTH: 0.27673
G1 F2581
G1 X124.424 Y113.836 E.00093
; LINE_WIDTH: 0.240413
G1 X124.404 Y113.881 E.00079
; LINE_WIDTH: 0.204097
G1 X124.384 Y113.925 E.00064
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X124.404 Y113.881 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 91/160
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
G17
G3 Z11.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X124.06 Y113.379
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2563
G1 X123.244 Y113.636 E.02841
G1 X123.244 Y112.51 E.03737
G1 X123.414 Y112.456 E.00594
G1 X124.026 Y113.33 E.03538
; WIPE_START
G1 F8843.478
G1 X123.244 Y113.636 E-.31937
G1 X123.244 Y112.51 E-.42806
G1 X123.275 Y112.5 E-.01257
; WIPE_END
G1 E-.04 F1800
G1 X124.781 Y114.76 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
G1 F2563
G1 X124.358 Y114.156 E.02446
G1 X124.108 Y114.235 E.0087
G1 X123.853 Y113.871 E.01475
G1 X122.837 Y114.191 E.03537
G1 X122.837 Y111.219 E.09861
G1 X123.007 Y111.165 E.00594
G1 X133.082 Y125.554 E.58268
G1 X133.053 Y125.721 E.00564
G1 X132.751 Y125.933 E.01222
G1 X132.584 Y125.903 E.00564
G1 X124.816 Y114.809 E.44924
G1 X123.946 Y114.713 F30000
G1 F2563
G1 X123.691 Y114.349 E.01475
G1 X122.429 Y114.747 E.04388
G1 X122.429 Y109.991 E.15776
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.682 Y109.991 E.01631
G1 X133.513 Y125.458 E.62636
G1 X133.424 Y125.958 E.01683
G1 X132.846 Y126.363 E.02341
G1 X132.347 Y126.275 E.01683
G1 X124.196 Y114.634 E.47138
G1 X124.003 Y114.695 E.00671
G1 X123.724 Y115.105 F30000
G1 F2563
G1 X123.529 Y114.827 E.01128
G1 X122.618 Y115.114 E.03167
G1 X122.618 Y132.472 E.57579
G1 X122.418 Y132.472 E.00663
G1 X122.418 Y138.278 E.19259
G1 X122.618 Y138.278 E.00663
G1 X122.618 Y138.678 E.0133
G1 X122.418 Y138.678 E.00663
G1 X122.418 Y140.602 E.0638
G1 X122.618 Y140.602 E.00663
G1 X122.618 Y142.751 E.07128
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X133.943 Y125.363 E.64689
G1 X133.796 Y126.195 E.02802
G1 X132.942 Y126.793 E.03459
G1 X132.11 Y126.646 E.02802
G1 X124.034 Y115.112 E.46707
G1 X123.784 Y115.191 E.0087
G1 X123.758 Y115.155 E.00147
G1 X123.051 Y115.388 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2563
M204 S5000
G1 X123.01 Y115.401 E.00132
G1 X123.01 Y132.864 E.53657
G1 X122.81 Y132.864 E.00615
G1 X122.81 Y134.054 E.03658
G1 X122.81 Y134.454 E.01229
G1 F2406.487
G1 X122.851 Y134.454 E.00126
G1 F2040
G1 X123.01 Y134.454 E.00489
G1 F2563
G1 X123.01 Y134.64 E.00571
G1 X123.01 Y135.182 E.01664
G1 X123.01 Y135.226 E.00136
G1 X122.851 Y135.226 E.00489
G1 X122.81 Y135.226 E.00126
G1 X122.81 Y137.486 E.06943
G1 X122.81 Y137.886 E.01229
G1 X122.851 Y137.886 E.00126
G1 X123.01 Y137.886 E.00489
G1 X123.01 Y138 E.00352
G1 X123.01 Y139.071 E.03289
G1 X122.81 Y139.071 E.00615
G1 X122.81 Y140.21 E.03501
G1 X123.01 Y140.21 E.00615
G1 X123.01 Y142.913 E.08306
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.046 Y124.827 E.58861
G1 X134.276 Y125.155 E.01229
G1 X134.357 Y125.271 E.00436
G1 X134.154 Y126.423 E.03593
G1 X134.038 Y126.504 E.00436
G1 X133.478 Y126.896 E.02101
G1 X133.15 Y127.126 E.01229
G1 X133.034 Y127.207 E.00436
G1 X131.882 Y127.004 E.03593
G1 X131.801 Y126.888 E.00436
G1 X124.107 Y115.9 E.41215
G1 X123.878 Y115.573 E.01229
G1 X123.787 Y115.601 E.00293
G1 F2040
G1 X123.628 Y115.651 E.00512
G1 X123.373 Y115.287 E.01366
G1 F2563
G1 X123.109 Y115.37 E.00851
M204 S10000
G1 X122.32 Y114.995 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2563
G1 X122.32 Y132.268 E.26575
G1 X122.32 Y140.805 F30000
; LINE_WIDTH: 0.232903
G1 F2563
G1 X122.32 Y141.806 E.01549
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z11.8 F30000
G1 X132.785 Y125.66 Z11.8
G1 Z11.4
G1 E.8 F1800
; LINE_WIDTH: 0.244905
G1 F2563
G1 X124.522 Y113.859 E.23711
; LINE_WIDTH: 0.263011
G1 X124.386 Y113.765 E.00297
; LINE_WIDTH: 0.29921
G1 X124.25 Y113.67 E.00346
; LINE_WIDTH: 0.335408
G1 X124.114 Y113.575 E.00395
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F12308.206
G1 X124.25 Y113.67 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 92/160
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
G17
G3 Z11.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X124.091 Y113.847
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2621
G1 X124.016 Y113.741 E.00427
G1 X123.244 Y113.985 E.02687
G1 X123.244 Y112.51 E.04893
G1 X123.414 Y112.456 E.00594
G1 X124.29 Y113.706 E.05063
G1 X124.14 Y113.812 E.00609
; WIPE_START
G1 F8843.478
G1 X124.016 Y113.741 E-.05405
G1 X123.244 Y113.985 E-.30784
G1 X123.244 Y112.937 E-.3981
; WIPE_END
G1 E-.04 F1800
G1 X124.875 Y114.894 Z12 F30000
G1 Z11.6
G1 E.8 F1800
G1 F2621
G1 X124.358 Y114.156 E.02986
G1 X123.908 Y114.298 E.01565
G1 X123.853 Y114.219 E.00318
G1 X122.837 Y114.54 E.03537
G1 X122.837 Y111.219 E.11018
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.909 Y114.943 E.44783
; WIPE_START
G1 F8843.478
G1 X124.358 Y114.156 E-.36491
G1 X123.908 Y114.298 E-.17924
G1 X123.853 Y114.219 E-.03647
G1 X123.403 Y114.361 E-.17938
; WIPE_END
G1 E-.04 F1800
G1 X123.746 Y114.776 Z12 F30000
G1 Z11.6
G1 E.8 F1800
G1 F2621
G1 X123.691 Y114.697 E.00318
G1 X122.429 Y115.095 E.04389
G1 X122.429 Y109.991 E.16932
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.627 Y125.622 E.63773
G1 X133.588 Y125.843 E.00745
G1 X132.683 Y126.477 E.03667
G1 X132.461 Y126.438 E.00745
G1 X124.196 Y114.634 E.47802
G1 X123.803 Y114.758 E.01366
G1 X123.296 Y115.249 F30000
G1 F2621
G1 X122.618 Y115.463 E.02358
G1 X122.618 Y132.298 E.55845
G1 X122.418 Y132.298 E.00663
G1 X122.418 Y138.139 E.19378
G1 X122.618 Y138.139 E.00663
G1 X122.618 Y138.669 E.01756
G1 X122.418 Y138.669 E.00663
G1 X122.418 Y140.589 E.06371
G1 X122.618 Y140.589 E.00663
G1 X122.618 Y142.751 E.07169
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.55 Y109.181 E.03414
G1 X122.757 Y109.388 E.00972
G1 X134.057 Y125.527 E.65353
G1 X133.96 Y126.08 E.01864
G1 X132.778 Y126.908 E.04786
G1 X132.225 Y126.81 E.01864
G1 X124.034 Y115.112 E.47371
G1 X123.584 Y115.254 E.01565
G1 X123.529 Y115.175 E.00318
G1 X123.353 Y115.231 E.0061
G1 X123.051 Y115.737 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2621
M204 S5000
G1 X123.01 Y115.75 E.00132
G1 X123.01 Y132.69 E.52051
G1 X122.81 Y132.69 E.00615
G1 X122.81 Y133.863 E.03604
G1 X122.81 Y134.263 E.01229
G1 F2536.674
G1 X122.851 Y134.263 E.00126
G1 F2160
G1 X123.01 Y134.263 E.00489
G1 F2621
G1 X123.01 Y134.413 E.00462
G1 X123.01 Y135.267 E.02624
G1 X123.01 Y135.285 E.00055
G1 X122.851 Y135.285 E.00489
G1 X122.81 Y135.285 E.00126
G1 X122.81 Y137.347 E.06337
M73 P60 R9
G1 X122.81 Y137.747 E.01229
G1 X122.851 Y137.747 E.00126
G1 X123.01 Y137.747 E.00489
G1 X123.01 Y137.845 E.00299
G1 X123.01 Y139.061 E.03738
G1 X122.81 Y139.061 E.00615
G1 X122.81 Y140.197 E.03492
G1 X123.01 Y140.197 E.00615
G1 X123.01 Y142.913 E.08344
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.827 Y108.904 E.03016
G1 X123.059 Y109.135 E.01006
G1 X134.161 Y124.991 E.59475
G1 X134.39 Y125.319 E.01229
G1 X134.472 Y125.435 E.00436
G1 X134.318 Y126.308 E.02724
G1 X134.202 Y126.389 E.00436
G1 X133.314 Y127.011 E.0333
G1 X132.986 Y127.24 E.01229
G1 X132.87 Y127.322 E.00436
G1 X131.997 Y127.168 E.02724
G1 X131.915 Y127.052 E.00436
G1 X123.878 Y115.573 E.43059
G1 X123.587 Y115.664 E.00938
G1 F2040
G1 X123.428 Y115.714 E.00512
G1 X123.373 Y115.636 E.00295
G1 F2621
G1 X123.109 Y115.719 E.00851
M204 S10000
G1 X122.32 Y115.343 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2621
G1 X122.32 Y132.094 E.25771
; WIPE_START
G1 F15000
G1 X122.32 Y130.094 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.714 Y134.459 Z12 F30000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.24282
G1 F2621
G1 X122.714 Y135.089 E.01027
; WIPE_START
G1 F15000
G1 X122.714 Y134.459 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y140.793 Z12 F30000
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.232889
G1 F2621
G1 X122.32 Y141.806 E.01568
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.37 Y135.585 Z12 F30000
G1 X132.785 Y125.66 Z12
G1 Z11.6
G1 E.8 F1800
; LINE_WIDTH: 0.244891
G1 F2621
G1 X124.491 Y113.814 E.23801
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.638 Y115.452 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 93/160
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
G17
G3 Z12 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2544
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2544
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2544
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.618 Y115.936 F30000
G1 F2544
G1 X122.618 Y132.133 E.53727
G1 X122.418 Y132.133 E.00663
G1 X122.418 Y134.484 E.07799
G1 X122.618 Y134.484 E.00663
G1 X122.618 Y134.944 E.01527
G1 X122.418 Y134.944 E.00663
G1 X122.418 Y138.013 E.10179
G1 X122.618 Y138.013 E.00663
G1 X122.618 Y138.643 E.02088
G1 X122.418 Y138.643 E.00663
G1 X122.418 Y140.564 E.06373
G1 X122.618 Y140.564 E.00663
G1 X122.618 Y142.751 E.07255
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.618 Y115.559 E.04924
G1 X122.618 Y115.876 E.01054
G1 X123.051 Y115.833 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2544
M204 S5000
G1 X123.01 Y115.846 E.00132
G1 X123.01 Y132.525 E.5125
G1 X122.81 Y132.525 E.00615
G1 X122.81 Y133.692 E.03586
G1 X122.81 Y134.092 E.01229
G1 X122.851 Y134.092 E.00126
G1 F2400
G1 X123.01 Y134.092 E.00489
G1 F2544
G1 X123.01 Y134.222 E.00399
G1 X123.01 Y135.326 E.03393
G1 X123.01 Y135.336 E.00032
G1 X122.851 Y135.336 E.00489
G1 X122.81 Y135.336 E.00126
G1 X122.81 Y137.621 E.07019
G1 X122.851 Y137.621 E.00126
G1 X123.01 Y137.621 E.00489
G1 X123.01 Y137.706 E.00263
G1 X123.01 Y139.035 E.04081
G1 X122.81 Y139.035 E.00615
G1 X122.81 Y140.172 E.03494
G1 X123.01 Y140.172 E.00615
G1 X123.01 Y142.913 E.08424
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.505 Y125.482 E.61319
G1 X134.558 Y125.558 E.00283
G1 X134.441 Y126.222 E.02073
G1 X134.365 Y126.275 E.00283
G1 X132.822 Y127.355 E.05788
G1 X132.747 Y127.408 E.00282
G1 X132.083 Y127.291 E.02073
G1 X132.03 Y127.215 E.00282
G1 X123.878 Y115.573 E.43674
G1 X123.387 Y115.727 E.01582
G1 X123.109 Y115.815 E.00896
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2544
G1 X122.32 Y131.929 E.2537
G1 X122.32 Y140.767 F30000
; LINE_WIDTH: 0.232862
G1 F2544
G1 X122.32 Y141.806 E.01607
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z12.2 F30000
G1 X132.785 Y125.66 Z12.2
G1 Z11.8
G1 E.8 F1800
; LINE_WIDTH: 0.244883
G1 F2544
G1 X124.541 Y113.885 E.23656
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 94/160
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
G17
G3 Z12.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2537
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2537
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2537
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2537
M73 P61 R9
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y131.976 E.54458
G1 X122.418 Y131.976 E.00663
G1 X122.418 Y134.322 E.07785
G1 X122.618 Y134.322 E.00663
G1 X122.618 Y134.989 E.0221
G1 X122.418 Y134.989 E.00663
G1 X122.418 Y137.898 E.09649
G1 X122.618 Y137.898 E.00663
G1 X122.618 Y138.599 E.02327
G1 X122.418 Y138.599 E.00663
G1 X122.418 Y140.671 E.06872
G1 X122.618 Y140.671 E.00663
G1 X122.618 Y142.751 E.06899
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04568
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2537
M204 S5000
G1 X123.01 Y132.368 E.50766
G1 X122.81 Y132.368 E.00615
G1 X122.81 Y133.53 E.03573
G1 X122.81 Y133.93 E.01229
G1 X122.851 Y133.93 E.00126
G1 F2520
G1 X123.01 Y133.93 E.00489
G1 F2537
G1 X123.01 Y134.051 E.00371
G1 X123.01 Y135.377 E.04076
G1 X122.851 Y135.381 E.00489
G1 X122.81 Y135.381 E.00126
G1 X122.81 Y137.505 E.06528
G1 X122.851 Y137.505 E.00126
G1 X123.01 Y137.505 E.00489
G1 X123.01 Y137.58 E.00229
G1 X123.01 Y138.991 E.04336
G1 X122.81 Y138.991 E.00615
G1 X122.81 Y140.279 E.03956
G1 X123.01 Y140.279 E.00615
G1 X123.01 Y142.913 E.08094
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2537
G1 X122.32 Y131.772 E.25128
G1 X122.32 Y140.874 F30000
; LINE_WIDTH: 0.232986
G1 F2537
G1 X122.32 Y141.806 E.01442
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z12.4 F30000
G1 X132.785 Y125.66 Z12.4
G1 Z12
G1 E.8 F1800
; LINE_WIDTH: 0.244883
G1 F2537
G1 X124.541 Y113.885 E.23656
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 95/160
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
G17
G3 Z12.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2541
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2541
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2541
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.569 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2541
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y131.825 E.53959
G1 X122.418 Y131.825 E.00663
G1 X122.418 Y134.168 E.07772
G1 X122.618 Y134.168 E.00663
G1 X122.618 Y135.026 E.02847
G1 X122.418 Y135.026 E.00663
G1 X122.418 Y137.792 E.09174
G1 X122.618 Y137.792 E.00663
G1 X122.618 Y138.273 E.01597
G1 X122.418 Y138.274 E.00663
G1 X122.418 Y140.565 E.07599
G1 X122.618 Y140.565 E.00663
G1 X122.618 Y142.751 E.07251
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04568
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2541
M204 S5000
G1 X123.01 Y132.217 E.50303
G1 X122.81 Y132.217 E.00615
G1 X122.81 Y133.376 E.0356
G1 X122.81 Y133.776 E.01229
G1 X122.851 Y133.776 E.00126
G1 X123.01 Y133.776 E.00489
G1 X123.01 Y133.889 E.00349
G1 X123.01 Y135.418 E.04697
G1 X122.81 Y135.418 E.00615
G1 X122.81 Y137.4 E.06089
G1 X122.851 Y137.4 E.00126
G1 X123.01 Y137.4 E.00489
G1 X123.01 Y137.464 E.00199
G1 X123.01 Y138.664 E.03685
G1 X122.81 Y138.664 E.00615
G1 X122.81 Y140.173 E.04635
G1 X122.851 Y140.173 E.00126
G1 X123.01 Y140.173 E.00489
G1 X123.01 Y140.238 E.00199
G1 X123.01 Y142.913 E.0822
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2541
G1 X122.32 Y131.621 E.24896
G1 X122.32 Y134.371 F30000
G1 F2541
G1 X122.32 Y134.823 E.00694
G1 X122.415 Y138.033 F30000
; LINE_WIDTH: 0.118121
G1 F2541
G1 X122.226 Y138.033 E.00116
G1 X122.32 Y140.768 F30000
; LINE_WIDTH: 0.232862
G1 F2541
G1 X122.32 Y141.806 E.01606
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.37 Y135.585 Z12.6 F30000
M73 P62 R9
G1 X132.785 Y125.66 Z12.6
G1 Z12.2
G1 E.8 F1800
; LINE_WIDTH: 0.244889
G1 F2541
G1 X124.541 Y113.885 E.23657
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 96/160
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
G17
G3 Z12.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2538
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2538
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2538
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2538
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y131.675 E.53462
G1 X122.418 Y131.675 E.00663
G1 X122.418 Y134.019 E.07775
G1 X122.618 Y134.019 E.00663
G1 X122.618 Y135.058 E.03447
G1 X122.418 Y135.058 E.00663
G1 X122.418 Y140.415 E.1777
G1 X122.618 Y140.415 E.00663
G1 X122.618 Y142.751 E.07747
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X133.048 Y126.719 E.04191
G1 X132.655 Y126.994 E.01589
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04568
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2538
M204 S5000
G1 X123.01 Y132.067 E.49844
G1 X122.81 Y132.067 E.00615
G1 X122.81 Y133.227 E.03563
G1 X122.81 Y133.627 E.01229
G1 X122.851 Y133.627 E.00126
G1 X123.01 Y133.627 E.00489
G1 X123.01 Y133.735 E.00331
G1 X123.01 Y135.45 E.05271
G1 X122.81 Y135.45 E.00615
G1 X122.81 Y137.302 E.0569
G1 X122.851 Y137.302 E.00126
G1 X123.01 Y137.302 E.00489
G1 X123.01 Y137.359 E.00174
G1 X123.01 Y138.044 E.02106
G1 X122.81 Y138.044 E.00615
G1 X122.81 Y139.623 E.04853
G1 X122.81 Y140.023 E.01229
G1 X122.851 Y140.023 E.00126
G1 X123.01 Y140.023 E.00489
G1 X123.01 Y140.132 E.00335
G1 X123.01 Y142.913 E.08545
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2538
G1 X122.32 Y131.472 E.24666
G1 X122.32 Y134.223 F30000
G1 F2538
G1 X122.32 Y134.855 E.00973
G1 X122.32 Y140.619 F30000
; LINE_WIDTH: 0.232725
G1 F2538
G1 X122.32 Y141.806 E.01836
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.37 Y135.585 Z12.8 F30000
G1 X132.785 Y125.66 Z12.8
G1 Z12.4
G1 E.8 F1800
; LINE_WIDTH: 0.244883
G1 F2538
G1 X124.541 Y113.885 E.23656
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 97/160
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
G17
G3 Z12.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2538
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2538
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2538
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.682 Y109.991 E.01631
G1 X133.718 Y125.752 E.63826
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2538
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y131.533 E.5299
G1 X122.418 Y131.533 E.00663
G1 X122.418 Y133.877 E.07777
G1 X122.618 Y133.877 E.00663
G1 X122.618 Y135.085 E.04007
G1 X122.418 Y135.085 E.00663
G1 X122.418 Y140.345 E.17446
G1 X122.618 Y140.345 E.00663
G1 X122.618 Y142.751 E.07981
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.639 Y109.27 E.03831
G1 X122.757 Y109.388 E.00555
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04569
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2538
M204 S5000
G1 X123.01 Y131.925 E.49406
G1 X122.81 Y131.925 E.00615
G1 X122.81 Y133.085 E.03566
G1 X122.81 Y133.485 E.01229
G1 X122.851 Y133.485 E.00126
G1 X123.01 Y133.485 E.00489
G1 X123.01 Y133.586 E.00309
G1 X123.01 Y135.477 E.05812
G1 X122.81 Y135.477 E.00615
G1 X122.81 Y137.211 E.05328
G1 X122.851 Y137.211 E.00126
G1 X123.01 Y137.211 E.00489
G1 X123.01 Y137.261 E.00152
G1 X123.01 Y137.418 E.00484
G1 X122.81 Y137.418 E.00615
G1 X122.81 Y139.953 E.07787
G1 X122.851 Y139.953 E.00126
G1 X123.01 Y139.953 E.00489
G1 X123.01 Y139.982 E.00091
M73 P62 R8
G1 X123.01 Y142.913 E.09006
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
M73 P63 R8
G1 X122.916 Y108.993 E.03402
G1 X123.059 Y109.135 E.00619
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2538
G1 X122.32 Y131.329 E.24447
G1 X122.32 Y134.081 F30000
G1 F2538
G1 X122.32 Y134.882 E.01232
G1 X122.32 Y140.548 F30000
; LINE_WIDTH: 0.232671
G1 F2538
G1 X122.32 Y141.806 E.01944
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z13 F30000
G1 X132.785 Y125.66 Z13
G1 Z12.6
G1 E.8 F1800
; LINE_WIDTH: 0.244889
G1 F2538
G1 X124.541 Y113.885 E.23657
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 98/160
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
G17
G3 Z13 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2536
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2536
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2536
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2536
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y131.391 E.52518
G1 X122.418 Y131.391 E.00663
G1 X122.418 Y133.741 E.07795
G1 X122.618 Y133.741 E.00663
G1 X122.618 Y135.104 E.04523
G1 X122.418 Y135.104 E.00663
G1 X122.418 Y140.264 E.17115
G1 X122.618 Y140.264 E.00663
G1 X122.618 Y142.751 E.08249
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04568
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2536
M204 S5000
G1 X123.01 Y131.783 E.48969
G1 X122.81 Y131.783 E.00615
G1 X122.81 Y132.949 E.03582
G1 X122.81 Y133.349 E.01229
G1 X122.851 Y133.349 E.00126
G1 X123.01 Y133.349 E.00489
G1 X123.01 Y133.444 E.00294
G1 X123.01 Y135.496 E.06305
G1 X122.81 Y135.496 E.00615
G1 X122.81 Y139.872 E.13445
G1 X122.851 Y139.872 E.00126
G1 X123.01 Y139.872 E.00489
G1 X123.01 Y139.912 E.00122
G1 X123.01 Y142.913 E.09223
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2536
G1 X122.32 Y131.187 E.24228
G1 X122.32 Y133.944 F30000
G1 F2536
G1 X122.32 Y134.901 E.01471
G1 X122.32 Y140.467 F30000
; LINE_WIDTH: 0.232616
G1 F2536
G1 X122.32 Y141.806 E.02068
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z13.2 F30000
G1 X132.785 Y125.66 Z13.2
G1 Z12.8
G1 E.8 F1800
; LINE_WIDTH: 0.244883
G1 F2536
G1 X124.541 Y113.885 E.23656
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 99/160
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
G17
G3 Z13.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2541
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2541
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2541
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.569 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2541
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y131.255 E.52069
G1 X122.418 Y131.255 E.00663
G1 X122.418 Y133.607 E.07802
G1 X122.618 Y133.607 E.00663
G1 X122.618 Y135.12 E.05017
G1 X122.418 Y135.12 E.00663
G1 X122.418 Y140.173 E.16764
G1 X122.618 Y140.173 E.00663
G1 X122.618 Y142.751 E.0855
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04569
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P64 R8
G1 F2541
M204 S5000
G1 X123.01 Y131.647 E.48553
G1 X122.81 Y131.647 E.00615
G1 X122.81 Y132.815 E.03588
G1 X122.81 Y133.215 E.01229
G1 X122.851 Y133.215 E.00126
G1 X123.01 Y133.215 E.00489
G1 X123.01 Y133.308 E.00285
G1 X123.01 Y135.512 E.06772
G1 X122.81 Y135.512 E.00615
G1 X122.81 Y138.117 E.08005
G1 X122.81 Y138.517 E.01229
G1 F2406.487
G1 X122.851 Y138.517 E.00126
G1 F2040
G1 X123.01 Y138.517 E.00489
G1 X123.01 Y138.594 E.00237
G1 F2541
G1 X122.851 Y138.594 E.00489
G1 X122.81 Y138.594 E.00126
G1 X122.81 Y139.781 E.03648
G1 X122.851 Y139.781 E.00126
G1 X123.01 Y139.781 E.00489
G1 X123.01 Y139.831 E.00153
G1 X123.01 Y142.913 E.09471
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2541
G1 X122.32 Y131.052 E.24019
G1 X122.32 Y133.811 F30000
G1 F2541
G1 X122.32 Y134.916 E.01701
G1 X122.32 Y140.377 F30000
; LINE_WIDTH: 0.232561
G1 F2541
G1 X122.32 Y141.806 E.02208
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z13.4 F30000
G1 X132.785 Y125.66 Z13.4
G1 Z13
G1 E.8 F1800
; LINE_WIDTH: 0.244889
G1 F2541
G1 X124.541 Y113.885 E.23657
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 100/160
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
G17
G3 Z13.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2541
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2541
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2541
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.569 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2541
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y131.12 E.51619
G1 X122.418 Y131.12 E.00663
G1 X122.418 Y133.479 E.07825
G1 X122.618 Y133.479 E.00663
G1 X122.618 Y135.129 E.05473
G1 X122.418 Y135.129 E.00663
G1 X122.418 Y140.072 E.16398
G1 X122.618 Y140.072 E.00663
G1 X122.618 Y142.751 E.08886
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04568
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2541
M204 S5000
G1 X123.01 Y131.512 E.48136
G1 X122.81 Y131.512 E.00615
G1 X122.81 Y133.087 E.04839
G1 X122.851 Y133.087 E.00126
G1 X123.01 Y133.087 E.00489
G1 X123.01 Y133.174 E.00268
G1 X123.01 Y135.521 E.07211
G1 X122.81 Y135.521 E.00615
G1 X122.81 Y137.58 E.06329
G1 X122.81 Y137.98 E.01229
G1 F2406.487
G1 X122.851 Y137.98 E.00126
G1 F2040
G1 X123.01 Y137.98 E.00489
G1 F2541
G1 X123.01 Y138.476 E.01522
G1 X122.81 Y138.478 E.00615
G1 X122.81 Y139.68 E.03693
G1 X122.851 Y139.68 E.00126
G1 X123.01 Y139.68 E.00489
G1 X123.01 Y139.74 E.00185
G1 X123.01 Y142.913 E.09749
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2541
G1 X122.32 Y130.916 E.23811
G1 X122.32 Y133.682 F30000
G1 F2541
G1 X122.32 Y134.925 E.01912
G1 X122.32 Y140.276 F30000
; LINE_WIDTH: 0.232507
G1 F2541
G1 X122.32 Y141.806 E.02364
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.37 Y135.585 Z13.6 F30000
G1 X132.785 Y125.66 Z13.6
G1 Z13.2
G1 E.8 F1800
; LINE_WIDTH: 0.244889
G1 F2541
G1 X124.541 Y113.885 E.23657
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 101/160
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
G17
G3 Z13.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2578
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2578
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
M73 P65 R8
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2578
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2578
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y130.989 E.51184
G1 X122.418 Y130.989 E.00663
G1 X122.418 Y133.351 E.07836
G1 X122.618 Y133.351 E.00663
G1 X122.618 Y134.881 E.05076
G1 X122.418 Y134.881 E.00663
G1 X122.418 Y139.96 E.16848
G1 X122.618 Y139.96 E.00663
G1 X122.618 Y142.751 E.09257
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04568
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2578
M204 S5000
G1 X123.01 Y131.381 E.47734
G1 X122.81 Y131.381 E.00615
G1 X122.81 Y132.959 E.04849
G1 X122.851 Y132.959 E.00126
G1 X123.01 Y132.959 E.00489
G1 X123.01 Y133.046 E.00267
G1 X123.01 Y135.273 E.06844
G1 X122.81 Y135.273 E.00615
G1 X122.81 Y137.064 E.05502
G1 X122.81 Y137.464 E.01229
G1 F2406.487
G1 X122.851 Y137.464 E.00126
G1 F2040
G1 X123.01 Y137.464 E.00489
G1 F2578
G1 X123.01 Y137.939 E.01462
G1 X123.01 Y138.353 E.01271
G1 X122.81 Y138.353 E.00615
G1 X122.81 Y139.568 E.03733
G1 X122.851 Y139.568 E.00126
G1 X123.01 Y139.568 E.00489
G1 X123.01 Y139.639 E.00218
G1 X123.01 Y142.913 E.1006
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2578
G1 X122.32 Y130.785 E.23609
G1 X122.32 Y133.554 F30000
G1 F2578
G1 X122.32 Y134.677 E.01728
; WIPE_START
G1 F15000
G1 X122.32 Y133.554 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.714 Y137.66 Z13.8 F30000
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.24282
G1 F2578
G1 X122.714 Y138.157 E.0081
; WIPE_START
G1 F15000
G1 X122.714 Y137.66 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y140.163 Z13.8 F30000
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.232455
G1 F2578
G1 X122.32 Y141.806 E.02536
G1 X122.297 Y141.853 E.00082
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.37 Y135.585 Z13.8 F30000
G1 X132.785 Y125.66 Z13.8
G1 Z13.4
G1 E.8 F1800
; LINE_WIDTH: 0.244877
G1 F2578
G1 X124.541 Y113.885 E.23656
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 102/160
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
G17
G3 Z13.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2542
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2542
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2542
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2542
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y130.859 E.50753
G1 X122.418 Y130.859 E.00663
G1 X122.418 Y133.226 E.07853
G1 X122.618 Y133.226 E.00663
G1 X122.618 Y134.425 E.03977
G1 X122.418 Y134.425 E.00663
G1 X122.418 Y137.358 E.09729
G1 X122.618 Y137.358 E.00663
G1 X122.618 Y137.827 E.01555
G1 X122.418 Y137.827 E.00663
G1 X122.418 Y139.837 E.06668
G1 X122.618 Y139.837 E.00663
G1 X122.618 Y142.751 E.09666
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.143 Y125.65 E.6585
G1 X134.083 Y125.994 E.0116
G1 X132.655 Y126.994 E.05781
G1 X132.311 Y126.933 E.0116
G1 X124.034 Y115.112 E.47868
G1 X122.72 Y115.526 E.04568
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2542
M204 S5000
G1 X123.01 Y131.251 E.47334
G1 X122.81 Y131.251 E.00615
G1 X122.81 Y132.834 E.04865
G1 X122.851 Y132.834 E.00126
G1 X123.01 Y132.834 E.00489
G1 X123.01 Y132.918 E.00258
G1 X123.01 Y134.817 E.05835
G1 X122.81 Y134.817 E.00615
G1 X122.81 Y136.566 E.05374
G1 X122.81 Y136.966 E.01229
G1 F2406.487
G1 X122.851 Y136.966 E.00126
G1 F2040
G1 X123.01 Y136.966 E.00489
G1 F2542
G1 X123.01 Y137.423 E.01405
G1 X123.01 Y138.219 E.02445
G1 X122.81 Y138.219 E.00615
G1 X122.81 Y139.445 E.03767
G1 X122.851 Y139.445 E.00126
G1 X123.01 Y139.445 E.00489
G1 X123.01 Y139.527 E.00253
G1 X123.01 Y142.913 E.10405
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.558 Y125.558 E.61601
G1 X134.441 Y126.222 E.02073
G1 X132.747 Y127.408 E.06353
G1 X132.083 Y127.291 E.02073
G1 X123.878 Y115.573 E.43956
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
M73 P66 R8
G1 F2542
G1 X122.32 Y130.655 E.23409
G1 X122.32 Y133.429 F30000
G1 F2542
G1 X122.32 Y134.221 E.01218
G1 X122.226 Y137.592 F30000
; LINE_WIDTH: 0.10477
G1 F2542
G1 X122.415 Y137.592 E.00095
G1 X122.32 Y140.04 F30000
; LINE_WIDTH: 0.232405
G1 F2542
G1 X122.32 Y141.806 E.02726
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.37 Y135.585 Z14 F30000
G1 X132.785 Y125.66 Z14
G1 Z13.6
G1 E.8 F1800
; LINE_WIDTH: 0.244883
G1 F2542
G1 X124.541 Y113.886 E.23656
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 103/160
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
G17
G3 Z14 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y114.081
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2539
G1 X123.244 Y112.51 E.05212
G1 X123.414 Y112.456 E.00594
G1 X124.316 Y113.743 E.05212
G1 X123.301 Y114.063 E.03529
G1 X122.837 Y114.636 F30000
G1 F2539
G1 X122.837 Y111.219 E.11336
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X122.894 Y114.618 E.05094
G1 X122.429 Y115.191 F30000
G1 F2539
G1 X122.429 Y109.991 E.17251
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.718 Y125.752 E.643
G1 X132.553 Y126.568 E.04721
G1 X124.196 Y114.634 E.48328
G1 X122.487 Y115.173 E.05946
G1 X122.663 Y115.544 F30000
G1 F2539
G1 X122.618 Y115.559 E.00156
G1 X122.618 Y130.733 E.50336
G1 X122.418 Y130.733 E.00663
G1 X122.418 Y133.102 E.07857
G1 X122.618 Y133.102 E.00663
G1 X122.618 Y133.968 E.02873
G1 X122.418 Y133.969 E.00663
G1 X122.418 Y137.194 E.10697
G1 X122.618 Y137.194 E.00663
G1 X122.618 Y137.681 E.01617
G1 X122.418 Y137.681 E.00663
G1 X122.418 Y139.702 E.06704
G1 X122.618 Y139.702 E.00663
G1 X122.618 Y142.751 E.10113
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134.115 Y125.609 E.65684
G1 X134.042 Y126.023 E.01394
G1 X132.696 Y126.965 E.0545
G1 X132.282 Y126.892 E.01394
G1 X124.034 Y115.112 E.47702
G1 X122.72 Y115.526 E.04569
G1 X123.01 Y115.846 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2539
M204 S5000
G1 X123.01 Y131.125 E.46948
G1 X122.81 Y131.125 E.00615
G1 X122.81 Y132.71 E.04869
G1 X122.851 Y132.71 E.00126
G1 X123.01 Y132.71 E.00489
G1 X123.01 Y132.793 E.00256
G1 X123.01 Y134.358 E.04809
G1 X122.81 Y134.359 E.00615
G1 X122.81 Y136.402 E.06277
G1 X122.81 Y136.802 E.01229
G1 X122.851 Y136.802 E.00126
G1 F2520
G1 X123.01 Y136.802 E.00489
G1 F2539
G1 X123.01 Y136.925 E.00378
G1 X123.01 Y138.073 E.03529
G1 X122.81 Y138.073 E.00615
G1 X122.81 Y138.91 E.02571
G1 X122.81 Y139.31 E.01229
G1 X122.851 Y139.31 E.00126
G1 X123.01 Y139.31 E.00489
G1 X123.01 Y139.404 E.00288
G1 X123.01 Y142.913 E.10783
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.529 Y125.517 E.61448
G1 X134.4 Y126.251 E.0229
G1 X132.788 Y127.379 E.06046
G1 X132.054 Y127.25 E.0229
G1 X123.878 Y115.573 E.43803
G1 X123.068 Y115.828 E.0261
M204 S10000
G1 X122.32 Y115.439 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2539
G1 X122.32 Y130.529 E.23216
G1 X122.32 Y133.305 F30000
G1 F2539
G1 X122.32 Y133.766 E.00708
G1 X122.226 Y137.437 F30000
; LINE_WIDTH: 0.12335
G1 F2539
G1 X122.415 Y137.437 E.00124
G1 X122.32 Y139.906 F30000
; LINE_WIDTH: 0.232358
G1 F2539
G1 X122.32 Y141.806 E.02933
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z14.2 F30000
G1 X132.785 Y125.66 Z14.2
G1 Z13.8
G1 E.8 F1800
; LINE_WIDTH: 0.244883
G1 F2539
G1 X124.541 Y113.885 E.23656
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X125.688 Y115.524 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 104/160
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
G17
G3 Z14.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y113.811
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2535
G1 X123.244 Y112.51 E.04315
G1 X123.414 Y112.456 E.00594
G1 X124.16 Y113.521 E.04315
G1 X123.301 Y113.793 E.0299
G1 X122.837 Y114.366 F30000
G1 F2535
G1 X122.837 Y111.219 E.10439
G1 X123.007 Y111.165 E.00594
G1 X133.151 Y125.652 E.58667
G1 X132.653 Y126.002 E.0202
G1 X124.358 Y114.156 E.47968
G1 X124.008 Y114.267 E.01217
G1 X123.853 Y114.045 E.00897
G1 X122.894 Y114.348 E.03338
G1 X122.429 Y114.921 F30000
G1 F2535
G1 X122.429 Y109.991 E.16354
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.682 Y109.991 E.01631
G1 X133.57 Y125.54 E.62968
G1 X133.506 Y125.901 E.01214
G1 X132.765 Y126.42 E.03004
G1 X132.404 Y126.357 E.01214
G1 X124.196 Y114.634 E.4747
G1 X123.846 Y114.745 E.01217
G1 X123.691 Y114.523 E.00897
G1 X122.487 Y114.903 E.04189
G1 X122.618 Y115.288 F30000
G1 F2535
G1 X122.618 Y130.608 E.50818
G1 X122.418 Y130.608 E.00663
G1 X122.418 Y132.981 E.07871
G1 X122.618 Y132.981 E.00663
G1 X122.618 Y133.502 E.01731
G1 X122.418 Y133.503 E.00663
G1 X122.418 Y136.983 E.11541
G1 X122.618 Y136.983 E.00663
G1 X122.618 Y137.525 E.01798
G1 X122.418 Y137.525 E.00663
G1 X122.418 Y139.556 E.06737
G1 X122.618 Y139.556 E.00663
G1 X122.618 Y142.751 E.10599
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X134 Y125.445 E.65021
G1 X133.878 Y126.137 E.02333
G1 X132.86 Y126.85 E.04123
G1 X132.167 Y126.728 E.02333
G1 X124.034 Y115.112 E.47039
G1 X123.684 Y115.223 E.01217
G1 X123.529 Y115.001 E.00897
G1 X122.675 Y115.27 E.02968
G1 X123.01 Y115.576 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2535
M204 S5000
M73 P67 R8
G1 X123.01 Y131 E.47394
G1 X122.81 Y131 E.00615
G1 X122.81 Y132.588 E.04882
G1 X122.851 Y132.588 E.00126
G1 X123.01 Y132.588 E.00489
G1 X123.01 Y132.669 E.00246
G1 X123.01 Y133.893 E.03762
G1 X122.81 Y133.894 E.00615
G1 X122.81 Y136.191 E.07058
G1 X122.81 Y136.591 E.01229
G1 F2406.487
M73 P67 R7
G1 X122.851 Y136.591 E.00126
G1 F2040
G1 X123.01 Y136.591 E.00489
G1 F2535
G1 X123.01 Y136.761 E.00522
G1 X123.01 Y137.917 E.03553
G1 X122.81 Y137.917 E.00615
G1 X122.81 Y138.764 E.02602
G1 X122.81 Y139.164 E.01229
G1 X122.851 Y139.164 E.00126
G1 X123.01 Y139.164 E.00489
G1 X123.01 Y139.269 E.00324
G1 X123.01 Y142.913 E.11197
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.414 Y125.353 E.60834
G1 X134.236 Y126.365 E.03159
G1 X132.952 Y127.265 E.04817
G1 X131.939 Y127.086 E.03159
G1 X123.878 Y115.573 E.43188
G1 X123.528 Y115.683 E.01128
G1 X123.373 Y115.461 E.00831
G1 X123.068 Y115.558 E.00983
M204 S10000
G1 X122.32 Y115.169 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2535
G1 X122.32 Y130.404 E.23439
G1 X122.32 Y139.759 F30000
; LINE_WIDTH: 0.232314
G1 F2535
G1 X122.32 Y141.806 E.03158
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.369 Y135.585 Z14.4 F30000
G1 X132.785 Y125.66 Z14.4
G1 Z14
G1 E.8 F1800
; LINE_WIDTH: 0.244872
G1 F2535
G1 X124.522 Y113.859 E.23708
; LINE_WIDTH: 0.259964
G1 X124.478 Y113.823 E.00101
; LINE_WIDTH: 0.299579
G2 X124.401 Y113.794 I-.049 J.015 E.002
G1 X124.012 Y113.917 E.00852
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F14026.411
G1 X124.401 Y113.794 E-.62049
G1 X124.434 Y113.786 E-.05241
G1 X124.478 Y113.823 E-.0871
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 105/160
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
G17
G3 Z14.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y113.462
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2524
G1 X123.244 Y112.51 E.03158
G1 X123.414 Y112.456 E.00594
G1 X123.96 Y113.236 E.03158
G1 X123.301 Y113.444 E.02294
G1 X122.837 Y114.017 F30000
G1 F2524
G1 X122.837 Y111.219 E.09283
G1 X123.007 Y111.165 E.00594
G1 X133.025 Y125.472 E.57936
G1 X132.971 Y125.779 E.01034
G1 X132.833 Y125.875 E.00559
G1 X132.526 Y125.821 E.01034
G1 X124.358 Y114.156 E.47237
G1 X124.208 Y114.204 E.00522
G1 X123.853 Y113.696 E.02053
G1 X122.894 Y113.999 E.03338
G1 X122.429 Y114.452 F30000
G1 F2524
G1 X122.429 Y109.991 E.14798
G1 X122.229 Y109.991 E.00663
G1 X122.229 Y109.642 E.01157
G1 X122.4 Y109.588 E.00594
G1 X122.6 Y109.874 E.01157
G1 X133.455 Y125.376 E.62778
G1 X133.343 Y126.015 E.02152
G1 X132.928 Y126.305 E.01677
G1 X132.289 Y126.193 E.02152
G1 X124.196 Y114.634 E.46806
G1 X124.046 Y114.682 E.00522
G1 X123.691 Y114.174 E.02053
G1 X122.429 Y114.572 E.04388
G1 X122.429 Y114.512 E.002
G1 X122.618 Y114.94 F30000
G1 F2524
G1 X122.618 Y130.484 E.51562
G1 X122.418 Y130.483 E.00663
G1 X122.418 Y132.859 E.07883
G1 X122.618 Y132.859 E.00663
G1 X122.618 Y133.107 E.00821
G1 X122.418 Y133.107 E.00663
G1 X122.418 Y135.968 E.09491
G1 X122.618 Y135.968 E.00663
G1 X122.618 Y136.701 E.02432
G1 X122.418 Y136.701 E.00663
G1 X122.418 Y139.397 E.08943
G1 X122.618 Y139.397 E.00663
G1 X122.618 Y142.751 E.11125
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.757 Y109.388 E.04386
G1 X133.885 Y125.281 E.64357
G1 X133.714 Y126.252 E.03271
G1 X133.024 Y126.736 E.02796
G1 X132.053 Y126.564 E.03271
G1 X124.034 Y115.112 E.46376
G1 X123.884 Y115.159 E.00522
G1 X123.529 Y114.652 E.02053
G1 X122.675 Y114.921 E.02968
G1 X123.01 Y115.227 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2524
M204 S5000
G1 X123.01 Y130.877 E.48087
G1 X122.81 Y130.876 E.00615
G1 X122.81 Y132.467 E.0489
G1 X122.851 Y132.467 E.00126
G1 X123.01 Y132.467 E.00489
G1 X123.01 Y132.547 E.00246
G1 X123.01 Y133.499 E.02924
G1 X122.81 Y133.499 E.00615
G1 X122.81 Y135.175 E.05149
G1 X122.81 Y135.575 E.01229
G1 F2406.49
G1 X122.851 Y135.575 E.00126
G1 F2040
G1 X123.01 Y135.574 E.00489
G1 F2524
G1 X123.01 Y135.974 E.01229
G1 X123.01 Y136.55 E.01768
G1 X123.01 Y137.093 E.01669
G1 X122.81 Y137.093 E.00615
G1 X122.81 Y138.605 E.04646
G1 X122.81 Y139.005 E.01229
G1 X122.851 Y139.005 E.00126
G1 X123.01 Y139.005 E.00489
G1 X123.01 Y139.123 E.00362
G1 X123.01 Y142.913 E.11647
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.059 Y109.135 E.04022
G1 X134.3 Y125.189 E.60219
G1 X134.072 Y126.48 E.04028
G1 X133.116 Y127.15 E.03588
G1 X131.825 Y126.922 E.04028
G1 X123.878 Y115.573 E.42574
G1 X123.728 Y115.62 E.00483
G1 X123.373 Y115.113 E.01902
G1 X123.068 Y115.209 E.00983
M204 S10000
G1 X122.32 Y114.82 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2524
G1 X122.32 Y130.279 E.23784
G1 X122.32 Y139.6 F30000
; LINE_WIDTH: 0.232272
G1 F2524
G1 X122.32 Y141.806 E.03403
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.36 Y135.579 Z14.6 F30000
G1 X132.798 Y125.59 Z14.6
G1 Z14.2
G1 E.8 F1800
; LINE_WIDTH: 0.244904
G1 F2524
G1 X132.703 Y125.543 E.00173
G1 X124.522 Y113.859 E.23476
; LINE_WIDTH: 0.262985
G1 X124.479 Y113.829 E.00094
; LINE_WIDTH: 0.299186
G1 X124.436 Y113.799 E.0011
; LINE_WIDTH: 0.335387
G1 X124.393 Y113.769 E.00125
; LINE_WIDTH: 0.393318
G1 X124.36 Y113.758 E.001
G1 X124.11 Y113.402 E.0124
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F10274.032
G1 X124.36 Y113.758 E-.70334
G1 X124.393 Y113.769 E-.05666
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 106/160
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
G17
G3 Z14.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X123.244 Y112.597
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2577
G1 X123.414 Y112.543 E.00594
G1 X123.71 Y112.966 E.01713
G1 X123.244 Y113.113 E.01624
G1 X123.244 Y112.657 E.01513
G1 X122.837 Y112.943 F30000
G1 F2577
G1 X122.837 Y111.306 E.05432
G1 X123.007 Y111.252 E.00594
M73 P68 R7
G1 X132.898 Y125.378 E.57202
G1 X132.836 Y125.732 E.01194
G1 X132.481 Y125.67 E.01194
G1 X123.853 Y113.348 E.49897
G1 X122.837 Y113.668 E.03537
G1 X122.837 Y113.003 E.02206
G1 X122.429 Y113.613 F30000
G1 F2577
G1 X122.429 Y110.015 E.11937
G1 X122.505 Y109.991 E.00264
G1 X122.229 Y109.991 E.00916
G1 X122.229 Y109.729 E.00868
G1 X122.4 Y109.675 E.00594
G1 X122.6 Y109.961 E.01157
G1 X133.328 Y125.282 E.62044
G1 X133.191 Y126.06 E.02621
G1 X133.023 Y126.178 E.00682
G1 X132.244 Y126.041 E.02621
G1 X123.691 Y113.826 E.49467
G1 X122.429 Y114.224 E.04388
G1 X122.429 Y113.673 E.01825
G1 X122.022 Y114.258 F30000
G1 F2577
G1 X122.022 Y110.398 E.12804
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y109.277 E.00092
G1 X133.758 Y125.187 E.64427
G1 X133.563 Y126.297 E.0374
G1 X133.118 Y126.609 E.01801
G1 X132.008 Y126.413 E.0374
G1 X123.529 Y114.304 E.49036
G1 X122.618 Y114.591 E.03167
G1 X122.618 Y130.364 E.52321
G1 X122.418 Y130.364 E.00663
G1 X122.418 Y135.524 E.17119
G1 X122.618 Y135.524 E.00663
G1 X122.618 Y136.693 E.03877
G1 X122.418 Y136.693 E.00663
G1 X122.418 Y139.226 E.08401
G1 X122.618 Y139.226 E.00663
G1 X122.618 Y142.751 E.11693
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y114.318 E.90507
; WIPE_START
G1 F8843.478
G1 X122.022 Y112.318 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.01 Y114.878 Z14.8 F30000
G1 Z14.4
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2577
M204 S5000
G1 X123.01 Y130.756 E.48787
G1 X122.81 Y130.756 E.00615
G1 X122.81 Y132.348 E.04893
G1 X122.851 Y132.348 E.00126
G1 X123.01 Y132.348 E.00489
G1 X123.01 Y132.426 E.00241
G1 X123.01 Y133.347 E.02829
G1 X122.81 Y133.347 E.00615
G1 X122.81 Y134.732 E.04256
G1 X122.81 Y135.132 E.01229
G1 F2406.487
G1 X122.851 Y135.132 E.00126
G1 F2040
G1 X123.01 Y135.132 E.00489
G1 F2577
G1 X123.01 Y135.533 E.01232
G1 X123.01 Y137.085 E.04769
G1 X122.81 Y137.085 E.00615
G1 X122.81 Y138.434 E.04143
G1 X122.81 Y138.834 E.01229
G1 X122.851 Y138.834 E.00126
G1 F2400
G1 X123.01 Y138.834 E.00489
G1 F2577
G1 X123.01 Y138.964 E.004
G1 X123.01 Y142.913 E.12135
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.153 E.00204
G1 X134.173 Y125.095 E.59798
G1 X133.921 Y126.525 E.04462
G1 X133.21 Y127.023 E.02666
G1 X131.78 Y126.771 E.04462
G1 X123.373 Y114.764 E.45038
G1 X123.068 Y114.86 E.00983
M204 S10000
G1 X122.32 Y114.472 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2577
G1 X122.32 Y130.16 E.24137
; WIPE_START
G1 F15000
G1 X122.32 Y128.16 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.714 Y132.544 Z14.8 F30000
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.24282
G1 F2577
G1 X122.714 Y133.151 E.00989
; WIPE_START
G1 F15000
G1 X122.714 Y132.544 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y135.728 Z14.8 F30000
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.23172
G1 F2577
G1 X122.32 Y136.49 E.01172
G1 X122.32 Y139.429 F30000
; LINE_WIDTH: 0.232233
G1 F2577
G1 X122.32 Y141.806 E.03666
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.3 Y135.54 Z14.8 F30000
G1 X132.643 Y125.491 Z14.8
G1 Z14.4
G1 E.8 F1800
; LINE_WIDTH: 0.144877
G1 F2577
G1 X132.629 Y125.437 E.00046
G1 X123.985 Y113.093 E.1252
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X125.133 Y114.731 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 107/160
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
G17
G3 Z14.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.837 Y112.593
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2310
G1 X122.837 Y111.655 E.03114
G1 X123.007 Y111.601 E.00594
G1 X123.962 Y112.965 E.05523
G1 X122.837 Y113.32 E.03916
G1 X122.837 Y112.653 E.0221
G1 X122.429 Y113.264 F30000
G1 F2310
G1 X122.429 Y110.364 E.09621
G1 X122.6 Y110.31 E.00594
G1 X133.164 Y125.397 E.61096
G1 X133.076 Y125.897 E.01683
G1 X132.908 Y126.015 E.00682
G1 X132.408 Y125.926 E.01683
G1 X123.691 Y113.477 E.50414
G1 X122.429 Y113.875 E.04388
G1 X122.429 Y113.324 E.01828
G1 X122.022 Y113.909 F30000
G1 F2310
G1 X122.022 Y110.398 E.11646
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y109.626 E.01248
G1 X133.595 Y125.302 E.6348
G1 X133.448 Y126.133 E.02802
G1 X133.003 Y126.445 E.01801
G1 X132.171 Y126.298 E.02802
G1 X123.529 Y113.955 E.49983
G1 X122.618 Y114.242 E.03167
G1 X122.618 Y130.242 E.53073
G1 X122.418 Y130.241 E.00663
G1 X122.418 Y132.623 E.07901
G1 X122.618 Y132.623 E.00663
G1 X122.618 Y132.971 E.01155
G1 X122.418 Y132.971 E.00663
G1 X122.418 Y135.079 E.06991
G1 X122.618 Y135.079 E.00663
G1 X122.618 Y136.682 E.05319
G1 X122.418 Y136.683 E.00663
G1 X122.418 Y139.041 E.07824
G1 X122.618 Y139.041 E.00663
G1 X122.618 Y142.751 E.12305
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y113.969 E.91665
; WIPE_START
G1 F8843.478
G1 X122.022 Y111.969 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.01 Y114.53 Z15 F30000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2310
M204 S5000
G1 X123.01 Y130.634 E.49485
G1 X122.81 Y130.634 E.00615
G1 X122.81 Y132.231 E.04908
G1 X122.851 Y132.231 E.00126
G1 X123.01 Y132.231 E.00489
G1 X123.01 Y132.307 E.00233
G1 X123.01 Y133.364 E.03246
G1 X122.81 Y133.364 E.00615
G1 X122.81 Y134.287 E.02837
G1 X122.81 Y134.687 E.01229
G1 X122.851 Y134.687 E.00126
G1 F2040
G1 X123.01 Y134.687 E.00489
G1 F2310
G1 X123.01 Y135.091 E.01243
G1 X123.01 Y137.074 E.06092
G1 X122.81 Y137.074 E.00615
G1 X122.81 Y138.249 E.0361
G1 X122.81 Y138.649 E.01229
G1 X122.851 Y138.649 E.00126
G1 F2280
G1 X123.01 Y138.649 E.00489
G1 F2310
G1 X123.01 Y138.793 E.00441
G1 X123.01 Y142.913 E.12661
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.502 E.01275
G1 X134.009 Y125.21 E.58921
G1 X133.806 Y126.361 E.03593
G1 X133.095 Y126.859 E.02666
G1 X131.943 Y126.656 E.03593
G1 X123.373 Y114.415 E.45915
G1 X123.068 Y114.512 E.00983
M204 S10000
G1 X122.32 Y114.123 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2310
M73 P69 R7
G1 X122.32 Y130.038 E.24485
G1 X122.32 Y135.282 F30000
G1 F2310
G1 X122.32 Y136.479 E.01841
G1 X122.32 Y139.245 F30000
; LINE_WIDTH: 0.232197
G1 F2310
G1 X122.32 Y141.806 E.0395
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.387 Y135.596 Z15 F30000
G1 X132.769 Y125.783 Z15
G1 Z14.6
G1 E.8 F1800
; LINE_WIDTH: 0.559015
G1 F2310
G1 X132.677 Y125.505 E.01234
G1 X124.03 Y113.157 E.63396
; WIPE_START
G1 F6975.466
G1 X125.177 Y114.795 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.299 Y110.191 Z15 F30000
G1 Z14.6
G1 E.8 F1800
; LINE_WIDTH: 0.440986
G1 F2310
G3 X122.22 Y109.139 I3.297 J-.776 E.03435
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9043.738
G1 X122.22 Y109.69 E-.39552
G1 X122.299 Y110.191 E-.36448
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 108/160
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
G17
G3 Z15 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X122.022 Y116.803
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F2551
G1 X122.193 Y116.749 E.00594
G1 X122.618 Y117.357 E.02458
G1 X122.618 Y130.125 E.42356
G1 X122.418 Y130.125 E.00663
G1 X122.418 Y132.506 E.07898
G1 X122.618 Y132.506 E.00663
G1 X122.618 Y136.675 E.13828
G1 X122.418 Y136.675 E.00663
G1 X122.418 Y138.834 E.07163
G1 X122.618 Y138.834 E.00663
G1 X122.618 Y142.751 E.12992
G1 X121.822 Y143.546 E.03734
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y116.863 E.82063
; WIPE_START
G1 F8843.478
G1 X122.193 Y116.749 E-.078
G1 X122.618 Y117.357 E-.28163
G1 X122.618 Y118.41 E-.40038
; WIPE_END
G1 E-.04 F1800
G1 X123.01 Y114.181 Z15.2 F30000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F2551
M204 S5000
G1 X123.01 Y130.517 E.50197
G1 X122.81 Y130.517 E.00615
G1 X122.81 Y132.114 E.04907
G1 X122.851 Y132.114 E.00126
G1 X123.01 Y132.114 E.00489
G1 X123.01 Y132.19 E.00233
G1 X123.01 Y133.005 E.02502
G1 X123.01 Y133.405 E.01229
G1 F2040
G1 X123.01 Y134.461 E.03247
G1 F2551
G1 X123.01 Y134.646 E.00567
G1 X123.01 Y137.067 E.07439
G1 X122.81 Y137.067 E.00615
G1 X122.81 Y138.042 E.02996
G1 X122.81 Y138.442 E.01229
G1 F2406.487
G1 X122.851 Y138.442 E.00126
G1 F2040
G1 X123.01 Y138.442 E.00489
G1 F2551
G1 X123.01 Y138.608 E.0051
G1 X123.01 Y142.913 E.13228
G1 X122.133 Y143.79 E.03811
G1 X121.43 Y143.79 E.0216
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y109.851 E.02347
G1 X133.845 Y125.324 E.58043
G1 X133.691 Y126.197 E.02724
G1 X133.549 Y126.297 E.00533
G1 X132.98 Y126.695 E.02133
G1 X132.107 Y126.541 E.02724
G1 X123.373 Y114.067 E.46793
G1 X123.068 Y114.163 E.00983
; WIPE_START
G1 F3600
M204 S10000
G1 X123.061 Y116.163 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.32 Y117.286 Z15.2 F30000
G1 Z14.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.23172
G1 F2551
G1 X122.32 Y129.922 E.1944
G1 X122.32 Y132.71 F30000
G1 F2551
G1 X122.32 Y136.471 E.05787
G1 X122.32 Y139.038 F30000
; LINE_WIDTH: 0.232162
G1 F2551
G1 X122.32 Y141.806 E.04269
G1 X122.297 Y141.853 E.00081
; LINE_WIDTH: 0.30252
G1 X122.273 Y141.9 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y141.947 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y141.994 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y142.861 E.02744
; WIPE_START
G1 F9260.475
G1 X122.226 Y141.994 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.47 Y135.65 Z15.2 F30000
G1 X132.641 Y126.425 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Top surface
; LINE_WIDTH: 0.42
G1 F2551
M204 S2000
G1 X133.612 Y125.454 E.04217
G1 X133.434 Y125.099
G1 X132.208 Y126.324 E.05325
G1 X131.989 Y126.011
G1 X133.214 Y124.785 E.05325
G1 X132.995 Y124.471
G1 X131.769 Y125.697 E.05325
G1 X131.55 Y125.383
G1 X132.775 Y124.158 E.05325
G1 X132.555 Y123.844
G1 X131.33 Y125.07 E.05325
G1 X131.11 Y124.756
G1 X132.336 Y123.531 E.05325
G1 X132.116 Y123.217
G1 X130.891 Y124.442 E.05325
G1 X130.671 Y124.129
G1 X131.897 Y122.903 E.05325
G1 X131.677 Y122.59
G1 X130.452 Y123.815 E.05325
G1 X130.232 Y123.501
G1 X131.457 Y122.276 E.05325
G1 X131.238 Y121.962
G1 X130.012 Y123.188 E.05325
G1 X129.793 Y122.874
G1 X131.018 Y121.649 E.05325
G1 X130.799 Y121.335
G1 X129.573 Y122.56 E.05325
G1 X129.353 Y122.247
G1 X130.579 Y121.021 E.05325
G1 X130.359 Y120.708
G1 X129.134 Y121.933 E.05325
G1 X128.914 Y121.62
G1 X130.14 Y120.394 E.05325
G1 X129.92 Y120.08
G1 X128.695 Y121.306 E.05325
G1 X128.475 Y120.992
G1 X129.7 Y119.767 E.05325
G1 X129.481 Y119.453
G1 X128.255 Y120.679 E.05325
G1 X128.036 Y120.365
G1 X129.261 Y119.14 E.05325
G1 X129.042 Y118.826
G1 X127.816 Y120.051 E.05325
G1 X127.597 Y119.738
G1 X128.822 Y118.512 E.05325
G1 X128.602 Y118.199
G1 X127.377 Y119.424 E.05325
G1 X127.157 Y119.11
G1 X128.383 Y117.885 E.05325
G1 X128.163 Y117.571
G1 X126.938 Y118.797 E.05325
G1 X126.718 Y118.483
G1 X127.944 Y117.258 E.05325
G1 X127.724 Y116.944
G1 X126.498 Y118.169 E.05325
G1 X126.279 Y117.856
G1 X127.504 Y116.63 E.05325
G1 X127.285 Y116.317
G1 X126.059 Y117.542 E.05325
G1 X125.84 Y117.229
G1 X127.065 Y116.003 E.05325
G1 X126.845 Y115.689
G1 X125.62 Y116.915 E.05325
G1 X125.4 Y116.601
G1 X126.626 Y115.376 E.05325
G1 X126.406 Y115.062
G1 X125.181 Y116.288 E.05325
G1 X124.961 Y115.974
G1 X126.187 Y114.749 E.05325
G1 X125.967 Y114.435
G1 X124.742 Y115.66 E.05325
G1 X124.522 Y115.347
G1 X125.747 Y114.121 E.05325
G1 X125.528 Y113.808
G1 X124.302 Y115.033 E.05325
G1 X124.083 Y114.719
G1 X125.308 Y113.494 E.05325
G1 X125.089 Y113.18
G1 X123.863 Y114.406 E.05325
G1 X123.643 Y114.092
G1 X124.869 Y112.867 E.05325
G1 X124.649 Y112.553
G1 X123.344 Y113.858 E.05672
; WIPE_START
G1 F9547.055
M204 S10000
G1 X124.649 Y112.553 E-.70143
G1 X124.738 Y112.679 E-.05858
; WIPE_END
G1 E-.04 F1800
G1 X122.803 Y115.999 Z15.2 F30000
G1 Z14.8
G1 E.8 F1800
G1 F2551
M204 S2000
G1 X122.295 Y116.507 E.02207
G1 X122.075 Y116.193
G1 X122.803 Y115.466 E.03161
G1 X122.803 Y114.933
G1 X121.856 Y115.88 E.04116
G1 X121.838 Y115.365
G1 X122.803 Y114.399 E.04194
G1 X121.838 Y114.831
G1 X124.43 Y112.239 E.11263
G1 X124.21 Y111.926
G1 X121.838 Y114.298 E.10309
G1 X121.838 Y113.765
G1 X123.99 Y111.612 E.09355
G1 X123.771 Y111.298
G1 X121.838 Y113.232 E.084
G1 X121.838 Y112.698
G1 X123.551 Y110.985 E.07446
G1 X123.332 Y110.671
G1 X121.838 Y112.165 E.06492
G1 X121.838 Y111.632
G1 X123.112 Y110.358 E.05537
G1 X122.892 Y110.044
G1 X121.838 Y111.099 E.04583
G1 X121.82 Y110.583
G1 X122.803 Y109.6 E.0427
G1 X122.75 Y109.12
G1 X121.638 Y110.232 E.04833
G1 X121.638 Y109.699
G1 X122.483 Y108.853 E.03674
M204 S10000
G1 X121.659 Y110.253 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.122788
G1 F2551
G1 X121.659 Y110.588 E.00218
; WIPE_START
G1 F15000
G1 X121.659 Y110.253 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.269 Y116.336 Z15.2 F30000
G1 X133.545 Y125.939 Z15.2
G1 Z14.8
G1 E.8 F1800
; LINE_WIDTH: 0.212279
G1 F2551
G1 X133.327 Y126.122 E.00393
; LINE_WIDTH: 0.173946
G1 X133.109 Y126.305 E.00304
; LINE_WIDTH: 0.135613
G1 X132.891 Y126.488 E.00215
; WIPE_START
G1 F15000
G1 X133.109 Y126.305 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.052 Y119.84 Z15.2 F30000
G1 X122.832 Y109.926 Z15.2
G1 Z14.8
G1 E.8 F1800
; LINE_WIDTH: 0.0919661
G1 F2551
G1 X122.796 Y109.911 E.00016
G1 X122.82 Y109.849 E.00026
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F15000
G1 X122.796 Y109.911 E-.47505
G1 X122.832 Y109.926 E-.28495
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 109/160
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
G17
G3 Z15.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1362
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y130.007 E.68857
G1 X122.418 Y130.006 E.00663
G1 X122.418 Y132.391 E.07911
G1 X122.618 Y132.391 E.00663
G1 X122.618 Y136.743 E.14436
G1 X122.418 Y136.743 E.00663
G1 X122.418 Y138.58 E.06092
G1 X122.618 Y138.58 E.00663
G1 X122.618 Y142.751 E.13836
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1362
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y130.4 E.6549
G1 X122.81 Y130.4 E.00615
G1 X122.81 Y131.999 E.04915
G1 X122.851 Y131.999 E.00126
G1 X123.01 Y131.999 E.00489
G1 X123.01 Y132.073 E.00227
G1 X123.01 Y137.108 E.1547
G1 X123.01 Y137.135 E.00084
G1 X122.851 Y137.135 E.00489
G1 X122.81 Y137.135 E.00126
G1 X122.81 Y137.788 E.02005
M73 P70 R7
G1 X122.81 Y138.188 E.01229
G1 X122.851 Y138.188 E.00126
G1 X123.01 Y138.188 E.00489
G1 X123.01 Y138.401 E.00656
G1 X123.01 Y142.913 E.13864
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1362
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.232125
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y138.783 E.0466
G1 X122.32 Y136.54 F30000
; LINE_WIDTH: 0.23172
G1 F1362
G1 X122.32 Y132.595 E.06069
G1 X122.32 Y129.802 F30000
G1 F1362
G1 X122.32 Y110.194 E.30166
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 110/160
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
G17
G3 Z15.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1373
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y129.896 E.6849
G1 X122.418 Y129.896 E.00663
G1 X122.418 Y132.278 E.07901
G1 X122.618 Y132.278 E.00663
G1 X122.618 Y142.751 E.34739
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1373
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y130.288 E.65146
G1 X122.81 Y130.288 E.00615
G1 X122.81 Y131.886 E.04909
G1 X122.851 Y131.886 E.00126
G1 X123.01 Y131.886 E.00489
G1 X123.01 Y131.958 E.00222
G1 X123.01 Y136.776 E.14804
G1 X123.01 Y137.176 E.01229
G1 X123.01 Y137.962 E.02415
G1 X123.01 Y138.147 E.00567
G1 X123.01 Y142.913 E.14646
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z15.6 F30000
G1 Z15.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1373
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231853
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y132.482 E.14355
G1 X122.32 Y129.693 F30000
; LINE_WIDTH: 0.23172
G1 F1373
G1 X122.32 Y110.194 E.29998
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 111/160
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
G17
G3 Z15.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1372
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y129.785 E.68122
G1 X122.418 Y129.785 E.00663
G1 X122.418 Y132.165 E.07895
G1 X122.618 Y132.165 E.00663
G1 X122.618 Y142.751 E.35114
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1372
M204 S5000
G1 X121.43 Y141.21 E.07928
M73 P71 R7
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y130.178 E.64808
G1 X122.81 Y130.178 E.00615
G1 X122.81 Y131.773 E.04901
G1 X122.851 Y131.773 E.00126
G1 X123.01 Y131.773 E.00489
G1 X123.01 Y131.845 E.00222
G1 X123.01 Y142.913 E.34009
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z15.8 F30000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1372
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231852
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y132.369 E.14529
G1 X122.32 Y129.581 F30000
; LINE_WIDTH: 0.23172
G1 F1372
G1 X122.32 Y110.194 E.29826
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
M73 P71 R6
G1 E-.04 F1800
; layer num/total_layer_count: 112/160
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
G17
G3 Z15.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1372
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y129.682 E.67779
G1 X122.418 Y129.682 E.00663
G1 X122.418 Y132.054 E.07869
G1 X122.618 Y132.054 E.00663
G1 X122.618 Y142.751 E.35482
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1372
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y130.074 E.64488
G1 X122.81 Y130.074 E.00615
G1 X122.81 Y131.662 E.04879
G1 X122.851 Y131.662 E.00126
G1 X123.01 Y131.662 E.00489
G1 X123.01 Y131.732 E.00215
G1 X123.01 Y142.913 E.34356
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z16 F30000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1372
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23185
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y132.258 E.14699
G1 X122.32 Y129.479 F30000
; LINE_WIDTH: 0.23172
G1 F1372
G1 X122.32 Y110.194 E.29668
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 113/160
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
G17
G3 Z16 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1372
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y129.583 E.67452
G1 X122.418 Y129.583 E.00663
M73 P72 R6
G1 X122.418 Y131.951 E.07854
G1 X122.618 Y131.951 E.00663
G1 X122.618 Y142.751 E.35824
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1372
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y129.975 E.64185
G1 X122.81 Y129.975 E.00615
G1 X122.81 Y131.559 E.04866
G1 X122.851 Y131.559 E.00126
G1 X123.01 Y131.559 E.00489
G1 X123.01 Y131.621 E.00191
G1 X123.01 Y142.913 E.34697
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z16.2 F30000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1372
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231849
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y132.155 E.14858
G1 X122.32 Y129.38 F30000
; LINE_WIDTH: 0.23172
G1 F1372
G1 X122.32 Y110.194 E.29517
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 114/160
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
G17
G3 Z16.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1372
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y129.495 E.67159
G1 X122.418 Y129.495 E.00663
G1 X122.418 Y131.855 E.0783
G1 X122.618 Y131.855 E.00663
G1 X122.618 Y142.751 E.36141
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1372
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y129.887 E.63913
G1 X122.81 Y129.887 E.00615
G1 X122.81 Y131.463 E.04843
G1 X122.851 Y131.463 E.00126
G1 X123.01 Y131.463 E.00489
G1 X123.01 Y131.518 E.00168
G1 X123.01 Y142.913 E.35013
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z16.4 F30000
G1 Z16
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1372
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231847
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y132.059 E.15005
G1 X122.32 Y129.292 F30000
; LINE_WIDTH: 0.23172
G1 F1372
G1 X122.32 Y110.194 E.29381
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 115/160
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
G17
G3 Z16.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z16.2
M73 P73 R6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1372
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.565 Y109.196 E.03483
G1 X122.618 Y109.249 E.00251
G1 X122.618 Y129.442 E.66982
G1 X122.418 Y129.442 E.00663
G1 X122.418 Y131.785 E.07771
G1 X122.618 Y131.785 E.00663
G1 X122.618 Y142.751 E.36376
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1372
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.842 Y108.919 E.0308
G1 X123.01 Y109.087 E.00731
G1 X123.01 Y129.834 E.63749
G1 X122.81 Y129.834 E.00615
G1 X122.81 Y131.392 E.04789
G1 X122.851 Y131.392 E.00126
G1 X123.01 Y131.392 E.00489
G1 X123.01 Y131.422 E.00092
G1 X123.01 Y142.913 E.35308
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z16.6 F30000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1372
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231847
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y131.988 E.15114
G1 X122.32 Y129.238 F30000
; LINE_WIDTH: 0.23172
G1 F1372
G1 X122.32 Y110.194 E.29299
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 116/160
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
G17
G3 Z16.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1372
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y129.441 E.66978
G1 X122.418 Y129.441 E.00663
G1 X122.418 Y131.747 E.07651
G1 X122.618 Y131.747 E.00663
G1 X122.618 Y142.751 E.365
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1372
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y129.833 E.63746
G1 X122.81 Y129.833 E.00615
G1 X122.81 Y131.355 E.04678
G1 X123.01 Y131.355 E.00615
G1 X123.01 Y142.913 E.35514
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z16.8 F30000
G1 Z16.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1372
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231846
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y131.951 E.15172
G1 X122.32 Y129.237 F30000
; LINE_WIDTH: 0.23172
G1 F1372
G1 X122.32 Y110.194 E.29297
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 117/160
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
G17
G3 Z16.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
M73 P74 R6
G1 X121.822 Y143.546
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1378
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.515 Y109.146 E.0325
G1 X122.618 Y109.249 E.00484
G1 X122.618 Y129.521 E.67246
G1 X122.418 Y129.521 E.00663
G1 X122.418 Y131.672 E.07135
G1 X122.618 Y131.672 E.00663
G1 X122.618 Y142.751 E.36749
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1378
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.792 Y108.869 E.02864
G1 X123.01 Y109.087 E.00947
G1 X123.01 Y129.874 E.63872
G1 X123.01 Y129.913 E.00122
G1 X122.851 Y129.913 E.00489
G1 X122.81 Y129.913 E.00126
G1 X122.81 Y131.28 E.04199
G1 X122.851 Y131.28 E.00126
G1 X123.01 Y131.28 E.00489
G1 X123.01 Y131.314 E.00105
G1 X123.01 Y142.913 E.3564
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z17 F30000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1378
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231845
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y131.876 E.15287
G1 X122.32 Y129.318 F30000
; LINE_WIDTH: 0.23172
G1 F1378
G1 X122.32 Y110.194 E.29421
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 118/160
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
G17
G3 Z17 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1382
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y129.767 E.68062
G1 X122.418 Y129.767 E.00663
G1 X122.418 Y131.414 E.05464
G1 X122.618 Y131.414 E.00663
G1 X122.618 Y142.751 E.37604
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1382
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y129.554 E.62891
G1 X123.01 Y129.954 E.01229
G1 X123.01 Y130.159 E.0063
G1 X122.851 Y130.159 E.00489
G1 X122.81 Y130.159 E.00126
G1 X122.81 Y130.622 E.01423
G1 X122.81 Y131.022 E.01229
G1 X122.851 Y131.022 E.00126
G1 X123.01 Y131.022 E.00489
G1 X123.01 Y131.239 E.00666
G1 X123.01 Y142.913 E.35871
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
M73 P75 R6
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z17.2 F30000
G1 Z16.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1382
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.231842
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y131.618 E.15683
G1 X122.32 Y129.564 F30000
; LINE_WIDTH: 0.23172
G1 F1382
G1 X122.32 Y110.194 E.29799
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 119/160
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
G17
G3 Z17.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z17
M73 P75 R5
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1391
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1391
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y129.8 E.63646
G1 X123.01 Y130.2 E.01229
G1 X123.01 Y130.797 E.01833
G1 X123.01 Y130.981 E.00567
G1 X123.01 Y142.913 E.36662
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1391
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 120/160
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
G17
G3 Z17.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
M73 P76 R5
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z17.6 F30000
G1 Z17.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 121/160
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
G17
G3 Z17.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z17.8 F30000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 122/160
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
G17
G3 Z17.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
M73 P77 R5
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z18 F30000
G1 Z17.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 123/160
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
G17
G3 Z18 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z18.2 F30000
G1 Z17.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 124/160
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
G17
G3 Z18.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
M73 P78 R5
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z18.4 F30000
G1 Z18
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 125/160
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
G17
G3 Z18.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z18.6 F30000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
M73 P79 R5
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 126/160
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
G17
G3 Z18.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
M73 P79 R4
G1 E-.04 F1800
G1 X122.22 Y142.861 Z18.8 F30000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 127/160
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
G17
G3 Z18.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
M73 P80 R4
G1 E-.04 F1800
G1 X122.22 Y142.861 Z19 F30000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 128/160
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
G17
G3 Z19 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z19.2 F30000
G1 Z18.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 129/160
; update layer progress
M73 L129
M991 S0 P128 ;notify layer change
G17
G3 Z19.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
M73 P81 R4
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z19.4 F30000
G1 Z19
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 130/160
; update layer progress
M73 L130
M991 S0 P129 ;notify layer change
G17
G3 Z19.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z19.6 F30000
G1 Z19.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 131/160
; update layer progress
M73 L131
M991 S0 P130 ;notify layer change
G17
G3 Z19.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
M73 P82 R4
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z19.8 F30000
G1 Z19.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 132/160
; update layer progress
M73 L132
M991 S0 P131 ;notify layer change
G17
G3 Z19.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.142 Y108.774 E.01501
G1 X122.618 Y109.249 E.02232
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.42 Y108.496 E.01244
G1 X123.01 Y109.087 E.02567
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z20 F30000
G1 Z19.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 133/160
; update layer progress
M73 L133
M991 S0 P132 ;notify layer change
G17
G3 Z20 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
M73 P83 R4
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z20.2 F30000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 134/160
; update layer progress
M73 L134
M991 S0 P133 ;notify layer change
G17
G3 Z20.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.093 Y108.724 E.01268
G1 X122.618 Y109.249 E.02465
M73 P83 R3
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X122.37 Y108.447 E.01028
G1 X123.01 Y109.087 E.02783
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z20.4 F30000
G1 Z20
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
M73 P84 R3
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 135/160
; update layer progress
M73 L135
M991 S0 P134 ;notify layer change
G17
G3 Z20.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z20.6 F30000
G1 Z20.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 136/160
; update layer progress
M73 L136
M991 S0 P135 ;notify layer change
G17
G3 Z20.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
M73 P85 R3
G1 E-.04 F1800
G1 X122.22 Y142.861 Z20.8 F30000
G1 Z20.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 137/160
; update layer progress
M73 L137
M991 S0 P136 ;notify layer change
G17
G3 Z20.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z21 F30000
G1 Z20.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 138/160
; update layer progress
M73 L138
M991 S0 P137 ;notify layer change
G17
G3 Z21 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
M73 P86 R3
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z21.2 F30000
G1 Z20.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 139/160
; update layer progress
M73 L139
M991 S0 P138 ;notify layer change
G17
G3 Z21.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z21.4 F30000
G1 Z21
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 140/160
; update layer progress
M73 L140
M991 S0 P139 ;notify layer change
G17
G3 Z21.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
M73 P87 R3
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z21.6 F30000
G1 Z21.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 141/160
; update layer progress
M73 L141
M991 S0 P140 ;notify layer change
G17
G3 Z21.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
M73 P87 R2
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z21.8 F30000
G1 Z21.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
M73 P88 R2
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 142/160
; update layer progress
M73 L142
M991 S0 P141 ;notify layer change
G17
G3 Z21.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z22 F30000
G1 Z21.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 143/160
; update layer progress
M73 L143
M991 S0 P142 ;notify layer change
G17
G3 Z22 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
M73 P89 R2
G1 E-.04 F1800
G1 X122.22 Y142.861 Z22.2 F30000
G1 Z21.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 144/160
; update layer progress
M73 L144
M991 S0 P143 ;notify layer change
G17
G3 Z22.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z22.4 F30000
G1 Z22
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 145/160
; update layer progress
M73 L145
M991 S0 P144 ;notify layer change
G17
G3 Z22.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1386
G1 X121.822 Y141.602 E.0645
G1 X122.022 Y141.602 E.00663
G1 X122.022 Y110.398 E1.0351
G1 X121.822 Y110.398 E.00663
G1 X121.822 Y108.454 E.0645
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1386
M204 S5000
G1 X121.43 Y141.21 E.07928
G1 X121.63 Y141.21 E.00615
G1 X121.63 Y110.79 E.93472
G1 X121.43 Y110.79 E.00615
G1 X121.43 Y108.21 E.07928
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
M73 P90 R2
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.444 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z22.6 F30000
G1 Z22.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.431669
G1 F1386
G1 X122.226 Y141.994 E.02744
; LINE_WIDTH: 0.39692
G1 X122.249 Y141.947 E.00152
; LINE_WIDTH: 0.34972
G1 X122.273 Y141.9 E.00132
; LINE_WIDTH: 0.30252
G1 X122.297 Y141.853 E.00112
; LINE_WIDTH: 0.23176
G1 X122.32 Y141.806 E.00081
G1 X122.32 Y110.194 E.48643
; LINE_WIDTH: 0.25532
G1 X122.297 Y110.147 E.00091
; LINE_WIDTH: 0.30252
G1 X122.273 Y110.1 E.00112
; LINE_WIDTH: 0.34972
G1 X122.249 Y110.053 E.00132
; LINE_WIDTH: 0.39692
G1 X122.226 Y110.006 E.00152
; LINE_WIDTH: 0.431669
G1 X122.22 Y109.139 E.02744
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9260.475
G1 X122.226 Y110.006 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 146/160
; update layer progress
M73 L146
M991 S0 P145 ;notify layer change
G17
G3 Z22.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.546
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1383
G1 X121.822 Y108.454 E1.1641
G1 X122.618 Y109.249 E.03734
G1 X122.618 Y142.751 E1.1113
G1 X121.865 Y143.504 E.03535
G1 X121.43 Y143.79 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1383
M204 S5000
G1 X121.43 Y141.569 E.06825
G1 X121.43 Y141.169 E.01229
G1 X121.43 Y111.015 E.92653
G1 X121.43 Y110.831 E.00567
G1 X121.43 Y108.21 E.08054
G1 X122.133 Y108.21 E.0216
G1 X123.01 Y109.087 E.03811
G1 X123.01 Y142.913 E1.03938
G1 X122.133 Y143.79 E.03811
G1 X121.49 Y143.79 E.01976
; WIPE_START
G1 F3600
M204 S10000
G1 X121.436 Y141.791 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.861 Z22.8 F30000
G1 Z22.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1383
G1 X122.22 Y109.139 E1.06837
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9259.259
G1 X122.22 Y111.139 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 147/160
; update layer progress
M73 L147
M991 S0 P146 ;notify layer change
G17
G3 Z22.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.539
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1377
G1 X121.822 Y108.46 E1.16363
G1 X122.618 Y109.26 E.03742
G1 X122.618 Y142.74 E1.1106
G1 X121.865 Y143.497 E.03543
G1 X121.43 Y143.783 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1377
M204 S5000
G1 X121.43 Y108.217 E1.09284
G1 X122.133 Y108.217 E.0216
G1 X123.01 Y109.098 E.0382
G1 X123.01 Y142.902 E1.0387
G1 X122.133 Y143.783 E.0382
G1 X121.49 Y143.783 E.01975
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y141.783 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.851 Z23 F30000
G1 Z22.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1377
G1 X122.22 Y109.149 E1.06778
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9259.259
M73 P91 R2
G1 X122.22 Y111.149 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 148/160
; update layer progress
M73 L148
M991 S0 P147 ;notify layer change
G17
G3 Z23 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.519
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1375
G1 X121.822 Y108.481 E1.16226
G1 X122.618 Y109.288 E.03761
G1 X122.618 Y142.711 E1.1087
G1 X121.864 Y143.476 E.03561
G1 X121.43 Y143.763 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1375
M204 S5000
G1 X121.43 Y108.237 E1.09159
G1 X122.133 Y108.237 E.02158
G1 X123.01 Y109.128 E.03841
G1 X123.01 Y142.872 E1.03688
G1 X122.132 Y143.763 E.03842
G1 X121.49 Y143.763 E.01973
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y141.763 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.825 Z23.2 F30000
G1 Z22.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1375
G1 X122.22 Y109.175 E1.06612
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9259.259
G1 X122.22 Y111.175 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 149/160
; update layer progress
M73 L149
M991 S0 P148 ;notify layer change
G17
G3 Z23.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.484
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1372
G1 X121.822 Y108.516 E1.15995
G1 X122.469 Y109.179 E.03074
G1 X122.618 Y109.335 E.00713
G1 X122.618 Y142.665 E1.10565
M73 P91 R1
G3 X121.865 Y143.441 I-49.929 J-47.743 E.03588
G1 X121.43 Y143.728 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1372
M204 S5000
G1 X121.43 Y108.272 E1.08949
G1 X122.132 Y108.272 E.02155
G1 X122.751 Y108.907 E.02727
G1 X123.01 Y109.177 E.0115
G1 X123.01 Y142.823 E1.03385
G3 X122.132 Y143.728 I-55.402 J-52.883 E.03876
G1 X121.49 Y143.728 E.01971
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y141.728 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.784 Z23.4 F30000
G1 Z23
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1372
G1 X122.22 Y109.216 E1.06352
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9259.259
M73 P92 R1
G1 X122.22 Y111.216 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 150/160
; update layer progress
M73 L150
M991 S0 P149 ;notify layer change
G17
G3 Z23.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.435
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1368
G1 X121.822 Y108.564 E1.15675
G1 X122.442 Y109.214 E.02981
G1 X122.618 Y109.404 E.0086
G1 X122.618 Y142.596 E1.10102
G3 X121.864 Y143.392 I-26.877 J-24.689 E.03638
G1 X121.43 Y143.68 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1368
M204 S5000
G1 X121.43 Y108.32 E1.08652
G1 X122.131 Y108.32 E.02153
G1 X122.179 Y108.369 E.00211
G3 X123.01 Y109.251 I-29.501 J28.663 E.03724
G1 X123.01 Y142.749 E1.02932
G3 X122.13 Y143.68 I-29.896 J-27.378 E.03936
G1 X121.49 Y143.68 E.01967
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y141.68 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.722 Z23.6 F30000
G1 Z23.2
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1368
G1 X122.22 Y109.276 E1.05963
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9259.259
G1 X122.22 Y111.276 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 151/160
; update layer progress
M73 L151
M991 S0 P150 ;notify layer change
G17
G3 Z23.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.371
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1363
G1 X121.822 Y108.626 E1.15255
G1 X122.408 Y109.26 E.02864
G1 X122.618 Y109.497 E.0105
G1 X122.618 Y142.503 E1.09489
G3 X121.864 Y143.327 I-19.687 J-17.266 E.03706
G1 X121.43 Y143.617 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1363
M204 S5000
G1 X121.43 Y108.383 E1.08264
G1 X122.13 Y108.383 E.0215
G1 X122.195 Y108.452 E.0029
G3 X123.01 Y109.348 I-22.311 J21.114 E.03723
G1 X123.01 Y142.652 E1.02336
M73 P93 R1
G3 X122.129 Y143.617 I-21.942 J-19.168 E.04016
G1 X121.49 Y143.617 E.01962
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y141.617 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.643 Z23.8 F30000
G1 Z23.4
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43173
G1 F1363
G1 X122.22 Y109.357 E1.05462
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9259.02
G1 X122.22 Y111.357 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 152/160
; update layer progress
M73 L152
M991 S0 P151 ;notify layer change
G17
G3 Z23.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.296
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1356
G1 X121.822 Y108.704 E1.14746
G1 X122.365 Y109.316 E.02711
G1 X122.618 Y109.615 E.01301
G1 X122.618 Y142.385 E1.08703
G3 X121.863 Y143.251 I-19.078 J-15.867 E.03814
G1 X121.43 Y143.538 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1356
M204 S5000
G1 X121.43 Y108.462 E1.07778
G1 X122.128 Y108.462 E.02144
G1 X122.226 Y108.568 E.00443
G3 X123.01 Y109.475 I-17.242 J15.703 E.03686
G1 X123.01 Y142.525 E1.01551
G3 X122.128 Y143.538 I-44.554 J-37.894 E.04128
G1 X121.49 Y143.538 E.0196
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y141.538 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.54 Z24 F30000
G1 Z23.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1356
G1 X122.22 Y109.46 E1.04807
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F9259.259
G1 X122.22 Y111.46 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 153/160
; update layer progress
M73 L153
M991 S0 P152 ;notify layer change
G17
G3 Z24 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y143.2
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1347
G1 X121.822 Y108.8 E1.1411
G1 X122.314 Y109.382 E.02526
M73 P94 R1
G3 X122.618 Y109.771 I-5.132 J4.332 E.01639
G1 X122.618 Y142.229 E1.07668
G3 X121.862 Y143.155 I-14.162 J-10.797 E.03966
G1 X121.43 Y143.442 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1347
M204 S5000
G1 X121.43 Y108.558 E1.07189
G1 X122.126 Y108.558 E.02137
G1 X122.261 Y108.712 E.0063
G3 X123.01 Y109.642 I-10.936 J9.574 E.03672
G1 X123.01 Y142.358 E1.00524
G3 X122.125 Y143.442 I-20.27 J-15.637 E.04301
G1 X121.49 Y143.442 E.01952
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y141.442 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.22 Y142.408 Z24.2 F30000
G1 Z23.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.43172
G1 F1347
G1 X122.22 Y109.592 E1.03967
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F9259.259
G1 X122.22 Y111.592 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 154/160
; update layer progress
M73 L154
M991 S0 P153 ;notify layer change
G17
G3 Z24.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y142.82
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1328
G1 X121.822 Y109.18 E1.11588
G1 X121.986 Y109.123 E.00575
G1 X122.253 Y109.459 E.01422
G3 X122.618 Y109.972 I-6.334 J4.897 E.0209
G1 X122.618 Y142.028 E1.06335
G3 X121.986 Y142.877 I-9.025 J-6.06 E.03512
G1 X121.879 Y142.839 E.00376
G1 X121.43 Y143.327 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1328
M204 S5000
G1 X121.43 Y108.673 E1.06485
G1 X122.122 Y108.673 E.02126
G1 X122.268 Y108.848 E.007
G3 X123.01 Y109.862 I-9.467 J7.704 E.03865
G1 X123.01 Y142.138 E.99173
G3 X122.122 Y143.327 I-8.778 J-5.627 E.04566
G1 X121.49 Y143.327 E.01941
M204 S10000
G1 X121.626 Y143.048 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.163798
G1 F1328
G1 X121.807 Y143.078 E.00181
; LINE_WIDTH: 0.119213
G1 X121.988 Y143.109 E.00114
G1 X122.22 Y142.241 F30000
; LINE_WIDTH: 0.43172
M73 P95 R1
G1 F1328
G1 X122.22 Y109.758 E1.02916
G1 X121.988 Y108.891 F30000
; LINE_WIDTH: 0.119206
G1 F1328
G1 X121.807 Y108.922 E.00114
; LINE_WIDTH: 0.163789
G1 X121.626 Y108.952 E.00181
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X121.807 Y108.922 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 155/160
; update layer progress
M73 L155
M991 S0 P154 ;notify layer change
G17
G3 Z24.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y142.658
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1314
G1 X121.822 Y109.342 E1.10517
G1 X121.99 Y109.286 E.00586
G1 X122.183 Y109.547 E.01075
G3 X122.618 Y110.262 I-6.65 J4.54 E.02779
G1 X122.618 Y141.738 E1.04409
G3 X121.99 Y142.714 I-5.331 J-2.74 E.03856
G1 X121.879 Y142.677 E.00387
G1 X121.43 Y143.189 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1314
M204 S5000
G1 X121.43 Y108.811 E1.05632
G1 X122.118 Y108.811 E.02114
G1 X122.161 Y108.865 E.00211
G3 X123.01 Y110.175 I-6.09 J4.88 E.04805
G1 X123.01 Y141.825 E.9725
G3 X122.118 Y143.189 I-7.003 J-3.606 E.05016
G1 X121.49 Y143.189 E.0193
M204 S10000
G1 X121.626 Y142.899 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.180334
G1 F1314
G1 X121.835 Y142.932 E.00237
; LINE_WIDTH: 0.132191
G1 X122.044 Y142.966 E.00154
G1 X122.22 Y142.029 F30000
; LINE_WIDTH: 0.43172
G1 F1314
G1 X122.22 Y109.971 E1.01569
G1 X122.044 Y109.034 F30000
; LINE_WIDTH: 0.132192
G1 F1314
G1 X121.835 Y109.068 E.00154
; LINE_WIDTH: 0.180331
G1 X121.626 Y109.101 E.00237
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X121.835 Y109.068 E-.76
; WIPE_END
M73 P95 R0
G1 E-.04 F1800
; layer num/total_layer_count: 156/160
; update layer progress
M73 L156
M991 S0 P155 ;notify layer change
G17
G3 Z24.6 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y142.459
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1294
G1 X121.822 Y109.541 E1.09196
G1 X121.995 Y109.488 E.00599
G1 X122.103 Y109.647 E.00638
M73 P96 R0
G3 X122.614 Y110.894 I-2.277 J1.661 E.04513
G1 X122.618 Y140.989 E.9983
G3 X122.256 Y142.101 I-2.245 J-.115 E.03926
G3 X121.995 Y142.512 I-4.475 J-2.554 E.01616
G1 X121.88 Y142.477 E.004
G1 X121.43 Y143.024 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1294
M204 S5000
G1 X121.43 Y108.976 E1.04621
G1 X122.115 Y108.976 E.02103
G1 X122.22 Y109.12 E.0055
G3 X122.957 Y110.56 I-3.304 J2.6 E.05
G3 X123.01 Y111.004 I-2.009 J.467 E.01377
G1 X123.01 Y140.996 E.92157
G3 X122.597 Y142.296 I-2.644 J-.126 E.0424
G3 X122.114 Y143.024 I-7.841 J-4.673 E.02686
G1 X121.49 Y143.024 E.01916
M204 S10000
G1 X121.626 Y142.719 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.213536
G1 F1294
G1 X121.837 Y142.75 E.00297
; LINE_WIDTH: 0.173886
G1 X122.048 Y142.782 E.00228
G1 X122.071 Y142.012 F30000
; LINE_WIDTH: 0.311601
G1 F1294
G1 X122.126 Y141.719 E.00654
; LINE_WIDTH: 0.338282
G1 X122.18 Y141.425 E.00719
; LINE_WIDTH: 0.374216
G1 X122.203 Y141.269 E.00426
; LINE_WIDTH: 0.431475
G2 X122.22 Y140.981 I-2.452 J-.293 E.00914
G1 X122.22 Y111.019 E.94868
G2 X122.203 Y110.731 I-2.469 J.005 E.00914
; LINE_WIDTH: 0.374211
G1 X122.18 Y110.575 E.00426
; LINE_WIDTH: 0.338252
G1 X122.126 Y110.281 E.00721
; LINE_WIDTH: 0.311516
G1 X122.071 Y109.986 E.00655
G1 X122.048 Y109.218 F30000
; LINE_WIDTH: 0.173811
G1 F1294
G1 X121.837 Y109.25 E.00228
; LINE_WIDTH: 0.213497
G1 X121.626 Y109.281 E.00297
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F15000
G1 X121.837 Y109.25 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 157/160
; update layer progress
M73 L157
M991 S0 P156 ;notify layer change
G17
G3 Z24.8 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y142.204
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1285
G1 X121.822 Y109.796 E1.07503
G1 X122.007 Y109.75 E.00631
G1 X122.141 Y109.999 E.00939
G3 X122.418 Y111.013 I-2.184 J1.142 E.03514
G1 X122.418 Y140.987 E.99429
G3 X122.007 Y142.25 I-2.519 J-.121 E.0446
G1 X121.881 Y142.219 E.00432
G1 X121.43 Y142.829 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1285
M204 S5000
G1 X121.43 Y109.171 E1.0342
G1 X122.108 Y109.171 E.02081
G1 X122.175 Y109.272 E.00373
G3 X122.802 Y110.826 I-2.881 J2.068 E.05197
G1 X122.81 Y140.995 E.92703
G3 X122.352 Y142.436 I-2.898 J-.128 E.04699
G3 X122.108 Y142.829 I-5.138 J-2.929 E.01422
G1 X121.49 Y142.829 E.01897
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y140.829 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P97 R0
G1 X122.048 Y141.657 Z25 F30000
G1 Z24.6
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.116332
G1 F1285
G1 X122.072 Y141.525 E.0008
; LINE_WIDTH: 0.158518
G1 X122.095 Y141.371 E.00147
; LINE_WIDTH: 0.195668
G1 X122.109 Y141.236 E.00168
; LINE_WIDTH: 0.23163
G2 X122.12 Y140.981 I-2.957 J-.253 E.00393
G1 X122.117 Y110.885 E.46279
; LINE_WIDTH: 0.206209
G2 X122.095 Y110.629 I-3.084 J.14 E.00342
; LINE_WIDTH: 0.158511
G1 X122.072 Y110.475 E.00147
; LINE_WIDTH: 0.116354
G1 X122.048 Y110.343 E.0008
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F15000
G1 X122.072 Y110.475 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 158/160
; update layer progress
M73 L158
M991 S0 P157 ;notify layer change
G17
G3 Z25 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.822 Y141.835
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1200
G1 X121.822 Y110.165 E1.05055
G1 X122.022 Y110.128 E.00674
G1 X122.096 Y110.321 E.00686
G3 X122.218 Y111.013 I-2.613 J.818 E.02337
G1 X122.218 Y140.987 E.99429
G3 X122.022 Y141.872 I-2.317 J-.049 E.03026
G1 X121.881 Y141.846 E.00475
G1 X121.43 Y142.588 F30000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X121.43 Y109.412 E1.01942
G1 X122.1 Y109.412 E.02058
G1 X122.141 Y109.483 E.00253
G3 X122.61 Y111.004 I-2.661 J1.654 E.04946
G1 X122.61 Y140.996 E.92154
G3 X122.141 Y142.516 I-3.13 J-.132 E.04945
G1 X122.1 Y142.588 E.00255
G1 X121.49 Y142.588 E.01872
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F3600
M204 S10000
G1 X121.487 Y140.588 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 159/160
; update layer progress
M73 L159
M991 S0 P158 ;notify layer change
G17
G3 Z25.2 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.43 Y142.284
G1 Z25
G1 E.8 F1800
G1 F1200
M204 S5000
G1 X121.43 Y109.716 E1.00073
G1 X122.088 Y109.716 E.02022
G1 X122.157 Y109.866 E.00507
G3 X122.41 Y111.004 I-2.726 J1.205 E.03607
G1 X122.41 Y140.995 E.92154
G3 X122.088 Y142.284 I-3.398 J-.166 E.04108
G1 X121.49 Y142.284 E.01836
M204 S10000
G1 X121.79 Y142.088 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.45716
G1 F1200
G1 X121.822 Y141.915 E.00594
; LINE_WIDTH: 0.484039
G1 X121.854 Y141.742 E.00633
; LINE_WIDTH: 0.513036
G1 X121.869 Y141.636 E.0041
; LINE_WIDTH: 0.544188
G1 X121.885 Y141.53 E.00437
; LINE_WIDTH: 0.579995
G1 X121.905 Y141.341 E.00832
; LINE_WIDTH: 0.630584
G2 X121.92 Y140.985 I-4.125 J-.356 E.01709
G1 X121.92 Y111.015 E1.43518
G2 X121.905 Y110.659 I-4.14 J-.001 E.01709
; LINE_WIDTH: 0.58
G1 X121.885 Y110.47 E.00832
; LINE_WIDTH: 0.54426
G1 X121.869 Y110.364 E.00435
; LINE_WIDTH: 0.51322
G1 X121.854 Y110.259 E.00408
; LINE_WIDTH: 0.484114
G1 X121.822 Y110.085 E.00634
; LINE_WIDTH: 0.456941
G1 X121.789 Y109.912 E.00595
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F8695.226
G1 X121.822 Y110.085 E-.76
; WIPE_END
G1 E-.04 F1800
; layer num/total_layer_count: 160/160
; update layer progress
M73 L160
M991 S0 P159 ;notify layer change
G17
G3 Z25.4 I1.217 J0 P1  F30000
;========Date 20250206========
; SKIPPABLE_START
; SKIPTYPE: timelapse
M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0
M1004 S5 P1  ; external shutter

M623
; SKIPPABLE_END
; OBJECT_ID: 399
G1 X121.43 Y141.865
G1 Z25.2
G1 E.8 F1800
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
M204 S5000
G1 X121.43 Y110.135 E.97496
G1 X122.07 Y110.135 E.01964
M73 P98 R0
G1 X122.121 Y110.313 E.00568
G3 X122.21 Y111.004 I-3.043 J.745 E.02146
G1 X122.21 Y140.996 E.92155
G3 X122.07 Y141.865 I-3.941 J-.192 E.02711
G1 X121.49 Y141.865 E.0178
M204 S10000
G1 X121.772 Y141.669 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.383376
G1 F1200
G1 X121.803 Y141.396 E.00761
; LINE_WIDTH: 0.430642
G2 X121.82 Y140.987 I-4.705 J-.409 E.01293
G1 X121.816 Y110.807 E.95353
; LINE_WIDTH: 0.394426
G2 X121.774 Y110.331 I-5.866 J.281 E.01368
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F10241.657
G1 X121.816 Y110.807 E-.76
; WIPE_END
G1 E-.04 F1800
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; MACHINE_END_GCODE_START
; filament end gcode 

;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z25.7 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firmware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z125.2 F600
    G1 Z123.2

M400 P100
M17 R ; restore z current

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

