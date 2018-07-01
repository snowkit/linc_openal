//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_openal.h"

#if defined(ANDROID) || defined(__ANDROID__)
    extern "C" {
        // void alcandroid_OnLoad( JavaVM *vm );
        // void alcandroid_OnUnload( JavaVM *vm );
        void alcandroid_Resume();
        void alcandroid_Suspend();
    }
#endif

namespace linc {

    namespace openal {

        #if defined(ANDROID) || defined(__ANDROID__)
            
            void androidResume() {
                alcandroid_Resume();
            }

            
            void androidSuspend() {
                alcandroid_Suspend();
            }

        #endif

    //AL helpers

        ALuint genSource() {
            ALuint source;
            alGenSources( (ALuint)1, &source);
            return source;
        }

        void deleteSource(ALuint source) {
            alDeleteSources( (ALuint)1, &source);
        }

        ALuint genBuffer() {
            ALuint buffer;
            alGenBuffers( (ALuint)1, &buffer );
            return buffer;
        }

        void deleteBuffer(ALuint buffer) {

            alDeleteBuffers( (ALuint)1, &buffer );

        }

        void bufferData( ALuint buffer, ALuint format, ALuint frequency, Array< unsigned char > bytes, ALuint byteOffset, ALuint byteLength) {
        
            alBufferData( buffer, format, &bytes[0] + byteOffset, byteLength, frequency );
        
        }

        int getBufferi(ALuint buffer, int param) {
            
            int res;

                alGetBufferi(buffer, param, &res);

            return res;

        } //getBufferi

        float getBufferf(ALuint buffer, int param) {
            
            float res;

                alGetBufferf(buffer, param, &res);

            return res;
        
        } //getSourcef

        int getSourcei(ALuint source, int param) {
            
            int res;

                alGetSourcei(source, param, &res);

            return res;

        } //getSourcei

        float getSourcef(ALuint source, int param) {
            
            float res;

                alGetSourcef(source, param, &res);

            return res;
        
        } //getSourcef

        Array<int> getSource3i(ALuint source, int param, Array<int> into) {

            #if HX_DEBUG
            if(into == null() || into->length < 3) {
                HX_STACK_DO_THROW(::String("linc::openal::getSource3i passed null or an array with < 3 length"));
                return into;
            }
            #endif

            int res1, res2, res3;

                alGetSource3i(source, param, &res1, &res2, &res2);

                into[0] = res1;
                into[1] = res2;
                into[2] = res3;

            return into;

        }

        Array<float> getSource3f(ALuint source, int param, Array<float> into) {

            #if HX_DEBUG
            if(into == null() || into->length < 3) {
                HX_STACK_DO_THROW(::String("linc::openal::getSource3f passed null or an array with < 3 length"));
                return into;
            }
            #endif

            float res1, res2, res3;

                alGetSource3f(source, param, &res1, &res2, &res2);

                into[0] = res1;
                into[1] = res2;
                into[2] = res3;

            return into;

        }

        void sourceQueueBuffer(ALuint source, ALuint buffer) {
            alSourceQueueBuffers(source, 1, &buffer);
        }

        static ALuint unq_buffers[1] = {0};
        int sourceUnqueueBuffer(ALuint source) {
            alSourceUnqueueBuffers(source, 1, unq_buffers);
            return unq_buffers[0];
        }

    //ALC helpers

        ALCcontext* createContext(ALCdevice* device, Array<ALCint> attr_list ) {
            return alcCreateContext(device, (attr_list != null()) ? &attr_list[0] : 0 );
        }

    } //openal namespace

} //linc namespace
