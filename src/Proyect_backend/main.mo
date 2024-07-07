import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Players "mo:base/HashMap";
import Teams "mo:base/HashMap";
import Bool "mo:base/Bool";

actor SportLeagueAdmin{
      let player = Players.HashMap<Text, Player>(5, Text.equal, Text.hash);
    type Player = {
      id: Text;
      first_Name: Text;
      last_Name: Text;
      age: Nat;
      height: Float;
      activo: Bool;
    };
      //Create player
    public func setPlayer(index: Text, id: Text, first_Name: Text, last_Name: Text, age:Nat,height:Float, activo:Bool): async () {
      let newPlayer: Player = {
        id = id;
        first_Name = first_Name;
        last_Name = last_Name;
        age = age;
        height= height;
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
        : Text, age:Nat,height : Float, activo:Bool): async () {
          let newPlayer: Player = {
            id = id;
            first_Name = first_Name;
            last_Name = last_Name;
            age = age;
            height = height;
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



           //Teams
    let team = Teams.HashMap<Text,Team>(5, Text.equal, Text.hash);
        type Team = {
          id: Text;
          name: Text;
          city: Text;
    };

  //Create team
  public func setTeam(index: Text,id: Text, name: Text, city: Text): async () {
    let newTeam: Team = {
      id = id;
      name = name;
      city = city;
      };
      team.put(index, newTeam);
      };

      //Get team
      public func getTeam(index: Text): async ?Team {
        return team.get(index);
        };

        //Delete team
        public func deleteTeam(index: Text): async () {
          team.delete(index);
          };

          //Update team
          public func updateTeam(index: Text, id: Text, name: Text, city: Text
          ): async () {
            let newTeam: Team = {
              id = id;
              name = name;
              city = city;
              };
              team.put(index, newTeam);
              };

              //Get all teams
              public func getAllTeams(): async Text {
                var pairs : Text = "";
                for((key,val) in team.entries()){
                  pairs := "("#key#":"#val.id#")"#pairs;
                  };
                  return pairs;
                  };

};
