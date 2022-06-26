function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
set(ax,'DataAspectRatio',[1 1 1]);
set(ax,'PlotBoxAspectRatio',[3 2 1]);
set(ax,'XLim',[-1.5 1.5]);
set(ax,'YLim',[-1 1]);
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');

% Geometry description:
pdeellip(0,0,0.68999999999999995,0.92000000000000004,...
0);
pdeellip(0,-0.0184,0.66239999999999999,0.874,...
0);
pdeellip(0.22,0,0.11,0.31,...
-0.31415926535897931);
pdeellip(-0.22,0,0.16,0.40999999999999998,...
0.31415926535897931);
pdeellip(0,0.34999999999999998,0.20999999999999999,0.25,...
0);
pdeellip(0,0.10000000000000001,0.045999999999999999,0.045999999999999999,...
0);
pdeellip(0,-0.10000000000000001,0.045999999999999999,0.045999999999999999,...
0);
pdeellip(-0.080000000000000002,-0.60499999999999998,0.045999999999999999,0.023,...
0);
pdeellip(0,-0.60499999999999998,0.023,0.023,...
0);
pdeellip(0.55379999999999996,-0.38579999999999998,0.033300000000000003,0.20599999999999999,...
-0.31415926535897931);
pdeellip(0.059999999999999998,-0.60499999999999998,0.045999999999999999,0.023,...
67.5);
% set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','E1+E2+E3+E4+E5+E6+E7+E8+E9+E10+E11')
% 
% % Boundary conditions:
% pdetool('changemode',0)
% pdesetbd(5,...
% 'dir',...
% 1,...
% '1',...
% '0')
% pdesetbd(4,...
% 'dir',...
% 1,...
% '1',...
% '0')
% pdesetbd(3,...
% 'dir',...
% 1,...
% '1',...
% '0')
% pdesetbd(2,...
% 'dir',...
% 1,...
% '1',...
% '0')
% pdesetbd(1,...
% 'dir',...
% 1,...
% '1',...
% '0')
% 
% % PDE coefficients:
% pdeseteq(1,...
% '1.0',...
% '0.0',...
% '10.0',...
% '1.0',...
% '0:10',...
% '0.0',...
% '0.0',...
% '[0 100]')
% setuprop(pde_fig,'currparam',...
% ['1.0 ';...
% '0.0 ';...
% '10.0';...
% '1.0 '])
% 
% % Solve parameters:
% setuprop(pde_fig,'solveparam',...
% str2mat('0','1000','10','pdeadworst',...
% '0.5','longest','0','1E-4','','fixed','Inf'))
% 
% % Plotflags and user data strings:
% setuprop(pde_fig,'plotflags',[1 1 1 1 1 1 1 1 0 0 0 1 1 0 0 0 0 1]);
% setuprop(pde_fig,'colstring','');
% setuprop(pde_fig,'arrowstring','');
% setuprop(pde_fig,'deformstring','');
% setuprop(pde_fig,'heightstring','');