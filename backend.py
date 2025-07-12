@app.route('/debug/ffmpeg')
def ffmpeg_version():
    import subprocess
    try:
        output = subprocess.check_output(['ffmpeg', '-version'], stderr=subprocess.STDOUT)
        return "<pre>" + output.decode() + "</pre>"
    except Exception as e:
        return f"Error ejecutando ffmpeg: {e}"
