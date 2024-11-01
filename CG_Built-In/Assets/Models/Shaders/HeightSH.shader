Shader "Custom/HeightSH"
{
    Properties
    {
        //_MainTex ("Albedo (RGB)", 2D) = "white" {}
    }
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR;
            };

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color.r = v.vertex.z * _SinTime < 70 ? 0 : 1;
                o.color.g = v.vertex.z * _SinTime > 78 ? 0 : (v.vertex.z - 55) / 20;
                o.color.b = (67-v.vertex.z) * _SinTime / 10;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 col = i.color;
                return col;
            }

            ENDCG
        }
        
    }
}
