
/mob/living/silicon/robot/gib_animation()
	PoolOrNew(/obj/effect/overlay/temp/gib_animation, list(loc, "gibbed-r"))

/mob/living/silicon/robot/dust()
	if(mmi)
		qdel(mmi)
	..()

/mob/living/silicon/robot/spawn_dust()
	new /obj/effect/decal/cleanable/remains/robot(loc)

/mob/living/silicon/robot/dust_animation()
	PoolOrNew(/obj/effect/overlay/temp/dust_animation, list(loc, "dust-r"))

/mob/living/silicon/robot/death(gibbed)
	if(stat == DEAD)
		return

	. = ..()

	locked = 0 //unlock cover

	update_canmove()
	if(camera && camera.status)
		camera.toggle_cam(src,0)
	update_headlamp(1) //So borg lights are disabled when killed.

	uneq_all() // particularly to ensure sight modes are cleared

	update_icons()

	sql_report_cyborg_death(src)