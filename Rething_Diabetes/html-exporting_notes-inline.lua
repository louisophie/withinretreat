local sup_map = { ["0"]="⁰", ["1"]="¹", ["2"]="²", ["3"]="³", ["4"]="⁴",
                  ["5"]="⁵", ["6"]="⁶", ["7"]="⁷", ["8"]="⁸", ["9"]="⁹" }

local function supnum(n)
  return tostring(n):gsub("%d", function(d) return sup_map[d] end)
end

function Para(el)
  local has_note = false
  local content, note_marks = {}, {}
  for _, x in ipairs(el.content) do
    if x.t == "Note" then
      has_note = true
      table.insert(note_marks, x)
      table.insert(content, pandoc.Str(supnum(#note_marks)))
    else
      table.insert(content, x)
    end
  end
  if not has_note then return nil end

  local note_blocks = {}
  local i = 0
  for _, n in ipairs(note_marks) do
    i = i + 1
    local inner = {}
    local first = n.content[1]
    if first and first.t == "Para" then
      table.insert(inner, pandoc.Para({ pandoc.Str(supnum(i)), table.unpack(first.content) }))
      for b = 2, #n.content do
        table.insert(inner, n.content[b])
      end
    else
      table.insert(inner, pandoc.Para({ pandoc.Str(supnum(i)) }))
      for _, b in ipairs(n.content) do
        table.insert(inner, b)
      end
    end
    table.insert(note_blocks, pandoc.Div(inner, pandoc.Attr("", { "inline-note" })))
  end

  return { pandoc.Para(content), table.unpack(note_blocks) }
end

--function Para(el)
  --local has_note = false
  --local content, note_marks = {}, {}
  --for _, x in ipairs(el.content) do
    --if x.t == "Note" then
      --has_note = true
      --table.insert(note_marks, x)
      --table.insert(content, pandoc.Superscript({ pandoc.Str("[" .. #note_marks .. "]") }))
    --else
      --table.insert(content, x)
    --end
  --end
  --if not has_note then return nil end

  --local note_blocks = {}
  --local i = 0
  --for _, n in ipairs(note_marks) do
    --i = i + 1
    --local inner = {}
    --local first = n.content[1]
    --if first and first.t == "Para" then
      --table.insert(inner, pandoc.Para({ pandoc.Str("[" .. i .. "] "), table.unpack(first.content) }))
      --for b = 2, #n.content do
        --table.insert(inner, n.content[b])
      --end
    --else
      --table.insert(inner, pandoc.Para({ pandoc.Str("[" .. i .. "] ") }))
      --for _, b in ipairs(n.content) do
        --table.insert(inner, b)
      --end
    --end
    --table.insert(note_blocks, pandoc.Div(inner, pandoc.Attr("", { "inline-note" })))
  --end

  --return { pandoc.Para(content), table.unpack(note_blocks) }
--end