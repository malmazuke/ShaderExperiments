#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 passthrough(float2 position, half4 color) {
    return color;
}

[[ stitchable ]] half4 recolour(float2 position, half4 color) {
    return half4(1, 0, 0, color.a);
}

[[ stitchable ]] half4 invertAlpha(float2 position, half4 color) {
    return half4(1, 0, 0, 1 - color.a);
}
