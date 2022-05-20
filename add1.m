NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.SelectVoice('Microsoft Zira Desktop'); 
obj.Speak('what is your name');
voices = obj.GetInstalledVoices;
for i = 1 : voices.Count
    voice = Item(voices,i-1);
    voice.VoiceInfo.Name
end
