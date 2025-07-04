--- STEAMODDED HEADER
--- MOD_NAME: Spinel Joker Mod
--- MOD_ID: j_spinel
--- MOD_AUTHOR: [FirstTry]
--- MOD_DESCRIPTION: I love Spinel.
--- PREFIX: spinel

SMODS.Atlas {
    key = "spinel",
    path = "j_spinel.png",
    px = 71,
    py = 95,
}

SMODS.Joker {
    key = "spinel",
    atlas = "spinel",
    rarity = 3,
    cost = 6,
    unlocked = true,
    blueprint_compat = true,
    eternal_compat = true,
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult = 6,
            xmult_mod = 6
        }
    },
    loc_txt = {
        name = "Spinel",
        text = {
            "{X:red,C:white}X#1#{} Mult",
            "{C:inactive}(Gains {C:inactive}{X:red,C:white}X6{} {C:inactive}permanently if 4 Aces scored){}"
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { card.ability.extra.xmult }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.before then
            local ace_count = 0
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:get_id() == 14 then
                    ace_count = ace_count + 1
                end
            end
            if ace_count >= 4 then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.MULT
                }
            end
        end
    end
}
