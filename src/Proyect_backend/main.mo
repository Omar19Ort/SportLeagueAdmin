import Nat "mo:base/Nat";
import Text "mo:base/Text";
import HashMap "mo:base/HashMap";
import Bool "mo:base/Bool";

actor Player{

      let player = HashMap.HashMap<Text, Player>(5, Text.equal, Text.hash);
    type Player = {
      id: Text;
      first_Name: Text;
      last_Name: Text;
      age: Nat;
      activo: Bool;
    };
      //Create player
    public func setPlayer(index: Text, id: Text, first_Name: Text, last_Name: Text, age:Nat, activo:Bool): async () {
      let newPlayer: Player = {
        id = id;
        first_Name = first_Name;
        last_Name = last_Name;
        age = age;
        activo = activo;
      };

      player.put(index, newPlayer);
    };
    //Get player
    public func getPlayer(index: Text): async ?Player {
      return player.get(index);
      };
      //Delete player
      public func deletePlayer(index: Text): async () {
        player.delete(index);
        };
        //Update player
        public func updatePlayer(index: Text, id: Text, first_Name: Text, last_Name
        : Text, age:Nat, activo:Bool): async () {
          let newPlayer: Player = {
            id = id;
            first_Name = first_Name;
            last_Name = last_Name;
            age = age;
            activo = activo;
            };
            player.put(index, newPlayer);
            };
            //Get all players
           public func getAllPlayers(): async Text {
              var pairs : Text = "";
                  for((key,val) in player.entries()){
                    pairs := "("#key#":"#val.first_Name#")"#pairs;
                  };
              return pairs;
           };
};