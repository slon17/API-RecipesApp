
receta('puerco asado','cena',['puerco','sal','pimienta'],'embarre el puerco de sal y pimienta y pongalo al fuego',['chanchoalhorno.png']).
receta('arroz con huevo','almuerzo',['arroz','huevo'],'ponga a hacer el huevo como si fuese a ser pateado y agrega el arroz',['arrozconuevo.png']).
receta('sopa negra','cena',['frijoles','huevo'],'haga frijoles y agregue el huevo sin pelar para que se ponga duro', ['sopanegra.png']).
receta('cereal', 'desayuno',['cereal','leche'],'ponga el cereal en un plato hondo y agregue la leche',['cereal.png']).
receta('macarrones','almuerzo',['espaguetti','salsa de tomate','queso'],'cocine los espaguetties, agregue la salsa y luego el queso',['macarrones.png']).
receta('arepas','desayuno',['leche','polvito de arepa','azucar','huevo'],'haga una masa con el polvo, la leche y el huevo, agrega azucar al gusto y frie arepitas en el sarten',['arepa.png']).


buscarXnombre(Busqueda, N,T,Ing,P,Img) :- receta(Busqueda, T,Ing,P, Img).
buscarXtipo(Busqueda, N,T,Ing,P,Img)  :- receta(N, Busqueda, Ing,P, Img).

buscarXingrediente(Busqueda, N,T,Ing,P,Img) :- receta(N,T,Ing,P,Img), ingrediente(Busqueda,Ing).
ingrediente(Busqueda, [Busqueda|R]).
ingrediente(Busqueda,[B|R]) :- bingrediente(Busqueda, R).
