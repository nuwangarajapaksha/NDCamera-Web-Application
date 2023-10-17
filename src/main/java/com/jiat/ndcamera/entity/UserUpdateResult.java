package com.jiat.ndcamera.entity;

public class UserUpdateResult {
    private User user;
    private MessageType message;

    public UserUpdateResult(User user, MessageType message) {
        this.user = user;
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public MessageType getMessage() {
        return message;
    }

    public void setMessage(MessageType message) {
        this.message = message;
    }
}
