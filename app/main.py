import os
import shutil

from playwright.sync_api import sync_playwright

url = "https://playwright.dev"
args = ["--disable-dev-shm-usage", "--ipc=host", "--single-process"]


def clean_temp_dir():
    folder = "/tmp"
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print("Failed to delete %s. Reason: %s" % (file_path, e))


def main(event, context):
    print("Start")
    with sync_playwright() as p:
        print(f"Launch browser with args: {args}")
        browser = p.chromium.launch(headless=True, args=args)
        contexto = browser.new_context()
        print("Open new page")
        page = contexto.new_page()

        print(f"Go to url: {url}")
        page.goto(url)
        print(f"Page title: {page.title()}")

        page.close()
        contexto.close()
        browser.close()

    clean_temp_dir()

    print("End")


if __name__ == "__main__":
    main({}, {})
