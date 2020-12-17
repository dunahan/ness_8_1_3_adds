// Syntax Moneo Version 2.7
// Copies Name and Tag from special waypoints to variables NESS uses
// Thx to Proleric and Shadooow for debugging the code!
// dunahan@schwerterkueste.de

%mod = '[MOD_NAME].mod' or die$!;
$searchfor = 'spawn_point';   // change this, if your waypoint have other ResRefs

for ('*.git' in %mod) {
  for (/WaypointList) {
    $locname = {/~/TemplateResRef};
    $searchstring = substr($locname, 0, 11);
    
    if ($searchstring eq $searchfor) {
      $name = /~/LocalizedName;
      add /~/VarTable, type => gffList unless /~/VarTable;
      add /~/VarTable/Name, type => gffString, value => "NESS";
      add /~/VarTable/[_]/Type, type => gffDword, value => 3;
      add /~/VarTable/[_]/Value, type => gffString, value => $name;
      
      $tag = /~/Tag;
      add /~/VarTable/Name, type => gffString, value => "NESS_TAG";
      add /~/VarTable/[_]/Type, type => gffDword, value => 3;
      add /~/VarTable/[_]/Value, type => gffString, value => $tag;
      
      for (/~/VarTable) {
        print /~/Name, ";", /~/Type, ";", /~/Value, "\n";
      }
    }
  }
}

%mod = '>';
close %mod or die$!;
