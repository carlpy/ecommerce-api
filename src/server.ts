import { app } from "./app";
import 'dotenv/config';

const port = process.env.PORT || 3400;

app.listen(port, () => {
	console.log('Listening from port: ', port);
})