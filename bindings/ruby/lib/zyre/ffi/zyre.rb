################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

module Zyre
  module FFI

    # An open-source framework for proximity-based P2P apps
    class Zyre
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      def initialize ptr, finalize=true
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      def self.create_finalizer_for ptr
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::Zyre::FFI.zyre_destroy ptr_ptr
        end
      end
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        ObjectSpace.undefine_finalizer self if @finalizer
        @finalizer = nil
        @ptr = nil
        ptr_ptr
      end

      # Constructor, creates a new Zyre node. Note that until you start the
      # node it is silent and invisible to other nodes on the network.     
      # The node name is provided to other nodes during discovery. If you  
      # specify NULL, Zyre generates a randomized node name from the UUID. 
      def self.new(name)
        name = String(name)
        ptr = ::Zyre::FFI.zyre_new(name)
        __new ptr
      end

      # Destructor, destroys a Zyre node. When you destroy a node, any
      # messages it is sending or receiving will be discarded.        
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::Zyre::FFI.zyre_destroy(self_p)
        result
      end

      # Return our node UUID string, after successful initialization
      def uuid()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_uuid(self_p)
        result
      end

      # Return our node name, after successful initialization
      def name()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_name(self_p)
        result
      end

      # Set node header; these are provided to other nodes during discovery
      # and come in each ENTER message.                                    
      def set_header(name, format, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        name = String(name)
        format = String(format)
        result = ::Zyre::FFI.zyre_set_header(self_p, name, format, *args)
        result
      end

      # Set verbose mode; this tells the node to log all traffic as well as 
      # all major events.                                                   
      def set_verbose()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_set_verbose(self_p)
        result
      end

      # Set UDP beacon discovery port; defaults to 5670, this call overrides 
      # that so you can create independent clusters on the same network, for 
      # e.g. development vs. production. Has no effect after zyre_start().   
      def set_port(port_nbr)
        raise DestroyedError unless @ptr
        self_p = @ptr
        port_nbr = Integer(port_nbr)
        result = ::Zyre::FFI.zyre_set_port(self_p, port_nbr)
        result
      end

      # Set UDP beacon discovery interval, in milliseconds. Default is instant
      # beacon exploration followed by pinging every 1,000 msecs.             
      def set_interval(interval)
        raise DestroyedError unless @ptr
        self_p = @ptr
        interval = Integer(interval)
        result = ::Zyre::FFI.zyre_set_interval(self_p, interval)
        result
      end

      # Set network interface for UDP beacons. If you do not set this, CZMQ will
      # choose an interface for you. On boxes with several interfaces you should
      # specify which one you want to use, or strange things can happen.        
      def set_interface(value)
        raise DestroyedError unless @ptr
        self_p = @ptr
        value = String(value)
        result = ::Zyre::FFI.zyre_set_interface(self_p, value)
        result
      end

      # By default, Zyre binds to an ephemeral TCP port and broadcasts the local 
      # host name using UDP beaconing. When you call this method, Zyre will use  
      # gossip discovery instead of UDP beaconing. You MUST set-up the gossip    
      # service separately using zyre_gossip_bind() and _connect(). Note that the
      # endpoint MUST be valid for both bind and connect operations. You can use 
      # inproc://, ipc://, or tcp:// transports (for tcp://, use an IP address   
      # that is meaningful to remote as well as local nodes). Returns 0 if       
      # the bind was successful, else -1.                                        
      def set_endpoint(format, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        format = String(format)
        result = ::Zyre::FFI.zyre_set_endpoint(self_p, format, *args)
        result
      end

      # Set-up gossip discovery of other nodes. At least one node in the cluster
      # must bind to a well-known gossip endpoint, so other nodes can connect to
      # it. Note that gossip endpoints are completely distinct from Zyre node   
      # endpoints, and should not overlap (they can use the same transport).    
      def gossip_bind(format, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        format = String(format)
        result = ::Zyre::FFI.zyre_gossip_bind(self_p, format, *args)
        result
      end

      # Set-up gossip discovery of other nodes. A node may connect to multiple
      # other nodes, for redundancy paths. For details of the gossip network  
      # design, see the CZMQ zgossip class.                                   
      def gossip_connect(format, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        format = String(format)
        result = ::Zyre::FFI.zyre_gossip_connect(self_p, format, *args)
        result
      end

      # Start node, after setting header values. When you start a node it
      # begins discovery and connection. Returns 0 if OK, -1 if it wasn't
      # possible to start the node.                                      
      def start()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_start(self_p)
        result
      end

      # Stop node; this signals to other peers that this node will go away.
      # This is polite; however you can also just destroy the node without 
      # stopping it.                                                       
      def stop()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_stop(self_p)
        result
      end

      # Join a named group; after joining a group you can send messages to
      # the group and all Zyre nodes in that group will receive them.     
      def join(group)
        raise DestroyedError unless @ptr
        self_p = @ptr
        group = String(group)
        result = ::Zyre::FFI.zyre_join(self_p, group)
        result
      end

      # Leave a group
      def leave(group)
        raise DestroyedError unless @ptr
        self_p = @ptr
        group = String(group)
        result = ::Zyre::FFI.zyre_leave(self_p, group)
        result
      end

      # Receive next message from network; the message may be a control
      # message (ENTER, EXIT, JOIN, LEAVE) or data (WHISPER, SHOUT).   
      # Returns zmsg_t object, or NULL if interrupted                  
      def recv()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_recv(self_p)
        result
      end

      # Send message to single peer, specified as a UUID string
      # Destroys message after sending                         
      def whisper(peer, msg_p)
        raise DestroyedError unless @ptr
        self_p = @ptr
        peer = String(peer)
        result = ::Zyre::FFI.zyre_whisper(self_p, peer, msg_p)
        result
      end

      # Send message to a named group 
      # Destroys message after sending
      def shout(group, msg_p)
        raise DestroyedError unless @ptr
        self_p = @ptr
        group = String(group)
        result = ::Zyre::FFI.zyre_shout(self_p, group, msg_p)
        result
      end

      # Send formatted string to a single peer specified as UUID string
      def whispers(peer, format, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        peer = String(peer)
        format = String(format)
        result = ::Zyre::FFI.zyre_whispers(self_p, peer, format, *args)
        result
      end

      # Send formatted string to a named group
      def shouts(group, format, *args)
        raise DestroyedError unless @ptr
        self_p = @ptr
        group = String(group)
        format = String(format)
        result = ::Zyre::FFI.zyre_shouts(self_p, group, format, *args)
        result
      end

      # Return zlist of current peer ids.
      def peers()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_peers(self_p)
        result
      end

      # Return zlist of currently joined groups.
      def own_groups()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_own_groups(self_p)
        result
      end

      # Return zlist of groups known through connected peers.
      def peer_groups()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_peer_groups(self_p)
        result
      end

      # Return the endpoint of a connected peer.
      def peer_address(peer)
        raise DestroyedError unless @ptr
        self_p = @ptr
        peer = String(peer)
        result = ::Zyre::FFI.zyre_peer_address(self_p, peer)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Return the value of a header of a conected peer. 
      # Returns null if peer or key doesn't exits.       
      def peer_header_value(peer, name)
        raise DestroyedError unless @ptr
        self_p = @ptr
        peer = String(peer)
        name = String(name)
        result = ::Zyre::FFI.zyre_peer_header_value(self_p, peer, name)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Return socket for talking to the Zyre node, for polling
      def socket()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::Zyre::FFI.zyre_socket(self_p)
        result
      end

      # Return the Zyre version for run-time API detection
      def self.version(major, minor, patch)
        result = ::Zyre::FFI.zyre_version(major, minor, patch)
        result
      end

      # Self test of this class.
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::Zyre::FFI.zyre_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
