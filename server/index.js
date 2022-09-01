const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const helmet = require("helmet");
const dotenv = require("dotenv");
const todoRoute = require("./routes/todo-route");

const app = express();

dotenv.config();
app.use(cors());
// app.use(helmet());
app.use(express.json());

mongoose
	.connect(process.env.MONGODB_URI, {
		useNewUrlParser: true,
	})
	.then(console.log("DB Connected successfuly"))
	.catch((error) => {
		console.log(error);
	});

app.get("/", (req, res) => {
	res.send("this is the homepage");
});

app.use("/v1/api", todoRoute);

// PORT AND SERVER SETTINGS
const PORT = 5000 || process.env.PORT;

app.listen(PORT, () => {
	console.log(`Listening on http://localhost:${PORT}`);
});
