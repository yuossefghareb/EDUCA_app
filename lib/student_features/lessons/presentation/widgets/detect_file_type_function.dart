String fileTypeDetect({required String contentType}) {
  if (contentType.startsWith('image/')) {
    return 'image';
  } else if (contentType.startsWith('application/')) {
    return 'PDF';
  }else if(contentType.startsWith('text/')){
    return 'text';
  }
  return 'unknown';
}
