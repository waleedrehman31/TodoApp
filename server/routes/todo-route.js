const express = require("express");

const router = express.Router();
const TodoModel = require("../models/todo-model");

router.get("/", async (req, res) => {
	try {
		const todos = await TodoModel.find();
		res.send(todos);
	} catch (error) {
		res.status(400).send("Error");
		console.log(error);
	}
});

router.get("/:id", async (req, res) => {
	_id = req.params.id;
	try {
		const todos = await TodoModel.findById(_id);
		res.send(todos);
	} catch (error) {
		res.status(404).send("Todo Not Found");
		console.log(error);
	}
});

router.post("/", async (req, res) => {
	const newTodo = new TodoModel({
		todo: req.body.todo,
		isComplete: req.body.isComplete,
	});
	try {
		await newTodo.save();
		res.send(newTodo);
	} catch (error) {
		res.status(400).send("Error");
		console.log(error);
	}
});

router.put("/:id", async (req, res) => {
	const _id = req.params.id;

	try {
		const todo = await TodoModel.findByIdAndUpdate(_id, {
			todo: req.body.todo,
			isComplete: req.body.isComplete,
		});
		res.send(todo);
	} catch (error) {
		res.status(400).send("Error");
		console.log(error);
	}
});

router.delete("/:id", async (req, res) => {
	const _id = req.params.id;
	try {
		await TodoModel.findByIdAndDelete(_id);
		res.send("Todo Deleted successfuly");
	} catch (error) {
		res.status(400).send("Error");
		console.log(error);
	}
});

module.exports = router;
