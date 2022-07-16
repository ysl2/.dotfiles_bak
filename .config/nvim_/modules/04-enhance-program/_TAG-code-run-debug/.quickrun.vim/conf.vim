" ===
" === quickrun.vim
" ===
" You can add .quickrun file into your project folder and write your shell there. The plugin will find that file and run commands there.
let g:quickrun_known_file_types = {
      \"c": ["!gcc %", "./a.out"],
      \"cpp": ["!g++ %", "./a.out"],
      \"java": ["!javac % && time java %<"],
      \"sh": ["!time bash %"],
      \"php": ["!php %"],
      \"vim": ["source %"],
      \"py": ["!python %"],
      \"go": ["!go test"],
      \"m": ["MatlabRun"],
      \"md": ["InstantMarkdownPreview"],
      \"markdown": ["InstantMarkdownPreview"],
      \"tex": ["VimtexStop", "VimtexCompile"]
      \}

