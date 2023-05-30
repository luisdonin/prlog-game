# Duda-and-Chicken-go-to-the-Coop
This repository contains a text-based adventure game in Prolog. Join Duda as they complete objectives and explore locations. Can you complete all the objectives?
Here is a possible readme with the instructions on how to play the game for github:

# Duda and Chicken go to the Coop

This is a text-based adventure game written in Prolog. You play as Duda, a dog who wants to catch a chicken in the forest and bring it to the coop. Along the way, you will encounter various obstacles and meet Harold and Kumar, who will invite you to eat a burger at the burger shack.

## How to play

- You need a Prolog interpreter to run this game. You can download one from [here](https://www.swi-prolog.org/download/stable).
- To start the game, load the file `[game].` in your Prolog interpreter and type `iniciar.`.
- The game will tell you where Duda is and what are his objectives.
- You can move to different locations by typing `ir_para(lugar).`, where `lugar` is the name of the location. For example, `ir_para(casa).` will make Duda go to the house.
- You can collect objects by typing `pegar(objeto).`, where `objeto` is the name of the object. For example, `pegar(rede).` will make Duda pick up the net in the house.
- You can take a bath in the lagoon by typing `banhar.`. This is necessary before entering the house.
- You can eat a burger at the burger shack by typing `comer_burger.`. This is possible only if you have met Harold and Kumar at the house and have picked up a burger there.
- The game will end when you have completed all your objectives.

## Tips

- Some locations are not accessible from others. For example, you cannot go to the burger shack without meeting Harold and Kumar at the house first.
- Some objects require other objects to be collected. For example, you cannot catch the chicken without having the net.
- The game is randomized, so you may not meet Harold and Kumar every time you play.

## Credits

This game was created by user J. Luis B. Donin and Luiz Felipe Nagatani Rabello.
