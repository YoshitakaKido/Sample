/*
  シーザー暗号によって暗号化されたテキストファイルを復号するプログラム
  (1)～(3)の部分は各自で追加すること
*/

#include <stdio.h>
#include <stdlib.h>

/*
  引き渡された文字を復号化して返す関数
  c      : 暗号文の文字
  key    : 鍵
  戻り値 : 復号化された文字
*/
char decrypt(char c, int key)
{
	int d;
	
	d = (int)c;

	if (d >= 'a' && d <= 'z') {  /* 暗号文が小文字のとき */
		d = d - key/***** (1) 鍵を使って暗号化と逆方向に「ずらす」にはどうすれば？ *****/;
		if (d < 'a') {  /* 小文字の範囲から外れたとき */
			d = d + 'z' - 'a' + 1; /* 末尾に戻ってから移動する */
		}
	}
	else if (d >= 'A' && d <= 'Z') {  /* 暗号文が大文字のとき */
		d = d - key/***** (1) 小文字の場合と同じ *****/;
		if (d < 'A') {  /* 大文字の範囲から外れたとき */
			d = d + 'Z' - 'A' + 1;  /* 末尾に戻ってから移動する */
		}
	}
	
	return (char)d;  /* 復号化された文字を返す */
}


/*
  プログラムの開始点
*/
int main(int argc, char *argv[])
{
	int key;                  /* 暗号鍵 */
	FILE *infile;             /* 入力ファイル名 */
	FILE *outfile;            /* 出力ファイル名 */
	char c;                   /* 読み込んだ文字 */
	
	if (argc != 3) {  /* 実行時パラメータの個数が合致しないとき */
		fprintf(stderr, "usage: %s <encrypted-file> <decrypted-file>\n", argv[0]);
		exit(1);  /* 異常終了 */
	}
	
	/*** ファイルハンドラの取得 ***/
	
	infile = fopen(argv[1], "r");   /* 入力ファイルを開く */
	outfile = fopen(argv[2], "w");  /* 出力ファイルを開く */
	
	if (infile == NULL || outfile == NULL) {  /* ファイルを開けなかったとき */
		fprintf(stderr, "ファイルを開けません。\n");  /* エラーメッセージを表示 */
		exit(1);  /* 異常終了 */
	}
	
	/*** 鍵の設定 ***/
	
	key = 0;  /* 鍵の値を初期化 */
	
	do {
		printf("共通鍵(1以上25以下)を入力してください: ");  /* 入力を促す */
		scanf("%d", &key);           /* 標準入力から鍵の値を読み込む */
	} while(key <= 0 || key >= 26);  /* 鍵の値が規定の範囲外の間は繰り返し */
	
	/*** 復号化 ***/
	
	c = fgetc(infile);  /* 入力ファイルから1文字読み込む */
	
	while (!feof(infile)) {  /* ファイルの終端に到達していないとき */
		c = decrypt(c, key/***** (2) 引数は何になる？ *****/);  /* 読み込んだ文字を復号化 */
		putc(c, outfile);/***** (3) 暗号化と同じく、ファイル出力 *****/;  /* 復号化した文字を出力ファイルに書き出す */
		c = fgetc(infile);  /* 入力ファイルから1文字読み込む */
	}
	
	/*** ファイルハンドラの解放 ***/
	
	fclose(infile);   /* 入力ファイルを閉じる */
	fclose(outfile);  /* 出力ファイルを閉じる */
	
	return 0;
}
