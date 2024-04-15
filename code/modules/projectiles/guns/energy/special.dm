/obj/item/gun/energy/ionrifle
	name = "pulse rifle"
	desc = "A military-issue YK-42b rifle based on a weaker pistol model, an magnetic pulse weapon that was developed by the Yuma Flats Energy Consortium to sabotage electronic devices the likes of communications, power armor, aircraft, and so on. It excels in damage against heavily armored opponents, especially power armor."
	icon = 'icons/obj/guns/gunfruits2022/energy.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "pulse"
	item_state = "yk42"
	fire_delay = 5
	can_flashlight = 1
	w_class = WEIGHT_CLASS_BULKY
	flags_1 =  CONDUCT_1
	slot_flags = ITEM_SLOT_BACK
	ammo_type = list(/obj/item/ammo_casing/energy/ion)
	shaded_charge = 1
	weapon_weight = WEAPON_HEAVY
	slowdown = 0.25
	flight_x_offset = 17
	flight_y_offset = 9
	equipsound = 'sound/f13weapons/equipsounds/yk42equip.ogg'

/obj/item/gun/energy/ionrifle/attackby(obj/item/A, mob/user, params)
	. = ..()
	if(.)
		return
	if(istype(A, /obj/item/stock_parts/cell/ammo))
		var/obj/item/stock_parts/cell/ammo/AM = A
		if(istype(AM, cell_type))
			var/obj/item/stock_parts/cell/ammo/oldcell = cell
			if(user.transferItemToLoc(AM, src))
				cell = AM
				if(oldcell)
					to_chat(user, "<span class='notice'>You perform a tactical reload on \the [src], replacing the cell.</span>")
					oldcell.dropped()
					oldcell.forceMove(get_turf(src.loc))
					oldcell.update_icon()
				//else
				//	to_chat(user, "<span class='notice'>You insert the cell into \the [src].</span>")

				playsound(src, 'sound/f13weapons/yk42reload.ogg', 60, TRUE)
				//chamber_round()
				A.update_icon()
				update_icon()
				return 1
			else
				to_chat(user, "<span class='warning'>You cannot seem to get \the [src] out of your hands!</span>")

/obj/item/gun/energy/ionrifle/emp_act(severity)
	return

/obj/item/gun/energy/ionrifle/carbine
	name = "ion carbine"
	desc = "The MK.II Prototype Ion Projector is a lightweight carbine version of the larger ion rifle, built to be ergonomic and efficient."
	icon_state = "ioncarbine"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT
	ammo_x_offset = 2
	flight_x_offset = 18
	flight_y_offset = 11

/obj/item/gun/energy/decloner
	name = "biological demolecularisor"
	desc = "A gun that discharges high amounts of controlled radiation to slowly break a target into component elements."
	icon_state = "decloner"
	ammo_type = list(/obj/item/ammo_casing/energy/declone)
	pin = null
	ammo_x_offset = 1

/obj/item/gun/energy/decloner/update_overlays()
	..()
	var/obj/item/ammo_casing/energy/shot = ammo_type[current_firemode_index]
	if(!QDELETED(cell) && (cell.charge > shot.e_cost))
		. += "decloner_spin"

/obj/item/gun/energy/floragun
	name = "floral somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells."
	icon_state = "flora"
	item_state = "gun"
	ammo_type = list(/obj/item/ammo_casing/energy/flora/yield, /obj/item/ammo_casing/energy/flora/mut)
	modifystate = 1
	ammo_x_offset = 1
	selfcharge = EGUN_SELFCHARGE

/obj/item/gun/energy/meteorgun
	name = "meteor gun"
	desc = "For the love of god, make sure you're aiming this the right way!"
	icon_state = "meteor_gun"
	item_state = "c20r"
	w_class = WEIGHT_CLASS_BULKY
	ammo_type = list(/obj/item/ammo_casing/energy/meteor)
	cell_type = "/obj/item/stock_parts/cell/potato"
	clumsy_check = 0 //Admin spawn only, might as well let clowns use it.
	selfcharge = EGUN_SELFCHARGE

/obj/item/gun/energy/meteorgun/pen
	name = "meteor pen"
	desc = "The pen is mightier than the sword."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "pen"
	item_state = "pen"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY

/obj/item/gun/energy/mindflayer
	name = "\improper Mind Flayer"
	desc = "A prototype weapon recovered from the ruins of Research-Station Epsilon."
	icon_state = "xray"
	item_state = null
	ammo_type = list(/obj/item/ammo_casing/energy/mindflayer)
	ammo_x_offset = 2

/obj/item/gun/energy/kinetic_accelerator/crossbow
	name = "mini energy crossbow"
	desc = "A weapon favored by syndicate stealth specialists."
	icon_state = "crossbow"
	item_state = "crossbow"
	w_class = WEIGHT_CLASS_SMALL
	custom_materials = list(/datum/material/iron=2000)
	suppressed = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/bolt)
	weapon_weight = WEAPON_LIGHT
	inaccuracy_modifier = 0.25
	obj_flags = 0
	overheat_time = 20
	holds_charge = TRUE
	unique_frequency = TRUE
	can_flashlight = 0
	max_mod_capacity = 0

/obj/item/gun/energy/kinetic_accelerator/crossbow/halloween
	name = "candy corn crossbow"
	desc = "A weapon favored by Syndicate trick-or-treaters."
	icon_state = "crossbow_halloween"
	item_state = "crossbow"
	ammo_type = list(/obj/item/ammo_casing/energy/bolt/halloween)

/obj/item/gun/energy/kinetic_accelerator/crossbow/large
	name = "energy crossbow"
	desc = "A reverse engineered weapon using syndicate technology. This thing seems incredibly unwieldly, and seems to be using similar internals to the Proto-Kinetic Accelerator. It might not play nice when brought near weapons similar to it."
	icon_state = "crossbowlarge"
	w_class = WEIGHT_CLASS_BULKY
	custom_materials = list(/datum/material/iron=4000)
	suppressed = null
	ammo_type = list(/obj/item/ammo_casing/energy/bolt/large)
	weapon_weight = WEAPON_HEAVY
	pin = null
	unique_frequency = FALSE

/obj/item/gun/energy/plasmacutter
	name = "plasma cutter"
	desc = "A mining tool capable of expelling concentrated plasma bursts. You could use it to cut limbs off xenos! Or, you know, mine stuff."
	icon_state = "plasmacutter"
	item_state = "plasmacutter"
	ammo_type = list(/obj/item/ammo_casing/energy/miningplasma)
	flags_1 = CONDUCT_1
	attack_verb = list("attacked", "slashed", "cut", "sliced")
	force = 12
	sharpness = SHARP_EDGED
	inaccuracy_modifier = 0.25
	can_charge = 0
	slowdown = 0
	heat = 3800
	usesound = list('sound/items/welder.ogg', 'sound/items/welder2.ogg')
	tool_behaviour = TOOL_WELDER
	toolspeed = 0.7 //plasmacutters can be used as welders, and are faster than standard welders

/obj/item/gun/energy/plasmacutter/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 25, 105, 0, 'sound/weapons/plasma_cutter.ogg')
	AddElement(/datum/element/update_icon_blocker)

/obj/item/gun/energy/plasmacutter/examine(mob/user)
	. = ..()
	if(cell)
		. += "<span class='notice'>[src] is [round(cell.percent())]% charged.</span>"

/obj/item/gun/energy/plasmacutter/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack/sheet/mineral/plasma))
		I.use(1)
		cell.give(1000)
		to_chat(user, "<span class='notice'>You insert [I] in [src], recharging it.</span>")
	else if(istype(I, /obj/item/stack/ore/plasma))
		I.use(1)
		cell.give(500)
		to_chat(user, "<span class='notice'>You insert [I] in [src], recharging it.</span>")
	else
		..()

// Tool procs, in case plasma cutter is used as welder
/obj/item/gun/energy/plasmacutter/tool_use_check(mob/living/user, amount)
	if(!QDELETED(cell) && (cell.charge >= amount * 100))
		return TRUE

	to_chat(user, "<span class='warning'>You need more charge to complete this task!</span>")
	return FALSE

/obj/item/gun/energy/plasmacutter/use(amount)
	return cell.use(amount * 100)

/obj/item/gun/energy/plasmacutter/use_tool(atom/target, mob/living/user, delay, amount=1, volume=0, datum/callback/extra_checks, skill_gain_mult = STD_USE_TOOL_MULT)

	if(amount)
		target.add_overlay(GLOB.welding_sparks)
		. = ..()
		target.cut_overlay(GLOB.welding_sparks)
	else
		. = ..(amount=1)

/obj/item/gun/energy/plasmacutter/adv
	name = "advanced plasma cutter"
	icon_state = "adv_plasmacutter"
	force = 15
	ammo_type = list(/obj/item/ammo_casing/energy/plasma/adv)

/obj/item/gun/energy/wormhole_projector
	name = "bluespace wormhole projector"
	desc = "A projector that emits high density quantum-coupled bluespace beams."
	ammo_type = list(/obj/item/ammo_casing/energy/wormhole, /obj/item/ammo_casing/energy/wormhole/orange)
	item_state = null
	icon_state = "wormhole_projector"
	pin = null
	inaccuracy_modifier = 0.25
	automatic_charge_overlays = FALSE
	var/obj/effect/portal/p_blue
	var/obj/effect/portal/p_orange
	var/atmos_link = FALSE

/obj/item/gun/energy/wormhole_projector/update_icon_state()
	icon_state = "[initial(icon_state)][current_firemode_index]"
	item_state = icon_state

/obj/item/gun/energy/wormhole_projector/update_ammo_types()
	. = ..()
	for(var/i in 1 to ammo_type.len)
		var/obj/item/ammo_casing/energy/wormhole/W = ammo_type[i]
		if(istype(W))
			W.gun = src
			var/obj/item/projectile/beam/wormhole/WH = W.BB
			if(istype(WH))
				WH.gun = src

/obj/item/gun/energy/wormhole_projector/process_chamber()
	..()
	select_fire()

/obj/item/gun/energy/wormhole_projector/proc/on_portal_destroy(obj/effect/portal/P)
	if(P == p_blue)
		p_blue = null
	else if(P == p_orange)
		p_orange = null

/obj/item/gun/energy/wormhole_projector/proc/has_blue_portal()
	if(istype(p_blue) && !QDELETED(p_blue))
		return TRUE
	return FALSE

/obj/item/gun/energy/wormhole_projector/proc/has_orange_portal()
	if(istype(p_orange) && !QDELETED(p_orange))
		return TRUE
	return FALSE

/obj/item/gun/energy/wormhole_projector/proc/crosslink()
	if(!has_blue_portal() && !has_orange_portal())
		return
	if(!has_blue_portal() && has_orange_portal())
		p_orange.link_portal(null)
		return
	if(!has_orange_portal() && has_blue_portal())
		p_blue.link_portal(null)
		return
	p_orange.link_portal(p_blue)
	p_blue.link_portal(p_orange)

/obj/item/gun/energy/wormhole_projector/proc/create_portal(obj/item/projectile/beam/wormhole/W, turf/target)
	var/obj/effect/portal/P = new /obj/effect/portal(target, src, 300, null, FALSE, null, atmos_link)
	if(istype(W, /obj/item/projectile/beam/wormhole/orange))
		qdel(p_orange)
		p_orange = P
		P.icon_state = "portal1"
	else
		qdel(p_blue)
		p_blue = P
	crosslink()

/* 3d printer 'pseudo guns' for borgs */

/obj/item/gun/energy/printer
	name = "cyborg lmg"
	desc = "A LMG that fires 3D-printed flechettes. They are slowly resupplied using the cyborg's internal power source."
	icon_state = "l6closed0"
	icon = 'icons/obj/guns/projectile.dmi'
	cell_type = "/obj/item/stock_parts/cell/secborg"
	ammo_type = list(/obj/item/ammo_casing/energy/c3dbullet)
	can_charge = 0
	use_cyborg_cell = 1

/obj/item/gun/energy/printer/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_blocker)

/obj/item/gun/energy/printer/emp_act()
	return

/obj/item/gun/energy/temperature
	name = "temperature gun"
	icon_state = "freezegun"
	desc = "A gun that changes temperatures."
	ammo_type = list(/obj/item/ammo_casing/energy/temp, /obj/item/ammo_casing/energy/temp/hot)
	cell_type = "/obj/item/stock_parts/cell/high"
	pin = null

/obj/item/gun/energy/temperature/security
	name = "security temperature gun"
	desc = "A weapon that can only be used to its full potential by the truly robust."
	pin = /obj/item/firing_pin

/obj/item/gun/energy/laser/instakill
	name = "instakill rifle"
	icon_state = "instagib"
	item_state = "instagib"
	desc = "A specialized ASMD laser-rifle, capable of flat-out disintegrating most targets in a single hit."
	ammo_type = list(/obj/item/ammo_casing/energy/instakill)
	force = 60

/obj/item/gun/energy/laser/instakill/red
	desc = "A specialized ASMD laser-rifle, capable of flat-out disintegrating most targets in a single hit. This one has a red design."
	icon_state = "instagibred"
	item_state = "instagibred"
	ammo_type = list(/obj/item/ammo_casing/energy/instakill/red)

/obj/item/gun/energy/laser/instakill/blue
	desc = "A specialized ASMD laser-rifle, capable of flat-out disintegrating most targets in a single hit. This one has a blue design."
	icon_state = "instagibblue"
	item_state = "instagibblue"
	ammo_type = list(/obj/item/ammo_casing/energy/instakill/blue)

/obj/item/gun/energy/laser/instakill/emp_act() //implying you could stop the instagib
	return

/obj/item/gun/energy/gravity_gun
	name = "one-point bluespace-gravitational manipulator"
	desc = "An experimental, multi-mode device that fires bolts of Zero-Point Energy, causing local distortions in gravity."
	ammo_type = list(/obj/item/ammo_casing/energy/gravity/repulse, /obj/item/ammo_casing/energy/gravity/attract, /obj/item/ammo_casing/energy/gravity/chaos)
	item_state = "gravity_gun"
	icon_state = "gravity_gun"
	pin = null
	var/power = 4

/obj/item/gun/energy/gravity_gun/security
	pin = /obj/item/firing_pin

//Emitter Gun

/obj/item/gun/energy/emitter
	name = "Emitter Carbine"
	desc = "A small emitter fitted into a handgun case, due to size constraints and safety it can only shoot about ten times when fully charged."
	icon_state = "emitter_carbine"
	force = 12
	w_class = WEIGHT_CLASS_SMALL
	inaccuracy_modifier = 0.25
	cell_type = /obj/item/stock_parts/cell/super
	ammo_type = list(/obj/item/ammo_casing/energy/emitter)
	automatic_charge_overlays = FALSE

/obj/item/gun/energy/emitter/update_icon_state()
	var/obj/item/ammo_casing/energy/shot = ammo_type[current_firemode_index]
	if(!QDELETED(cell) && (cell.charge > shot.e_cost))
		icon_state = "emitter_carbine_empty"
	else
		icon_state = "emitter_carbine"

//the pickle ray
/obj/item/gun/energy/pickle_gun
	name = "pickle ray"
	desc = "funniest shit i've ever seen"
	icon_state = "decloner"
	no_pin_required = TRUE
	ammo_type = list(/obj/item/ammo_casing/energy/pickle)

//Gutsy flamethrower
/obj/item/gun/energy/gutsy_flamethrower
	name = "integrated flamethrower"
	desc = "A flamethrower integrated directly into a Mr. Gutsy. This one has limiters to prevent rapid depletion of charge."
	icon = 'icons/obj/guns/flamethrower.dmi'
	icon_state = "m2_flamethrower_on"
	item_state = "m2flamethrower"
	can_charge = FALSE
	selfcharge = EGUN_SELFCHARGE_BORG
	cell_type = /obj/item/stock_parts/cell/secborg
	fire_delay = 10
	charge_delay = 3
	ammo_type = list(/obj/item/ammo_casing/energy/flamethrower)

/obj/item/gun/energy/gutsy_flamethrower/emp_act()
	return


/obj/item/stock_parts/cell/lasmusket
	name = "lasmusket internal battery"
	charge = 0
	maxcharge = 1
	start_charged = FALSE


//Laser musket
/obj/item/gun/energy/lasmusket
	name = "laser musket"
	desc = "In the wasteland, one must make do, and this weapon's wielder certainly does. Made from metal scraps, electronic parts,a microfusion cell, an old rifle stock and a bottle full of dreams, the Laser Musket is sure to stop anything in its tracks and make those raiders think twice."
	icon = 'icons/fallout/objects/guns/energy.dmi'
	icon_state = "lasmusket"
	item_state = "lasmusket"
	fire_delay = 15
	dryfire_sound = 'sound/f13weapons/noammoenergy.ogg'
	dryfire_text = "*power failure*"
	can_bayonet = TRUE
	can_scope = TRUE
	can_remove = FALSE
	can_charge = FALSE
	dead_cell = TRUE
	knife_x_offset = 22
	knife_y_offset = 20
	bayonet_state = "bayonet"
	scope_state = "scope_long"
	scope_x_offset = 11
	scope_y_offset = 14
	fire_sound = 'sound/f13weapons/lasmusket_fire.ogg'
	equipsound = 'sound/f13weapons/equipsounds/aep7equip.ogg'
	cell_type = /obj/item/stock_parts/cell/lasmusket
	ammo_type = list(/obj/item/ammo_casing/energy/laser/lasgun/hitscan/musket)
	var/cranks = 0
	var/cranking = FALSE
	var/stop_cranking_because_we_fired = FALSE //originally called 'firing' but apparently parent already has a var called firing. whoops
	var/crank_time = 5 //time per crank in ds
	var/pump_sound = 'sound/f13weapons/lasmusket_crank.ogg'
	var/conductor = FALSE
	var/focused_lense = FALSE
	automatic_charge_overlays = FALSE
	extra_damage = -20
	extra_penetration = -0.15
	slowdown = 0.2 //you can't actually fire it yet

/obj/item/gun/energy/lasmusket/examine(mob/user)
	..()
	if(!conductor)
		. += "It has an connector for a <b>super conductor</b> on it's capacitor."
	if(conductor)
		. += "It has a super conductor installed on it's capacitor."
	if(!focused_lense)
		. += "It has an exposed slot for a <b>focused crystal lense</b> on it's refractor."
	if(focused_lense)
		. += "It has a focus crystal lense installed in it's refractor."

/obj/item/gun/energy/lasmusket/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/advanced_crafting_components/lenses))
		if(!focused_lense)
			focused_lense = TRUE
			to_chat(user, "<span class = 'notice'>You fit the focused lense into the [src], sharpening it's power!</span>")
			qdel(A)
		else
			to_chat(user, "<span class = 'notice'>There is already a focused lense slotted in the [src]</span>")
			return
	if(istype(A, /obj/item/advanced_crafting_components/conductors))
		if(!conductor)
			conductor = TRUE
			to_chat(user, "<span class = 'notice'>You attach the super conductor the micro fusion cell within the [src], increasing it's capacity!</span>")
			qdel(A)
		else
			to_chat(user, "<span class = 'notice'>There is no room for additional capacitors in the [src]</span>")

/obj/item/gun/energy/lasmusket/attack_self(mob/living/user)
	if(cranking)
		to_chat(user, "<span class = 'notice'>You are already cranking [src]!</span>")
		return
	cranking = TRUE
	to_chat(user, "<span class = 'notice'>You start cranking [src].</span>")
	slowdown = 0.5
	while(do_after_advanced(user, crank_time, src, do_after_flags = DO_AFTER_DISALLOW_ACTIVE_ITEM_CHANGE, tool = src) && !stop_cranking_because_we_fired)
		to_chat(user, "<span class = 'notice'>You crank [src].</span>") //debug
		cranks++
		playsound(src, pump_sound, 30, 1)
		switch(cranks)
			if(1)
				cell.give(1)
			if(2)
				extra_damage = 0
				extra_penetration = 0
			if(3)
				extra_damage = 5
				extra_penetration = 0
			if(4)
				to_chat(user, "<span class='nicegreen'>[src] is fully charged!</span>")
				extra_damage = 10
				extra_penetration = 0.05
			if(5)
				if(conductor == TRUE)
					to_chat(user, "<span class='nicegreen'>[src] glows brightly as it is over-charged!</span>")
					extra_damage = 15
					extra_penetration = 0.10
			if(6)
				if(focused_lense == TRUE && conductor == TRUE)
					to_chat(user, "<span class='nicegreen'>[src] strains it's over-charged microfusion capacitor!</span>")
					extra_damage = 20
					extra_penetration = 0.15
		update_icon()
	update_icon()
	slowdown = initial(slowdown)
	if(!stop_cranking_because_we_fired)
		to_chat(user, "<span class = 'notice'>You stop cranking [src]. You cranked it for a total of [cranks/2] seconds!</span>")
	cranking = FALSE
	stop_cranking_because_we_fired = FALSE

/obj/item/gun/energy/lasmusket/update_overlays()
	. = ..()
	switch(cranks)
		if(1)
			. += "[icon_state]_charge1"
		if(2)
			. += "[icon_state]_charge2"
		if(3)
			. += "[icon_state]_charge3"
		if(4 to INFINITY)
			. += "[icon_state]_charge4"

/obj/item/gun/energy/lasmusket/do_fire(atom/target, mob/living/user, message = TRUE, params, zone_override = "", bonus_spread = 0, stam_cost = 0)
	stop_cranking_because_we_fired = TRUE
	..()
	to_chat(user, "<span class = 'notice'>You stop cranking [src]. You cranked it for a total of [cranks/2] seconds!</span>")
	cell.use(1)
	cranks = 0
	slowdown = initial(slowdown)
	extra_damage = initial(extra_damage)
	extra_penetration = initial(extra_penetration)
	update_icon()

//Laser musket, logarithmic
//It can be cranked forever and will stack damage increases. Logarithmically, of course, so it doesn't get too out of hand.
/obj/item/gun/energy/lasmusket/log
	name = "logarithmic laser musket"
	desc = "It's mathematical!"
	var/logmult = 10 //note: do not change these for balance. ever. unless you're vving them as an admin, in which it's fine
	var/logdiv = 2


/obj/item/gun/energy/lasmusket/log/attack_self(mob/living/user)
	if(cranking)
		to_chat(user, "<span class = 'notice'>You are already cranking [src]!</span>")
		return
	cranking = TRUE
	to_chat(user, "<span class = 'notice'>You start cranking [src].</span>")
	slowdown = 0.5
	while(do_after_advanced(user, crank_time, src, do_after_flags = DO_AFTER_DISALLOW_ACTIVE_ITEM_CHANGE, tool = src) && !stop_cranking_because_we_fired)
		to_chat(user, "<span class = 'notice'>You crank [src].</span>") //debug
		if(!cranks)
			cell.give(1)
		cranks++
		playsound(src, pump_sound, 30, 1)
		update_icon()
		extra_damage = logmult*log(cranks/logdiv) //it aint logarithmic for nothin

	to_chat(user, "<span class = 'notice'>You stop cranking [src]. You cranked it for a total of [cranks/2] seconds!</span>")
	cranks = 0
	update_icon()
	cell.use(1)
	extra_damage = initial(extra_damage)
	extra_penetration = initial(extra_penetration)
	slowdown = initial(slowdown)
	cranking = FALSE
	stop_cranking_because_we_fired = FALSE
