/* DO NOT EDIT THIS FILE - it is machine generated */
#include <jni.h>
/* Header for class verification_VerificationLibProxy */

#ifndef _Included_verification_VerificationLibProxy
#define _Included_verification_VerificationLibProxy
#ifdef __cplusplus
extern "C" {
#endif
/*
 * Class:     verification_VerificationLibProxy
 * Method:    initialise
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_initialise
  (JNIEnv *, jobject, jstring);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    shutdown
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_shutdown
  (JNIEnv *, jobject);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    startSession
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_startSession
  (JNIEnv *, jobject);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    endSession
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_endSession
  (JNIEnv *, jobject);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    sendFrameBoundry
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_sendFrameBoundry
  (JNIEnv *, jobject);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    entitySpawned
 * Signature: (Ljava/lang/String;)Ljava/lang/Object;
 */
JNIEXPORT jobject JNICALL Java_verification_VerificationLibProxy_entitySpawned
  (JNIEnv *, jobject, jstring);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    entityDestroyed
 * Signature: (Ljava/lang/Object;)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_entityDestroyed
  (JNIEnv *, jobject, jobject);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    propertyChanged_int
 * Signature: (Ljava/lang/Object;I)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_propertyChanged_1int
  (JNIEnv *, jobject, jobject, jint);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    propertyChanged_bool
 * Signature: (Ljava/lang/Object;Z)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_propertyChanged_1bool
  (JNIEnv *, jobject, jobject, jboolean);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    startDriving
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_startDriving
  (JNIEnv *, jobject, jstring);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    executeActions
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_executeActions
  (JNIEnv *, jobject);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    destroyAgent
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_destroyAgent
  (JNIEnv *, jobject, jstring);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    createAgent
 * Signature: (Ljava/lang/String;Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_createAgent
  (JNIEnv *, jobject, jstring, jstring);

/*
 * Class:     verification_VerificationLibProxy
 * Method:    updateBelief
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_verification_VerificationLibProxy_updateBelief
  (JNIEnv *, jobject, jstring);

#ifdef __cplusplus
}
#endif
#endif
