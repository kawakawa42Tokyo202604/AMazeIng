# A-Maze-ing

## English

A Python program that generates a random maze and its shortest entrance-to-exit route from a configuration file. It saves the walls and route as text that other programs can read.

The supplied configuration creates a 20-by-15 maze. Change its dimensions or random seed to generate different mazes.

### Run

Requires Python 3.10 or newer and Make. No additional packages are needed.

```sh
make
make run
```

The supplied [config.example.txt](config.example.txt) writes the maze, entrance and exit coordinates, and shortest route to `maze.txt`.

Use `make run CONFIG=config.txt` for another configuration, or run `python3 a_maze_ing.py config.example.txt` directly.

### Configuration

| Key | Meaning |
| --- | --- |
| `WIDTH` / `HEIGHT` | Maze width and height |
| `ENTRY` / `EXIT` | Coordinates `x,y`, with `0,0` at the top left |
| `OUTPUT_FILE` | Output file path |
| `PERFECT` | `True` gives one route between any two open cells; `False` adds passages for alternative routes |
| `SEED` | Random initial value for reproducibility; defaults to 42 |

All keys except `SEED` are required. The entrance and exit must be open cells inside the maze.

### Output file

`maze.txt` starts with a grid of hexadecimal characters, one per cell, encoding its walls. After a blank line come the entrance coordinates, exit coordinates, and shortest route. Each `N`, `E`, `S`, or `W` means one step north, east, south, or west.

### Implementation

- Uses Kruskal's algorithm and Union-Find to generate passages, and breadth-first search to find the shortest route.
- Walls use bit values north=1, east=2, south=4, west=8, saved as one hexadecimal character.
- Includes a central “42” pattern when there is enough space.

### Tests

```sh
make test
```

Checks invalid configuration, minimal size, seed reproducibility, regeneration, consistent walls, connectivity, perfect mazes, and shortest routes.

## 日本語

幅・高さ・入口・出口を設定すると、ランダムな迷路と、入口から出口までの最短経路を作るPythonのプログラムです。迷路の壁と進み方をテキストファイルに保存し、別のプログラムから読み込める形にします。

付属の設定では20×15マスの迷路を作ります。幅・高さや乱数の初期値を変更して、異なる迷路を生成できます。

### 実行

Python 3.10以降・Make を使用します。追加パッケージは不要です。

```sh
make
make run
```

付属の [config.example.txt](config.example.txt) で20×15の迷路を生成し、`maze.txt` に迷路・入口と出口の座標・最短経路を保存します。

別の設定ファイルを使う場合は `make run CONFIG=config.txt`、直接起動する場合は `python3 a_maze_ing.py config.example.txt` と指定します。

### 設定

| 項目 | 意味 |
| --- | --- |
| `WIDTH` / `HEIGHT` | 迷路の幅と高さ |
| `ENTRY` / `EXIT` | 入口と出口の座標 `x,y`（左上が `0,0`） |
| `OUTPUT_FILE` | 出力先ファイル |
| `PERFECT` | `True` で2地点間の経路が1通りになる迷路、`False` で複数の経路ができるよう通路を追加 |
| `SEED` | 同じ迷路を再現するための乱数の初期値（省略時は42） |

`SEED` 以外は必須です。入口・出口は迷路内の通行可能なセルに指定します。

### 出力ファイル

`maze.txt` の先頭は、各マスの壁を16進数1文字で表した格子です。空行の後に入口の座標、出口の座標、最短経路を続けます。経路の `N`・`E`・`S`・`W` は、それぞれ北・東・南・西へ1マス進むことを表します。

### 実装メモ

- Kruskal法と Union-Find で迷路を生成し、幅優先探索で最短経路を求めます。
- セルの壁を北=1・東=2・南=4・西=8のビットで表し、16進数1文字で保存します。
- 十分な大きさがある場合は、中央に「42」の形を配置します。

### テスト

```sh
make test
```

設定エラー、最小サイズ、シード再現性、再生成、壁の整合性、連結性、完全迷路、最短経路を確認します。
