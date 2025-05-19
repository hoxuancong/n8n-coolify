from pytube import YouTube

url = "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
yt = YouTube(url)

print(f"Title: {yt.title}")
print(f"Length: {yt.length} seconds")
print(f"Author: {yt.author}")
