#  ObjectiveK

## What is it?

Clean room implementation of a minimal ObjC-style runtime, particularly the parts that require use of assembly language.

## How is it done?

`objc_msgSend()` is a function that does things a C function can not do: It forwards the parameters it was given to the actual function implementing a particular message in an object.

So what I do is I write a function in C that _almost_ does that. I.e. I write a function that calls the function to do method look-up, then calls another function without arguments.

Then I disassemble said C function using `clang -S -o foo.s` and modify the resulting assembler code so that it jumps to the looked-up function instead of calling it, so it uses whatever parameters were passed to us, and returns to whoever called us (think of it as being like tail call elimination).

Of course, that means I have to undo anything the function prolog did, which in the case of Intel x64 is reserve 32 bytes of stack and pushing the base pointer on the stack. Restoring the base pointer in turn means I can not keep the address to jump to in a local variable, but luckily the result register for any kind of pointer is the same, so I just use that register (%rax) for the call, as it's unlikely to be used by the function we call for its arguments.

## Why have objc_msgSend in the first place?

You could just in-line the code in `objc_msgSend()` in your compiled code, but by having this separate function, platform developers can optimize by e.g. caching lookup-results, and can update the general call sequence. Also, the CPU can better cache and predict because it _knows_ you will be calling both the method lookup and the looked-up method. And finally, it makes code generation easier if every method call maps to a single `objc_msgSend()` invocation.
