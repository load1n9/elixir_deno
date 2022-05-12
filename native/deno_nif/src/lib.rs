use deno_core::v8;
use deno_core::JsRuntime;
use deno_core::RuntimeOptions;

#[rustler::nif]
fn run (code: &str) -> String {
  let mut runtime = JsRuntime::new(RuntimeOptions::default());
  let output: serde_json::Value =
  eval(&mut runtime, code).expect("Eval failed");
  format!("{:?}", output)
}
fn eval(
  context: &mut JsRuntime,
  code: &str,
) -> Result<serde_json::Value, String> {
  let res = context.execute_script("<anon>", code);
  match res {
    Ok(global) => {
      let scope = &mut context.handle_scope();
      let local = v8::Local::new(scope, global);
      // Deserialize a `v8` object into a Rust type using `serde_v8`,
      // in this case deserialize to a JSON `Value`.
      let deserialized_value =
        serde_v8::from_v8::<serde_json::Value>(scope, local);

      match deserialized_value {
        Ok(value) => Ok(value),
        Err(err) => Err(format!("Cannot deserialize value: {:?}", err)),
      }
    }
    Err(err) => Err(format!("Evaling error: {:?}", err)),
  }
}
rustler::init!("Elixir.Deno.Nif", [run]);
