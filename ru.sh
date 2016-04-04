# Fetch HTML page with calendar and menu.
curl --compressed http://ru.ufsc.br/ru/ 2>/dev/null |

  # Take table row corresponding to day of week (Mon=2,Tue=3,Sun=8).
  awk "/<tr>/{i++}i==$(date +%u)+1" | 
  
  # Remove HTML tags.
  sed 's/<\/*[^>]*>//g' |
  
  # Ignore leading spaces (\xC2\xA0 is non-breaking space).
  grep -Po '[^\s\xc2\xa0].+'
