import { dbank } from "../../declarations/dbank";

window.addEventListener("load",async ()=>{
  //console.log("loading balance");
  update();
});


document.querySelector("form").addEventListener("submit", async(e)=> {
  e.preventDefault();
  //console.log("sele");
  const btn = e.target.querySelector("#submit-btn");
  const inputAmount = parseFloat(document.getElementById("input-amount").value);

  btn.setAttribute("disabled", true);
  if(document.getElementById("input-amount").value.length != 0) {
    await dbank.topUp(inputAmount);
  }
  if(document.getElementById("withdrawal-amount").value.length !=0) {
    const withdrawAmount = parseFloat(document.getElementById("withdrawal-amount").value); 
    await dbank.withDraw(withdrawAmount);
  
  }
  await dbank.compoundInterest();
  update();
  document.getElementById("withdrawal-amount").value="";
  document.getElementById("value").value="";
  
  
  btn.removeAttribute("disabled")
});

const update = async()=> {
  const curAmount = await dbank.checkBalance();
  document.getElementById("value").innerText = Math.round(curAmount*100) / 100;
}