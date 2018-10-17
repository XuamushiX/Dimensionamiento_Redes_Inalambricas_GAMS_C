% Creado por: Esteban Inga Ortega
% Escritura desde Matlab a GAMS
% 17-10-2017
% Optimizacion GAMS
% Utilizar GAMS 32 Bits
% Capacidad + Cobertura + Interferencia
% Usar GAMS 32 bits                                                     %
%==========================================================================
%  PARÁMETROS Y DISTANCIAS 
%==========================================================================
x=[24.9285714285714 29.6428571428571 24.5000000000000 24.0714285714286 24.9285714285714 34.2142857142857 30.3571428571429 25.7857142857143 25.3571428571429 30.3571428571429 30.3571428571429 34.7857142857143 34.9285714285714 33.6428571428571 30.0714285714286 34.2142857142857];
y=[20.4897959183673 21.6326530612245 21.7959183673469 23.2653061224490 24.8979591836735 23.5918367346939 19.6734693877551 19.0204081632653 17.5510204081633 18.3673469387755 16.5714285714286 20.4897959183673 19.3469387755102 25.2244897959184 24.2448979591837 22.1224489795918];
xs=[24.2142857142857 21.0714285714286 25.2142857142857 29.3571428571429 34.3571428571429 37.7857142857143 38.3571428571429 39.3571428571429 33.6428571428571 28.5000000000000];
ys=[30.9387755102041 31.9183673469388 32.5714285714286 33.3877551020408 30.7755102040816 28.0000000000000 21.9591836734694 19.0204081632653 18.8571428571428 22.7755102040816];
Cap=8;     %Capacidad del AP
Porc=0.9;   %Porcentaje de usuarios a cubrir
K=4;        %K representa el numero de canales disponibles.     
R=5;        %R, Radio de cobertura;
P=0.9;      %P, Porcentaje cobertura
%==========================================================================
% x=[102.534562211982 89.1705069124424 91.0138248847926 109.447004608295 113.133640552995 98.3870967741936 79.9539170506913 77.1889400921659 92.8571428571429 107.603686635945 128.341013824885 122.350230414747 106.682027649770 91.4746543778802 71.6589861751152 66.5898617511521 74.4239631336406 91.4746543778802 107.142857142857 123.271889400922 137.096774193548 138.018433179724 134.331797235023 128.341013824885 114.516129032258 92.8571428571429 76.2672811059908 63.3640552995392 57.3732718894009 55.0691244239631 62.4423963133641 69.8156682027650 79.9539170506913 96.5437788018433 114.516129032258 129.262672811060 138.479262672811 144.930875576037 152.764976958525 150 147.695852534562 142.626728110599 137.096774193548 124.193548387097 112.672811059908 100.230414746544 80.8755760368664 74.8847926267281 57.8341013824885 51.3824884792627 48.6175115207373 46.3133640552995 46.7741935483871 51.3824884792627 57.8341013824885 64.2857142857143 74.8847926267281 85.0230414746544 91.9354838709678 109.907834101382 126.958525345622 145.852534562212 155.990783410138 160.599078341014 162.442396313364 166.129032258065 166.129032258065 166.589861751152 156.912442396313 151.382488479263 139.400921658986 102.995391705069 78.1105990783410 69.3548387096774 8.06451612903226 14.9769585253456 9.90783410138249 16.8202764976959 29.2626728110599 33.8709677419355 20.9677419354839 26.0368663594470 44.0092165898618 26.9585253456221 18.6635944700461 25.5760368663595 12.2119815668203 17.2811059907834 28.3410138248848 35.7142857142857 22.8110599078341 26.4976958525346 41.2442396313364 26.4976958525346 8.98617511520738 181.336405529954 171.658986175115 175.345622119816 182.258064516129 190.092165898618];
% y=[98.8338192419825 100.583090379009 80.1749271137026 81.9241982507289 107.580174927114 114.577259475219 109.329446064140 87.7551020408163 72.0116618075802 69.6793002915452 80.7580174927114 109.329446064140 126.822157434402 126.822157434402 118.658892128280 87.7551020408163 60.9329446064140 54.5189504373178 54.5189504373178 58.6005830903790 66.1807580174927 88.3381924198251 119.241982507289 134.402332361516 141.399416909621 141.399416909621 137.317784256560 133.236151603499 115.160349854227 88.3381924198251 66.7638483965015 51.6034985422741 41.1078717201166 40.5247813411079 42.2740524781341 45.7725947521866 48.6880466472303 52.1865889212828 77.2594752186589 103.498542274052 118.658892128280 139.650145772595 150.728862973761 154.810495626822 154.810495626822 154.810495626822 154.810495626822 151.311953352770 146.064139941691 132.653061224490 120.408163265306 106.997084548105 81.9241982507289 63.2653061224490 47.5218658892128 32.3615160349854 27.6967930029155 25.3644314868805 25.3644314868805 24.1982507288630 23.6151603498542 27.6967930029155 38.1924198250729 51.6034985422741 60.9329446064140 82.5072886297376 113.994169096210 133.819241982507 158.892128279883 165.889212827988 171.137026239067 176.384839650146 172.886297376093 169.970845481050 188.046647230321 168.221574344023 157.725947521866 140.816326530612 151.895043731778 172.886297376093 180.466472303207 186.297376093294 188.046647230321 162.973760932945 155.393586005831 141.399416909621 38.1924198250729 22.4489795918368 21.2827988338192 44.0233236151603 50.4373177842566 35.2769679300292 20.1166180758017 7.87172011661807 8.45481049562682 37.0262390670554 27.6967930029155 21.2827988338192 15.4518950437318 9.62099125364432];
% xs=[113.824884792627 79.2165898617512 22.9262672811060 24.3983614951357 88.3064516129033 163.709677419355 156.298003072197 161.520737327189 146.198156682028 72.2119815668203 63.1797235023042 151.474654377880 118.433179723502 100.691244239632 125.460829493088 53.4101382488479 182.565284178188 61.4055299539170 102.419354838710 134.608294930876];
% ys=[152.769679300291 30.3790087463557 166.180758017493 27.5672173631357 121.938775510204 32.6530612244898 87.7551020408162 56.2682215743441 161.661807580175 159.008746355685 58.0174927113703 125.072886297376 23.9067055393586 80.5247813411079 96.5014577259476 121.690962099125 15.4518950437318 86.4431486880467 47.9591836734694 54.2857142857143];
% Cap=25;     %Capacidad del AP
% Porc=0.8;   %Porcentaje de usuarios a cubrir
% K=2;        %K representa el numero de canales disponibles.     
% R=65;       %R, Radio de cobertura;
% P=0.8;      %P, Porcentaje cobertura
%==========================================================================
flag=0; num=0;
N=length(x);
M=length(xs);
Rs=R*ones(M,1);
Ds=2*Rs;        %Distancia de interferencia
for i=1:M 
    for j=1:N
        dist(i,j)=sqrt((xs(i)-x(j))^2+(ys(i)-y(j))^2); 
    end
end
for i=1:M
    for k=1:M
        distAP(i,k)=sqrt((xs(i)-xs(k))^2+(ys(i)-ys(k))^2); 
    end
end
%==========================================================================
%                               LPSolve
%==========================================================================
clc
fid = fopen('Caso_C.lp', 'w');
fprintf(fid, 'min: X1');
for j=2:M
    fprintf(fid, '+X%d',j); 
end
fprintf(fid, ';\n'); 

%1. RESTRICCION DEL NUMERO DE USUARIOS CONECTADOS
fprintf(fid, 'CONECTIVIDAD: Y1');
for j=2:N
    fprintf(fid, '+Y%d',j); 
end
fprintf(fid, '>=%f;\n',Porc*N); 
%2. RESTRICCION DE QUE CADA USUARIO ESTA CONECTADO SI SE CONECTA A ALGUN AP EN
%ALGUN CANAL
for j=1:N
    %Ecuacion de restriccion de conexion de cada usuario
    fprintf(fid, 'CONECTIVIDAD_USUARIO%d: Y%d=',j,j); 
    for i=1:M
        for k=1:K
            fprintf(fid, '+X_%d_%d_%d',i,k,j);
        end
    end
    fprintf(fid, ';\n');
end
%3. RESTRICCION DE CAPACIDAD DE LAS ESTACIONES BASE
for i=1:M
    for k=1:K
        fprintf(fid, 'CAPACIDAD_AP_%d_%d: ',i,k);
        for j=1:N
            fprintf(fid, '+X_%d_%d_%d',i,k,j);
        end
        fprintf(fid, '<=%f * X_%d_%d;\n',Cap,i,k);
    end
end
%4. RESTRICCION DE ACTIVIDAD DE LAS ESTACIONES BASE
for i=1:M
    for k=1:K
        fprintf(fid, 'ACTIVIDAD_AP_%d_CH%d: X_%d_%d<=X%d;\n',i,k,i,k,i);
    end
end
%5. RESTRICCION DE CONECTIVIDAD SI EXISTE COBERTURA Y ACTIVIDAD EN EL SITIO i
for i=1:M
    for k=1:K
        for j=1:N
            if dist(i,j)<=Rs(i) 
                fprintf(fid, 'REST_%d_%d_%d: X_%d_%d_%d<=X_%d_%d;\n',i,k,j,i,k,j,i,k); 
            else
                fprintf(fid, 'REST_%d_%d_%d: X_%d_%d_%d<=0;\n',i,k,j,i,k,j); 
            end
        end
    end
end
%6. RESTRICCION DE INTERFERENCIA ENTRE LOS AP MUY CERCANOS ENTRE SI
for k=1:K
    for i=1:(M-1)
        for j=(i+1):M
            if distAP(i,j)<=max(Ds(i),Ds(j))    %Los dos AP no se pueden encender simultï¿½neamente. 
                fprintf(fid, 'REST_INTERF%d_%d_CH%d: X_%d_%d+X_%d_%d<=1;\n',i,j,k,i,k,j,k); 
            end
        end
    end
end 
fprintf(fid, 'binary '); 
for i=1:M
    for j=1:N
        for k=1:N %REVISAR 
            fprintf(fid, 'X_%d_%d_%d, ',i,j,k); 
        end
    end
end
for i=1:N
    fprintf(fid, 'Y%d, ',i); 
end
for i=1:M
    for k=1:K
        fprintf(fid, 'X_%d_%d, ',i,k); 
    end
end

for i=1:(M-1)
    fprintf(fid, 'X%d, ',i); %Zi
end
fprintf(fid, 'X%d;\n',M); 
fclose(fid);
%==========================================================================
%                               GAMS 32 bits                              %
%==========================================================================
fidg = fopen('Caso_C.gms', 'w');
fprintf(fidg,'$TITLE ECUACIONES');
fprintf(fidg,'\n');
fprintf(fidg,'$ONTEXT');
fprintf(fidg,'\n');
fprintf(fidg,'$Comunicaciones I')
fprintf(fidg,'\n');
fprintf(fidg,'$24-04-2017')
fprintf(fidg,'\n');
fprintf(fidg,'$MINIMIZAR EL NUMERO DE APs')
fprintf(fidg,'\n');
fprintf(fidg,'$Resolucion Mediante GAMS')
fprintf(fidg,'\n');
fprintf(fidg,'$                                    USAR GAMS 32 bits')
fprintf(fidg,'\n');
fprintf(fidg,'$OFFTEXT');
fprintf(fidg,'\n');
%==========================================================================
% Función Objetivo
fprintf(fidg,'VARIABLES');
fprintf(fidg,'\n');
fprintf(fidg, 'Z;')
fprintf(fidg,'\n');
%==========================================================================
fprintf(fidg,'BINARY VARIABLES ');
for i=1:N
    fprintf(fidg,'Y_%d, ',i);
end
for i=1:(M-1)
    fprintf(fidg,'Z_%d, ',i); %Xi --> lpsolve
end
for i=1:M
    for k=1:K
        fprintf(fidg, 'X_%d_%d, ',i,k);
    end
end
%ingreso de variable binaria X_AP_CH_USUARIO
for i=1:M
    for j=1:N
        for k=1:K
            fprintf(fidg, 'X_%d_%d_%d,',i,k,j);
        end
    end
end
fprintf(fidg,'Z_%d;\n',M);% para evitar error al finalizar la declaracion
fprintf(fidg,'EQUATIONS');
fprintf(fidg,'\n');
%==========================================================================
fprintf(fidg,'funcionobj,min_num_usuarios,ecuacion1');
for j=2:N
    fprintf(fidg,',ecuacion%d',j);
 end
for i=1:M
    for k=1:K
    fprintf(fidg, ',CAPACIDAD_AP_%d_%d',i,k);
    end
end
for i=1:M
    for k=1:K
        fprintf(fidg, ',ACTIVIDAD_AP_%d_CH_%d',i,k);
    end
end
 for i=1:M
    for j=1:N
        for k=1:K
            fprintf(fidg, ',COBERTURA_AP_%d_CH_%d_USUARIO_%d',i,k,j); 
        end
    end
 end
 for k=1:K
    for i=1:(M-1)
        for j=(i+1):M
            if distAP(i,j)<=max(Ds(i),Ds(j))
            fprintf(fidg, ',REST_INTERF_AP_%d_AP_%d_CH_%d',i,j,k);
            end
        end
    end
end
fprintf(fidg,';\n');
%==========================================================================
fprintf(fidg,'funcionobj.. Z=E');
fprintf(fidg, '=Z_1');
for j=2:M
     fprintf(fidg,'+Z_%d',j);
end
fprintf(fidg,';\n');
%==========================================================================
fprintf(fidg,'min_num_usuarios.. +Y_1');
for j=2:N
    fprintf(fidg,'+Y_%d',j);%CONECTIVIDAD -->lpsolve
end
fprintf(fidg,'=G=%f;\n',P*N);
%==========================================================================
for j=1:N
    %Ecuacion de restriccion de conexion de cada usuario
    fprintf(fidg, 'ecuacion%d.. Y_%d=E=',j,j); %CONECTIVIDAD USUARIO: -->lPsolve
    for i=1:M
        for k=1:K
        fprintf(fidg, '+X_%d_%d_%d',i,k,j);
        end
    end
    fprintf(fidg, ';\n');
end
%==========================================================================
%RESTRICCION DE CAPACIDAD DE LAS ESTACIONES BASE
%fprintf(fid,'funcionobj,CAPACIDAD_AP_1,');
for i=1:M
    for k=1:K
    fprintf(fidg, 'CAPACIDAD_AP_%d_%d.. ',i,k);
    for j=1:N
        fprintf(fidg, '+X_%d_%d_%d',i,k,j);
    end
    fprintf(fidg, '=L=%f * X_%d_%d;\n',Cap,i,k);
    end
end
%==========================================================================
%4. RESTRICCION DE ACTIVIDAD DE LAS ESTACIONES BASE
for i=1:M
    for k=1:K
        fprintf(fidg, 'ACTIVIDAD_AP_%d_CH_%d.. X_%d_%d=L=Z_%d;\n',i,k,i,k,i);
    end
end
%==========================================================================
%RESTRICCION DE CONECTIVIDAD SI EXISTE COBERTURA Y ACTIVIDAD EN EL SITIO i
for i=1:M
    for k=1:K
    for j=1:N
        if dist(i,j)<=R
            fprintf(fidg, 'COBERTURA_AP_%d_CH_%d_USUARIO_%d.. X_%d_%d_%d=L=X_%d_%d;\n',i,k,j,i,k,j,i,k); 
        else
            fprintf(fidg, 'COBERTURA_AP_%d_CH_%d_USUARIO_%d.. X_%d_%d_%d=L=0;\n',i,k,j,i,k,j); %REST-->lpsolve
        end
    end
    end
end
%==========================================================================
%RESTRICCION POR INTERFERENCIA ENTRE AP i Y AP j
for k=1:K
    for i=1:(M-1)
        for j=(i+1):M
            if distAP(i,j)<=max(Ds(i),Ds(j))    %Los dos AP no se pueden encender simultï¿½neamente. 
                fprintf(fidg, 'REST_INTERF_AP_%d_AP_%d_CH_%d.. X_%d_%d+X_%d_%d=L=1;\n',i,j,k,i,k,j,k); 
            end
        end
    end
end 
%==========================================================================
fprintf(fidg,'MODEL  cobcapinter /all/');
fprintf(fidg,'\n');
fprintf(fidg,'SOLVE   cobcapinter using MIP minimizing Z'); 
fprintf(fidg,';\n');
fclose(fidg);
%==========================================================================
clc