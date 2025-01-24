local pressetHooks = {
    ["ENTRADA"] = { "https://discord.com/api/webhooks/1050178181358956574/fy4lNRM87rYY02GBMQg4-wHuj4EbeZv6DVZ5qRR68DhaZA6lKN5npjUdNSy07KFe5Nzu" },
    ["SAIDA"] = { "https://discord.com/api/webhooks/1050178225554341988/dq1uVZmjK22q0Dg7bm8_FXol3OMEZnL1oXkgoOL5MddMSYXeMBjPqkyfY3laQqa8z9xh" },
    ["DROPAR"] = { "https://discord.com/api/webhooks/1050179316199211108/QQPk6AeEnrW4Vs57Ml2MydEdoCXaoxWlqcaxbKuw7uJSv8tfHM5bIh1dqwa8EVxH0m8O" },
    ["ENVIAR"] = { "https://discord.com/api/webhooks/1050179119821893633/a77eifgB_9Dy41lP1KL1bD0-Caj552LembLEc2Dh6RiWxCTlA2u6Zf0jvAQhSP7I3SPv" },
    ["EQUIPAR"] = { "https://discord.com/api/webhooks/1050179214852235274/dNvAsz_qpGaSvMm_6H2bVIvSbj4VB3OSkzkXrYcUpXFm5cJSd1tQH1KL3qWanCGYVX0o" },
    ["GARMAS"] = { "https://discord.com/api/webhooks/1050178993728540742/NxbvaIy9KEaefs5h-_F5ejClsggJxeBL0AE_QTh9yA9hBz9RXwBdsxdxNSOqlDW_6uzb" },
    ["SAQUEAR"] = { "https://discord.com/api/webhooks/1050179174196858960/c5skeSenN_2ZghXo4OD390AGGadWscwJt6QEByWgrWk34ZovGmLHrIrIMsraVXyYSFvP" },
    ["BAUCARRO"] = { "https://discord.com/api/webhooks/1108435244958371931/f0a-qeOBB8tRPABGzTqUo_Sbsx6v73ZORXlfqYAhjCR4GSs6nSZns5Mkh4BN50OCOO5e" },
    ["BAUCASAS"] = { "https://discord.com/api/webhooks/1108435209021571153/t9VeMTVg3rNuIanbMzLkCtCSKv7mOHnBQVZTqE1tUgiz61nXsLBuK1yDAUoKZkxAxfgU" },
    ["CRASHS"] = { "https://discord.com/api/webhooks/983508758774841384/1WdYJ-E-6XbjQhulir5hZbRn-sS6h8B_kcQYaIvDishyVyE1PVI9V2qcgD1OarA9FLWD" },
    ["MORTE"] = { "XXX" },
    ["ROUBOGERAIS"] = { "https://discord.com/api/webhooks/983537964082663444/eEtvouHjUdRr2_VgVEKFiI-rHuHRAhPvKLF5M_vfrnS6eXVviLQnlqPPi4GNcC8DKmT6" },
    ["ROUBOAMMU"] = { "https://discord.com/api/webhooks/983537964082663444/eEtvouHjUdRr2_VgVEKFiI-rHuHRAhPvKLF5M_vfrnS6eXVviLQnlqPPi4GNcC8DKmT6" },
    ["ROUBOCAIXA"] = { "https://discord.com/api/webhooks/983538024182857758/geC94Nnktum2esueiuZrQXytxevkzKzTX1TzNjjHn6HtBQpNARMq56GdDsW4a2tHGWpV" },
    ["ROUBOREGISTRADORA"] = { "https://discord.com/api/webhooks/983538078637523005/zHPOTdpMXkOluNTp65riqLuvq_ydMbpdfqzfFAf-4OBOFDJqYc8q8YWovgDGP05IQyQ7" },
    ["BANCODEPOSITAR"] = { "https://discord.com/api/webhooks/983507800359571507/jtJ-KntekGNUS6xFtGsTjGqRFq2YO2ZDWsO2klMu1LqWj3RlAZ5IPupxTXCEtQ6h2MbV" },
    ["BANCOSACAR"] = { "https://discord.com/api/webhooks/983507861437022218/jszN9FwRduR9AKYObXGu43Rq0iXRSFvOA_mxW9wxASYTMfDKQKWPGF2pQ_D6SBYDKg2A" },
    ["BANCOENVIAR"] = { "https://discord.com/api/webhooks/983507929099542548/go4iuiBxJ-7e7hFG-H3Ftud4T1iFsLO5Pjv8MT-kPRUuj5pzg9FGTENsYgbOzz8vPE47" },
    ["COMPRARVEICULO"] = { "XXX" },
    ["WL"] = { "https://discord.com/api/webhooks/1050179511704105040/SsfZ5iGxNYdgSb-F_sL3SmYAHXcxRdJZ53AcNGthIX4gLVJNIokYzZIG7x1BJa7cTtAR" },
    ["IDS"] = { "XXX" },
    ["TPTO"] = { "https://discord.com/api/webhooks/1050179972393881710/zBKq-atpyz4W9EHMrEsVAkF8_JEehb7vE6hn-yru3bemy44MlCe0jktY-FM9tbu1dl3V" },
    ["TPTOME"] = { "https://discord.com/api/webhooks/1050180080992792636/L8DKqBZKmq7tATztSRtrUyz-uGYhgLutBRWXefuq5hiy5pHnCN9RhY6hSw76lHuqAjzf" },
    ["GOD"] = { "https://discord.com/api/webhooks/1050180177562443887/6bAzkcvjG6wiPRWZL8MWcseqPTxvskYwXNvXbX7EQ1Ax7XAjcNQRXIcZqbqeBCehpeb2" },
    ["GOID"] = { "https://discord.com/api/webhooks/1050180177562443887/6bAzkcvjG6wiPRWZL8MWcseqPTxvskYwXNvXbX7EQ1Ax7XAjcNQRXIcZqbqeBCehpeb2" },
    ["KICK"] = { "https://discord.com/api/webhooks/1050179695498498228/n00PWs28RR-GbmAzzPxwDXe37nzO_0iWiYz78ra-JMU851IQo13wZLaDydhaLk2SHdoq" },
    ["BAN"] = { "XXX" },
    ["PRENDERADM"] = { "https://discord.com/api/webhooks/1050179882564472903/12t2eyEkf-cw1HWgUBfdfOk74ciMzdsL0WUn6mIKOOydolQhcNjorJHXXgkWPa7spDvD" },
    ["AADM"] = { "https://discord.com/api/webhooks/1050179556591542312/Sh2-2xIJE2py9jQF04s59FOVWvx_1Ukx2WdM3J70Ckm2ZuvQT_h1TT3kKVtn3ZtFCOOp" },
    ["KILL"] = { "https://discord.com/api/webhooks/1050179734207737918/9nDJR3FTGIptHxfWQ8VTg0rRm3xBI378o70qtkCHHu9cQXoOnW8X3XlddWYTuNGZooEs" },
    ["ITEM"] = { "https://discord.com/api/webhooks/1050178828959482029/5tTcCwaWF6Wb4DtEs5xCCVvxqpBVSfRMMfJFr2fRPRHtAdIRhd0WssIlLne_gZ6snjgh" },
    ["TPWAY"] = { "https://discord.com/api/webhooks/1050180152979628143/Rhj97HfwjU_fa5N8v1VSC6-IyQm0sOzDi6yajGEfvzu9txx0AAkqOkF00Jp-7pIG_XTN" },
    ["ACEITARCHAMADOADMIN"] = { "https://discord.com/api/webhooks/983507606364622889/SJrjz90UWzTJ9qe8ylJHSQmhgD88Nkmu1FB9Nt2YnnNSJEPMshIllvrcqC2f3Q8IUFoz" },
    ["GROUPADD"] = { "https://canary.discord.com/api/webhooks/1080958884098887852/AZm0MQIxcOAlCGUi9pY_yMWcBuTfdZQ6FV-W4rFFtDfGIiEs-AmQDfVkORNNMa04Tyfw" },
    ["GROUPREM"] = { "https://discord.com/api/webhooks/1050179866210873434/njEAvId2XKwNOj4qTEhby1EHzkRQyRi6UT_1Txn4M3PXDNknBjcDIekavB2PgaiWuKps" },
    ["SPAWNCAR"] = { "https://discord.com/api/webhooks/1050179634957926512/NO1VqL97FmN_0OrMNBYTWumD0CI2EusogOxiCfGJmYeuC7RbAvQoUpcRO9gc_4DqMUY_" },
    ["MONEY"] = { "https://discord.com/api/webhooks/1050178928486129784/_uhr8_Q3jFT_XsHLY9TIQkpdXMcfunlGNWtrye4loIwK2BmNnsicm3ENABk0yE_Klrup" },
    ["BATERPONTOBENNYS"] = { "XXX" },
    ["BATERPONTOPOLICIA"] = { "XXX" },
    ["BATERPONTOHOSPITAL"] = { "XXX" },
    ["BATERPONTOADMIN"] = { "https://discord.com/api/webhooks/1113105241316003910/NT8liqmpRGH3f9QmP2JlCbiwVoFsbXJhFsyFx84OrSWOr5REC-2C7x_swUC-lrux_WO8" },
    ["PRENDER"] = { "https://discord.com/api/webhooks/1050178941073248388/GhgKqylII0U3ArtEnrDSZlpeTgxPdCEFPK1pLXVeMCopUbbTJGcwcyIlFUj6xFVGFcrv" },
    ["DESMANCHE"] = { "https://discord.com/api/webhooks/1108435325178609664/muaopZKduNkOHrIOtOPR-b_H-NA_QCEV7CoJVFOrB-aXanF4FBfE-nI7FTvTlg21KY_Z" },
    ["COPYPRESET"] = { "https://discord.com/api/webhooks/1108435167334367275/1dJlqAZ-01ezvUhz00F2hK3vz2K4uOjd-GTGaFjOg894VM1fUfnSpXW9Ft8gxBfrmRXF" },
    ["SETPRESET"] = { "https://discord.com/api/webhooks/1108435124682510456/QuHe6XP8Yo_TE_fu52GXTHu-glk7HVI9fqC4R2CAfGkrsdpcZZNLJYNvqae_YVncOTqm" },
    ["REVISTARADM"] = { "XXX" },
    ["VAULTADM"] = { "XXX" },
    ["HOUSEADMCHEST"] = { "XXX" },
    ["FUEL"] = { "XXX" },
    ["LOCKPICK"] = { "https://discord.com/api/webhooks/1108435280454762609/bCJsKQmXCTsMYdyONyJfcVjWh2puP3hqiZ7SN0nnUnqimFcU0NirPG7zh1WC3fnnkd5b" },
    ["ADDCARRO"] = { "https://discord.com/api/webhooks/960684660638240789/ecXyeFoqo5NCr9wcSdgNhRptsJAufFypr34hUalrlqR8WydLK3R7g5046I0_p39SVuO-" },
    ["RENOMEAR"] = { "https://discord.com/api/webhooks/983507678817034331/LavSODTfJ16sRI11g0WlHbfOtLuPVg0tcKGSjQ3znNzrss4SJCdvxoQBmsh5J8Q-YfY5" },
    ["CRAFT"] = { "XXX" },
    ["KITMALOKERO"] = { "XXX" },
    ["ITEMP"] = { "https://discord.com/api/webhooks/1113105968700588174/bgYUSASgZ_hwbVBgBLqMYXNZpZqxTN8StqvhvX03Ep2Ic-6E5GVX0F7_UHpLYHidrUz4" },
    ["GETITEM"] = { "XXX" },
    ["REMCARRO"] = { "https://discord.com/api/webhooks/960684712207200296/7dyBNT5GfUuXvR0J_tzswXivUtrvZF5xHqLLhvyuwui6uXtPPXq7aDDXTjYnX0zez2qX" },
    ["REC"] = { "https://discord.com/api/webhooks/1106033683481239582/nGl-OFuoBW3cSnvH0ycTBbR1JnJIRO_8_ySFkHuX-iaK_N5vAfhwAXDgVCFThnLlOgH_" },
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DISCORD WEEBHOOK
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function vRP.sendLog(weebhook, mensagge)
    if weebhook and mensagge then
        if pressetHooks[weebhook] ~= nil then
            SendWebhookMessage(pressetHooks[weebhook][1],mensagge)
        else
            SendWebhookMessage(weebhook,mensagge)
        end
    end
end

function SendWebhookMessage(webhook,message)
    if webhook ~= "none" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
    end
end

function vRP.log(file,info)
    file = io.open(file, "a")
    if file then
        file:write("» "..info.."\r")
    end
    file:close()
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- DESLOGAR DENTRO DA PROPRIEDADE
-----------------------------------------------------------------------------------------------------------------------------------------
function vRP.atualizarPosicao(user_id,x,y,z)
    local data = vRP.getUserDataTable(user_id)
    if user_id then
        if data then
            data.position = { x = x, y = y, z = z }
        end
    end
end

function vRP.limparArmas(user_id)
    local data = vRP.getUserDataTable(user_id)
    if user_id then
        if data then
            data.weapons = {}
        end
    end
end