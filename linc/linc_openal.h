#pragma once

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

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

namespace linc {

    namespace openal {

        extern ALuint genSource();
        extern void deleteSource(ALuint source);
        extern ALuint genBuffer();
        extern void deleteBuffer(ALuint buffer);
        extern void bufferData(ALuint buffer, ALuint format, ALuint frequency, Array<unsigned char> bytes, ALuint byteOffset, ALuint byteLength);
        extern ALCcontext* createContext(ALCdevice* device, Array<ALCint> attr_list );
        extern int getBufferi(ALuint buffer, int param);
        extern float getBufferf(ALuint buffer, int param);
        extern int getSourcei(ALuint source, int param);
        extern float getSourcef(ALuint source, int param);
        extern Array<int> getSource3i(ALuint source, int param, Array<int> into);
        extern Array<float> getSource3f(ALuint source, int param, Array<float> into);
        extern void sourceQueueBuffer(ALuint source, ALuint buffer);
        extern int sourceUnqueueBuffer(ALuint source);

        #if defined(ANDROID) || defined(__ANDROID__)
            extern void androidResume();
            extern void androidSuspend();
        #endif


    } //openal namespace

} //linc namespace
