const express = require('express')
const multer = require('multer')
const path = require('path')
const cors = require('cors')
const app = express()
const mysql = require('mysql2')
const { ok } = require('assert')
const port = 3000
const jwt = require('jsonwebtoken')
const secretKey = 'sangnongejia'
// Middleware
app.use('/uploads', express.static('uploads'))
app.use(express.json({ encoding: 'utf-8' }))
app.use(cors())
// 使用CORS中间件，允许来自所有域的请求。这样，前端应用运行在不同端口（http://localhost:5173），也能向服务器（http://localhost:3000）发送跨域请求，而不会触发CORS错误。
// Multer configuration
const connection = mysql.createPool({
  host: 'localhost', // 数据库主机
  user: 'root', // 数据库用户名
  password: 'rroott', // 数据库密码
  database: 'sannongejia', // 数据库名
  connectionLimit: 10, // 设置连接池的连接数上限
})
// connection.connect((err) => {
//   if (err) {
//     console.error('Failed to connect to the database:', err);
//   } else {
//     console.log('Connected to the database');
//     // 在这里进行数据库操作，例如执行SQL查询、插入数据等
//   }
// });

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    cb(null, 'uploads/product')
  },
  filename: (req, file, cb) => {
    const timestamp = Date.now()
    cb(null, `${timestamp}-${file.originalname}`)
  },
})

//规范上传的图片所存位置，和名字
const upload = multer({ storage })

// User login endpoint
app.post('/user/login', (req, res) => {
  const { username, password } = req.body
  const sql = 'select * from adminusers where username = ? && password = ?'
  connection.query(sql, [username, password], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      if (result.length == 0) {
        res.json({ code: 401, message: '账号或密码不正确' })
      } else {
        result = result[0]
        // console.log(result)
        res.json({ code: 200, data: { token: result.token } })
      }
    }
  })
})

// Get user information endpoint
app.get('/user/info', async (req, res) => {
  const token = req.headers.token
  const sql = 'select * from adminusers where token= ?'
  try {
    const result = await new Promise((resolve, reject) => {
      connection.query(sql, [token], (err, result) => {
        if (err) {
          reject(err)
        } else {
          resolve(result)
        }
      })
    })
    await getrole(result)
    if (result.length == 0) {
      res.status(401).json({ code: 401, message: '获取用户信息失败' })
    } else {
      res.status(200).json({ code: 200, data: result })
    }
  } catch (error) {
    console.error(error)
    res.status(500).json({ code: 500, message: '服务器错误' })
  }
})

// Image upload endpoint
app.post('/upload', upload.single('image'), (req, res) => {
  if (!req.file) {
    return res.status(400).json({ code: 400, message: 'No file provided' })
  }

  let imageUrl = req.file.path
  imageUrl = imageUrl.replace(/\\/g, '/')
  return res.status(200).json({
    code: 200,
    data: { imageUrl: `http://localhost:${port}/${imageUrl}` },
    message: '图片上传成功',
  })
})

app.get('/product/getpropertyinfo', (req, res) => {
  const sql = 'select * from property'
  connection.query(sql, (err, result) => {
    if (err) {
      //console.log('Failed to fetch data:', err)
      Promise.reject('服务器出现错误')
    } else {
      //console.log( result);
      res.json({ code: '200', message: '请求商品分类成功', data: result })
    }
  })
})
app.post('/product/getplatformattribute', (req, res) => {
  const { id } = req.body
  sql = 'select * from platformattribute where propertyid=' + id
  connection.query(sql, (err, result) => {
    if (err) {
      //console.log('Failed to fetch data:', err)
      Promise.reject('服务器出现错误')
    } else {
      //console.log(result)
      res.json({ code: '200', message: '请求分类属性成功', data: result })
    }
  })
})
app.post('/product/setplatformattribute', (req, res) => {
  // console.log(req.body)
  const propertyid = req.body.propertyid
  const name = req.body.name
  const value = JSON.stringify(req.body.value)
  //console.log(value)
  if (req.body.id) {
    const id = req.body.id
    // console.log(id)
    const sql =
      'update platformattribute set propertyid=?,name=?,value=? where id=? '
    connection.query(sql, [propertyid, name, value, id], (err, result) => {
      if (err) {
        //console.log('Failed to fetch data:', err)
        Promise.reject('服务器出现错误')
      } else {
        //console.log(result)
        res.send('ok')
      }
    })
  } else {
    const sql =
      'insert into platformattribute (propertyid,name,value) value(?,?,?)'
    connection.query(sql, [propertyid, name, value], (err, result) => {
      if (err) {
        //console.log('Failed to fetch data:', err)
        Promise.reject('服务器出现错误')
      } else {
        //console.log(result)
        res.send('ok')
      }
    })
  }
})
app.post('/product/delplatformattribute', (req, res) => {
  const id = req.body.id
  const sql = 'delete from platformattribute where id=?'
  connection.query(sql, [id], (err, result) => {
    if (err) {
      //console.log('Failed to fetch data:', err)
      Promise.reject('服务器出现错误')
    } else {
      //console.log(result)
      res.send('ok')
    }
  })
})
app.post('/product/getspudetail', (req, res) => {
  // console.log(req.body)
  const propertyid = req.body.propertyid
  const pageNo = req.body.pageNo - 1
  const pageSize = req.body.pageSize
  const sql =
    'select *,(SELECT COUNT(*) FROM spudetail WHERE propertyid = ?) AS total_count from spudetail where propertyid=? limit ? offset ?'
  connection.query(
    sql,
    [propertyid, propertyid, pageSize, pageNo * pageSize],
    (err, result) => {
      if (err) {
        //console.log('Failed to fetch data:', err)
        Promise.reject('服务器出现错误')
      } else {
        if (result.length == 0) {
          res.json(result)
        } else {
          //console.log(result)
          res.json({ code: 200, data: result, message: '请求spu详情成功' })
        }
      }
    },
  )
})
app.get('/product/getsaleattr', (req, res) => {
  const sql = 'select * from salesattribute'
  connection.query(sql, (err, result) => {
    if (err) {
      //console.log('Failed to fetch data:', err)
      Promise.reject('服务器出现错误')
    } else {
      res.json(result)
    }
  })
})
app.post('/product/getexistingattribute', (req, res) => {
  const spuid = req.body.spuid
  const sql = 'select * from existingattribute  where spuid=?'
  connection.query(sql, [spuid], (err, result) => {
    if (err) {
      //console.log('Failed to fetch data:', err)
      Promise.reject('服务器出现错误')
    } else {
      //console.log(result)
      if (result.length != 0) {
        res.json({ code: '200', data: result, message: '获取已有属性成功' })
      }
    }
  })
})
app.post('/product/setspudetail', (req, res) => {
  // console.log(req.body)
  const spuid = req.body.id
  const { spuname, description, propertyid, spuSaleAttrList, spuImageList } =
    req.body
  if (spuid) {
    const sql3 = 'select * from existingattribute where spuid=?'
    connection.query(sql3, [spuid], (err3, result3) => {
      if (err3) {
        console.log(err3)
      }
      //  console.log("result3:",result3,"spuSaleAttrList:",spuSaleAttrList)
      result3 = result3.filter((attr) => {
        return !spuSaleAttrList.find((item) => {
          return attr.id == item.id
        })
      })
      // console.log( "后来的result3",result3)
      const sql4 = 'delete from existingattribute where id=?'
      for (const result4 of result3) {
        connection.query(sql4, [result4.id], (err4, result5) => {
          if (err4) {
            console.log(err4)
          }
          // console.log(result5)
        })
      }
    })
    const sql = 'update spudetail set spuname = ? ,description = ? where id = ?'
    connection.query(sql, [spuname, description, spuid], (err, result) => {
      if (err) {
        console.log(err)
      }
    })
    // 更新spu详情数据
    const sql5 = 'select * from spuimage where spuid=?'
    connection.query(sql5, [spuid], (err5, result6) => {
      if (err5) {
        console.log(err5)
      }
      // console.log('result6', result6)
      // console.log('spuImageList', spuImageList)
      result6 = result6.filter((item) => {
        return !spuImageList.find((attr) => {
          return attr.id == item.id
        })
      })
      const sql6 = 'delete from spuimage where id=?'
      for (const result7 of result6) {
        connection.query(sql6, [result7.id], (err6, result7) => {
          if (err6) {
            console.log(err6)
          }
          // console.log(result7)
        })
      }
    })

    for (const spuImage of spuImageList) {
      if (!spuImage.id) {
        const sql1 =
          'insert into spuimage (spuid, imagename, imgurl) values (?, ?, ?)'
        connection.query(
          sql1,
          [spuImage.spuid, spuImage.imagename, spuImage.imgurl],
          (err1, result1) => {
            if (err1) {
              console.log(err1)
            }
            // console.log(result1)
          },
        )
      } else {
        continue
      }
    }
    //处理imglist
    for (const spuSaleAttr of spuSaleAttrList) {
      // console.log(spuSaleAttr.saleattrvaluelist)
      if (spuSaleAttr.id) {
        // console.log(spuSaleAttr.id)
        const sql2 =
          'update existingattribute set spuid = ? ,basesaleattrid = ? ,saleattrname = ? ,saleattrvaluelist = ? where id = ? '
        connection.query(
          sql2,
          [
            spuSaleAttr.spuid,
            spuSaleAttr.basesaleattrid,
            spuSaleAttr.saleattrname,
            JSON.stringify(spuSaleAttr.saleattrvaluelist),
            spuSaleAttr.id,
          ],
          (err2, result2) => {
            if (err2) {
              console.log(err2)
            }
          },
        )
      } else {
        const sql2 =
          'insert into existingattribute (spuid,basesaleattrid,saleattrname,saleattrvaluelist) values (?, ?, ?,?)'
        connection.query(
          sql2,
          [
            spuSaleAttr.spuid,
            spuSaleAttr.basesaleattrid,
            spuSaleAttr.saleattrname,
            JSON.stringify(spuSaleAttr.saleattrvaluelist),
          ],
          (err2, result2) => {
            if (err2) {
              console.log(err2)
            } else {
              console.log(result2)
            }
          },
        )
      }
    }
    //处理已有销售属性
    res.json({ code: 200, message: '修改成功' })
  } else {
    //增加新spu
    // console.log(spuname,description,propertyid)
    const sql =
      'insert into spudetail (spuname,description,propertyid) values (?, ?, ?)'
    connection.query(sql, [spuname, description, propertyid], (err, result) => {
      if (err) {
        console.log(err)
      } else {
        // console.log(result)
        const spuid = result.insertId
        // console.log(spuid)
        const sql1 =
          'insert into spuimage (spuid, imagename, imgurl) values (?, ?, ?)'
        for (const spuImage of spuImageList) {
          connection.query(
            sql1,
            [spuid, spuImage.imagename, spuImage.imgurl],
            (err1, result1) => {
              if (err1) {
                console.log(err1)
              }
              console.log(result1)
            },
          )
        }
        const sql2 =
          'insert into existingattribute (spuid,basesaleattrid,saleattrname,saleattrvaluelist) values (?, ?, ?,?)'
        for (const spuSaleAttr of spuSaleAttrList) {
          connection.query(
            sql2,
            [
              spuid,
              spuSaleAttr.basesaleattrid,
              spuSaleAttr.saleattrname,
              JSON.stringify(spuSaleAttr.saleattrvaluelist),
            ],
            (err2, result2) => {
              if (err2) {
                console.log(err2)
              } else {
                console.log(result2)
              }
            },
          )
        }
      }
    })
    res.json({ code: 200, message: '添加成功' })
  }
})
app.post('/product/getspuimage', (req, res) => {
  const spuid = req.body.spuid
  const sql = 'select * from spuimage where spuid=?'
  connection.query(sql, [spuid], (err, result) => {
    // console.log(result)
    res.json(result)
  })
})
app.post('/product/setskudetail', (req, res) => {
  let {
    spuid,
    skuname,
    price,
    weight,
    skudescription,
    skucount,
    skusaleattrvalueList,
    skuplatformattributeList,
    skuimage,
  } = req.body
  price = Number(price)
  skucount = Number(skucount)
  skusaleattrvalueList = JSON.stringify(skusaleattrvalueList)
  skuplatformattributeList = JSON.stringify(skuplatformattributeList)
  const sql =
    'insert into skudetail (spuid,skuname,price,weight,skudescription,skucount,skusaleattrvalueList,skuplatformattributeList,skuimage) values (?,?,?,?,?,?,?,?,?)'
  if (skuname && price && skucount && skuimage && weight) {
    connection.query(
      sql,
      [
        spuid,
        skuname,
        price,
        weight,
        skudescription,
        skucount,
        skusaleattrvalueList,
        skuplatformattributeList,
        skuimage,
      ],
      (err, result) => {
        if (err) {
          console.log(err)
        } else {
          console.log(result)
          res.json({ code: 200, message: '添加sku成功' })
        }
      },
    )
  } else {
    res.json({ code: 500 })
  }
})
app.post('/product/getskudetail', (req, res) => {
  const spuid = req.body.spuid
  const sql = 'select * from skudetail where spuid = ?'
  connection.query(sql, [spuid], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      console.log(result)
      res.json({ code: 200, data: result, message: '查询sku成功' })
    }
  })
})
app.post('/product/delspu', (req, res) => {
  const spuid = req.body.spuid
  const sql = 'delete from existingattribute where spuid=?'
  const sql1 = 'delete from skudetail where spuid=?'
  const sql3 = 'delete from spuimage where spuid=?'
  const sql2 = 'delete from spudetail where id=?'
  connection.getConnection((err, poolConnection) => {
    if (err) throw err
    poolConnection.beginTransaction((err) => {
      if (err) {
        poolConnection.release()
        throw err
      }
      poolConnection.query(sql, [spuid], (err, result) => {
        if (err) {
          poolConnection.rollback(() => {
            poolConnection.release()
            throw err
          })
        }
        poolConnection.query(sql1, [spuid], (err, result) => {
          if (err) {
            poolConnection.rollback(() => {
              poolConnection.release()
              throw err
            })
          }
          poolConnection.query(sql2, [spuid], (err, result) => {
            if (err) {
              poolConnection.rollback(() => {
                poolConnection.release()
                throw err
              })
            }
            poolConnection.query(sql3, [spuid], (err, result) => {
              if (err) {
                poolConnection.rollback(() => {
                  poolConnection.release()
                  throw err
                })
              }
              poolConnection.commit((err) => {
                if (err) {
                  poolConnection.rollback(() => {
                    poolConnection.release()
                    throw err
                  })
                }
                res.json({ code: 200, message: '删除成功' })
                poolConnection.release() // Release the connection back to the pool
              })
            })
          })
        })
      })
    })
  })
})

app.post('/product/getallskudetail', (req, res) => {
  console.log(req.body)
  const pageNo = req.body.pageNo - 1
  const pageSize = req.body.pageSize
  const sql = 'SELECT COUNT(*) AS totalcount FROM skudetail'
  const sql1 = 'select * from skudetail limit ? offset ?'
  connection.query(sql, (err, result) => {
    console.log(result)
    connection.query(sql1, [pageSize, pageNo * pageSize], (err1, result1) => {
      console.log(result1)
      res.json({
        code: 200,
        data: result1,
        total: result[0].totalcount,
        message: '获取sku数据成功',
      })
    })
  })
})

app.post('/product/skuputaway', (req, res) => {
  const skuid = req.body.skuid
  const putaway = req.body.putaway
  const sql = 'update skudetail set putaway = ? where id = ?'
  connection.query(sql, [putaway, skuid], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      if (putaway == 1) {
        res.json({ code: 200, message: '上架成功' })
      } else {
        res.json({ code: 200, message: '下架成功' })
      }
    }
  })
})

app.post('/product/deletesku', (req, res) => {
  const id = req.body.id
  const sql = 'delete from skudetail where id = ?'
  connection.query(sql, [id], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      res.json({ code: 200, message: '删除成功' })
    }
  })
})
const getresult3 = (item) => {
  return new Promise((resolve, reject) => {
    const result3 = []
    const result4 = []
    const rolePromises = item.roles.map((role) => {
      const sql = 'select rolename,permission from role where id=?'
      return new Promise((resolveRole, rejectRole) => {
        connection.query(sql, [role], (err2, resul2) => {
          if (err2) {
            rejectRole(err2)
          } else {
            if (resul2.length != 0) {
              result3.push(resul2[0].rolename)
              result4.push(resul2[0].permission)
              resolveRole()
            } else {
              resolveRole()
            }
          }
        })
      })
    })

    Promise.all(rolePromises)
      .then(() => {
        resolve({ result3, result4 })
      })
      .catch(reject)
  })
}

const getresult4 = (item) => {
  return new Promise((resolve, reject) => {
    const result4 = []
    const result5 = []
    const routerPromises = []
    item = item.filter((idattr) => idattr !== null)
    for (idattr of item) {
      for (id of idattr) {
        const sql = 'select code,level from menu where id=?'
        const routerPromise = new Promise((resolverouter, rejectrouter) => {
          connection.query(sql, [id], (err2, resul2) => {
            if (err2) {
              rejectrouter(err2)
            } else {
              if (resul2.length != 0) {
                result4.push(resul2[0].code)
                if (resul2[0].level == 4) {
                  result5.push(resul2[0].code)
                }
                resolverouter()
              } else {
                resolverouter()
              }
            }
          })
        })
        routerPromises.push(routerPromise)
      }
    }

    Promise.all(routerPromises)
      .then(() => {
        resolve({ result4, result5 })
      })
      .catch(reject)
  })
}

const getrole = async (result) => {
  for (item of result) {
    if (item.roles) {
      const result3 = await getresult3(item)
      item.role = result3.result3
      const result4 = await getresult4(result3.result4)
      item.routers = [...new Set(result4.result4)]
      item.buttons = [...new Set(result4.result5)]
    }
  }
}

app.post('/acl/getadminuserinfo', async (req, res) => {
  let { pageNo, pageSize } = req.body
  pageNo = pageNo - 1
  const sql = 'select * from adminusers order by userid desc limit ? offset ? '
  const sql1 = 'SELECT COUNT(*) AS totalcount FROM adminusers'

  try {
    const result1 = await new Promise((resolve, reject) => {
      connection.query(sql1, (err1, result1) => {
        if (err1) {
          reject(err1)
        } else {
          resolve(result1)
        }
      })
    })

    const result = await new Promise((resolve, reject) => {
      connection.query(sql, [pageSize, pageNo * pageSize], (err, result) => {
        if (err) {
          reject(err)
        } else {
          resolve(result)
        }
      })
    })

    await getrole(result)

    res.json({
      code: 200,
      data: result,
      message: '获取用户成功',
      total: result1[0].totalcount,
    })
  } catch (error) {
    console.error(error)
    res.status(500).json({ code: 500, message: '服务器错误' })
  }
})

// console.log(token)
// 测试生成token
app.post('/acl/addnewuser', (req, res) => {
  const { username, name, password, userid } = req.body
  const token = jwt.sign({ username, name }, secretKey, { expiresIn: '30m' })
  const avatar = `http://localhost:3000/uploads/avatar.png`
  const sql1 = 'select * from adminusers where username=?'
  connection.query(sql1, [username], (err1, result1) => {
    if (err1) {
      console.log(err1)
    } else {
      if (result1.length == 0) {
        if (userid) {
          const sql =
            'update adminusers set username = ? , name = ? where userid = ?'
          connection.query(sql, [username, name, userid], (err, result) => {
            if (err) {
              console.log(err)
            } else {
              console.log(result)
              if (result.changedRows != 0) {
                const sql1 = 'update adminusers set token = ? where userid = ?'
                connection.query(sql1, [token, userid], (err1, result1) => {
                  if (err1) {
                    console.log(err1)
                  } else {
                    res.json({ code: 200, message: '修改成功' })
                  }
                })
              } else {
                res.json({ code: 200, message: '修改成功' })
              }
            }
          })
        } else {
          const sql =
            'insert into adminusers (token,avatar,username,name,password) values (?,?,?,?,?)'

          connection.query(
            sql,
            [token, avatar, username, name, password],
            (err, result) => {
              if (err) {
                console.log(err)
              } else {
                res.json({ code: 200, data: result, message: '添加用户成功' })
              }
            },
          )
        }
      } else {
        res.json({ code: 500, message: '用户名已存在' })
      }
    }
  })
})

function convertToTree(data, parentId) {
  const result = []
  for (const item of data) {
    if (item.pid === parentId) {
      item.children = convertToTree(data, item.id)
      result.push(item)
    }
  }
  return result
}

app.get('/acl/getmenuinfo', (req, res) => {
  const sql = 'select * from menu'
  connection.query(sql, (err, result) => {
    let treeData = convertToTree(result, 0)
    res.json({ code: 200, data: treeData, message: '获取信息成功' })
  })
})

app.post('/acl/setmenuinfo', (req, res) => {
  const { id, pid, name, code } = req.body
  if (id) {
    const sql = 'update menu set name = ? , code = ? where id = ?'
    connection.query(sql, [name, code, id], (err, result) => {
      if (err) {
        console.log(err)
      } else {
        res.json({ code: 200, message: '修改成功' })
      }
    })
  } else {
    const level = req.body.level + 1
    const sql = 'insert into menu (pid,name,code,level) values (?,?,?,?) '
    connection.query(sql, [pid, name, code, level], (err, result) => {
      if (err) {
        console.log(err)
      } else {
        res.json({ code: 200, message: '添加成功' })
      }
    })
  }
})

app.post('/acl/getroleinfo', (req, res) => {
  let { pageNo, pageSize } = req.body
  pageNo = pageNo - 1
  const sql1 = 'SELECT COUNT(*) AS totalcount FROM role'
  const sql = 'select * from role order by id desc limit ? offset ? '
  connection.query(sql1, (err1, reslut1) => {
    if (err1) {
      console.log(err1)
    } else {
      connection.query(sql, [pageSize, pageNo * pageSize], (err, result) => {
        if (err) {
          console.log(err)
        } else {
          res.json({
            code: 200,
            data: result,
            message: '获取角色信息成功',
            total: reslut1[0].totalcount,
          })
        }
      })
    }
  })
})

app.post('/acl/searchrole', (req, res) => {
  const searchvalue = `%${req.body.searchvalue}%`
  const sql1 = 'SELECT COUNT(*) AS totalcount FROM role where rolename like ?'
  const sql = 'select * from role where rolename like ? order by id desc  '
  connection.query(sql1, [searchvalue], (err1, reslut1) => {
    if (err1) {
      console.log(err1)
    } else {
      connection.query(sql, [searchvalue], (err, result) => {
        if (err) {
          console.log(err)
        } else {
          res.json({
            code: 200,
            data: result,
            message: '获取角色信息成功',
            total: reslut1[0].totalcount,
          })
        }
      })
    }
  })
})

app.post('/acl/setrole', (req, res) => {
  const { id, rolename } = req.body
  const sql1 = 'select * from role where rolename = ?'
  connection.query(sql1, [rolename], (err1, result1) => {
    if (err1) {
      console.log(err1)
    } else {
      if (result1.length > 0) {
        res.json({ code: 500, message: '角色已存在' })
      } else {
        if (id) {
          const sql = 'update role set rolename = ? where id = ?'
          connection.query(sql, [rolename, id], (err, result) => {
            if (err) {
              console.log(err)
            } else {
              res.json({ code: 200, message: '更新成功' })
            }
          })
        } else {
          const sql = 'insert into role (rolename) values (?)'

          connection.query(sql, [rolename], (err, result) => {
            if (err) {
              console.log(err)
            } else {
              res.json({ code: 200, message: '添加角色成功' })
            }
          })
        }
      }
    }
  })
})
function convertToTree1(data, parentId, power) {
  const result = []
  for (const item of data) {
    if (item.pid === parentId) {
      for (const i of power) {
        if (i == item.id) {
          item.select = true
          break
        }
      }
      item.children = convertToTree1(data, item.id, power)
      result.push(item)
    }
  }
  return result
}
app.post('/acl/getrolepower', (req, res) => {
  const id = req.body.id
  const sql = 'select permission from role where id = ?'
  connection.query(sql, [id], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      if (result[0].permission == null) {
        result[0].permission = []
      }
      const sql1 = 'select * from menu'
      connection.query(sql1, (err1, result1) => {
        let treeData = convertToTree1(result1, 0, result[0].permission)
        res.json({ code: 200, data: treeData, message: '获取信息成功' })
      })
    }
  })
})

app.post('/acl/setrolepower', (req, res) => {
  const id = req.body.id
  const permission = JSON.stringify(req.body.permission)
  const sql = 'update role set  permission = ? where id = ?'
  connection.query(sql, [permission, id], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      res.json({ code: 200, message: '分配权限成功' })
    }
  })
})

app.get('/acl/getallroleinfo', (req, res) => {
  const sql = 'select id,rolename from role'
  connection.query(sql, (err, result) => {
    if (err) {
      console.log(err)
    } else {
      res.json({ code: 200, data: result, message: '获取全部角色成功' })
    }
  })
})

app.post('/acl/setuserrole', (req, res) => {
  console.log(req.body)
  const userid = req.body.userid
  const roles = JSON.stringify(req.body.roles)
  const sql = 'update adminusers set roles = ? where userid = ?'
  connection.query(sql, [roles, userid], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      res.json({ code: 200, message: '用户分配角色成功' })
    }
  })
})

app.post('/acl/searchuser', async (req, res) => {
  const searchvalue = `%${req.body.searchvalue}%`
  const sql =
    'select * from adminusers where username like ? order by userid desc '
  const sql1 =
    'select count(*) as totalcount from adminusers where username like ?'
  try {
    const result1 = await new Promise((resolve, reject) => {
      connection.query(sql1, [searchvalue], (err1, result1) => {
        if (err1) {
          reject(err1)
        } else {
          resolve(result1)
        }
      })
    })

    const result = await new Promise((resolve, reject) => {
      connection.query(sql, [searchvalue], (err, result) => {
        if (err) {
          reject(err)
        } else {
          resolve(result)
        }
      })
    })

    await getrole(result)

    res.json({
      code: 200,
      data: result,
      message: '获取用户成功',
      total: result1[0].totalcount,
    })
  } catch (error) {
    console.error(error)
    res.status(500).json({ code: 500, message: '服务器错误' })
  }
})

app.post('/acl/deleteuser', (req, res) => {
  const useridattr = req.body
  let deletePromises = []
  for (userid of useridattr) {
    console.log(userid)
    const deletePromise = new Promise((reslove, reject) => {
      const sql = 'delete from adminusers where userid=?'
      connection.query(sql, [userid], (err, result) => {
        if (err) {
          reject(err)
        } else {
          reslove(result)
        }
      })
    })
    deletePromises.push(deletePromise)
  }
  Promise.all(deletePromises)
    .then(() => {
      res.json({ code: 200, message: '删除成功' })
    })
    .catch((error) => {
      console.log(error)
      res.json({ code: 500, message: '删除失败' })
    })
})

app.post('/acl/deleterole', (req, res) => {
  const id = req.body.id
  const sql = 'delete from role where id=?'
  connection.query(sql, [id], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      res.json({ code: 200, message: '删除成功' })
    }
  })
})

app.post('/acl/deletemenu', (req, res) => {
  console.log(req.body)
  const idattr = req.body
  const sql = 'delete from menu where id= ?'
  const allPrmise = []
  for (id of idattr) {
    const definepromise = new Promise((resolve, reject) => {
      connection.query(sql, [id], (err, result) => {
        if (err) {
          reject(err)
        } else {
          resolve()
        }
      })
    })
    allPrmise.push(definepromise)
  }
  Promise.all(allPrmise)
    .then(() => {
      res.json({ code: 200, message: '删除成功' })
    })
    .catch((error) => {
      console.log(error)
      res.json({ code: 500, message: '删除失败' })
    })
})

app.post('/orderfrom/getorderfrom', (req, res) => {
  const pageNo = req.body.pageNo - 1
  const { pageSize, status } = req.body
  const sql1 = 'select count(*) as totalcount  from dingdan where status = ? '
  const sql =
    'select * from dingdan where status = ? order by dingdanid desc limit ? offset ?'
  connection.query(sql1, [status], (err1, result1) => {
    if (err1) {
      console.log(err1)
    } else {
      connection.query(
        sql,
        [status, pageSize, pageNo * pageSize],
        (err, result) => {
          if (err) {
            console.log(err)
          } else {
            res.json({
              code: 200,
              data: result,
              message: '获取订单信息成功',
              total: result1[0].totalcount,
            })
          }
        },
      )
    }
  })
})
app.post('/orderfrom/saveorderfrom', (req, res) => {
  const orderfrom = req.body
  const { sjr, adress, phone, dingdanid } = orderfrom
  const sql =
    'update dingdan set sjr = ? ,adress = ? ,phone = ? where dingdanid = ? '
  connection.query(sql, [sjr, adress, phone, dingdanid], (err, result) => {
    if (err) {
      console.log(err)
    } else {
      res.json({ code: 200, message: '修改订单信息成功' })
    }
  })
})

app.post('/orderfrom/delivergoods', (req, res) => {
  const idattr = req.body
  const allPrmise = []
  const sql = 'update dingdan set status = ?,fahuotime=? where dingdanid = ?'
  for (const id of idattr) {
    const orderfrompromise = new Promise((resolve, reject) => {
      connection.query(sql, [3, new Date(), id], (err, result) => {
        if (err) {
          reject(err)
        } else {
          resolve()
        }
      })
    })
    allPrmise.push(orderfrompromise)
  }
  Promise.all(allPrmise)
    .then(() => {
      res.json({ code: 200, message: '发货成功' })
    })
    .catch((error) => {
      console.log(error)
      res.json({ code: 500, message: '发货失败' })
    })
})

app.post('/orderfrom/searchorderfrominfo', (req, res) => {
  const { search, status } = req.body
  const searchvalue = `%${req.body.search}%`
  const sql1 =
    'SELECT COUNT(*) AS totalcount FROM dingdan where status=? and (dingdanid = ? or _id = ? or adress like ? or phone = ? or sjr like ?)'
  const sql =
    'select * from dingdan where status=? and (dingdanid = ? or _id = ? or adress like ? or phone = ? or sjr like ?) order by dingdanid desc  '
  connection.query(
    sql1,
    [status, search, search, searchvalue, search, searchvalue],
    (err1, reslut1) => {
      if (err1) {
        console.log(err1)
      } else {
        connection.query(
          sql,
          [status, search, search, searchvalue, search, searchvalue],
          (err, result) => {
            if (err) {
              console.log(err)
            } else {
              res.json({
                code: 200,
                data: result,
                message: '获取角色信息成功',
                total: reslut1[0].totalcount,
              })
            }
          },
        )
      }
    },
  )
})

app.get('/home/getkuchun', (req, res) => {
  const sql = 'select skuname,skucount from skudetail'
  connection.query(sql, (err, result) => {
    if (err) {
      console.log(err)
    } else {
      res.json({ code: 200, data: result, message: '获取sku信息成功' })
    }
  })
})

// Start the server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`)
})
