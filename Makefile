.DELETE_ON_ERROR:

AS = armips

ASM = hack.asm
ROM = ssf2tr.gba
HACK = hack.gba

$(HACK): $(ASM)
	cp $(ROM) $(HACK)
	$(AS) $(ASM)

.PHONY:
clean:
	rm -rf $(HACK)
