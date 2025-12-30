//_createart generated.  modify at your own risk. Changing values should be fine.

main()
{

	level.tweakfile = true;
 
	// *Fog section* 

	setdvar("scr_fog_exp_halfplane", "971.99");
	setdvar("scr_fog_exp_halfheight", "388.336");
	setdvar("scr_fog_nearplane", "729.34");
	setdvar("scr_fog_red", "0.58");
	setdvar("scr_fog_green", "0.60");
	setdvar("scr_fog_blue", "0.56");
	setdvar("scr_fog_baseheight", "-244.014");

//	// *depth of field section* 
//	level.do_not_use_dof = true;
//	level.dofDefault["nearStart"] = 0;
//	level.dofDefault["nearEnd"] = 60;
//	level.dofDefault["farStart"] = 2000;
//	level.dofDefault["farEnd"] = 10000;
//	level.dofDefault["nearBlur"] = 6;
//	level.dofDefault["farBlur"] = 2;
//
//	players = maps\_utility::get_players();
//	for( i = 0; i < players.size; i++ )
//	{
//		players[i] maps\_art::setdefaultdepthoffield();
//	}
	
	setdvar("visionstore_glowTweakEnable", "1");
	setdvar("visionstore_glowTweakRadius0", "2");
	setdvar("visionstore_glowTweakRadius1", "");
	setdvar("visionstore_glowTweakBloomCutoff", "0.5");
	setdvar("visionstore_glowTweakBloomDesaturation", "0");
	setdvar("visionstore_glowTweakBloomIntensity0", "0.9");
	setdvar("visionstore_glowTweakBloomIntensity1", "");
	setdvar("visionstore_glowTweakSkyBleedIntensity0", "");
	setdvar("visionstore_glowTweakSkyBleedIntensity1", "");

	level thread fog_settings();
	//Can set our custom vision here in future or edit this one to fulfill
	//level thread maps\_utility::set_all_players_visionset( "zombie_sumpf", 0.1 );
}

fog_settings()
{
	start_dist 			= 404.39;
	halfway_dist 		= 1543.52;
	halfway_height 	= 460.33;//380 is dog fog
	base_height 		= -244.014;//200 is dog fog
	red 						= 0.65;
	green 					= 0.84;
	blue		 				= 0.79;
	trans_time			= 0;
	
	//OptionalArg: [start_dist]: the distance the fog starts at from the player's camera"
	//"OptionalArg: [halfway_dist]: the half-way mark for where the fog is 50% opaque"
	//"OptionalArg: [halfway_height]: the half-way height mark for where the fog starts to fade out"
	//"OptionalArg: [base_height]: the base height"
	//main scr fog settings dont appear to do anything
	//also need to adjust dog stop fog

	//start_dist 			= 104.39;
	//halfway_dist 		= 900;//543.52;
	//halfway_height 	= 900;//460.33; d
	//base_height 		= 200;//-144.014; d
	//dont do halfh below 0 (havent tried it when bh is below that), and generally i think bh always below halfh
	//halfh 460 was a good one with base something else
	/*
	//700, 400 not bad, all around good ; 900,200 interesting, goes very high; 900 -200 bad, now wondering if 900200 was even good, 
	halfway_height 	= 700;
	base_height 		= 400;
	//1000 50, pretty mid, cant see floor fog; 1000 600 pretty good, hits tops of trees fine and makes world feel large. top 3 so far although clouds ruined
	*/
	/*
	//300, 0 pretty good, meshes well with sky, might push out the halfd
	halfway_height 	= 300;//460.33;
	base_height 		= 0;
	*/
	/*
	//makes fog start at floor and visible layer that dissipates as you go up, not bad, sadly above treetop clearly less fog, has best 3D fog feel
	halfway_height 	= 200;
	base_height 		= -200;
	*/

	if( IsSplitScreen() )
	{
		start_dist 			= 404.39;
		halfway_dist 		= 1543.52;
		halfway_height 	= 460.3;
		cull_dist 			= 8500;
		red 			    	= 0.65;
		green 			   	= 0.84;
		blue		 				= 0.79;
		maps\_utility::set_splitscreen_fog( start_dist, halfway_dist, halfway_height, base_height, red, green, blue, trans_time, cull_dist );
	}
	else
	{
		SetVolFog( start_dist, halfway_dist, halfway_height, base_height, red, green, blue, trans_time );
	}

}