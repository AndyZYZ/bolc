#pragma strict
var i:int;
function Start () {
		i=0;
}

function Update () {
		if (Input.GetKeyDown (KeyCode.Q) && i == 0) {
						i++;
		
				} else if (i > 0 && i <= 18) {
						transform.Rotate (-5, 0, 0);
						i++;
				} else if (i==19)
				        {
				        //print("complete");
				         i++;
				        var other : rotatedown = gameObject.GetComponent(rotatedown);
		                // Call the function DoSomething on the script
		              
		               // set another variable in the other script instance
		                other.i = 18;
				         }

}