
faceDetector = vision.CascadeObjectDetector();
tracker = MultiObjectTrackerKLT;




cam = webcam();

videoFrame = snapshot(cam);

%image1 = grayImage(1:240, 1:320);
%image2 = grayImage(1:240, 321:640);
%image3 = grayImage(241:480, 1:320);
%image4 = grayImage(241:480, 321:640);
%image5 = grayImage(r3+1:2*r3, c3+1:2*c3);
%image6 = grayImage(r3+1:2*r3, 2*c3+1:720);
%image7 = grayImage(2*r3+1:end, 1:c3);
%image8 = grayImage(2*r3+1:end, c3+1:2*c3);
%image9 = grayImage(2*r3+1:end, 2*c3+1:720);


videoPlayer = vision.DeployableVideoPlayer;

Loop = true;
num = 0;
frameCount = 0;

while Loop && frameCount < 100000

    videoFrame = snapshot(cam);
    videoFrameGray = rgb2gray(videoFrame);
    frameCount = frameCount + 100;
    image1 = videoFrame(1:240, 1:320);
    image2 = videoFrame(1:240, 321:640);
    image3 = videoFrame(241:480, 1:320);
    image4 = videoFrame(241:480, 321:640);

    if num < 10
        bbox = faceDetector.step(image1);
        bbox1=faceDetector.step(image2);
        bbox2=faceDetector.step(image3);
        bbox3=faceDetector.step(image4);
        %bbox = faceDetector.step(videoFrameGray);
       
         if (~isempty(bbox)) && (~isempty(bbox1))
           
           
           % videoFrame = insertMarker(videoFrame, xyPoints, '+', 'Color', 'white');
            disp("light onn1 and 2")
            %writeLED(rpi,'led0',1)
             writeDigitalPin(rasp,18,1);
             writeDigitalPin(rasp,23,1);
             writeDigitalPin(rasp,25,0);
             writeDigitalPin(rasp,12,0);
             elseif ~isempty(bbox) && ~isempty(bbox2)
                disp("light on 1 and 3")
                 writeDigitalPin(rasp,18,1);
                 writeDigitalPin(rasp,23,0);
                 writeDigitalPin(rasp,25,1);
                 writeDigitalPin(rasp,12,0);
                
                
              elseif ~isempty(bbox) && ~isempty(bbox3)
                disp("light on 1 and 4")  
                writeDigitalPin(rasp,18,1);
                writeDigitalPin(rasp,23,0);
                writeDigitalPin(rasp,25,0);
                writeDigitalPin(rasp,12,1);
               elseif ~isempty(bbox1) && ~isempty(bbox3)
                disp("light on 2 and 4")
                writeDigitalPin(rasp,18,0);
                writeDigitalPin(rasp,23,1);
                writeDigitalPin(rasp,25,0);
                writeDigitalPin(rasp,12,1);
                elseif ~isempty(bbox1) && ~isempty(bbox2)
                  disp("light on 2 and 3")
                  
                     writeDigitalPin(rasp,18,0);
                     writeDigitalPin(rasp,23,1);
                     writeDigitalPin(rasp,25,1);
                     writeDigitalPin(rasp,12,0);
                 elseif (~isempty(bbox2)) && ~isempty(bbox3)
                   disp("light on 3 and 4")
                 
                   writeDigitalPin(rasp,18,0);
                   writeDigitalPin(rasp,23,0);
                   writeDigitalPin(rasp,25,1);
                   writeDigitalPin(rasp,12,1);
               
                  
                   elseif (~isempty(bbox) && ~isempty(bbox1)) && ~isempty(bbox2)
                      disp("light on 1 2 3") 
                      
                         writeDigitalPin(rasp,18,1);
                         writeDigitalPin(rasp,23,1);
                         writeDigitalPin(rasp,25,1);
                         writeDigitalPin(rasp,12,0);
                     elseif ~isempty(bbox1) && ~isempty(bbox2) && ~isempty(bbox3)
                       disp("light on 2 3 4")
                       
                        writeDigitalPin(rasp,18,0);
                        writeDigitalPin(rasp,23,1);
                        writeDigitalPin(rasp,25,1);
                        writeDigitalPin(rasp,12,1);
                      elseif ~isempty(bbox2) && ~isempty(bbox3) && ~isempty(bbox)
                         disp("light on 3 4 1")
                         
                            writeDigitalPin(rasp,18,1);
                            writeDigitalPin(rasp,23,0);
                            writeDigitalPin(rasp,25,1);
                            writeDigitalPin(rasp,12,1);
                        elseif ~isempty(bbox3) && ~isempty(bbox) && ~isempty(bbox1)
                           disp("light on 4 1 2 ") 
                          
                            writeDigitalPin(rasp,18,1);
                            writeDigitalPin(rasp,23,1);
                            writeDigitalPin(rasp,25,0);
                            writeDigitalPin(rasp,12,1);
                          elseif ~isempty(bbox) && ~isempty(bbox1) && ~isempty(bbox2) && ~isempty(bbox3)
                            disp("light on 1 2 3 4") 
                           
                           writeDigitalPin(rasp,18,1);                         
                           writeDigitalPin(rasp,23,1);
                           writeDigitalPin(rasp,25,1);
                           writeDigitalPin(rasp,12,1);
                           
                                           
                                
                               elseif ~isempty(bbox)
                                 disp("light onn1")
                                
                                    writeDigitalPin(rasp,18,1);
                                    writeDigitalPin(rasp,23,0);
                                    writeDigitalPin(rasp,25,0);
                                    writeDigitalPin(rasp,12,0);
                                     elseif ~isempty(bbox1)
                                      disp("light onn2")
                                
                                    writeDigitalPin(rasp,18,0);
                                    writeDigitalPin(rasp,23,1);
                                    writeDigitalPin(rasp,25,0);
                                    writeDigitalPin(rasp,12,0);
                                          elseif ~isempty(bbox2)
                                 disp("light onn3")
                                
                                    writeDigitalPin(rasp,18,0);
                                    writeDigitalPin(rasp,23,0);
                                    writeDigitalPin(rasp,25,1);
                                    writeDigitalPin(rasp,12,0);
                                             elseif ~isempty(bbox3)
                                                disp("light onn4")

                                                    writeDigitalPin(rasp,18,0);
                                                writeDigitalPin(rasp,23,0);
                                                writeDigitalPin(rasp,25,0);
                                                writeDigitalPin(rasp,12,1);
                                                    else
                                                        disp("light off")

                                                        writeDigitalPin(rasp,18,0);
                                                        writeDigitalPin(rasp,23,0);
                                                        writeDigitalPin(rasp,25,0);
                                                        writeDigitalPin(rasp,12,0);
            
           % writeDigitalPin(rpi,18,0);
        end
        pause(5);
    step(videoPlayer, videoFrame);

  
    Loop = isOpen(videoPlayer);
    end
end
release(videoPlayer);
release(pointTracker);
release(faceDetector);