# Phrase Translation Guide

## How It Works Now

The translation service has been updated to support **multi-word phrases** in addition to individual words.

### Translation Priority

1. **Multi-word phrases** (matched first, longest to shortest)
2. **Individual words** (for remaining text)

### Example Phrases in Dictionary

Current multi-word phrases that will work:

- `'mahal kita'` → `"kandu tage"`
- `'ano ang pangalan mo'` → `"det e dagit am"`
- `'ano ginagawa mo'` → `"det nimo am"`
- `'saan ka galing?'` → `"ne' gufru am?"`
- `'saan ka nakatira'` → `"ne gu fanak am"`
- `'salita ng diyos'` → `"tnalu dwata"`

### How to Add New Phrases

1. Open `lib/translator/data/tagalog_to_blaan.dart`
2. Add your phrase with spaces:
   ```dart
   'mahal kita': "kandu tage",
   'kumusta ka': "few am",
   'magandang umaga': "fye bawem dafun",
   ```

### Important Rules

#### ✅ DO:
- Use lowercase for dictionary keys
- Include spaces between words
- Use exact phrase matching
- Longer phrases are matched first (prevents partial matches)

#### ❌ DON'T:
- Don't use punctuation in the key (unless it's part of the phrase)
- Don't mix case (use lowercase)
- Don't add duplicate entries

### Examples

#### Example 1: Simple Phrase
**Input:** "Mahal kita"
**Process:**
1. Check phrases: "mahal kita" found → "kandu tage"
2. Result: "kandu tage"

#### Example 2: Phrase in Sentence
**Input:** "Mahal kita, kumusta ka?"
**Process:**
1. Check phrases: "mahal kita" found → "kandu tage"
2. Remaining: ", kumusta ka?"
3. Translate words: "kumusta" → (word lookup), "ka" → (word lookup)
4. Result: "kandu tage, [kumusta] [ka]?"

#### Example 3: Multiple Phrases
**Input:** "Ano ang pangalan mo? Saan ka nakatira?"
**Process:**
1. Check phrases: 
   - "ano ang pangalan mo" found → "det e dagit am"
   - "saan ka nakatira" found → "ne gu fanak am"
2. Result: "det e dagit am? ne gu fanak am?"

### Testing Your Phrases

1. **Restart the app** after adding new phrases
2. Type the exact phrase in the input field
3. The translation should appear as a complete phrase

### Current Phrase Count

Your dictionary currently has these multi-word phrases:
- "ano ang pangalan mo"
- "ano ginagawa mo"
- "mahal kita"
- "saan ka galing?"
- "saan ka nakatira"
- "salita ng diyos"
- And more...

### Troubleshooting

#### Phrase not translating?
**Check:**
1. Exact spelling (case-insensitive but must match)
2. Spaces between words
3. No extra punctuation in the key
4. App has been restarted after adding phrase

#### Getting word-by-word translation instead?
**Cause:** The phrase key doesn't exactly match the input
**Solution:** Check the dictionary key matches your input exactly (ignoring case)

#### Partial phrase matching?
**Example:** "mahal" matches instead of "mahal kita"
**Solution:** The system now matches longest phrases first, so this shouldn't happen

### Performance Note

The phrase matching uses RegEx with word boundaries (`\b`), so it will:
- ✅ Match "Mahal kita" in "Mahal kita, kumusta?"
- ✅ Match "mahal kita" (case-insensitive)
- ❌ Not match "mahalkita" (no space)
- ❌ Not match "mahalita" (different word)

### Adding More Phrases

Common phrases you might want to add:

```dart
// Greetings
'magandang umaga': "fye bawem dafun",
'magandang hapon': "fye bawem dafun",
'magandang gabi': "fye bawem labi",

// Questions
'kumusta ka': "few am",
'nasaan ka': "ne am",
'ano yan': "det nen",

// Common expressions
'salamat sa iyo': "salamat am",
'walang anuman': "wala anuman",
'paalam na': "paalam na",
```

## Summary

Your translation service now supports **complete phrase translation**! Just add phrases to the dictionary with spaces, and they'll be translated as complete units instead of word-by-word.

**"Mahal kita"** will now correctly translate to **"kandu tage"** as a complete phrase! ❤️
