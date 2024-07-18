/datum/job/mm //do NOT use this for anything, it's just to store faction datums
	department_flag = MEN
	faction = FACTION_MINUTEMEN
	selection_color = "#6e9af8"

	access = list(ACCESS_ROBOTICS, ACCESS_NCR, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_NCR, ACCESS_ENGINE_EQUIP, ACCESS_ENGINE, ACCESS_HYDROPONICS, ACCESS_KITCHEN, ACCESS_BAR, ACCESS_SEC_DOORS)
	blacklisted_quirks = list()
	outfit = /datum/outfit/job/mm/
	exp_type = EXP_TYPE_MM

	objectivesList = list("Leadership recommends the following goal for this week: Establish an outpost at the radio tower","Leadership recommends the following goal for this week: Acquire blueprints for research and preservation", "Leadership recommends the following goal for this week: Acquire or confiscate dangerous tech by any means necessary.")

/datum/outfit/job/mm
	name = "mmdatums"
	jobtype = /datum/job/mm
	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = 	/obj/item/radio/headset/headset_ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	gloves = /obj/item/clothing/gloves/combat
	id = /obj/item/card/id/dogtag
	box = /obj/item/storage/survivalkit/advanced

/datum/outfit/job/mm/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/outfit/job/mm/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_STRAIGHT_EDGE, REF(src))
	ADD_TRAIT(H, TRAIT_GENERIC, REF(src))

// Captain
/datum/job/mm/mmcaptain
	title = "Minutemen Captain"
	flag = MMCAPTAIN
	total_positions = 1
	spawn_positions = 1
	head_announce = list("Security")
	description = "You are the direct superior to the Officers, NCOs, and Enlisted. You are the CO of Westford's garrison. You plan patrols, training and missions, working in some cases with Officers and NCOs in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel, and conducting diplomacy with the region."
	supervisors = "The General and Minuteman Command"
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_CHANGE_IDS, ACCESS_NCR_COMMAND)
	selection_color = "#1758b9"
	display_order = JOB_DISPLAY_ORDER_MMCAPTAIN
	req_admin_notify = 1

	exp_type = EXP_TYPE_MM
	exp_requirements = 1440

	loadout_options = list()

/datum/outfit/job/mm/mmcaptain
	name = "Minuteman Captain"
	jobtype	= /datum/job/mm/mmcaptain
	id = /obj/item/card/id/dogtag/mm_captain
	uniform	= /obj/item/clothing/under/f13/minutemen_captain
	shoes =	/obj/item/clothing/shoes/f13/military/ncr_officer_boots
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/f13/leather
	ears = /obj/item/radio/headset/headset_ncr/command
	suit = /obj/item/clothing/suit/armor/f13/combat/minutemen/overcoat
	r_pocket = /obj/item/binoculars
	box = /obj/item/storage/survivalkit/advanced
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911/custom = 1,
		/obj/item/ammo_box/magazine/m45 = 3,
		/obj/item/storage/bag/money/small/ = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/grenade/syndieminibomb/concussion = 1,
		)

/datum/outfit/job/mm/mmcaptain/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS, REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER, REF(src))
	ADD_TRAIT(H, TRAIT_SELF_AWARE, REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)

/* loadouts
/datum/outfit/loadout/mmcaptain1
	name = "Veteran of the Mojave Campaign"
	suit_store = /obj/item/gun/ballistic/automatic/pistol/deagle/elcapitan
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m14mm = 3,
	)

/datum/outfit/loadout/mmcaptain2
	name = "Friend of the Rangers"
	suit_store = /obj/item/gun/ballistic/revolver/hunting/sequoia/rangercaptain
	backpack_contents = list(
		/obj/item/ammo_box/c4570box = 1,
	)
*/

 //Officer
/datum/job/mm/mm_officer
	title = "Minutemen Officer"
	flag = MMOFFICER
	total_positions = 2
	spawn_positions = 2
	description = "You are the direct superior to the NCOs and Enlisted. You plan patrols, training and missions, working in some cases with NCOs and Enlisted in accomplishing objectives otherwise beyond the capabilities of ordinary enlisted personnel, and helping the captain in conducting diplomacy with the region."
	supervisors = "Captain"
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_CHANGE_IDS, ACCESS_NCR_COMMAND)
	selection_color = "#2163c5"
	display_order = JOB_DISPLAY_ORDER_MMOFFICER
	outfit = /datum/outfit/job/mm/mm_officer
	exp_type = EXP_TYPE_MM
	exp_requirements = 1020

	/*loadout_options = list( 				// ALL: Bayonet, M1911 sidearm
		/datum/outfit/loadout/ncrltsniper,	// Republic's Pride
		/datum/outfit/loadout/ncrltshotgun, // Riot Shotgun
		)*/

/datum/outfit/job/mm/mm_officer		// Republic's Pride, Binoculars, Bayonet, M1911 custom
	name = "Minutemen Officer"
	jobtype	= /datum/job/mm/mm_officer
	id = /obj/item/card/id/dogtag/mm_officer
	uniform	= /obj/item/clothing/under/f13/minutemen_officer
	shoes =	/obj/item/clothing/shoes/f13/military/ncr_officer_boots
	accessory = /obj/item/clothing/accessory/ncr/LT1
	neck = /obj/item/storage/belt/holster/legholster
	gloves = /obj/item/clothing/gloves/f13/leather
	ears = /obj/item/radio/headset/headset_ncr/command
	suit = /obj/item/clothing/suit/armor/f13/combat/minutemen/
	r_pocket = /obj/item/binoculars
	box = /obj/item/storage/survivalkit/advanced
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911/custom = 1,
		/obj/item/ammo_box/magazine/m45 = 3,
		/obj/item/storage/bag/money/small = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 3,
		/obj/item/grenade/syndieminibomb/concussion = 1,
		)
/*
/datum/outfit/loadout/ncrltsniper
	name = "Frontier Sharpshooter"
	suit_store = /obj/item/gun/ballistic/automatic/m1garand/republicspride
	backpack_contents = list(
		/obj/item/ammo_box/magazine/garand308 = 2,
		)

/datum/outfit/loadout/ncrltshotgun
	name = "Battle-Hardened"
	suit_store = /obj/item/gun/ballistic/automatic/shotgun/riot
	backpack_contents = list(
		/obj/item/ammo_box/magazine/d12g = 2,
		)
*/
/datum/outfit/job/mm/mm_officer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, REF(src))
	ADD_TRAIT(H, TRAIT_SELF_AWARE, REF(src))
	ADD_TRAIT(H, TRAIT_HARD_YARDS, REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER, REF(src))
	H.AddSpell(new /obj/effect/proc_holder/spell/terrifying_presence)


//SERGEANT
/datum/job/mm/mm_nco
	title = "Minutemen NCO"
	flag = MMNCO
	total_positions = 4
	spawn_positions = 4
	description = "You are the direct superior to the enlisted troops, working with the chain of command you echo the orders of your superiors and ensure that the enlisted follow them to the letter. Additionally, you are responsible for the wellbeing of the troops and their ongoing training with the Minutemen. You lead them on patrols and tasks as a squad - you should not be leaving the town alone!"
	supervisors = "Officers and the Captain"
	selection_color = "#2d6ecf"
	access = list(ACCESS_NCR, ACCESS_NCR_ARMORY, ACCESS_NCR_COMMAND)
	display_order = JOB_DISPLAY_ORDER_MMNCO
	outfit = /datum/outfit/job/mm/mm_nco
	exp_type = EXP_TYPE_MM
	exp_requirements = 780

	/*loadout_options = list( // ALL: Bayonet, M1911 sidearm
		/datum/outfit/loadout/sergeantrifleman,	// AK-112
		/datum/outfit/loadout/sergeantrecon, // Marksman carbine
		/datum/outfit/loadout/sergeantcqc, // Armor plus browning.
		)*/

/datum/outfit/job/mm/mm_nco/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, REF(src))
	ADD_TRAIT(H, TRAIT_SELF_AWARE, REF(src))
	ADD_TRAIT(H, TRAIT_LIFEGIVER, REF(src))


/datum/outfit/job/mm/mm_nco
	name = "Minutemen NCO"
	jobtype = /datum/job/mm/mm_nco
	id = /obj/item/card/id/dogtag/mm_nco
	accessory = /obj/item/clothing/accessory/ncr/SGT
	gloves = /obj/item/clothing/gloves/f13/leather/fingerless
	neck = /obj/item/storage/belt/holster/legholster
	uniform = /obj/item/clothing/under/f13/minutemen_nco
	backpack_contents = list(
		/obj/item/storage/bag/money/small = 1,
		/obj/item/grenade/f13/frag = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911 = 1,
		/obj/item/ammo_box/magazine/m45 = 2,
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 1,
		/obj/item/clothing/accessory/ncr/SSGT = 1,
		/obj/item/book/granter/trait/trekking = 1,
	)
/*loadouts
/datum/outfit/loadout/sergeantrifleman
	name = "One of the Men"
	head = /obj/item/clothing/head/helmet/f13/ncr/sergeant
	suit = /obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle/sergeant
	suit_store = /obj/item/gun/ballistic/automatic/assault_rifle/ak112
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556mm = 2,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/flashlight/seclite = 1,
	)

/datum/outfit/loadout/sergeantrecon
	name = "Recon Squad Leader"
	head = /obj/item/clothing/head/helmet/f13/ncr/sergeant
	suit = /obj/item/clothing/suit/armor/f13/ncr/reinforced/mantle/sergeant
	suit_store = /obj/item/gun/ballistic/automatic/rangemaster
	backpack_contents = list(
		/obj/item/ammo_box/a762mmbox = 2,

	)

/datum/outfit/loadout/sergeantcqc
	name = "Trench Raid Leader"
	head = /obj/item/clothing/head/helmet/f13/ncr/heavygunner/trenchraider
	mask = /obj/item/clothing/mask/gas
	suit = /obj/item/clothing/suit/armor/f13/ncr/heavygunner/trenchraider
	suit_store = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/grenade/f13/frag = 2,
		/obj/item/grenade/f13/he_grenade = 1,
		/obj/item/shovel/trench = 1,
	)
*/

//MM Enlisted
/datum/job/mm/mm_enlisted
	title = "Minutemen Regular"
	flag = MMENLISTED
	total_positions = 12
	spawn_positions = 12
	description = "You are a regular, the standard Minuteman enlisted trooper. Obey your the NCOs and officers, no matter what you are expected to follow military discipline and uphold the Minutemen's ideals."
	supervisors = "NCOs and Above"
	display_order = JOB_DISPLAY_ORDER_MMENLISTED
	outfit = /datum/outfit/job/mm/mm_enlisted
	exp_type = EXP_TYPE_MM

/*
	loadout_options = list(
		/datum/outfit/loadout/trooperrifleman,		// Service Rifle + Bayonet
		/datum/outfit/loadout/trooperfiresupport,	// Hunting shotgun, Trench tool, Sandbags
		/datum/outfit/loadout/trooperhunter,		// Hunting Rifle
	)
*/
/datum/outfit/job/mm/mm_enlisted
	name = "Minutemen Regular"
	jobtype	= /datum/job/mm/mm_enlisted
	id = /obj/item/card/id/dogtag/mm_enlisted
	accessory = /obj/item/clothing/accessory/ncr/TPR
	uniform = /obj/item/clothing/under/f13/minutemen
	backpack_contents = list(
		/obj/item/storage/bag/money/small = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/grenade/f13/frag = 1,
		/obj/item/storage/box/ration/menu_eight = 1,
	)
/*
/datum/outfit/loadout/trooperrifleman
	name = "Veteran Trooper"
	suit_store = /obj/item/gun/ballistic/automatic/service
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556mm = 3,
		/obj/item/melee/onehanded/knife/bayonet = 1,
	)

/datum/outfit/loadout/trooperfiresupport
	name = "Asst. Pointman"
	suit_store = /obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/grenade/f13/frag = 1,
	)

/datum/outfit/loadout/trooperhunter
	name = "Marksman Qualified"
	suit_store = /obj/item/gun/ballistic/rifle/hunting
	backpack_contents = list(
		/obj/item/attachments/scope = 1,
		/obj/item/ammo_box/a308 = 1,
		/obj/item/shovel/trench = 1,
		/obj/item/stack/sheet/mineral/sandbags = 5,
	)
	*/
