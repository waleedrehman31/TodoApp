const express = require("express");
const cors = require("cors");
const mongoose = require("mongoose");
const helmet = require("helmet");
const dotenv = require("dotenv");
dotenv.config();

const app = express();

app.use(cors());
app.use(helmet());
app.use(express.json());

mongoose
	.connect(process.env.MONGODB_URI)
	.then(console.log("DB Connected successfuly"))
	.catch((error) => {
		console.log(error);
	});

app.get("/", (req, res) => {
	res.send("Hello");
	res.json("Hello");
});

const PORT = 5000 || process.env.PORT;

app.listen(PORT, () => {
	console.log(`Listening on http://localhost:${PORT}`);
});
