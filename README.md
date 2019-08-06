# TinderUI-SwiftUI
Proyecto base para crear una interface estilo Tinder en SwiftUI

#Post
Este es mi primer post sobre desarrollo mobile, mi objetivo es mostrar cómo crear interfaces complejas, es decir, que tengan micro-interacciones, interacciones con gestos, animaciones, etc.

En esta instancia mostrare como montar la interface central de Tinder, donde vas Swipeando los rostros de los pretendientes dando like o unlike

Asumiré que tienes nociones sobre Swift y que ya sabes que es [SWiftUI](https://developer.apple.com/xcode/swiftui/), por tanto no explicare detalles del lenguaje y no profundizare sobre SwiftUI, por lo demás ya existen un montón de posts ahi afuera que desarrollan las nociones básica de este maravilloso Framework desarrollado por apple.

_________________
###Stack

**Xcode** 11.0 Beta 4 (11M374r)
**MacOS Catalina** Versión 10.15 Beta (19A512f)
**Swift** 5.0
_________________

Lo primero que haremos sera revisar nuestro prototipo y extraeremos sus colores y assets principales, los agregaremos a nuestro **Assets.xcassets** con sus correspondientes nombres.


![](https://thepracticaldev.s3.amazonaws.com/i/dy23qwtetobhtl6pgge3.png)


SwiftUI nos presenta una forma sencilla de trabajar con gradientes: LinearGradient, RadialGradient y AngularGradient. En esta ocasión trabajaremos con Linear gradient, que es una **struct** que nos pide un **Gradient** y dos **UnitPoint**, inicial y final.

Gradient nos pide un array de colores, que en nuestro caso sera el del gradiente izquierdo y derecho descritos anteriormente

```swift
Gradient(colors: [Color("left_gradient_color"),Color("rigth_gradient_color")])
```

Un UnitPoint es un punto, imagina un plano cartesiano con las coordenadas X y Y. Puedes inicializar asi:

```swift
UnitPoint(x: 0.0, y: 0.0)
```

Pero tambien puedes acceder a las constantes

```swift
UnitPoint.bottom
UnitPoint.bottomLeading
UnitPoint.bottomTrailing
UnitPoint.center
UnitPoint.leading
UnitPoint.top
UnitPoint.topLeading
UnitPoint.topTrailing
UnitPoint.trailing
UnitPoint.zero
```

Si quieres un Gradiente que vaya de izquierda a derecha utilizarias el **UnitPoint.leading** y el **UnitPoint.trailing**, generalmente estas constantes te sirviran para la mayoria de los casos en los que quieras utilizar gradientes, sin embargo siempre podrás inicializar un **UnitPoint** con un punto arbitrario en el plano, para lograr algo exactamente como lo que estas buscando.
 
![](https://thepracticaldev.s3.amazonaws.com/i/oe7jsog1lbfsssgpx4ps.png)

```swift

import SwiftUI

struct GradientHeader: View {
    var body: some View {
         VStack{
           Text("Discover")
               .font(.system(size:30))
               .bold()
               .foregroundColor(.white)
          }
          .frame(minWidth:0, maxWidth: .infinity)
          .frame(height: 280)
          .background(LinearGradient(gradient: Gradient(colors: [Color("left_gradient_color"),Color("rigth_gradient_color")]), startPoint: .leading, endPoint: .trailing))
                        
    }
}

```

El resultado del código anterior nos dara como resultado lo siguiente

![](https://thepracticaldev.s3.amazonaws.com/i/c1xbsmuu3nxurkwar11l.png)


## Botones


```swift

Button("Click Me"){
//tap action
}
.frame(width:60,height:60)

```

![](https://thepracticaldev.s3.amazonaws.com/i/pzv2o0uswyxqaggtndhn.png)


```swift

Button("Click Me"){
//tap action
}
.frame(width:60,height:60)
.background(Color.white)
.mask(Circle())
.shadow(color: Color("Shadow"), radius: 4, x: 0, y: 5)

```

## 🤖¡Avanzado!

```swift
//button+styles.swift
import Foundation
import SwiftUI

public struct Rounded : ButtonStyle {
    public func body(configuration: Button<Self.Label>, isPressed: Bool) -> some View {
        configuration
            .background(Color.white)
            .mask(Circle())
            .shadow(color: Color("Shadow"), radius: 4, x: 0, y: 5)
           
    }
}

public struct Big : ButtonStyle {
    public func body(configuration: Button<Self.Label>, isPressed: Bool) -> some View {
        configuration
            .frame(width: 60, height: 60)
    }
    
}

extension StaticMember where Base : ButtonStyle {
    public static var rounded: Rounded.Member {
        StaticMember<Rounded>(Rounded())
    }
    public static var big: Big.Member {
       StaticMember<Big>(Big())
   }
}
```

Aislando nuestros estilos como se muestran anteriormente, nos queda una composición de nuestro botón de manera mas limpia, con la aventaja añadida que podemos combinar estilos, aquí podemos ver como combinamos el estilo de un botón grande con el de un botón redondeado.

```swift
//Crea un nuevo Documento SwiftUI
import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Button("Click Me!"){
          //Tap Code!!   
        }
        .buttonStyle(.rounded)
        .buttonStyle(.big)
        
    }
}
```


```swift

//Buttons.swift

import SwiftUI

struct Buttons: View {
    
    var body: some View {
        
          HStack(alignment: .center){
               
             Button(action:{}){
               Image("redo")
                 .resizable()
                 .frame(width: 22, height: 22)
                 .foregroundColor(Color("redo"))
              }
              .buttonStyle(.rounded)
              .buttonStyle(.small)
              .offset(y:-14.0)
            
              // Agregar los otros 4 botones, intercalando .small y .big 
              // solo los botones de los costados tienen offset y : -14
           }
           .padding(.bottom, 35)
           .frame(minWidth:0, maxWidth:.infinity)
    }
}
```

El resultado de generar los botones de esta manera

![](https://thepracticaldev.s3.amazonaws.com/i/zq0yjq6pqjbxes3c5kc9.png)

## Offset

El offset es considerado el desplazamiento desde nuestra posición original, ya sea que nuestra vista este dentro de un VStack, HStack o ZStack; el offset desplazara nuestra vista en el eje X o en el eje Y, considerando su posición original, es decir que si a nuestra vista le seteamos un offset de (0,0) esta simplemente permanecera en su lugar, consideramos un offset X positivo un desplazamiento a la derecha de nuestra pantalla y uno negativo un desplazamiento a la izquierda de nuestra pantalla. Por otro lado el offset Y positivo se desplazara hacia abajo de nuestra pantalla y uno negativo hacia arriba de nuestra pantalla.

![](https://thepracticaldev.s3.amazonaws.com/i/fungt9jve7you672rt08.png)


el evento dragging nos devolverá un **vector** (x, y) que indica la dirección que tomo nuestro dedo al arrastrar una vista. Utilizaremos este desplazamiento para sumarlo al offset de nuestra vista, si hacemos esto sumaremos esa interacción del drag, entonces si hacemos drag de nuestra vista y la desplazamos unos 100 pixeles a la derecha, el offset nuevo de nuestra vista sera de (100,0) desde su posición original.

![](https://thepracticaldev.s3.amazonaws.com/i/kwxi41t3wjyjzydz8zf4.png)

el modificador gesture espera un objeto tipo Gesture, nosotros le pasaremos un DragGesture con 2 eventos: onChanged, qué nos indica que nuestro gesto esta cambiando, y onEnded que nuestro evento termino, es decir, que se dejo de hacer dragging.

el evento onChanged se ejecuta cada cierta cantidad de Frames en nuestra app, entonces lo que haremos es ir sumando esa diferencia de nuestro desplazamiento a un offset general (como vemos en el siguiente ejemplo). 

Tenemos que considerar otro factor, que es el parámetro startLocation, que es él desde el borde superior izquierdo al punto que esta haciendo dragging (como muestra la figura anterior).

Lo que haremos es restart el startLocation (x,y) a location, esto hará que nuestra vista se fije de forma consistente al punto al que estamos haciendo dragging, si solo consideráramos location para esto, la vista comenzaría a moverse anclada desde la esquina superior izquierdo.


```swift
import SwiftUI

struct Card: View {
    
    @State var offset = CGPoint(x: 0.0, y: 0.0)

    var body: some View {
        VStack{
            Image("paloma_mami")
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color("Shadow"), radius: 4, x: 0, y: 5)
        .gesture(
            DragGesture()
            .onChanged{ value in
                self.offset.x += value.location.x - value.startLocation.x
                self.offset.y += value.location.y - value.startLocation.y
            }
            .onEnded{ _ in
                withAnimation {
                    self.offset = CGPoint(x: 0.0, y: 0.0)
                }
            }
        )
        .offset(x: self.offset.x, y: self.offset.y)
    }
}

```

```swift

//Draggable.swift

import Foundation
import SwiftUI

struct DraggableView : ViewModifier {
    
    @State var offset = CGPoint(x: 0.0, y: 0.0)
    
    func body(content: Content) -> some View {

        content.gesture(
            DragGesture()
            .onChanged{ value in
                self.offset.x += value.location.x - value.startLocation.x
                self.offset.y += value.location.y - value.startLocation.y
            }
            .onEnded{ _ in
                withAnimation {
                    self.offset = CGPoint(x: 0.0, y: 0.0)
                }
            }
        )
        .offset(x: self.offset.x, y: self.offset.y)
        
    }
}

extension View {
    func draggable() -> some View {
        modifier(DraggableView())
    }
}

```

![](https://thepracticaldev.s3.amazonaws.com/i/x2tjvswt4sxnn9s7u4wv.png)

## Modelando los datos

Lo primero que haremos, sera crear una **struct** llamada Person del tipo **Identifiable**. En **SwiftUI** los elementos que iteran sobre una lista de objeto como **List** o **ForEach** necesitan un objeto que pueda identificar su carácter único, para ello **SwiftUI** nos entrega un tipo llamado **Identifiable**. Identifiable nos pedira asignar un id, lo haremos seteando ese id con un **UUID**, así se verificara que el objeto es único, así la lista iterara de forma optima.

```swift

import SwiftUI

struct Person : Identifiable {
    var id = UUID()
    var name = ""
    var image = ""
    var proffesion = ""
    var age = 0
    var commonConexions = 0
}

```

Así es como inicializamos un objeto tipo Person.

```swift
Person(name:"Paloma",image:"paloma_image",proffesion:"Cantante",age: 21, commonConexions: 12) 
```

Lo que hará que nuestro Stack de Cards de pretendientes logre ser Reactivo a los datos, es invocar el modelo que construiremos mas adelante de esta forma

```swift
@ObjectBinding var model = Model()
```
**@ObjectBinding** notificara a nuestra vista que tiene que volver a renderear con los nuevos datos, un objeto con la etiqueta **@ObjectBinding** debe ser de tipo **BindableObject** y lo construiremos de esta forma.


```swift
import Foundation
import Combine
import SwiftUI

class Model : BindableObject {
    var willChange = PassthroughSubject<Void, Never>()
    
     var persons = [
           Person(name:"Paloma", proffesion: "Cantante",age: 21, commonConexions: 10 ),
           Person(name:"Paloma", proffesion: "Cantante",age: 21, commonConexions: 10 ),
           Person(name:"Paloma", proffesion: "Cantante",age: 21, commonConexions: 10 ),
        ]{
        didSet{
            willChange.send()
        }
    }
    
}

```

Esta propiedad es obligatoria, le avisara a nuestra vista de **SwiftUI** que debe refrescarse, los argumentos **Void** y **Never** son suficientes para **SwiftUI**.

```swift
var willChange = PassthroughSubject<Void, Never>()
```

de esta forma informamos un cambio de los datos

```swift
willChange.send()
```

En nuestro ejemplo, tenemos un array llamado **persons** que cada vez que cambia se avisa a willChange que debe informar un cambio, nos valemos del trigger **didSet** que se ejecuta cuando nuestro objeto **persons** recibe un cambio.

```swift

     var persons = []{
        didSet{
            willChange.send()
        }
    }

```

