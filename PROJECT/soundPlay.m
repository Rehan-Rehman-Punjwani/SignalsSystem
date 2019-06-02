function soundPlay(myfile)
   load(myfile);
   
   obj = audioplayer(y, Fs);
   obj.TimerFcn = 'showSeconds';
   obj.TimerPeriod = 10;
   
   play(obj);
end

function showSeconds
   disp('tick')
end