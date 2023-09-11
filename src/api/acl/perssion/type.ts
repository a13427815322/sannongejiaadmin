export interface Response {
  code: number
  message: string
}

export interface menuinforesponetype extends Response {
  data: menuinforespone
}
export interface menuinforespone {
  code: string
  id: number
  level: number
  name: 'string'
  select?: boolean
  pid: number
  children: menuinforespone[]
}
export interface temaddmenu {
  id: number
  pid: number
  name: string
  code: string
  level: number
}
