#ifndef SNOWKIT_OPENAL_H
#define SNOWKIT_OPENAL_H

    #if defined(HX_MACOS) || defined(IPHONE)
        #include <OpenAL/al.h>
        #include <OpenAL/alc.h>
    #elif defined(ANDROID) || defined(__ANDROID__)
        #include "../lib/openal-android/include/AL/al.h"
        #include "../lib/openal-android/include/AL/alc.h"
    #else
        #include "../lib/openal-soft/include/AL/al.h"
        #include "../lib/openal-soft/include/AL/alc.h"
    #endif

#endif