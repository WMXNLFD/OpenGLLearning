#version 330 core                                            
layout (location = 6) in vec3 aPos;                          
//layout (location = 7) in vec3 aColor;           
//layout (location = 8) in vec2 aTexCoord;         
layout (location = 7) in vec3 aNormal;         
layout (location = 8) in vec2 aTexCoord;

//uniform mat4 transform;
uniform mat4 model;
uniform mat4 view;
uniform mat4 proj;

//out vec4 vertexColor;                
//out vec2 TexCoord;
out vec3 FragPos;
out vec3 Normal; 
out vec2 TexCoord;

void main(){                                                 
    gl_Position = proj * view * model * vec4(aPos.xyz, 1.0);    
	FragPos = ( model * vec4(aPos.xyz, 1.0) ).xyz;
	Normal = mat3(transpose(inverse(model))) * aNormal;
	//vertexColor = vec4( aColor.x, aColor.y, aColor.z, 1.0);
	TexCoord = aTexCoord;
}      