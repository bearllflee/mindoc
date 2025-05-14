package controllers

import (
	"math"
	"net/url"

	"github.com/beego/beego/v2/core/logs"
	"github.com/mindoc-org/mindoc/conf"
	"github.com/mindoc-org/mindoc/models"
	"github.com/mindoc-org/mindoc/utils/pagination"
)

type HomeController struct {
	BaseController
}

func (c *HomeController) Prepare() {
	c.BaseController.Prepare()
	//如果没有开启匿名访问，则跳转到登录页面
	if !c.EnableAnonymous && c.Member == nil {
		c.Redirect(conf.URLFor("AccountController.Login")+"?url="+url.PathEscape(conf.BaseUrl+c.Ctx.Request.URL.RequestURI()), 302)
	}
}

func (c *HomeController) ProjectsIndex() {
	c.Prepare()
	// Ensure user is logged in to view the projects list.
	if !c.isUserLoggedIn() {
		// Store the current URL before redirecting to login
		c.Ctx.SetCookie("redirect_url", c.Ctx.Input.URL(), 0, "/")
		c.Ctx.Redirect(302, c.BaseUrl()+"/login")
		c.StopRun() // Stop further processing
	}
	c.TplName = "home/index.tpl"

	pageIndex, _ := c.GetInt("page", 1)
	pageSize := 18
	memberId := 0
	if c.Member != nil {
		memberId = c.Member.MemberId
	}
	books, totalCount, err := models.NewBook().FindForHomeToPager(pageIndex, pageSize, memberId)
	if err != nil {
		logs.Error(err)
		c.Abort("500")
	}
	if totalCount > 0 {
		pager := pagination.NewPagination(c.Ctx.Request, totalCount, pageSize, c.BaseUrl())
		c.Data["PageHtml"] = pager.HtmlPages()
	} else {
		c.Data["PageHtml"] = ""
	}
	c.Data["TotalPages"] = int(math.Ceil(float64(totalCount) / float64(pageSize)))
	c.Data["Lists"] = books
}

// New home page handler
func (c *HomeController) Index() {
	c.Prepare()
	c.TplName = "home/new_index.tpl" // Set the template for the new home page
}
