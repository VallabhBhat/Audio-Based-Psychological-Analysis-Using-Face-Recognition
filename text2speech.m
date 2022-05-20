UserInput='sad';
%UserInput = "This only you do";
if isempty(UserInput)
  return;
end 
UserInput = char(UserInput); 
switch(UserInput)
    case 'sad'
        UserInput="Why do you look too sad, don't be sad";
        disp('Sad')
end
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.SelectVoice('Microsoft Zira Desktop'); 
obj.Volume = 100;
Speak(obj, UserInput);