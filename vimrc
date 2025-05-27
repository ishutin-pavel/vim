"-------------------------
" Автосохранение отключить
"-------------------------

  set nobackup
  set nowb
  set noswapfile

"-----
" Табы
"-----

  set shiftwidth=2 "Длина таба в пробелах Normal mode
  set tabstop=2    "Длина таба в пробелах
  set expandtab    "Преобразует указанное чило пробелов в tabstop в символ табуляции
  set autoindent   "Включить автоотступ

"----------
" Кодировка
"----------

  set fileencoding=utf-8
  set encoding=utf-8
  set termencoding=utf-8

"------
" Цвета
"------

  "Подсветка синтаксиса
  syntax on

  "Цветовая схема
  colorscheme monokai

"------
" Поиск
"------

  "Подсветка результатов поиска
  set hlsearch

  "Ignore case when searching
  set ignorecase

  "When searching try to be smart about cases
  set smartcase

  "Искать во всех вложенных каталогах проекта :find
  set path+=.,**,,

  "Поиск выделенного фрагмента
  xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
  xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

  function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
  endfunction

"-----------------
" Другие параметры
"-----------------

  "Разрешить переключаться по файлам без сохранения
  set hidden

  "Курсор в виде блока
  let &t_ti.="\e[1 q"
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_te.="\e[0 q"

"------------
" Status Line
"------------

  "всегда показывать строку состояния
  set laststatus=2

  set statusline=
  set statusline+=\ %F                                        "полный путь к файлу
  set statusline+=%=%5l                                       "номер текущей строки
  set statusline+=%m\                                         "модификатор
  set statusline+=%=                                          "разделитель между левой и правой частью
  set statusline+=\ %y                                        "тип файла
  set statusline+=\ %{&fileencoding?&fileencoding:&encoding}  "кодировка
  set statusline+=\ [%{&fileformat}\]                         "формат end-of-line
  set statusline+=%=%5l                                       "номер текущей строки
  set statusline+=/%L\                                        "всего строк

"------------------
" Файловый менеджер
"------------------

  let g:netrw_banner = 0       "Скрыть баннер

  "Переход по окнам ctrl + hjkl
  map <C-k> <C-w><Up>
  map <C-j> <C-w><Down>
  map <C-l> <C-w><Right>
  map <C-h> <C-w><Left>

"----------------
" РАСКЛАДКА
"----------------

  set keymap=russian-jcukenwin
  set iminsert=0 "по умолчанию английский в режиме вставки
  set imsearch=0 "по умолчанию английский в поиске
