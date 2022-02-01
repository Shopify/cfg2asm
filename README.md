# cfg2asm

*cfg2asm* is a tool for printing assembly from *control flow-graph*, or CFG,
files dumped by the GraalVM compiler.

The *C1Visualizer* is the tool usually used to work with GraalVM control flow
graphs. cfg2asm is an open-source equivalent that works from the command line.

cfg2asm was forked from [Seafoam](https://github.com/Shopify/seafoam).

## Installation

```
% brew install capstone               # macOS
% sudo apt-get install libcapstone3   # Ubuntu < 21.04
% sudo apt-get install libcapstone4   # Ubuntu >= 21.04
% gem install cfg2asm
```

## Use

`-Dgraal.PrintBackendCFG=true` for Java, or `--vm.Dgraal.PrintBackendCFG=true` for Truffle.

```
% cfg2asm examples/java/exampleArithOperator.cfg.gz
[examples/java/exampleArithOperator.cfg.gz]
				;Comment 0:	VERIFIED_ENTRY
	0x124b8de80:	nop	dword ptr [rax + rax]
				;Comment 5:	block B0 null
				;Comment 5:	0 [rsi|DWORD, rdx|DWORD, rbp|QWORD] = LABEL numbPhis: 0 align: false label: ?
				;Comment 5:	4 [] = HOTSPOTLOCKSTACK frameMapBuilder: org.graalvm.compiler.lir.amd64.AMD64FrameMapBuilder@26ba755b slotKind: QWORD
				;Comment 5:	10 rsi|DWORD = ADD (x: rsi|DWORD, y: rdx|DWORD) size: DWORD
	0x124b8de85:	add	esi, edx
				;Comment 7:	12 rax|DWORD = MOVE rsi|DWORD moveKind: DWORD
	0x124b8de87:	mov	eax, esi
				;Comment 9:	14 RETURN (savedRbp: rbp|QWORD, value: rax|DWORD) isStub: false requiresReservedStackAccessCheck: false thread: r15 scratchForSafepointOnReturn: rcx config: org.graalvm.compiler.hotspot.GraalHotSpotVMConfig@6c71283a
	0x124b8de89:	mov	rcx, qword ptr [r15 + 0x108]
				;Comment 16:	POLL_RETURN_FAR
	0x124b8de90:	test	dword ptr [rcx], eax
	0x124b8de92:	ret	
				;Comment 19:	{Stub<ExceptionHandlerStub.exceptionHandler>@0x11a9b9980:CallingConvention[rax|QWORD[.], rdx|QWORD]:CallingConvention[rax|QWORD[.], rdx|QWORD]; temps=rdi|ILLEGAL,xmm14|ILLEGAL,xmm15|ILLEGAL,xmm12|ILLEGAL,xmm13|ILLEGAL,xmm10|ILLEGAL,xmm11|ILLEGAL,xmm7|ILLEGAL,xmm8|ILLEGAL,xmm9|ILLEGAL,xmm0|ILLEGAL,xmm1|ILLEGAL,xmm2|ILLEGAL,xmm3|ILLEGAL,xmm4|ILLEGAL,xmm5|ILLEGAL,xmm6|ILLEGAL,rax|ILLEGAL,rcx|ILLEGAL,rdx|ILLEGAL,rsi|ILLEGAL,r8|ILLEGAL,r9|ILLEGAL,r10|ILLEGAL,r11|ILLEGAL}
				;Comment 19:	EXCEPTION_HANDLER_ENTRY
	0x124b8de93:	call	0x11a9b9980
	0x124b8de98:	nop	
				;Comment 25:	{Field[name=CompilerToVM::Data::SharedRuntime_deopt_blob_unpack, type=address, offset=0, address=0x10646a4d0, value=4740607520]:0x11a8fee20}
				;Comment 25:	DEOPT_HANDLER_ENTRY
	0x124b8de99:	call	0x11a8fee20
	0x124b8de9e:	nop	
	0x124b8de9f:	hlt	
```

## Author

cfg2asm was written by Chris Seaton at Shopify, chris.seaton@shopify.com.

## Citations


## License

MIT
