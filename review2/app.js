const express = require("express");
const cors = require("cors");
const morgan = require("morgan");
const path = require("path");
const fs = require("fs");
const authRoutes = require("./routes/authRoutes");
const eventRoutes = require("./routes/eventRoutes");
const bookingRoutes = require("./routes/bookingRoutes");
const { notFoundHandler, errorHandler } = require("./middlewares/errorMiddleware");

const app = express();
const allowedOrigins = (process.env.CLIENT_URL || "http://localhost:5173")
  .split(",")
  .map((origin) => origin.trim())
  .filter(Boolean);

function resolveFrontendDistPath() {
  const candidates = [
    process.env.FRONTEND_DIST_PATH,
    path.resolve(__dirname, "../../frontend/dist"),
    path.resolve(__dirname, "../frontend-dist")
  ].filter(Boolean);

  return candidates.find((candidate) => fs.existsSync(candidate));
}

app.use(
  cors({
    origin: (origin, callback) => {
      const isAllowed = !origin || allowedOrigins.includes("*") || allowedOrigins.includes(origin);
      return callback(null, isAllowed);
    },
    credentials: true
  })
);
app.use(express.json());
app.use(morgan("dev"));

app.get("/api/health", (req, res) => {
  res.json({ success: true, message: "API is healthy" });
});

app.use("/api/auth", authRoutes);
app.use("/api/events", eventRoutes);
app.use("/api/bookings", bookingRoutes);

// In production, serve React build from the same server.
if (process.env.NODE_ENV === "production") {
  const frontendDistPath = resolveFrontendDistPath();

  if (frontendDistPath) {
    app.use(express.static(frontendDistPath));
    app.get(/^\/(?!api).*/, (req, res) => {
      res.sendFile(path.join(frontendDistPath, "index.html"));
    });
  }
}

app.use(notFoundHandler);
app.use(errorHandler);

module.exports = app;
