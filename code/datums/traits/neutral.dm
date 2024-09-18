//traits with no real impact that can be taken freely
//MAKE SURE THESE DO NOT MAJORLY IMPACT GAMEPLAY. those should be positive or negative traits.

/datum/quirk/voracious
	name = "Voracious"
	desc = "Nothing gets between you and your food. You eat twice as fast as everyone else!"
	value = 0
	mob_trait = TRAIT_VORACIOUS
	gain_text = "<span class='notice'>You feel HONGRY.</span>"
	lose_text = "<span class='danger'>You no longer feel HONGRY.</span>"
	medical_record_text = "Patient demonstrates a disturbing capacity for eating."

/datum/quirk/spiritual
	name = "Spiritual"
	desc = "You're in tune with the gods, and your prayers may be more likely to be heard. Or not."
	value = 0
	mob_trait = TRAIT_SPIRITUAL
	gain_text = "<span class='notice'>You feel a little more faithful to the gods today.</span>"
	lose_text = "<span class='danger'>You feel less faithful in the gods.</span>"
	medical_record_text = "Patient reports a belief in a higher power."

/datum/quirk/tagger
	name = "Tagger"
	desc = "You're an experienced artist. While drawing graffiti, you can get twice as many uses out of drawing supplies."
	value = 0
	mob_trait = TRAIT_TAGGER
	gain_text = "<span class='notice'>You know how to tag walls efficiently.</span>"
	lose_text = "<span class='danger'>You forget how to tag walls properly.</span>"
	medical_record_text = "Patient was recently seen for possible paint huffing incident."

/datum/quirk/tagger/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/toy/crayon/spraycan/spraycan = new(get_turf(H))
	H.put_in_hands(spraycan)
	H.equip_to_slot(spraycan, SLOT_IN_BACKPACK)
	H.regenerate_icons()

/datum/quirk/photographer
	name = "Photographer"
	desc = "You know how to handle a camera, shortening the delay between each shot."
	value = 0
	mob_trait = TRAIT_PHOTOGRAPHER
	gain_text = "<span class='notice'>You know everything about photography.</span>"
	lose_text = "<span class='danger'>You forget how photo cameras work.</span>"
	medical_record_text = "Patient mentions photography as a stress-relieving hobby."

/datum/quirk/photographer/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/camera/camera = new(get_turf(H))
	H.put_in_hands(camera)
	H.equip_to_slot(camera, SLOT_NECK)
	H.regenerate_icons()

/datum/quirk/no_taste
	name = "Ageusia"
	desc = "You can't taste anything! Toxic food will still poison you."
	value = 0
	mob_trait = TRAIT_AGEUSIA
	gain_text = "<span class='notice'>You can't taste anything!</span>"
	lose_text = "<span class='notice'>You can taste again!</span>"
	medical_record_text = "Patient suffers from ageusia and is incapable of tasting food or reagents."

/datum/quirk/snob
	name = "Snob"
	desc = "You care about the finer things, if a room doesn't look nice its just not really worth it, is it?"
	value = 0
	gain_text = "<span class='notice'>You feel like you understand what things should look like.</span>"
	lose_text = "<span class='notice'>Well who cares about deco anyways?</span>"
	medical_record_text = "Patient seems to be rather stuck up."
	mob_trait = TRAIT_SNOB

/datum/quirk/friendly
	name = "Friendly"
	desc = "You give the best hugs, especially when you're in the right mood."
	value = 0
	mob_trait = TRAIT_FRIENDLY
	gain_text = "<span class='notice'>You want to hug someone.</span>"
	lose_text = "<span class='danger'>You no longer feel compelled to hug others.</span>"
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates low-inhibitions for physical contact and well-developed arms. Requesting another doctor take over this case."

/datum/quirk/empath
	name = "Empath"
	desc = "Whether it's a sixth sense or careful study of body language, it only takes you a quick glance at someone to understand how they feel."
	value = 0
	mob_trait = TRAIT_EMPATH
	gain_text = "<span class='notice'>You feel in tune with those around you.</span>"
	lose_text = "<span class='danger'>You feel isolated from others.</span>"
	medical_record_text = "Patient is highly perceptive of and sensitive to social cues, or may possibly have ESP. Further testing needed."

/datum/quirk/jolly
	name = "Jolly"
	desc = "You sometimes just feel happy, for no reason at all."
	value = 0
	mob_trait = TRAIT_JOLLY
	mood_quirk = TRUE
	medical_record_text = "Patient demonstrates constant euthymia irregular for environment. It's a bit much, to be honest."

/datum/quirk/jolly/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "jolly", /datum/mood_event/jolly)

/datum/quirk/dwarfism
	name = "Dwarfism"
	desc = "Due to a genetic mutation, you've learnt to appreciate the smaller things in life."
	value = 0
	medical_record_text = "Patient has dwarfism."

/datum/quirk/dwarfism/add()
	ADD_TRAIT(quirk_holder, TRAIT_DWARF, GENETIC_MUTATION) //better here than mob trait to add genetic mutation
	quirk_holder.AddElement(/datum/element/dwarfism, COMSIG_HUMAN_MUTATION_LOSS, src)

/datum/quirk/dwarfism/remove()
	REMOVE_TRAIT(quirk_holder, TRAIT_DWARF, GENETIC_MUTATION)
	quirk_holder.RemoveElement(/datum/element/dwarfism, COMSIG_HUMAN_MUTATION_LOSS, src)

/datum/quirk/depression
	name = "Depression"
	desc = "You sometimes just hate life."
	mob_trait = TRAIT_DEPRESSION
	value = 0
	gain_text = "<span class='danger'>You start feeling depressed.</span>"
	lose_text = "<span class='notice'>You no longer feel depressed.</span>" //if only it were that easy!
	medical_record_text = "Patient has a severe mood disorder, causing them to experience acute episodes of depression."
	mood_quirk = TRUE

/datum/quirk/depression/on_process()
	if(prob(0.05))
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "depression", /datum/mood_event/depression)

/datum/quirk/lightless
	name = "Light Sensitivity"
	desc = "Bright lights irritate you. Your eyes start to water, your skin feels itchy against the photon radiation, and your hair gets dry and frizzy. Maybe it's a medical condition."
	value = 0
	gain_text = "<span class='danger'>The safety of light feels off...</span>"
	lose_text = "<span class='notice'>Enlightening.</span>"
	medical_record_text = "Patient has acute phobia of light, and insists it is physically harmful."

/datum/quirk/apathetic
	name = "Apathetic"
	desc = "You just don't care as much as other people. That's nice to have in a place like this, I guess."
	value = 0
	mood_quirk = TRUE
	medical_record_text = "Patient was administered the Apathy Evaluation Scale but did not bother to complete it."

/datum/quirk/unstable
	name = "Unstable"
	desc = "Due to past troubles, you are unable to recover your sanity if you lose it. Be very careful managing your mood!"
	value = 0
	mob_trait = TRAIT_UNSTABLE
	gain_text = "<span class='danger'>There's a lot on your mind right now.</span>"
	lose_text = "<span class='notice'>Your mind finally feels calm.</span>"
	medical_record_text = "Patient's mind is in a vulnerable state, and cannot recover from traumatic events."

/datum/quirk/apathetic/add()
	var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
	if(mood)
		mood.mood_modifier = 0.8

/datum/quirk/apathetic/remove()
	if(quirk_holder)
		var/datum/component/mood/mood = quirk_holder.GetComponent(/datum/component/mood)
		if(mood)
			mood.mood_modifier = 1 //Change this once/if species get their own mood modifiers.

/datum/quirk/lightless/on_process()
	var/turf/T = get_turf(quirk_holder)
	var/lums = T.get_lumcount()
	if(lums >= 0.8)
		SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, "brightlight", /datum/mood_event/brightlight)
	else
		SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, "brightlight")

/datum/quirk/musician
	name = "Musician"
	desc = "You can tune handheld musical instruments to play melodies that clear certain negative effects and soothe the soul."
	value = 0
	mob_trait = TRAIT_MUSICIAN
	gain_text = "<span class='notice'>You know everything about musical instruments.</span>"
	lose_text = "<span class='danger'>You forget how musical instruments work.</span>"
	medical_record_text = "Patient brain scans show a highly-developed auditory pathway."

/datum/quirk/musician/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/choice_beacon/music/B = new(get_turf(H))
	H.put_in_hands(B)
	H.equip_to_slot_if_possible(B, SLOT_IN_BACKPACK)
	var/obj/item/musicaltuner/musicaltuner = new(get_turf(H))
	H.put_in_hands(musicaltuner)
	H.equip_to_slot_if_possible(musicaltuner, SLOT_IN_BACKPACK)
	H.regenerate_icons()

// Removed to just not clutter the UI.
/*
/datum/quirk/pineapple_liker
	name = "Ananas Affinity"
	desc = "You find yourself greatly enjoying fruits of the ananas genus. You can't seem to ever get enough of their sweet goodness!"
	value = 0
	gain_text = "<span class='notice'>You feel an intense craving for pineapple.</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient demonstrates a pathological love of pineapple."

/datum/quirk/pineapple_liker/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= PINEAPPLE

/datum/quirk/pineapple_liker/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~PINEAPPLE

/datum/quirk/pineapple_hater
	name = "Ananas Aversion"
	desc = "You find yourself greatly detesting fruits of the ananas genus. Serious, how the hell can anyone say these things are good? And what kind of madman would even dare putting it on a pizza!?"
	value = 0
	gain_text = "<span class='notice'>You find yourself pondering what kind of idiot actually enjoys pineapples...</span>"
	lose_text = "<span class='notice'>Your feelings towards pineapples seem to return to a lukewarm state.</span>"
	medical_record_text = "Patient is correct to think that pineapple is disgusting."

/datum/quirk/pineapple_hater/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.disliked_food |= PINEAPPLE

/datum/quirk/pineapple_hater/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.disliked_food &= ~PINEAPPLE
*/
/datum/quirk/deviant_tastes
	name = "Deviant Tastes"
	desc = "You dislike food that most people enjoy, and find delicious what they don't."
	value = 0
	gain_text = "<span class='notice'>You start craving something that tastes strange.</span>"
	lose_text = "<span class='notice'>You feel like eating normal food again.</span>"
	medical_record_text = "Patient demonstrates irregular nutrition preferences."

/datum/quirk/deviant_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	var/liked = species.liked_food
	species.liked_food = species.disliked_food
	species.disliked_food = liked

/datum/quirk/deviant_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/maso
	name = "Masochism"
	desc = "You are aroused by pain."
	value = 0
	mob_trait = TRAIT_MASO
	gain_text = "<span class='notice'>You desire to be hurt.</span>"
	lose_text = "<span class='notice'>Pain has become less exciting for you.</span>"

/datum/quirk/longtimer
	name = "Longtimer"
	desc = "You've been around for a long time and seen more than your fair share of action, suffering some pretty nasty scars along the way. For whatever reason, you've declined to get them removed or augmented."
	value = 0
	gain_text = "<span class='notice'>Your body has seen better days.</span>"
	lose_text = "<span class='notice'>Your sins may wash away, but those scars are here to stay...</span>"
	medical_record_text = "Patient has withstood significant physical trauma and declined plastic surgery procedures to heal scarring."
	/// the minimum amount of scars we can generate
	var/min_scars = 3
	/// the maximum amount of scars we can generate
	var/max_scars = 7

/datum/quirk/longtimer/on_spawn()
	var/mob/living/carbon/C = quirk_holder
	C.generate_fake_scars(rand(min_scars, max_scars))

//Horrid and pulled from Crash
/* // People do really weird shit with this, commenting it out for safety.
/datum/quirk/soapstone
	name = "Soapstone"
	desc = "You recently found this yellow rock. Neat. Now, if only you knew what this did..."
	value = 0
	var/obj/item/heirloom
	var/where

/datum/quirk/soapstone/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	var/obj/item/heirloom_type  ///DONT CHANGE HERILOOM STUFF FOR SOME REASON DONT WORK IF YOU REMOVE IT AAAAA.
	switch(quirk_holder.mind.assigned_role)
		if("Baron", "Centurion", "Lieutenant", "NCR Captain")
			heirloom_type = pick(/obj/item/soapstone)
		else
			heirloom_type = pick(
				/obj/item/soapstone/trait)
	heirloom = new heirloom_type(get_turf(quirk_holder)) //IF YOU CHANGE THIS FOR SOME REASON WILL NOT WORK.
	var/list/slots = list(
		"in your left pocket" = SLOT_L_STORE, //SPAWNS IN THE POCKETS
		"in your right pocket" = SLOT_R_STORE,
		"in your backpack" = SLOT_IN_BACKPACK	//SPAWNS IN THE BACKPACK

	)
	where = H.equip_in_one_of_slots(heirloom, slots, FALSE) || "at your feet"

/datum/quirk/soapstone/post_add()
	if(where == "in your backpack")
		var/mob/living/carbon/human/H = quirk_holder
		SEND_SIGNAL(H.back, COMSIG_TRY_STORAGE_SHOW, H)
*/

// Purposefully locked perks, these reveal in-game what stat specials are required to obtain these perks.
// Some perks that are always locked due to how they are assigned are also listed here aka FEV perks.
/datum/quirk/fev //DOOM - Used in mob_tar creation && A secondary version for FEV-II exposure.
	name = "SPECIAL: Unstable FEV Exposure"
	desc = "Be it accidental; the work of a mad scientist roaming the waste-land, or pre-war experiments that left an individual unable to die, this one has been exposed to an FEV Variation. \
	This trait must be gained through gameplay."
	value = 0 // Locked
	gain_text = span_notice("You feel a burning pain as your DNA is ripped apart, and sewn back together.")
	lose_text = span_notice("The dull metronome of pain that defined your existence has faded.")
	medical_record_text = "Patient appears to have 'perfect' DNA - if 'perfect' was a Wastelanders idea of beauty."
	mob_trait = TRAIT_FEV
	locked = TRUE

/datum/quirk/fev/add()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 6 //Larger Muscle-mass
	mob_tar.dna.species.punchdamagehigh += 8 //But not too large. Reserved for FEV-II
	quirk_holder.become_mega_nearsighted(ROUNDSTART_TRAIT) //Custom proc to make essentially welder-blindness.
	mob_tar.maxHealth += 5 //These guys are tanky. Almost blind, and slower.
	mob_tar.health += 5
	mob_tar.resize += 0.05
	mob_tar.update_transform()
	to_chat(mob_tar, "<span class='notice'>You feel far stronger, and a tad dumber...</span>")

/datum/quirk/fev/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 6 //Larger Muscle-mass
	mob_tar.dna.species.punchdamagehigh += 8 //But not too large. Reserved for FEV-II
	quirk_holder.become_mega_nearsighted(ROUNDSTART_TRAIT) //Custom proc to make essentially welder-blindness.
	mob_tar.maxHealth += 5 //These guys are tanky. Almost blind, and slower.
	mob_tar.health += 5
	to_chat(mob_tar, "<span class='notice'>You feel far stronger, and a tad dumber...</span>")

/datum/quirk/fev/remove()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.remove_mega_nearsighted()
	mob_tar.maxHealth -= 5 //Mutie rage.
	mob_tar.health -= 5
	mob_tar.dna.species.punchdamagelow -= 6
	mob_tar.dna.species.punchdamagehigh -= 8
	mob_tar.resize -= 0.05
	mob_tar.update_transform()

/datum/quirk/fevII //FRANK FUCKING HORRIGAAAN
	name = "SPECIAL: FEV-II Exposure"
	desc = "Direct exposure to FEV-II has caused unpredictable mutations to existing DNA. \
	This trait must be gained through gameplay."
	value = 0 //Never unlockable naturally.
	gain_text = span_notice("You feel a burning pain as your DNA is ripped apart, and sewn back together.")
	lose_text = span_notice("The dull metronome of pain that defined your existence has faded.")
	medical_record_text = "Patient has been exposed to FEV-II, with clear signs of triple-helix DNA present."
	mob_trait = TRAIT_FEVII
	locked = TRUE

/datum/quirk/fevII/add()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 8 //Fear.
	mob_tar.dna.species.punchdamagehigh += 16  //Hurts!
	mob_tar.maxHealth += 15 //Mutie rage.
	mob_tar.health += 15
	mob_tar.resize += 0.1
	mob_tar.update_transform()
	to_chat(mob_tar, "<span class='danger'>You feel extremely strong!</span>")

/datum/quirk/fevII/on_spawn() //should never happen.
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow += 8 //Fear.
	mob_tar.dna.species.punchdamagehigh += 16  //Hurts bad.
	mob_tar.maxHealth += 15 //Mutie rage.
	mob_tar.health += 15
	to_chat(mob_tar, "<span class='danger'>You feel extremely strong!</span>")

/datum/quirk/fevII/remove()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.dna.species.punchdamagelow -= 8
	mob_tar.dna.species.punchdamagehigh -= 16 //Prevents stacking
	mob_tar.maxHealth -= 15 //Mutie rage.
	mob_tar.health -= 15
	mob_tar.resize -= 0.1
	mob_tar.update_transform()

//SPECIAL integration
/datum/quirk/leaper_weak
	name = "SPECIAL: Leap"
	desc = "You are agile enough to leap short distances, albiet somewhat clumsily. \
	Having high agility (7) grants this trait automatically."
	value = 0
	mob_trait = TRAIT_LEAPER_WEAK
	gain_text = "<span class='notice'>You feel like you can leap a good distance.</span>"
	lose_text = "<span class='notice'>You lost your agility!</span>"
	locked = TRUE

/datum/quirk/leaper_moderate
	name = "SPECIAL: Lunge"
	desc = "You are incredibly agile and can leap incredible distances as a result, provided you are not weighed down by muscle mass. \
	Being extraordinarily agile (9) will grant this trait automatically, having extraordinary strength (9) will grant tackle instead."
	value = 0
	mob_trait = TRAIT_LEAPER_MODERATE
	gain_text = "<span class='notice'>You feel like you can leap amazingly far!</span>"
	lose_text = "<span class='notice'>You've lost your agility!</span>"
	locked = TRUE

/datum/quirk/leaper_strong
	name = "SPECIAL: Tackle"
	desc = "You can leap medium distances and, if colliding with someone, will likely knock them down due to your strength and bulk. \
	Having extraordinary agility (9) and extraordinary strength (9) will grant this trait automatically."
	value = 0
	mob_trait = TRAIT_LEAPER_STRONG
	gain_text = "<span class='notice'>You're a battering ram!</span>"
	lose_text = "<span class='notice'>You feel slow and weak.</span>"
	locked = TRUE

/datum/quirk/pa_wear
	name = "SPECIAL: Power Armor Training"
	desc = "Either through training or skill you have become capable of donning and using power armor. \
	Having extraordinary intellect (9), high strength (7), and high endurance (7) will grant this trait automatically."
	value = 0
	mob_trait = TRAIT_PA_WEAR
	gain_text = "<span class='notice'>You realize how to use Power Armor.</span>"
	lose_text = "<span class='danger'>You forget how Power Armor works.</span>"
	locked = TRUE