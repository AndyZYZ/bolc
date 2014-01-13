
var sensitivity : float = .1; 
var MoveSpeed : float = 5;
var n:float=5;
var esctrigger = 1;
function Update() 
{ 
	var moveSpeed = this.MoveSpeed;

	if(Input.GetKeyDown(KeyCode.Escape))
	    {
	      esctrigger = esctrigger * (-1);
	      Debug.Log("esc botton pressed,etrigger="+esctrigger);
	      
	      }

	/*if(Input.GetKey(KeyCode.LeftShift))
		{
		moveSpeed = n*this.MoveSpeed;
		print("i");

		}
	 else if(Input.GetKey(KeyCode.CapsLock))
		{
	moveSpeed = 10*n*this.MoveSpeed;
		}
    else
		{
	moveSpeed=this.MoveSpeed;
		}*/
 if (esctrigger==1) 
 {
        transform.Rotate(Vector3.up * Input.GetAxis("Mouse X") * Time.deltaTime * sensitivity);   

        transform.Translate(Vector3.forward * Input.GetAxis("Vertical")* Time.deltaTime*moveSpeed);   // 
        transform.Translate(Vector3.right * Input.GetAxis("Horizontal") * Time.deltaTime* moveSpeed); // 
//   transform.Translate(Vector3.up * Input.GetAxis("UpDown") * Time.deltaTime* moveSpeed);   
 //  transform.Translate(Vector3.forward * Input.GetAxis("Vertical")* Time.deltaTime*moveSpeed );   //
 }
}
