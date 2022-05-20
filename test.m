net=load('net_emotion.mat');
cam = webcam(1);
preview(cam);
img = snapshot(cam);
closePreview(cam);
clear cam

test_net(net,img);

function test_net(net, image)


R = imresize(image, [64,64]);
R1 = rgb2gray(R);

[Label, Probability] = classify(net.emotionNet,R1);

figure;
subplot(2,2,1);imshow(image)
subplot(2,2,2);imshow(R)
title({char(Label), num2str(max(Probability)*100, 6)})

UserInput = Label;
if isempty(UserInput)
  return;
end 
UserInput = char(UserInput); 
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.SelectVoice('Microsoft Zira Desktop');
obj.Volume = 100;
Speak(obj, UserInput);


end