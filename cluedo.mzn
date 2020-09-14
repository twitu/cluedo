enum CARDS;
set of int: ANSWERS = 0..2;  % 0 - not answered, 1 - dont have, 2 - have
set of int: PLAYERS;
set of int: SUGGESTIONS;

array[PLAYERS] of int: hand_size;
array[SUGGESTIONS] of set of CARDS: suggestion;
array[SUGGESTIONS, PLAYERS] of ANSWERS: answer;

set of CARDS: CHARACHTERS;
set of CARDS: WEAPONS;
set of CARDS: ROOMS;
set of CARDS: reveal;

% decisions variables
array[PLAYERS] of var set of CARDS: hand;
var set of CARDS: suspects;

% assertions about data

% constraints
include "globals.mzn";

% constraint hand[3] == reveal;

constraint all_disjoint(hand);  % no two players should have the same card

% a player's hand cannot contain more cards than the pre-decided value
% a player's hand cannot contain any of the suspect cards
constraint forall (p in PLAYERS)
                  (card(hand[p]) == hand_size[p] /\ card(hand[p] intersect suspects) == 0);
       
% a player who passes does not have any of the suggested cards
% a player who answers has at least one of the suggested cards
% nothing can be concluded about other players
constraint forall (s in SUGGESTIONS, p in PLAYERS)
                  (if answer[s, p] == 1 then card(suggestion[s] intersect hand[p]) == 0
                    elseif answer[s, p] == 2 then card(suggestion[s] intersect hand[p]) >= 1
                   else true endif
                  );

% final suspected cards must contain one of each type of card
constraint card(CHARACHTERS intersect suspects) == 1 /\ card(WEAPONS intersect suspects) == 1 /\ card(ROOMS intersect suspects) == 1;
% try to solve model for given constraints             
solve satisfy;

% output
% output ["Player " ++ show(i) ++ " " ++ show(hand[i]) ++ "\n"| i in PLAYERS] ++ ["suspect cards: ", show(suspects)];
output ["suspect cards: ", show(suspects)];
