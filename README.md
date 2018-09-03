# WASM Demo (Web Assembly:Demo)

The Demo includes the the Mandelbrot image created in Web Assembly using  :
1. C 
2. TypeScript

### Pre-requisite
- Nodejs 8.*+
- emscripten (https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html)
- Assemblyscript (https://github.com/AssemblyScript/assemblyscript)

Both projects can be compiled into WASM module 
### Compiling C to WASM usinb Clang and Emscripten
```sh
$ emcc C\mandelbrot.c -O3 -s WASM=1 -s SIDE_MODULE=1 -o mandelbrot.wasm
```
### Compiling TS directly into WASM module
```sh
$ npx asc TS\mandelbrot.ts -b mandelbrot.wasm -t mandelbrot.wat -O3 --validate --noDebug --noAssert --use abort=
```
or you can use ```npm run build-asc```

### Installation
1. Clone and go-to root folder 
2. ```npm install```
3. install nginx to serve locally.
