# JM 2024/25 - UAlg-ISE-DEE-LESTI
# Arquitetura de Computadores

import sys
from PIL import Image
from os import getcwd, listdir, path


def convert_pixel_to_argb(pixel):
    # Desloca cada canal (RGBA) para a direita 4 bits
    r, g, b, a = (channel >> 4 for channel in pixel)

    # Retorna ARGB em hexadecimal
    return f"{a:X}{r:X}{g:X}{b:X}"


def convert_image_to_text(image_path, output_path):
    # Abre a imagem (aceita formatos BMP, JPG, PNG, etc.)
    image = Image.open(image_path)
    pixels = image.load()
    width, height = image.size

    with open(output_path, "w") as file:
        # Escreve as dimensões da imagem no ficheiro de saída
        file.write(f"WORD {width}, {height}\n")

        # Itera sobre cada pixel da imagem
        for y in range(height):
            file.write("WORD ")
            for x in range(width):
                pixel = pixels[x, y]
                argb = convert_pixel_to_argb(pixel)

                # Escreve o valor ARGB no ficheiro de saída
                file.write(f"0{argb}H" if argb[0] in "ABCDEF" else f" {argb}H")

                # Adiciona uma vírgula entre os pixels, exceto no último de cada linha
                if x < width - 1:
                    file.write(",")

            # Nova linha, exceto na última linha
            if y < height - 1:
                file.write("\n")




if __name__ == "__main__":
    # Verifica o número correto de argumentos
    #if len(sys.argv) != 2:
    #    print("Uso: python img2argb.py <imagem>")
    #    sys.exit(1)

    path_pixelarts_cena1 = "Cena-1\pixel-art-imgs"
    path_pixelarts_cena2 = "Cena-2\pixel-art-imgs"

    # Listar todos os arquivos na pasta atual que terminam com .png
    arquivos_png_cena1 = [f for f in listdir(path_pixelarts_cena1) if f.endswith('.png')]
    arquivos_png_cena2 = [f for f in listdir(path_pixelarts_cena2) if f.endswith('.png')]

    # Exibir os nomes dos arquivos encontrados
    for arquivo in arquivos_png_cena1:
        input_image_path = path.join("Cena-1", "pixel-art-imgs", arquivo)

        # Converte a imagem em texto e salva num ficheiro
        convert_image_to_text(input_image_path, f"{input_image_path[:-4]}-PEPE.txt")
