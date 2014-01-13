#pragma strict
var i :int;
function Start () {
		i=18;
}

function Update () {
		if (Input.GetKeyDown (KeyCode.E) && i == 18) {
		
						i--;
				} else 	if (i >= 0 && i < 18) {
						transform.Rotate (5, 0, 0);
						i--;
				} else if (i==-1)
						{
						//print("complete");
						i--;
						// To access public variables and functions 
		                // in another script attached to the same game object.
		                 // (ScriptName is the name of the javascript file)
		               var other : rotateup = gameObject.GetComponent(rotateup);
		                // Call the function DoSomething on the script
		              
		               // set another variable in the other script instance
		                other.i = 0;
		}
						
}