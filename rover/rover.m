% https://www.mathworks.com/matlabcentral/answers/136897-use-keyboard-input-to-assign-value-to-a-variable
% https://www.mathworks.com/matlabcentral/answers/335596-how-to-make-matlab-detect-keyboard-stroke
global r
global v
global u

r = true;
v = tcpip('192.168.43.192',25000);
v.ByteOrder = 'littleEndian';
fopen(v);
u = tcpip('192.168.43.192',25001);
u.ByteOrder = 'littleEndian';
fopen(u);

h = figure;
set(h,'KeyPressFcn',@move);

while r
    pause(1);
end
close(h);
fclose(v);
fclose(u);

function move(~,e)
    global r
    global v
    global u
    fprintf('key pressed: %s\n',e.Key);
    if strcmpi(e.Key,'control')
        r = false;
    elseif strcmpi(e.Key,'uparrow') || strcmpi(e.Key,'w')
        for count = 1:100
            % This loop runs for approximately 1 second
            fwrite(v,1,'double');
        end
    elseif strcmpi(e.Key,'downarrow') || strcmpi(e.Key,'s')
        for count = 1:100
            % This loop runs for approximately 1 second
            fwrite(v,-1,'double');
        end
    elseif strcmpi(e.Key,'leftarrow') || strcmpi(e.Key,'a')
        r = true;
    elseif strcmpi(e.Key,'space')
        for angle = 125:-1:0
            fwrite(u,angle,'double');
        end
    end
end
