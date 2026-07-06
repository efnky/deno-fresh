export default function Home() {
  const port = Deno.env.get("PORT") ?? "8000";
  return (
    <main>
      <h1>deno-fresh up</h1>
      <p>Listening on :{port}</p>
    </main>
  );
}
