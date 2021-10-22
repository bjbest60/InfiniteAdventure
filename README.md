# InfiniteAdventure
<b>INFINITE.PAS:  Pascal source for Infinite Adventure, entered in IFComp '21</b>

For use with FreePascal, freepascal.org.

The source uses the CRT unit, which I found to be difficult to find and/or move to the correct spot. The two necessary files are crt.o and crt.ppu.  To get IA to compile in DOS, I had to copy those files to \bin\go32v2.  IA requires CWSDPMI.EXE (included with FreePascal) in the same folder to run in DOS.  I believe everything runs natively in Windows out of the box.

IA's parser uses simple text-matching.  It chops the command up into no more than four words and then, given that number of words, searches for verbs it recognizes.  It tries to eliminate, ignore, or reroute articles and prepositions.  It's fairly effective for the limited vocabulary it has. Out-of-world commands like RESTART and QUIT are handled slightly differently.

Things that should be improved to make this system useful for anything other than IA:
- Use an array of records as the fundamental way to store and retrieve the world model.  This would allow for dropping of inventory items, for example.  Rooms could also be stored this way.
- Right now the rooms are generated on an x,y map, allowing only for the four cardinal directions.  A record-based system might eliminate this, allowing for other directions.
- The word-wrapping code is probably wonky and only works for up to three lines.
- Containers?  Supporters?  Ha!
- In IFComp, a weird bug involving DOSBox and FreePascal was discovered.  Short answer:  Use DOSBox for Windows; use DOSBox-X for Linux and Mac.

I propose that were one to create a full-fledged system out of this code, one should call it TACOS (Text Adventure Creation, Old-School).  But, y'know, AGT (Adventure Game Toolkit) exists, so check that out first if you really want to write DOS-based IF.

