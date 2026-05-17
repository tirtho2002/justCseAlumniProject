package justCseAlumniProject;

import java.sql.Timestamp;

public class Message {
    private int sender_id;
    private String message;
    private Timestamp send_at;

    public Message(int sender_id, String message, Timestamp send_at) {
        this.sender_id = sender_id;
        this.message = message;
        this.send_at = send_at;
    }

    public int getSender_id() { return sender_id; }
    public String getMessage() { return message; }
    public Timestamp getSend_at() { return send_at; }
}