if getGender() == 0 then
	skins = {0, 1, 2, 3, 4};
	hairs = {30000, 30010, 30020, 30030, 30040, 30050, 30060, 30070, 30080, 30090, 30100, 30110, 30120, 30130, 30140, 30150, 30160, 30170, 30180, 30190, 30200, 30210, 30220, 30230, 30240, 30250, 30260, 30270, 30280, 30290, 30300, 30310, 30320, 30330, 30340, 30350, 30360, 30370, 30400, 30410, 30420, 30430, 30440, 30450, 30460, 30470, 30480, 30490, 30510, 30520, 30530, 30540, 30550, 30560, 30570, 30580, 30590, 30600, 30610, 30620, 30630, 30640, 30650, 30660, 30700, 30710, 30720, 30730, 30740, 30750, 30760, 30770, 30780, 30790, 30800, 30810};
	eyes = {20000, 20001, 20002, 20003, 20004, 20005, 20006, 20007, 20008, 20009, 20010, 20011, 20012, 20013, 20014, 20016, 20017, 20018, 20019, 20020, 20021, 20022, 20023};
	eyesprefix = 20000;
else
	skins = {0, 1, 2, 3, 4};
	hairs = {31000, 31010, 31020, 31030, 31040, 31050, 31060, 31070, 31080, 31090, 31100, 31110, 31120, 31130, 31140, 31150, 31160, 31170, 31180, 31190, 31200, 31210, 31220, 31230, 31240, 31250, 31260, 31270, 31280, 31290, 31300, 31310, 31320, 31330, 31340, 31350, 31410, 31420, 31430, 31440, 31450, 31460, 31470, 31480, 31490, 31510, 31520, 31530, 31540, 31550, 31560, 31570, 31580, 31590, 31600, 31610, 31620, 31630, 31640, 31650, 31660, 31670, 31680, 31690, 31700, 31710, 31720, 31730, 31740, 31750, 31760, 31770, 31780, 31790};
	eyes = {21000, 21001, 21002, 21003, 21004, 21005, 21006, 21007, 21008, 21009, 21010, 21011, 21012, 21013, 21014, 21016, 21017, 21018, 21019, 21020, 21021, 21022};
	eyesprefix = 21000;
end
if state == 0 then
	addText("Hello, what can I do for you today?\r\n#L0##bSkin#k#l\r\n#L1##bHair#k#l\r\n#L2##bHair Color#k#l\r\n#L3##bEyes#k#l\r\n#L4##bEyes Color#k#l");
	sendSimple();
elseif state == 1 then
	what = getSelected();
	setVariable("what", what);
	if what == 0 then
		sendStyle(skins, 5);
	elseif what == 1 then
		sendStyle(hairs, #hairs);
	elseif what == 2 then
		hair = getHair();
		cur = hair - hair%10;
		colors = {cur, cur+1, cur+2, cur+3, cur+4, cur+5, cur+6, cur+7};
		sendStyle(colors, #colors);
	elseif what == 3 then
		sendStyle(eyes, #eyes);
	elseif what == 4 then
		cur = getEyes()%100+eyesprefix;
		colors = {cur, cur+100, cur+200, cur+300, cur+400, cur+500, cur+600, cur+700};
		sendStyle(colors, #colors);
	else
		endNPC();
	end
elseif state == 2 then
	what = getVariable("what");
	if getSelected() >=0 then
		if what == 0 then
			if skins[getSelected()+1] >= 0 then
				setStyle(skins[getSelected()+1]);
			end
		elseif what == 1 then
			if hairs[getSelected()+1] > 0  then
				setStyle(hairs[getSelected()+1]);
			end
		elseif what == 2 then
			hair = getHair();
			cur = hair - hair%10;
			setStyle(cur + getSelected());
		elseif what == 3 then
			setStyle(eyes[getSelected()+1]);
		elseif what == 4 then
			setStyle(eyesprefix+getEyes()%100 + getSelected()*100);
		else
			setStyle(eyes[getSelected()]);
		end
	end
	endNPC();
end
	
