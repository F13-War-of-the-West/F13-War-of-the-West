/*
BoS access:
Main doors: ACCESS_CAPTAIN 20
*/

/datum/job/bos //do NOT use this for anything, it's just to store faction datums.
	department_flag = BOS
	selection_color = "#6d7374"
	faction = FACTION_BROTHERHOOD

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	blacklisted_quirks = list(/datum/quirk/straight_edge)
	outfit = /datum/outfit/job/bos/
	exp_type = EXP_TYPE_BROTHERHOOD

	objectivesList = list("Leadership recommends the following goal for this week: Establish an outpost at the radio tower","Leadership recommends the following goal for this week: Acquire blueprints for research and preservation", "Leadership recommends the following goal for this week: Acquire or confiscate dangerous tech by any means necessary.")

/datum/outfit/job/bos
	name = "bosdatums"
	jobtype = 	/datum/job/bos
	backpack = 	/obj/item/storage/backpack/explorer
	satchel = 	/obj/item/storage/backpack/satchel/explorer
	ears = 		/obj/item/radio/headset/headset_bos
	uniform =	/obj/item/clothing/under/syndicate/brotherhood
	shoes = 	/obj/item/clothing/shoes/combat/swat
	gloves = 	/obj/item/clothing/gloves/combat
	id = 		/obj/item/card/id/dogtag
	box = 		/obj/item/storage/survivalkit/advanced

/datum/outfit/job/bos/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/bos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK,  REF(src))
	ADD_TRAIT(H, TRAIT_STRAIGHT_EDGE,  REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC,  REF(src))
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/boscombathelmetmk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/set_vrboard/bos)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gate_bos)

/*
Elder


/datum/job/bos/f13elder
	title = "Elder"
	flag = F13ELDER
	head_announce = list("Security")
	supervisors = "the high elders"
	selection_color = "#7f8c8d"
	req_admin_notify = 1

	exp_requirements = 0

	total_positions = 0
	spawn_positions = 1

	outfit = /datum/outfit/job/bos/f13elder

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_MINERAL_STOREROOM, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13elder/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ,  REF(src))
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))

/datum/outfit/job/bos/f13elder
	name = "Elder"
	jobtype = /datum/job/bos/f13elder
	pa_wear = TRUE
	suit =	/obj/item/clothing/suit/f13/elder
	glasses =	/obj/item/clothing/glasses/night
	accessory =	/obj/item/clothing/accessory/bos/elder
	suit_store =	/obj/item/gun/energy/laser/pistol
	neck =	/obj/item/clothing/neck/mantle/holster/bos/right
	ears = /obj/item/radio/headset/headset_bos/command
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
	)
*/
/*
Head Paladin


/datum/job/bos/f13sentinel
	title = "Paladin Commander"
	flag = F13SENTINEL
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the acting field commander on behalf of the Chicago chapter. You are a veteran of many battles and sorties in pursuit of Brotherhood goals; your only weakness may just be your hubris. Your main goals are the protection of your brothers, initiating Juniors in the caste, diplomacy and trade."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder"
	selection_color = "#7f8c8d"

	exp_requirements = 1440
	exp_type = EXP_TYPE_BROTHERHOOD

	loadout_options = list(
	/datum/outfit/loadout/sentheavy,	// Gatling Laser
	/datum/outfit/loadout/sentlaser,	// AER12
	/datum/outfit/loadout/sentmelee,	// Super Sledge, Colt 6520, More Melee Damage
	)

	outfit = /datum/outfit/job/bos/f13sentinel

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13sentinel/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR,  REF(src))
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER,  REF(src))
	ADD_TRAIT(H, TRAIT_IRONFIST,  REF(src))

/datum/outfit/job/bos/f13sentinel
	name = "Paladin Commander"
	jobtype = /datum/job/bos/f13sentinel
	uniform = 		/obj/item/clothing/under/f13/recon
	accessory = 	/obj/item/clothing/accessory/bos/sentinel
	suit = /obj/item/clothing/suit/armor/f13/power_armor/midwest
	head = /obj/item/clothing/head/helmet/f13/power_armor/midwest
	glasses =       /obj/item/clothing/glasses/sunglasses
	belt =			/obj/item/storage/belt/military/assault
	mask =			/obj/item/clothing/mask/gas/sechailer
	ears =			/obj/item/radio/headset/headset_bos/command
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		)

/datum/outfit/loadout/sentheavy
	name = "Frontline Commander"
	backpack_contents = list(
		/obj/item/encminigunpack = 1,
		/obj/item/stock_parts/cell/ammo/ecp = 2,
	)

/datum/outfit/loadout/sentlaser
	name = "Aspiring Lord"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer12 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
	)

/datum/outfit/loadout/sentmelee
	name = "Ascended Tribal"
	backpack_contents = list(
		/obj/item/twohanded/sledgehammer/supersledge = 1,
		/obj/item/book/granter/trait/bigleagues = 1,
		/obj/item/gun/ballistic/revolver/colt6520 = 1,
		/obj/item/ammo_box/l10mm = 2,
	)
*/
/*
Proctor
*/

/datum/job/bos/f13headscribe
	title = "Head Scribe"
	flag = F13HEADSCRIBE
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You head the scientific, diplomatic and exploratory nature of this expedition at the behest of the Council of Elders. While all the castes look up to you in moments of need for objectives, tasks, and the way forward - you must ensure that decisions on situations requiring a fist must be made in accordance with you Senior Paladins and Senior Knights. You are the lead medical and engineering expert of the chapter, and must not head out without escort."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder"
	selection_color = "#6d737481"

	exp_type = EXP_TYPE_BROTHERHOOD
	exp_requirements = 1440


	outfit = /datum/outfit/job/bos/f13headscribe

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_CHANGE_IDS)

/datum/outfit/job/bos/f13headscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT,  REF(src))
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT,  REF(src))
	ADD_TRAIT(H, TRAIT_CYBERNETICIST,  REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC,  REF(src))
	ADD_TRAIT(H, TRAIT_CHEMWHIZ,  REF(src))
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH,  REF(src))
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))
	ADD_TRAIT(H, TRAIT_ADVANCED_EXPLOSIVE_CRAFTING, REF(src))

/datum/outfit/job/bos/f13headscribe
	name = "Head Scribe"
	jobtype = /datum/job/bos/f13headscribe
	chemwhiz = TRUE
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	gunsmith_four = TRUE
	uniform = 		/obj/item/clothing/under/syndicate/brotherhood
	accessory = 	/obj/item/clothing/accessory/bos/headscribe
	glasses =       /obj/item/clothing/glasses/sunglasses
	suit = 			/obj/item/clothing/suit/armor/f13/headscribe
	ears = 			/obj/item/radio/headset/headset_bos/command
	belt = 			/obj/item/storage/belt/utility/full/engi
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 3,
		/obj/item/gun/energy/laser/plasma/glock = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/book/granter/trait/gunsmith_three=1,
		/obj/item/book/granter/trait/gunsmith_four=1,
		)

/*
Head Knight
*/

/datum/job/bos/f13knightcap
	title = "Head Knight"
	flag = F13KNIGHTCAPTAIN
	head_announce = list("Security")
	total_positions = 0
	spawn_positions = 0
	description = "You are the Head Knight, leader of your respective caste in the Chapter. Your knowledge of pre-war tactics, and you have advanced combat training and experience. You are in charge of the detachment's internal security, and your Knights. Delegate to them as necessary."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Elder"
	selection_color = "#6d737481"

	exp_type = EXP_TYPE_BROTHERHOOD
	exp_requirements = 1440

	loadout_options = list(
	/datum/outfit/loadout/capstand,	// AER12
	/datum/outfit/loadout/capsap,	// P90
	/datum/outfit/loadout/capmelee,	// Prewar Ripper
	)

	outfit = /datum/outfit/job/bos/f13knightcap

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_CHANGE_IDS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS, ACCESS_ARMORY, ACCESS_BRIG, ACCESS_CHANGE_IDS)


/datum/outfit/job/bos/f13knightcap/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR,  REF(src))

/datum/outfit/job/bos/f13knightcap/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR,  REF(src))


/datum/outfit/job/bos/f13knightcap
	name = "Head Knight"
	jobtype = /datum/job/bos/f13knightcap
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/captain
	glasses =		/obj/item/clothing/glasses/night
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	accessory =		/obj/item/clothing/accessory/bos/knightcaptain
	belt =			/obj/item/storage/belt/security/full
	neck =			/obj/item/storage/belt/holster
	ears =			 /obj/item/radio/headset/headset_bos/command
	mask =			/obj/item/clothing/mask/gas/sechailer
	head =			/obj/item/clothing/head/helmet/f13/combat/brotherhood/captain
	id =			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/pistol14 = 1,
		/obj/item/ammo_box/magazine/m14mm = 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/book/granter/trait/gunsmith_one = 1,
		/obj/item/book/granter/trait/gunsmith_two = 1,
		)

/datum/outfit/loadout/capstand
	name = "Standard"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer12 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 3
	)

/datum/outfit/loadout/capsap
	name = "Close Support"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/p90 = 1,
		/obj/item/ammo_box/magazine/mp90 = 2
	)

/datum/outfit/loadout/capmelee
	name = "Frontline Leader"
	backpack_contents = list(
		/obj/item/melee/powered/ripper/prewar = 1
	)


/*
Senior Paladin


/datum/job/bos/f13seniorpaladin
	title = "Senior Paladin"
	flag = F13SENIORPALADIN
	total_positions = 0
	spawn_positions = 0
	description = "You are the chapter's seniormost member of the Paladin caste. One shaped from years of training and experience. Duties relating to field command fall under you, by default. In matters of trade, exploration and diplomacy - you are the de facto head, unless a Head Scribe exists. Your job is to be the chapter's fist, instilling discipline in your caste of Paladins as you go."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Paladin Commander"
	selection_color = "#95a5a6"

	exp_requirements = 1020
	exp_type = EXP_TYPE_BROTHERHOOD

	loadout_options = list(
		/datum/outfit/loadout/spaladina,	// Super Sledge
		/datum/outfit/loadout/spaladinb,	// Gatling Laser
		/datum/outfit/loadout/spaladinc,	// AER12
		)

	outfit = /datum/outfit/job/bos/f13seniorpaladin

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13paladin,
		),
	)

/datum/outfit/job/bos/f13seniorpaladin/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR,  REF(src))
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))

/datum/outfit/job/bos/f13seniorpaladin
	name =	"Senior Paladin"
	jobtype =	/datum/job/bos/f13seniorpaladin
	suit = /obj/item/clothing/suit/armor/f13/power_armor/t51b
	head = /obj/item/clothing/head/helmet/f13/power_armor/t51b
	accessory =	/obj/item/clothing/accessory/bos/seniorpaladin
	uniform =	/obj/item/clothing/under/f13/recon
	mask =	/obj/item/clothing/mask/gas/sechailer
	neck = /obj/item/storage/belt/holster
	belt =	/obj/item/storage/belt/military/assault

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
	)

/datum/outfit/loadout/spaladina
	name = "Senior Brawler Paladin"
	backpack_contents = list(
		/obj/item/twohanded/sledgehammer/supersledge = 1,
		/obj/item/clothing/accessory/bos/paladin = 1,
		)
/datum/outfit/loadout/spaladinb
	name = "Senior Offensive Paladin"
	backpack_contents = list(
		/obj/item/encminigunpack = 1,
		/obj/item/clothing/accessory/bos/paladin = 1,
		)

/datum/outfit/loadout/spaladinc
	name = "Senior Support Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer12 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/clothing/accessory/bos/paladin = 1,
		)
*/

/*
Paladin


/datum/job/bos/f13paladin
	title = "Paladin"
	flag = F13PALADIN
	total_positions = 2
	spawn_positions = 2
	description = "You answer to the Paladin Commander, and by extension - the Head Scribe for issues regarding technology aquisition. Be the chapter's shock infantry, and utilize your armour to its fullest capacity. Highly trained from experience as a knight - you are to take field command in the absence of a Senior Paladin. You may also finalize trade and diplomatic decisions in the absence of a superior. You are also required to train Squires, so that they may one day become Paladins themselves."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Paladin Commander"
	selection_color = "#95a5a6"
	exp_type = EXP_TYPE_BROTHERHOOD
	exp_requirements = 780

	loadout_options = list(
	/datum/outfit/loadout/paladina,	// Powerfist, Colt 6520, More Melee Damage
	/datum/outfit/loadout/paladinb, // R91
	/datum/outfit/loadout/paladinc, // AER9
	)

	outfit = /datum/outfit/job/bos/f13paladin

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13seniorpaladin,
		),
	)

/datum/outfit/job/bos/f13paladin/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_PA_WEAR,  REF(src))
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))

/datum/outfit/job/bos/f13paladin
	name =	"Paladin"
	jobtype =	/datum/job/bos/f13paladin
	suit =	/obj/item/clothing/suit/armor/f13/power_armor/t45d/bos
	head =	/obj/item/clothing/head/helmet/f13/power_armor/t45d/bos
	uniform =	/obj/item/clothing/under/f13/recon
	mask =	/obj/item/clothing/mask/gas/sechailer
	neck = /obj/item/storage/belt/holster
	belt =	/obj/item/storage/belt/military/assault
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak= 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/gun/energy/laser/pistol=1,
		/obj/item/stock_parts/cell/ammo/ec=1,
	)

/datum/outfit/loadout/paladina
	name = "Assault Paladin"
	backpack_contents = list(
		/obj/item/melee/f13powerfist = 1,
		/obj/item/gun/ballistic/revolver/colt6520 = 1,
		/obj/item/ammo_box/l10mm = 2,
		/obj/item/book/granter/trait/bigleagues = 1,
		/obj/item/clothing/accessory/bos/paladin = 1,
		/obj/item/clothing/accessory/bos/juniorpaladin = 1,
		/obj/item/clothing/accessory/bos/seniorpaladin = 1,
	)

/datum/outfit/loadout/paladinb
	name = "Tactical Paladin"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/assault_rifle/r91 = 1,
		/obj/item/ammo_box/magazine/m556mm = 2,
		/obj/item/clothing/accessory/bos/paladin = 1,
		/obj/item/clothing/accessory/bos/juniorpaladin = 1,
		/obj/item/clothing/accessory/bos/seniorpaladin = 1,
		)

/datum/outfit/loadout/paladinc
	name = "Frontline Paladin"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/clothing/accessory/bos/paladin = 1,
		/obj/item/clothing/accessory/bos/juniorpaladin = 1,
		/obj/item/clothing/accessory/bos/seniorpaladin = 1,
		)
*/
/*
Senior Scribe


/datum/job/bos/f13seniorscribe
	title = "Senior Scribe"
	flag = F13SENIORSCRIBE
	total_positions = 1
	spawn_positions = 1
	description = "You answer to the Head Scribe. You are an experienced scientific expert in the fields of medical and engineering technology. Guide your scribes, conduct trade by the side of the Paladins, and ensure your bunker is in the best shape possible. You may also take up the duties of a Field Scribe, with an escort - and may travel close to the chapter bunker to collect salvage and medical herbs if needed."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Proctor"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_BROTHERHOOD
	exp_requirements = 600

	outfit = /datum/outfit/job/bos/f13seniorscribe

	loadout_options = list(
	/datum/outfit/loadout/sscribea,	// Recharger Rifle, Marksman Carbine Blueprint, G&B Part 3&4, Advanced Explosives Crafting
	/datum/outfit/loadout/sscribeb,	// Plasma Pistol, Advanced Engineering Belt, Hypospray, High Surgery
	)

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13scribe,
		),
	)


/datum/outfit/job/bos/f13seniorscribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID,  REF(src))
	ADD_TRAIT(H, TRAIT_CYBERNETICIST,  REF(src))
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))
	ADD_TRAIT(H, TRAIT_EXPLOSIVE_CRAFTING, REF(src))

/datum/outfit/job/bos/f13seniorscribe
	name =	"Senior Scribe"
	jobtype =	/datum/job/bos/f13seniorscribe
	chemwhiz =	TRUE
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = TRUE
	ears = /obj/item/radio/headset/headset_bos
	uniform =	/obj/item/clothing/under/syndicate/brotherhood
	shoes =	/obj/item/clothing/shoes/combat
	belt =	/obj/item/storage/belt/utility/full/engi
	accessory =	/obj/item/clothing/accessory/bos/seniorscribe
	suit =	/obj/item/clothing/suit/f13/seniorscribe
	id =	/obj/item/card/id/dogtag
	glasses =	/obj/item/clothing/glasses/sunglasses/big
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/firstaid/regular = 1,
	)

/datum/outfit/loadout/sscribea
	name = "Sword Senior Scribe"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9/recharger = 1,
		/obj/item/stock_parts/cell/ammo/breeder = 2,
		/obj/item/book/granter/crafting_recipe/blueprint/marksman = 1,
		/obj/item/book/granter/trait/gunsmith_three = 1,
		/obj/item/book/granter/trait/gunsmith_four = 1,
		/obj/item/book/granter/trait/explosives_advanced = 1,
	)
/datum/outfit/loadout/sscribeb
	name = "Shield Senior Scribe"
	backpack_contents = list(
		/obj/item/gun/energy/laser/plasma/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/belt/utility/full/engi = 1,
		/obj/item/reagent_containers/hypospray/CMO = 1,
		/obj/item/book/granter/trait/highsurgery = 1,
	)
*/
/*
Scribe
*/

/datum/job/bos/f13scribe
	title = "Scribe"
	flag = F13SCRIBE
	total_positions = 4
	spawn_positions = 4
	description = "You are a Scribe - tasked with researching and reverse-engineering recovered technologies from the old world, while maintaining your chapter's. You may also be trained in medical or engineering technologies - and can conduct trade by the side of the Paladin caste. You may also take up the duties of a Field Scribe, with an escort - and may travel close to the chapter bunker to collect salvage and medical herbs if needed."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Ethical experimentation and research. Maintenance and crafting."
	supervisors = "the Senior Scribes and Head Scribe"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_BROTHERHOOD
	exp_requirements = 180

	loadout_options = list(
	/datum/outfit/loadout/scribea,	// Sr Scribe
	/datum/outfit/loadout/scribeb,	// Sr Scribe
	/datum/outfit/loadout/scribec,
	/datum/outfit/loadout/scribed,
	)

	outfit = /datum/outfit/job/bos/f13scribe

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13scribe,
		),
	)

/datum/outfit/job/bos/f13scribe
	name = "Scribe"
	jobtype = /datum/job/bos/f13scribe
	chemwhiz =	TRUE
	ears = /obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat
	belt = 			/obj/item/storage/belt/utility/full/engi
	glasses =		/obj/item/clothing/glasses/sunglasses/big
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/storage/firstaid/regular = 1,
		/obj/item/book/granter/trait/gunsmith_three = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/belt/utility/full = 1,
		)

/datum/outfit/job/bos/f13scribe/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_MID,  REF(src))
	ADD_TRAIT(H, TRAIT_MEDICALGRADUATE,  REF(src))
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))
	ADD_TRAIT(H, TRAIT_CYBERNETICIST,  REF(src))
	ADD_TRAIT(H, TRAIT_EXPLOSIVE_CRAFTING, REF(src))
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AER9)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/AEP7)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/wattz1k)

/datum/outfit/loadout/scribea
	name = "Sword Senior Scribe"
	backpack_contents = list(
		/obj/item/gun/energy/laser/aer9/recharger = 1,
		/obj/item/stock_parts/cell/ammo/breeder = 2,
		/obj/item/book/granter/crafting_recipe/blueprint/marksman = 1,
		/obj/item/book/granter/crafting_recipe/gunsmith_three = 1,
		/obj/item/book/granter/crafting_recipe/gunsmith_four = 1,
		/obj/item/book/granter/trait/explosives_advanced = 1,
		/obj/item/clothing/accessory/bos/seniorscribe = 1,
		/obj/item/clothing/suit/f13/seniorscribe = 1,
	)
/datum/outfit/loadout/scribeb
	name = "Shield Senior Scribe"
	backpack_contents = list(
		/obj/item/gun/energy/laser/plasma/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/belt/utility/full/engi = 1,
		/obj/item/reagent_containers/hypospray/CMO = 1,
		/obj/item/book/granter/trait/highsurgery = 1,
		/obj/item/clothing/accessory/bos/seniorscribe = 1,
		/obj/item/clothing/suit/f13/seniorscribe = 1,
	)
/datum/outfit/loadout/scribec
	name = "Sword Scribe"
	backpack_contents = list(
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/aer9 = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/aep7 = 1,
		/obj/item/book/granter/crafting_recipe/blueprint/wattz1k = 1,
		/obj/item/clothing/accessory/bos/scribe = 1,
		/obj/item/clothing/accessory/bos/juniorscribe = 1,
		/obj/item/clothing/suit/f13/scribe = 1,
	)

/datum/outfit/loadout/scribed
	name = "Shield Scribe"
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz/magneto = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/storage/belt/utility/full/engi = 1,
		/obj/item/clothing/accessory/bos/scribe = 1,
		/obj/item/clothing/accessory/bos/juniorscribe = 1,
		/obj/item/clothing/suit/f13/scribe = 1,
	)

/*
Senior Knight


/datum/job/bos/f13seniorknight // Is now Senior Knight again. Yep.
	title = "Senior Knight"
	flag = F13SENIORKNIGHT
	total_positions = 2
	spawn_positions = 1
	description = "You are the senior-most member of your caste in the chapter. Experienced in the fields of combat, reconnaissance and defense; you must lead your caste to victory. Assist Paladins, prepare defense. You are also the one who heads the internal security of the bunker - ensuring personnel are adhering to the Codex, and squashing insubordination."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Paladins and Paladin Commander"
	selection_color = "#95a5a6"
	exp_requirements = 600
	exp_type = EXP_TYPE_BROTHERHOOD

	loadout_options = list(
	/datum/outfit/loadout/sknighta,
	/datum/outfit/loadout/sknightb,
	)

	outfit = /datum/outfit/job/bos/f13seniorknight

	access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_BROTHERHOOD_COMMAND, ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13knight,
		),
	)


/datum/outfit/job/bos/f13seniorknight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_RESEARCHER,  REF(src))

/datum/outfit/job/bos/f13seniorknight
	name = "Senior Knight"
	jobtype = /datum/job/bos/f13seniorknight
	uniform = /obj/item/clothing/under/syndicate/brotherhood
	accessory = /obj/item/clothing/accessory/bos/seniorknight
	neck = /obj/item/storage/belt/holster
	suit = /obj/item/clothing/suit/armor/f13/combat/brotherhood/senior
	head = /obj/item/clothing/head/helmet/f13/combat/brotherhood/senior
	mask = /obj/item/clothing/mask/gas/sechailer
	id = /obj/item/card/id/dogtag
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = FALSE
	gunsmith_four = FALSE
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		)

/datum/outfit/loadout/sknighta
	name = "Senior Footknight"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/mp5 = 1,
		/obj/item/ammo_box/magazine/msmg9mm = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/grenade/smokebomb = 1,
		)

/datum/outfit/loadout/sknightb
	name = "Senior Knight Ranger"
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz2k = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		)
*/
/*
Knight
*/

/datum/job/bos/f13knight // Back to being knight again. Yippee.
	title = "Knight"
	flag = F13KNIGHT
	total_positions = 4
	spawn_positions = 4
	description = "You are the veritable lifeblood of your chapter. Versatile, adaptable and hopefully, dangerous to the chapter's enemies. Your prime duties include ensuring the defense of the chapter, assisting Paladins in expeditions, and serving as scouts. You may also train and take charge of Initiates."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the Senior Knights and Head Knight"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_BROTHERHOOD
	exp_requirements = 180

	loadout_options = list(
	/datum/outfit/loadout/knighta, //Sr Knight, PA Wear book
	/datum/outfit/loadout/knightb, //Sr Knight, PA Wear book
	/datum/outfit/loadout/knightc,
	/datum/outfit/loadout/knightd,
	/datum/outfit/loadout/knighte,
	)

	outfit = /datum/outfit/job/bos/f13knight

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/mentor = list(
			/datum/job/bos/f13initiate,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13knight,
		),
	)

/datum/outfit/job/bos/f13knight/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/bos/f13knight
	name = "Knight"
	jobtype = /datum/job/bos/f13knight
	uniform = /obj/item/clothing/under/syndicate/brotherhood
	mask = /obj/item/clothing/mask/gas/sechailer
	belt = /obj/item/storage/belt/military/assault
	neck = /obj/item/storage/belt/holster
	id = /obj/item/card/id/dogtag
	gunsmith_one = TRUE
	gunsmith_two = TRUE
	gunsmith_three = FALSE
	gunsmith_four = FALSE
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		)

/datum/outfit/loadout/knighta
	name = "Senior Footknight"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/mp5 = 1,
		/obj/item/ammo_box/magazine/msmg9mm = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/clothing/accessory/bos/seniorknight = 1,
		/obj/item/clothing/suit/armor/f13/combat/brotherhood/senior = 1,
		/obj/item/clothing/head/helmet/f13/combat/brotherhood/senior = 1,
		/obj/item/book/granter/trait/pa_wear = 1,
		)

/datum/outfit/loadout/knightb
	name = "Senior Knight Ranger"
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz2k = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/gun/ballistic/automatic/pistol/mk23 = 1,
		/obj/item/ammo_box/magazine/m45exp = 2,
		/obj/item/clothing/accessory/bos/seniorknight = 1,
		/obj/item/clothing/suit/armor/f13/combat/brotherhood/senior = 1,
		/obj/item/clothing/head/helmet/f13/combat/brotherhood/senior = 1,
		/obj/item/book/granter/trait/pa_wear = 1,
		)

/datum/outfit/loadout/knightc
	name = "Footknight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight = 1,
		/obj/item/clothing/accessory/bos/knight = 1,
		/obj/item/gun/energy/laser/aer9 = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/clothing/head/helmet/f13/combat/brotherhood = 1,
		/obj/item/clothing/suit/armor/f13/combat/brotherhood = 1,
		)

/datum/outfit/loadout/knightd
	name = "Scout Knight"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight = 1,
		/obj/item/clothing/accessory/bos/knight = 1,
		/obj/item/gun/ballistic/automatic/combatcarbine = 1,
		/obj/item/ammo_box/magazine/mthompson = 2,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/clothing/head/helmet/f13/combat/brotherhood = 1,
		/obj/item/clothing/suit/armor/f13/combat/brotherhood = 1,
		)

/datum/outfit/loadout/knighte
	name = "Knight Cavalry"
	backpack_contents = list(
		/obj/item/clothing/accessory/bos/juniorknight = 1,
		/obj/item/clothing/accessory/bos/knight = 1,
		/obj/item/melee/powered/ripper = 1,
		/obj/item/gun/energy/laser/pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 3,
		/obj/item/clothing/head/helmet/f13/combat/brotherhood = 1,
		/obj/item/clothing/suit/armor/f13/combat/brotherhood = 1,
		)

/*
Squire
*/

/datum/job/bos/f13squire
	title = "Squire"
	flag = F13SQUIRE
	total_positions = 1
	spawn_positions = 1
	description = "You are an Initiate that showed enough promise during training to be made a Squire, and one day, a Paladin. Listen to the Paladins, follow their orders, and let them guide you. They will lead you into your new life. You are NOT above Initiate. Do not order them around."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "Paladins, or Knights if Paladins aren't around"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_BROTHERHOOD
	exp_requirements = 180

	outfit = /datum/outfit/job/bos/f13squire

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13knightcap,
		),
	)

/datum/outfit/job/bos/f13squire
	name = "Squire"
	jobtype = /datum/job/bos/f13squire
	backpack = /obj/item/storage/backpack/explorer
	ears = /obj/item/radio/headset/headset_bos
	uniform = /obj/item/clothing/under/syndicate/brotherhood
	accessory = /obj/item/clothing/accessory/bos/squire
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/f13/combat/brotherhood/squire
	suit = /obj/item/clothing/suit/armor/f13/combat/brotherhood/squire
	suit_store = /obj/item/gun/energy/laser/aer9
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/stock_parts/cell/ammo/mfc = 2,
		)

/*
Initiate
*/

/datum/job/bos/f13initiate
	title = "Initiate"
	flag = F13INITIATE
	total_positions = 4
	spawn_positions = 4
	description = "Either recently inducted or born into the Brotherhood, you have since proven yourself worthy of assignment to the Chapter. You are to assist your superiors and receive training how they deem fit. You are NEVER allowed to leave the bunker without the direct supervision of a superior; doing so may result in exile or transferrence back the Valley."
	forbids = "The Brotherhood of Steel Expects: Obeying superiors and respecting the Chain that Binds to a degree. Collection and safeguarding of HARMFUL technology from the wasteland. Expanding and making relations only at the benefit of the chapter. Experimentation, research and innovation."
	enforces = "The Brotherhood of Steel Expects: Obeying the Chain That - Binds your direct superior. Collection and safeguarding of technology from the wasteland. Experimentation and research."
	supervisors = "the scribes, knights, or Paladins"
	selection_color = "#95a5a6"

	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 0

	loadout_options = list(
	/datum/outfit/loadout/initiatea,	// Initiate Combat Armor, Wattz Pistol
	/datum/outfit/loadout/initiateb,	// Initiate Combat Armor, Hunting Shotgun
	/datum/outfit/loadout/initiatec,	// Science Glasses, Empty Medical Belt, Stimpak x1, Chemistry Usage, Low Surgery
	)

	outfit = /datum/outfit/job/bos/f13initiate

	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/disciple = list(
			/datum/job/bos/f13knight,
			/datum/job/bos/f13scribe,
		),
	)

/datum/outfit/job/bos/f13initiate
	name = "Aspirant"
	jobtype = /datum/job/bos/f13initiate
	backpack = /obj/item/storage/backpack/explorer
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate/brotherhood
	shoes = 		/obj/item/clothing/shoes/combat/swat
	gloves = 		/obj/item/clothing/gloves/combat
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/survival = 1,
		)

/datum/outfit/loadout/initiatea
	name = "Civilized Knight-Aspirant"
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	backpack_contents = list(
		/obj/item/gun/energy/laser/wattz = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		/obj/item/clothing/accessory/bos/initiateK = 1,
		)

/datum/outfit/loadout/initiateb
	name = "Tribal Knight-Aspirant"
	suit = 			/obj/item/clothing/suit/armor/f13/combat/brotherhood/initiate
	head = 			/obj/item/clothing/head/helmet/f13/combat/brotherhood/initiate
	backpack_contents = list(
		/obj/item/gun/ballistic/shotgun/hunting = 1,
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/clothing/accessory/bos/initiateK = 1,
		)

/datum/outfit/loadout/initiatec
	name = "Scribe-Aspirant"
	belt =			/obj/item/storage/belt/medical
	suit =			/obj/item/clothing/suit/toggle/labcoat
	glasses =		/obj/item/clothing/glasses/science
	gloves =		/obj/item/clothing/gloves/color/latex
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/book/granter/trait/chemistry = 1,
		/obj/item/book/granter/trait/lowsurgery = 1,
		/obj/item/clothing/accessory/bos/initiateS = 1,
		)


/*
Off-Duty
*/
/datum/job/bos/f13offdutybos
	title = "BoS Off-Duty"
	flag = F13OFFDUTYBOS
	total_positions = 7
	spawn_positions = 7
	description = "While off-duty, you are relieved of both your duties and your authority. You are not required to participate in any routine duties of the bunker, and you may spend your time doing whatever you please, within reason."
	supervisors = "your superior rank."
	enforces = "You are not permited to leave the base. You are a non-combatant. You cannot join any raids or battles on the surface. You cannot not run dungeons."
	selection_color = "#95a5a6"
	roleplay_exclusive_notify = 1
	exp_type = EXP_TYPE_WASTELAND//So you can't sit on it and play Baron / Inquisitor. :)
	outfit = /datum/outfit/job/bos/f13offdutybos
	access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_BOS, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)

/datum/outfit/job/bos/f13offdutybos
	name = "BoS Off-Duty"
	jobtype = /datum/job/bos/f13offdutybos
	backpack = /obj/item/storage/backpack
	ears = 			/obj/item/radio/headset/headset_bos
	uniform =		/obj/item/clothing/under/syndicate
	belt = 			/obj/item/storage/belt/military/army
	shoes = 		/obj/item/clothing/shoes/combat
	gloves = 		/obj/item/clothing/gloves/combat
	id = 			/obj/item/card/id/dogtag
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		)
