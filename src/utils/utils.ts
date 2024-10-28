export function isChinese(value: string) {
  return /^[\u4e00-\u9fa5]*$/.test(value);
}

export function getPostWords(content: string) {
  return content.split(" ").filter(Boolean).length;
}

const WORDS_PER_MINUTE = 200;
export function readingTime(wordsCount: number) {
  return Math.ceil(wordsCount / WORDS_PER_MINUTE);
}

export function isPlural(value: number) {
  return value > 1;
}

export function readTimeStr(wordsCount: number) {
  const time = readingTime(wordsCount);
  const minOrMins = isPlural(time) ? "mins" : "min";
  return `${time} ${minOrMins}`;
}
