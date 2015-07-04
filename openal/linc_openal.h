#ifndef _LINC_OPENAL_H_
#define _LINC_OPENAL_H_

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

#endif //_LINC_OPENAL_H_