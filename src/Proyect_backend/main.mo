import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Players "mo:base/HashMap";
import Equipo "mo:base/HashMap";
import Bool "mo:base/Bool";
import Float "mo:base/Float";
import Principal "mo:base/Principal";

actor SportLeagueAdmin{
    public query (message) func whoAmi(): async Text{
      if(Principal.isAnonymous(message.caller)){
        return "No estas logueado";
      };
      return "Hola, soy el administrador de la liga";

      
    };



      var player = Players.HashMap<Text, Player>(5, Text.equal, Text.hash);
      var team = Equipo.HashMap<Text,Team>(5, Text.equal, Text.hash);

      type PlayerResult = {
    #Success : Text;
    #NotFound : Text;
    #Error : Text;
      };

      //STABLE Players
      stable var id : ?Text = null;
      stable var first_Name : ?Text = null;
      stable var last_Name : ?Text = null;
      stable var age : Nat = 0;
      stable var height : Float = 0;
      stable var activo : Bool = false;
    type Player = {
      id: Text;
      first_Name: Text;
      last_Name: Text;
      age: Nat;
      height: Float;
      activo: Bool;
    };
      //Create player
    public func setPlayer(index: Text, id: Text, first_Name: Text, last_Name: Text, age:Nat,height:Float, activo:Bool): async PlayerResult {
      if (Text.equal(index, "")) {
            return #Error("Player with this index already exists");
        };
      let newPlayer: Player = {
        id = id;
        first_Name = first_Name;
        last_Name = last_Name;
        age = age;
        height= height;
        activo = activo;
      };
      player.put(index, newPlayer);
      return #Success("Player registered");
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
        : Text, age:Nat,height : Float, activo:Bool): async ?Text {
        if (age < 18 or age > 40) {
            return ?("The player's age must be between 18 and 40 years");
        };
          
          let newPlayer: Player = {
            id = id;
            first_Name = first_Name;
            last_Name = last_Name;
            age = age;
            height = height;
            activo = activo;
            };
            player.put(index, newPlayer);
            return null;
            };
            //Get all players
           public func getAllPlayers(): async Text {
              var pairs : Text = "";
                  for((key,val) in player.entries()){
                    pairs := "("#key#":"#val.first_Name#")"#pairs;
                  };
              return pairs;
           };

          //Stable teams
        stable var id_team : ?Text = null;
        stable var team_name : ?Text = null;
        stable var city : ?Text = null;

           //Teams
        type Team = {
          id_team: Text;
          name: Text;
          city: Text;
    };

  //Create team
  public func setTeam(index: Text,id_team: Text, name: Text, city: Text): async PlayerResult {
    let newTeam: Team = {
      id_team = id_team;
      name = name;
      city = city;
      };
      team.put(index, newTeam);
      return #Success("Team registered");
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
          public func updateTeam(index: Text, id_team: Text, name: Text, city: Text
          ): async () {
            let newTeam: Team = {
              id_team = id_team;
              name = name;
              city = city;
              };
              team.put(index, newTeam);
              };

              //Get all teams
              public func getAllTeams(): async Text {
                var pairs : Text = "";
                for((key,val) in team.entries()){
                  pairs := "("#key#":"#val.id_team#")"#pairs;
                  };
                  return pairs;
                  };
};
