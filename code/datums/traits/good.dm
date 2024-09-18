//predominantly positive traits
//this file is named weirdly so that positive traits are listed above negative ones

/datum/quirk/alcohol_tolerance
	name = "Alcohol Tolerance"
	desc = "You become drunk more slowly and suffer fewer drawbacks from alcohol."
	value = 1
	mob_trait = TRAIT_ALCOHOL_TOLERANCE
	gain_text = "<span class='notice'>You feel like you could drink a whole keg!</span>"
	lose_text = "<span class='danger'>You don't feel as resistant to alcohol anymore. Somehow.</span>"
	medical_record_text = "Patient demonstrates a high tolerance for alcohol."

/datum/quirk/horrifying_tastes
	name = "Horrifying Tastes"
	desc = "You enjoy a fine sort of meal not often appreciated by your peers. To serve man, in all it's forms is your life's work. Put bluntly - you are a cannibal. Consuming human flesh doesn't bother you, and dishes such as longpork stew will heal you."
	mob_trait = TRAIT_LONGPORKLOVER
	value = 2
	gain_text = "<span class='notice'>You have an insatiable hunger for the flesh of your fellow man.</span>"
	lose_text = "<span class='notice'>The terrible hunger fades - you feel peace at last.</span>"
	medical_record_text = "Patient refuses to comment on their dietary preferences."

/datum/quirk/horrifying_tastes/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= LONGPORK
	species.disliked_food &= ~LONGPORK

/datum/quirk/horrifying_tastes/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food &= ~LONGPORK
		species.disliked_food |= LONGPORK

/datum/quirk/tribal
	name = "Former Tribal"
	desc = "You used to be part of one of the tribes scattered throughout the wasteland. You retain some of your tribal knowledge but the ancient crafts are lost to you as you became more modern. \
	This perk adds Trapper, Herbal Affinity, and Primitive Tech all in one."
	value = 3
	gain_text = "<span class='notice'>You remember the old ways of your tribe..</span>"
	lose_text = "<span class='notice'>You've forgotten the ways of your ancestors..</span>"

/datum/quirk/tribal/add()
	var/mob/living/carbon/human/H = quirk_holder
	ADD_TRAIT(H, TRAIT_MACHINE_SPIRITS, "Former Tribal")
	ADD_TRAIT(H, TRAIT_HERBAL_AFFINITY, "Former Tribal")
	ADD_TRAIT(H, TRAIT_TRAPPER, "Former Tribal")

/datum/quirk/tribal/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(!QDELETED(H))
		REMOVE_TRAIT(H, TRAIT_MACHINE_SPIRITS, "Former Tribal")
		REMOVE_TRAIT(H, TRAIT_TRAPPER, "Former Tribal")
		REMOVE_TRAIT(H, TRAIT_HERBAL_AFFINITY, "Former Tribal")

/datum/quirk/tribespeak
	name = "Tribal Language Comprehension"
	desc = "You're somehow capable of understanding and speaking the common tribal languages in the area."
	value = 1
	gain_text = "<span class='notice'>You remember the old ways of your tribe..</span>"
	lose_text = "<span class='notice'>You've forgotten the ways of your ancestors..</span>"

/datum/quirk/tribespeak/add()
	var/mob/living/carbon/human/H = quirk_holder
	H.grant_language(/datum/language/tribal)

/datum/quirk/tribespeak/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(!QDELETED(H))
		H.remove_language(/datum/language/tribal)

/datum/quirk/drunkhealing
	name = "Drunken Resilience"
	desc = "Nothing like a good drink to make you feel on top of the world. Whenever you're drunk, you slowly recover from injuries."
	value = 2
	mob_trait = TRAIT_DRUNK_HEALING
	gain_text = "<span class='notice'>You feel like a drink would do you good.</span>"
	lose_text = "<span class='danger'>You no longer feel like drinking would ease your pain.</span>"
	medical_record_text = "Patient has unusually efficient liver metabolism and can slowly regenerate wounds by drinking alcoholic beverages."

/datum/quirk/freerunning
	name = "Freerunning"
	desc = "You're great at quick moves! You can climb structures much faster and scale up walls!"
	value = 2
	mob_trait = TRAIT_FREERUNNING
	gain_text = "<span class='notice'>You feel lithe on your feet!</span>"
	lose_text = "<span class='danger'>You feel clumsy again.</span>"
	medical_record_text = "Patient scored highly on cardio tests."

/* // Added light step as a default trait for agility 6.
/datum/quirk/light_step
	name = "Light Step"
	desc = "You walk with a gentle step; stepping on sharp objects is quieter, less painful and you won't leave footprints behind you."
	value = 1
	mob_trait = TRAIT_LIGHT_STEP
	gain_text = "<span class='notice'>You walk with a little more litheness.</span>"
	lose_text = "<span class='danger'>You start tromping around like a barbarian.</span>"
	medical_record_text = "Patient's dexterity belies a strong capacity for stealth."
*/

// Expensive because with agility 9 you can silently walk as fast as most people can loudly sprint.
/datum/quirk/quick_step
	name = "Silent Running"
	desc = "You move much faster while walking and move silently as well. Potentially faster than some can sprint."
	value = 3
	mob_trait = TRAIT_SPEEDY_STEP
	gain_text = "<span class='notice'>You feel determined. No time to lose.</span>"
	lose_text = "<span class='danger'>You feel less determined. What's the rush, man?</span>"
	medical_record_text = "Patient scored highly on racewalking tests."

/datum/quirk/selfaware
	name = "Self-Aware"
	desc = "You know your body well, and can accurately assess the extent of your wounds."
	value = 2
	mob_trait = TRAIT_SELF_AWARE
	medical_record_text = "Patient demonstrates an uncanny knack for self-diagnosis."

/datum/quirk/skittish
	name = "Skittish"
	desc = "You can conceal yourself in danger. Ctrl-shift-click a closed locker to jump into it, as long as you have access."
	value = 1
	mob_trait = TRAIT_SKITTISH
	medical_record_text = "Patient demonstrates a high aversion to danger and has described hiding in containers out of fear."

/datum/quirk/herbal_affinity
	name = "Herbal Affinity"
	desc = "You are in-tune with your natural side. Tribal medicine has increased healing and you do not suffer any drawbacks from it."
	value = 1
	mob_trait = TRAIT_HERBAL_AFFINITY
	gain_text = "<span class='notice'>You feel a connection to traditional forms of medicine.</span>"
	lose_text = "<span class='danger'>You feel yourself unable to handle natural medicine.</span>"
	medical_record_text = "Patient reports a keen interest in natural forms of treatment."

/datum/quirk/bloodpressure
	name = "Polycythemia vera"
	desc = "You've a treated form of Polycythemia vera that increases the total blood volume inside of you as well as the rate of replenishment!"
	value = 1 //I honeslty dunno if this is a good trait? I just means you use more of medbays blood and make janitors madder, but you also regen blood a lil faster.
	mob_trait = TRAIT_HIGH_BLOOD
	gain_text = "<span class='notice'>You feel full of blood!</span>"
	lose_text = "<span class='notice'>You feel like your blood pressure went down.</span>"
	medical_record_text = "Patient's blood tests report an abnormal concentration of red blood cells in their bloodstream."

/datum/quirk/bloodpressure/add()
	quirk_holder.blood_ratio = 1.2
	quirk_holder.blood_volume += 150

/datum/quirk/bloodpressure/remove()
	if(quirk_holder)
		quirk_holder.blood_ratio = 1

/datum/quirk/tribal_tech
	name = "Primitive Tech"
	desc = "You're able to use primitive technology."
	value = 1
	mob_trait = TRAIT_MACHINE_SPIRITS
	gain_text = "<span class='notice'>You are now able to use primitive technology.</span>"
	lose_text = "<span class='danger'>You are no longer able to use primitive technology.</span>"
	//locked = TRUE
/*
/datum/quirk/night_vision
	name = "Night Vision"
	desc = "You can see slightly more clearly in full darkness than most people."
	value = 1
	mob_trait = TRAIT_NIGHT_VISION
	gain_text = "<span class='notice'>The shadows seem a little less dark.</span>"
	lose_text = "<span class='danger'>Everything seems a little darker.</span>"
	//locked = TRUE

/datum/quirk/night_vision/on_spawn()
	var/mob/living/carbon/human/H = quirk_holder
	H.update_sight()
*/
/datum/quirk/nukalover
	name = "Nuka Fiend"
	desc = "You are a fan of America's most popular pre-war soft drink. Your body simply loves the sugary drink so much, it rejects healthier alternatives."
	value = 2
	mob_trait = TRAIT_NUKA_LOVER
	gain_text = "<span class='notice'>You want to buy the whole world a nuka-cola!</span>"
	lose_text = "<span class='danger'>What's the big deal about nuka-cola?</span>"
	medical_record_text = "Patient has an addiction to the soft drink Nuka-Cola. Somehow, their metabolism has adapted to the sugars and artifical flavorings."

/datum/quirk/nukalover/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/species/species = H.dna.species
	species.liked_food |= NUKA
	species.disliked_food |= VEGETABLES

/datum/quirk/nukalover/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/species/species = H.dna.species
		species.liked_food = initial(species.liked_food)
		species.disliked_food = initial(species.disliked_food)

/datum/quirk/trapper
	name = "Trapper"
	desc = "As an experienced hunter and trapper you know your way around butchering animals for their products, and are able to get twice the usable materials by eliminating waste."
	value = 1
	mob_trait = TRAIT_TRAPPER
	gain_text = "<span class='notice'>You learn the secrets of butchering!</span>"
	lose_text = "<span class='danger'>You forget how to slaughter animals.</span>"
	//locked = TRUE

/datum/quirk/bigleagues
	name = "Big Leagues"
	desc = "Swing for the fences! You deal additional damage with melee weapons."
	value = 2
	mob_trait = TRAIT_BIG_LEAGUES
	gain_text = "<span class='notice'>You feel like swinging for the fences!</span>"
	lose_text = "<span class='danger'>You feel like bunting.</span>"
	//locked = TRUE

/datum/quirk/chemwhiz
	name = "Chem Whiz"
	desc = "You've been playing around with chemicals all your life. You know how to use chemistry machinery."
	value = 2
	mob_trait = TRAIT_CHEMWHIZ
	gain_text = "<span class='notice'>The mysteries of chemistry are revealed to you.</span>"
	lose_text = "<span class='danger'>You forget how the periodic table works.</span>"
	//locked = TRUE

/datum/quirk/hard_yards
	name = "Wasteland Maneuvers"
	desc = "You know how to get around the wasteland, you ignore the slowdown effects of terrain."
	value = 3
	mob_trait = TRAIT_HARD_YARDS
	gain_text = "<span class='notice'>Rain or shine, nothing slows you down.</span>"
	lose_text = "<span class='danger'>You walk with a less sure gait, the ground seeming less firm somehow.</span>"
	//locked = TRUE

/datum/quirk/lifegiver
	name = "Lifegiver"
	desc = "You embody wellness! Instantly gain +10 maximum health!"
	value = 3
	mob_trait = TRAIT_LIFEGIVER
	gain_text = "<span class='notice'>You feel more healthy than usual.</span>"
	lose_text = "<span class='danger'>You feel less healthy than usual.</span>"
	//locked = TRUE

// This somehow doesn't work and nobody fucking noticed, this means every job with Lifegiver dating back years
// never got any bonus health and nobody noticed. Jesus christ I knew most ss13 coders were morons by this is special! -Possum
/*
/datum/quirk/lifegiver/on_spawn()
	var/mob/living/carbon/human/mob_tar = quirk_holder
	mob_tar.maxHealth += 10
	mob_tar.health += 10
*/
/datum/quirk/iron_fist
	name = "Iron Fist"
	desc = "You have fists of kung-fury! Increases unarmed and tackle damage."
	value = 2
	mob_trait = TRAIT_IRONFIST
	gain_text = "<span class='notice'>Your fists feel furious!</span>"
	lose_text = "<span class='danger'>Your fists feel calm again.</span>"
	//locked = TRUE

/datum/quirk/perfect_attacker
	name = "Perfect Striker"
	desc = "Your strikes are flawless, you always deal maximum damage with unarmed attacks."
	value = 2
	mob_trait = TRAIT_PERFECT_ATTACKER
	gain_text = "<span class='notice'>Your punches never miss!</span>"
	lose_text = "<span class='danger'>Your strikes feel a bit clumsy.</span>"

/datum/quirk/surgerylow
	name = "Minor Surgery"
	desc = "You are a somewhat adequate medical practicioner, capable of performing minor surgery."
	value = 2
	mob_trait = TRAIT_SURGERY_LOW
	gain_text = "<span class='notice'>You feel yourself discovering the basics of the human body.</span>"
	lose_text = "<span class='danger'>You forget how to perform even the simplest surgery.</span>"
	//locked = TRUE

/datum/quirk/surgerymid
	name = "Intermediate Surgery"
	desc = "You are a skilled medical practicioner, capable of performing most surgery."
	value = 3
	mob_trait = TRAIT_SURGERY_MID
	gain_text = "<span class='notice'>You feel yourself discovering most of the details of the human body.</span>"
	lose_text = "<span class='danger'>You forget how to perform surgery.</span>"
	//locked = TRUE

/datum/quirk/surgeryhigh
	name = "Complex Surgery"
	desc = "You are an expert practicioner, capable of performing almost all surgery."
	value = 4
	mob_trait = TRAIT_SURGERY_HIGH
	gain_text = "<span class='notice'>You feel yourself discovering the most intricate secrets of the human body.</span>"
	lose_text = "<span class='danger'>You forget your advanced surgical knowledge.</span>"
	//locked = TRUE

// Everything basic crafting does is also done by advanced crafting for explosives. I could increase advanced crafting to 2
// but a newer player might think they need both for all recipes, so instead I commented this out. Unlike surgery perks
// this would be slightly harder to be clear to a non-code diving/veteran player. -Possum
/* // You also get this for having high enough intelligence automatically.
/datum/quirk/explosive_crafting
	name = "Explosives Crafting"
	desc = "You have strong feelings about the future of industrial society."
	value = 1
	mob_trait = TRAIT_EXPLOSIVE_CRAFTING
	gain_text = "<span class='notice'>You feel like you can make a bomb out of anything.</span>"
	lose_text = "<span class='danger'You feel okay with the advancement of technology.</span>"
	//locked = TRUE
*/
/datum/quirk/advanced_explosive_crafting
	name = "Advanced Explosive Crafting"
	desc = "Decades of engineering knowledge have taught you to make all kinds of horrible explosives."
	value = 1
	mob_trait = TRAIT_ADVANCED_EXPLOSIVE_CRAFTING
	gain_text = "<span class='notice'>You're on the no-fly list.'</span>"
	lose_text = "<span class='danger'>You feel like you're allowed to fly on planes again.</span>"
	//locked = TRUE

/datum/quirk/gunslinger
	name = "Gunslinger"
	desc = "Years of training and skill shooting has made you a much better shot."
	value = 2
	mob_trait = TRAIT_NICE_SHOT
	gain_text = "<span class='notice'>You need a big iron on your hip.'</span>"
	lose_text = "<span class='danger'>Texas Red would clear leather.</span>"

/datum/quirk/researcher
	name = "Research Scientist"
	desc = "Through either being self taught or a former member of a scientific institution you know how to use research machines."
	value = 4
	mob_trait = TRAIT_RESEARCHER
	gain_text = "<span class='notice'>SCIENCE!'</span>"
	lose_text = "<span class='danger'>NOT SCIENTIFICALLY POSSIBLE!</span>"

/datum/quirk/technophreak
	name = "Technophreak"
	desc = "You are an expert at scrapping machines. When disassembling old world machines and cars you gain more salvage. When breaking apart salvage at a workbench, you gain more materials."
	value = 3
	mob_trait = TRAIT_TECHNOPHREAK
	gain_text = "<span class='notice'>There gold in them there wrecks.'</span>"
	lose_text = "<span class='danger'>What a bunch of junk!</span>"

/datum/quirk/calcium_healer
	name = "Calcium Healer"
	desc = "Brahmin milk is a staple of a healthy society, drinking milk heals you."
	value = 1
	mob_trait = TRAIT_CALCIUM_HEALER
	gain_text = "<span class='notice'>Got milk?'</span>"
	lose_text = "<span class='danger'>Milk is gross!</span>"

/datum/quirk/autodraw
	name = "Bow Auto Draw"
	desc = "Through extensive work hunting, you can knock arrows immediately after firing instead of slowly drawing a new shot."
	value = 2
	mob_trait = TRAIT_AUTO_DRAW
	gain_text = "<span class='notice'>You are a big game hunter.'</span>"
	lose_text = "<span class='danger'>Guns are better anyways.</span>"
