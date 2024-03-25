exports.helloWorld = (req, res) => {
  const users = [
    {
      id: 1,
      name: "John Doe",
      username: "johndoe",
      email: "johndoe@example.com",
    },
    {
      id: 2,
      name: "Jane Doe",
      username: "janedoe",
      email: "janedoe@example.com",
    },
    // Add more user objects as needed
  ];

  res.status(200).json(users);
};
