using UnityEngine;
using System.Collections;

public class myGUI : MonoBehaviour {

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}

	void OnGUI()
	{
		UnityEngine.GUILayout.Label ("欢迎使用the beauty of Liquid Crstal 液晶之美 Demo 1");
		UnityEngine.GUILayout.Label ("本软件尚在开发阶段，你所看到的与最终版本可能有所区别");
		UnityEngine.GUILayout.Label ("对本软件有任何意见和建议，请联系我");
		UnityEngine.GUILayout.Label ("作者：张一则");
		UnityEngine.GUILayout.Label ("手机：13524524021，邮箱 : 370042500@qq.com");
		UnityEngine.GUILayout.Label ("");

		UnityEngine.GUILayout.Label ("操作说明：");
		UnityEngine.GUILayout.Label ("通过WSAD键和鼠标调整视角");
		UnityEngine.GUILayout.Label ("通过ESC键锁定视角");
		UnityEngine.GUILayout.Label ("通过QE键控制液晶分子偏转");
		if (GUI.Button(new Rect(10,250,50,50),"退出"))
		   Application.Quit();

	}
				


}