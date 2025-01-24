local fardado = {}

local fardas = {

   ["Coronel [H]"] = {
      [1] = { 0,0,2 },
      [3] = { 1,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { 15,0,2 },
      [8] = { 15,0,2 },
      [9] = { 18,4,2 },
      [11] = { 220,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { -1,0 } 
   },

   ["Major [H]"] = {
      [1] = { 0,0,2 },
      [3] = { 1,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { 15,0,2 },
      [8] = { 15,0,2 },
      [9] = { 18,0,2 },
      [11] = { 220,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { -1,0 } 
   },

   ["Capitao [H]"] = {
      [1] = { 0,0,2 },
      [3] = { 1,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { 15,0,2 },
      [8] = { 15,0,2 },
      [9] = { 18,0,2 },
      [11] = { 220,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { -1,0 } 
   },

   ["Tenente [H]"] = {
      [1] = { 0,0,2 },
      [3] = { 1,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { 15,0,2 },
      [8] = { 15,0,2 },
      [9] = { 18,0,2 },
      [11] = { 220,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { -1,0 } 
   },

   ["Sargento [H]"] = {
      [1] = { 0,0,2 },
      [3] = { 1,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { 15,0,2 },
      [8] = { 15,0,2 },
      [9] = { 18,0,2 },
      [11] = { 220,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { -1,0 } 
   },

   ["Soldado [H]"] = {
      [1] = { -1,0,2 },
      [3] = { 0,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { 130,0,2 },
      [9] = { 18,0,2 },
      [11] = { 271,1,2 },
      ["p6"] = { 5,0 },
      ["p0"] = { -1,0 } 
   },

   ["Cabo [H]"] = {
      [1] = { -1,0,2 },
      [3] = { 0,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { 130,0,2 },
      [9] = { 18,0,2 },
      [11] = { 271,1,2 },
      ["p6"] = { 5,0 },
      ["p0"] = { -1,0 } 
   },

   ["Aluno [H]"] = {
      [1] = { 59,2,2 },
      [3] = { 0,0,2 },
      [4] = { 59,9,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { -1,0,2 },
      [11] = { 271,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { -1,0 } 
   },
  -- Mulher
  
   ["Coronel [M]"] = { 
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Major [M]"] = { 
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Capitao [M]"] = {
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Tenente [M]"] = {
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   }, 

   ["Sargento [M]"] = {
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Soldado [M]"] = {
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Cabo [M]"] = {
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Aluno [M]"] = {
      [1] = { -1,0,2 },
      [3] = { 1,0,2 },
      [4] = { 32,0,2 },
      [6] = { 25,0,2 },
      [7] = { -1,0,2 },
      [8] = { -1,0,2 },
      [9] = { 36,0,2 },
      [11] = { 230,0,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

-- ATENAS MEDICAL CENTER
   --MULHER
   ["Diretor [HOSPITAL][M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 86,0,2 },
      [4] = { 8,0,2 },
      [6] = { 0,10,2 },
      [7] = { 96,0,2 },
      [8] = { 39,7,2 },
      [9] = { 0,0,2 },
      [11] = { 57,5,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Vice Diretor [HOSPITAL][M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 86,0,2 },
      [4] = { 23,0,2 },
      [6] = { 0,10,2 },
      [7] = { 96,0,2 },
      [8] = { 39,7,2 },
      [9] = { 0,0,2 },
      [11] = { 57,5,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { 0,7 } 
   },

   ["Gestao [HOSPITAL][M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 86,0,2 },
      [4] = { 23,0,2 },
      [6] = { 6,3,2 },
      [7] = { 96,0,2 },
      [8] = { 39,0,2 },
      [9] = { 0,0,2 },
      [11] = { 57,7,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Medico [HOSPITAL][M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 86,0,2 },
      [4] = { 23,0,2 },
      [6] = { 6,3,2 },
      [7] = { 96,0,2 },
      [8] = { 39,0,2 },
      [9] = { 0,0,2 },
      [11] = { 57,7,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 }
   },

   ["Enfermeiro [HOSPITAL][M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 86,0,2 },
      [4] = { 23,0,2 },
      [6] = { 6,3,2 },
      [7] = { 96,0,2 },
      [8] = { 39,5,2 },
      [9] = { 0,0,2 },
      [11] = { 25,6,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Psicologo [HOSPITAL][M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 86,0,2 },
      [4] = { 23,0,2 },
      [6] = { 6,3,2 },
      [7] = { 96,0,2 },
      [8] = { 39,0,2 },
      [9] = { 0,0,2 },
      [11] = { 139,2,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },

   ["Socorrista [HOSPITAL][M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 85,0,2 },
      [4] = { 23,0,2 },
      [6] = { 1,0,2 },
      [7] = { 96,0,2 },
      [8] = { 7,0,2 },
      [9] = { 0,0,2 },
      [11] = { 27,1,2 },
      ["p6"] = { -1,0 },
      ["p0"] = { -1,0 } 
   },


   --HOMEM
   ["Paramedico [M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 1,0,2 },
      [4] = { 23,0,2 },
      [6] = { 7,1,2 },
      [7] = { 0,0,2 },
      [8] = { 34,0,2 },
      [9] = { 0,0,2 },
      [11] = { 67,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { -1,0 },
   },

   ["Mecanico [H]"] = { 
      [1] = { 0,0,2 },
      [3] = { 96,0,2 },
      [4] = { 89,20,2 },
      [6] = { 27,0,2 },
      [7] = { -1,0,2 },
      [8] = { 90,0,2 },
      [9] = { 0,0,2 },
      [11] = { 66,0,2 },
      ["p0"] = { -1,0 },
      ["p6"] = { 1,0 } 
   },

   ["Mecanico [M]"] = { 
      [1] = { 0,0,2 },
      [3] = { 18,0,2 },
      [4] = { 61,9,2 },
      [6] = { 25,0,2 },
      [7] = { 1,0,0 },
      [8] = { 54,0,2 },
      [9] = { 0,0,2 },
      [11] = { 230,20,2 },
      ["p6"] = { 4,0 },
      ["p0"] = { -1,0 } 
   },



   
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function vRP.colocarFarda(user_id, farda)
    local source = vRP.getUserSource(user_id)
    if fardas[farda] then
        vRPclient.apagarTela(source)
        TriggerClientEvent("vrp_sound:source",source,'ziper',0.5)

        vRPclient.setCustomization(source,fardas[farda])
        fardado[user_id] = true

        vRPclient.acenderTela(source)
    end
end

function vRP.removerFarda(user_id)
    local source = vRP.getUserSource(user_id)
    if user_id then
      local user = vRP.getUserApparence(user_id)

      vRPclient.apagarTela(source)
      TriggerClientEvent("vrp_sound:source",source,'ziper',0.5)

      fardado[user_id] = nil
      if user then
         vRPclient.setCustomization(source, user.clothes)
      end

      vRPclient.acenderTela(source)
    end
end

function vRP.checkFarda(user_id)
    return fardado[user_id]
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- CHECAGENS
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddEventHandler("vRP:playerSpawn",function(user_id,source,first_spawn)
  fardado[user_id] = nil
end)

AddEventHandler("vRP:playerLeave",function(user_id,source)
	fardado[user_id] = nil
end)
