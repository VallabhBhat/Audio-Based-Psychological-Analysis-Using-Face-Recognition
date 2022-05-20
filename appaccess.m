net=load('trainednetwork.mat');
[img,t] = snapshot(c,'manual');
test_network(net,img);

function test_network(net, img)

R = imresize(img, [227 227]);
R1 = rgb2gray(R);

[Label, Probability] = classify(net.trainedNetwork_1,R1);

figure;
subplot(2,2,1);imshow(img)
subplot(2,2,2);imshow(R)
title({char(Label), num2str(max(Probability)*100, 6)})

UserInput = Label;
if isempty(UserInput)
  return;
end 
UserInput = char(UserInput); 
NET.addAssembly('System.Speech');
obj = System.Speech.Synthesis.SpeechSynthesizer;
obj.Volume = 100;
Speak(obj, UserInput);

end

