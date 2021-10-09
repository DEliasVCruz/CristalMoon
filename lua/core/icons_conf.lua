local present, icons = pcall(require, "nvim-web-devicons")
if not present then
  return
end

icons.setup {
  override = {
    c = {
      icon = "",
      color = "#32b4ff",
      name = "c",
    },
    css = {
      icon = "",
      color = "#32b4ff",
      name = "css",
    },
    deb = {
      icon = "",
      color = "#50EAFA",
      name = "deb",
    },
    Dockerfile = {
      icon = "",
      color = "#50EAFA",
      name = "Dockerfile",
    },
    html = {
      icon = "",
      color = "#F4C2C2",
      name = "html",
    },
    jpeg = {
      icon = "",
      color = "#301934",
      name = "jpeg",
    },
    jpg = {
      icon = "",
      color = "#301934",
      name = "jpg",
    },
    js = {
      icon = "",
      color = "#F9F900",
      name = "js",
    },
    kt = {
      icon = "󱈙",
      color = "#f79617",
      name = "kt",
    },
    lock = {
      icon = "",
      color = "#ff3c41",
      name = "lock",
    },
    lua = {
      icon = "",
      color = "#32b4ff",
      name = "lua",
    },
    mp3 = {
      icon = "",
      color = "#FCFDFF",
      name = "mp3",
    },
    mp4 = {
      icon = "",
      color = "#FCFDFF",
      name = "mp4",
    },
    out = {
      icon = "",
      color = "#FCFDFF",
      name = "out",
    },
    png = {
      icon = "",
      color = "#301934",
      name = "png",
    },
    py = {
      icon = "",
      color = "#50EAFA",
      name = "py",
    },
    ["robots.txt"] = {
      icon = "ﮧ",
      color = "#ff3c41",
      name = "robots",
    },
    toml = {
      icon = "",
      color = "#32b4ff",
      name = "toml",
    },
    ts = {
      icon = "ﯤ",
      color = "#23D4AC",
      name = "ts",
    },
    ttf = {
      icon = "",
      color = "#FCFDFF",
      name = "TrueTypeFont",
    },
    rb = {
      icon = "",
      color = "#ff3c41",
      name = "rb",
    },
    rpm = {
      icon = "",
      color = "#f79617",
      name = "rpm",
    },
    vue = {
      icon = "﵂",
      color = "#46a42b",
      name = "vue",
    },
    woff = {
      icon = "",
      color = "#FCFDFF",
      name = "WebOpenFontFormat",
    },
    woff2 = {
      icon = "",
      color = "#FCFDFF",
      name = "WebOpenFontFormat2",
    },
    xz = {
      icon = "",
      color = "#F9F900",
      name = "xz",
    },
    zip = {
      icon = "",
      color = "#F9F900",
      name = "zip",
    },
  },
}
