import { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import App from "./App.jsx";
import AdminPanel from "./AdminPanel.jsx";

// Simple client-side router — no library needed
const path = window.location.pathname;

createRoot(document.getElementById("root")).render(
  <StrictMode>
    {path.startsWith("/admin") ? <AdminPanel /> : <App />}
  </StrictMode>
);
