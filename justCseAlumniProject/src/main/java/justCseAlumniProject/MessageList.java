package justCseAlumniProject;

public class MessageList {
    private int    thread_id;
    private int    sender_id;
    private int    receiver_id;
    private String receiver_name;

    public MessageList(int thread_id, int sender_id, int receiver_id, String receiver_name) {
        this.thread_id     = thread_id;
        this.sender_id     = sender_id;
        this.receiver_id   = receiver_id;
        this.receiver_name = receiver_name;
    }

    public int    getThread_id()     { return thread_id; }
    public int    getSender_id()     { return sender_id; }
    public int    getReceiver_id()   { return receiver_id; }
    public String getReceiver_name() { return receiver_name; }
}