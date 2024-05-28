import mongoose, { Schema, models } from "mongoose";

const schema = new Schema(
  {
    name: {
      type: String,
      required: true,
    },
    email: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: true,
    },
    score: {
      type: Number,
      default: 0,
    },
  },
  { timestamps: true }
);

const User = mongoose.models.User || mongoose.model("User", schema, "users");

export default User;
