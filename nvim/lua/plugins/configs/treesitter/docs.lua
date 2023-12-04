return {
    enable = true,
    spec_config = {
        jsdoc = {
            slots = {
                class = { author = true }
            },
            processors = {
                author = function()
                    return " * @author Frederik Haugaard Bruun"
                end
            }
        }
    }
}
