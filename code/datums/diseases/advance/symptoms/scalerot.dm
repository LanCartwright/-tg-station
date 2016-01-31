/*
//////////////////////////////////////
scalerot
	Increases resistance.
	Increases stage speed.
	Little transmittable.
	high level
Bonus
	Rots away lizards and reverts them to a fleshy form
//////////////////////////////////////
*/
/datum/symptom/scalerot
		name = "Scale rot"
		stealth = 2
		resistance = 3
		stage_speed = 3
		transmittable = 0
		level = 6
		severity = 5

/datum/symptom/scalerot/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB))
		var/mob/living/carbon/human/M = A.affected_mob
		if(M.dna.species.id == "lizard")
			switch(A.stage)
				if(1)
					M << "<span class='notice'>[pick("Your scales feels awfully itchy", "Your tail hurts")]</span>"
				if(2)
					M << "<span class='notice'>[pick("You claw at your scales", "Your claws feel strange")]</span>"
					M.adjustCloneLoss(15)
				if(3)
					M << M.say(pick("Hiss?"))
					M << "<span class='notice'>[pick("You painfully let out a hiss")]</span>"
					M.adjustCloneLoss(30)
				if(4)
					M << "<span class='notice'>[pick("Your scales rot away and reveal flesh")]</span>"
					M.adjustCloneLoss(45)
				if(5)
					M.dna.species = new /datum/species/human()
					M.update_icons()
					M.update_hair()
					M << "<span class='notice'>[pick("You tear at your scales and rip off your scaley skin!")]</span>"
					M.adjustCloneLoss(200)
					M.adjustBruteLoss(200)