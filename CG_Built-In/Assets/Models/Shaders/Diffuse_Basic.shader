Shader "Custom/Pixel"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Cull Off Zwrite Off Ztest Always
        
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
        }
        ENDCG
    }
    FallBack "Diffuse"
}
