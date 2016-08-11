/*  =========================================================================
    zyre_event - Parsing Zyre messages

    Copyright (c) the Contributors as noted in the AUTHORS file.           
                                                                           
    This file is part of Zyre, an open-source framework for proximity-based
    peer-to-peer applications -- See http://zyre.org.                      
                                                                           
    This Source Code Form is subject to the terms of the Mozilla Public    
    License, v. 2.0. If a copy of the MPL was not distributed with this    
    file, You can obtain one at http://mozilla.org/MPL/2.0/.               
    =========================================================================
*/

#ifndef ZYRE_EVENT_H_INCLUDED
#define ZYRE_EVENT_H_INCLUDED

#ifdef __cplusplus
extern "C" {
#endif


//  @warning THE FOLLOWING @INTERFACE BLOCK IS AUTO-GENERATED BY ZPROJECT
//  @warning Please edit the model at "api/zyre_event.api" to make changes.
//  @interface
//  This API is a draft, and may change without notice.
#ifdef ZYRE_BUILD_DRAFT_API
//  *** Draft method, for development use, may change without warning ***
//  Constructor: receive an event from the zyre node, wraps zyre_recv.
//  The event may be a control message (ENTER, EXIT, JOIN, LEAVE) or  
//  data (WHISPER, SHOUT).                                            
ZYRE_EXPORT zyre_event_t *
    zyre_event_new (zyre_t *node);

//  *** Draft method, for development use, may change without warning ***
//  Destructor; destroys an event instance
ZYRE_EXPORT void
    zyre_event_destroy (zyre_event_t **self_p);

//  *** Draft method, for development use, may change without warning ***
//  Returns event type, as printable uppercase string. Choices are:   
//  "ENTER", "EXIT", "JOIN", "LEAVE", "EVASIVE", "WHISPER" and "SHOUT"
//  and for the local node: "STOP"                                    
ZYRE_EXPORT const char *
    zyre_event_type (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Return the sending peer's uuid as a string
ZYRE_EXPORT const char *
    zyre_event_peer_uuid (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Return the sending peer's public name as a string
ZYRE_EXPORT const char *
    zyre_event_peer_name (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Return the sending peer's ipaddress as a string
ZYRE_EXPORT const char *
    zyre_event_peer_addr (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Returns the event headers, or NULL if there are none
ZYRE_EXPORT zhash_t *
    zyre_event_headers (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Returns value of a header from the message headers   
//  obtained by ENTER. Return NULL if no value was found.
ZYRE_EXPORT const char *
    zyre_event_header (zyre_event_t *self, const char *name);

//  *** Draft method, for development use, may change without warning ***
//  Returns the group name that a SHOUT event was sent to
ZYRE_EXPORT const char *
    zyre_event_group (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Returns the incoming message payload; the caller can modify the
//  message but does not own it and should not destroy it.         
ZYRE_EXPORT zmsg_t *
    zyre_event_msg (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Returns the incoming message payload, and pass ownership to the   
//  caller. The caller must destroy the message when finished with it.
//  After called on the given event, further calls will return NULL.  
//  Caller owns return value and must destroy it when done.
ZYRE_EXPORT zmsg_t *
    zyre_event_get_msg (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Print event to zsys log
ZYRE_EXPORT void
    zyre_event_print (zyre_event_t *self);

//  *** Draft method, for development use, may change without warning ***
//  Self test of this class.
ZYRE_EXPORT void
    zyre_event_test (bool verbose);

#endif // ZYRE_BUILD_DRAFT_API
//  @end

#ifdef __cplusplus
}
#endif

#endif
