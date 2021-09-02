package handler

import (
	"net/http"

	"go-explorer/api/internal/logic"
	"go-explorer/api/internal/svc"
	"go-explorer/api/internal/types"

	"github.com/tal-tech/go-zero/rest/httpx"
)

func ApiHandler(ctx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.Request
		if err := httpx.Parse(r, &req); err != nil {
			httpx.Error(w, err)
			return
		}

		l := logic.NewApiLogic(r.Context(), ctx)
		resp, err := l.Api(req)
		if err != nil {
			httpx.Error(w, err)
		} else {
			httpx.OkJson(w, resp)
		}
	}
}
