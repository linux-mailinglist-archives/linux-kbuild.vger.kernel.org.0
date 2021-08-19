Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DA53F1FA9
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 20:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhHSSPR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 14:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232909AbhHSSPQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 14:15:16 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54B5C06175F
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 11:14:39 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id x4so6653544pgh.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 11:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0SKhC3J984Bt9tebQiICdzNOkpC2IvMStmeSDq7Umio=;
        b=In5/RKkUZeagC+WlIH/+8GTOktolnZ2nOKo/ztLU4GKb3NQ2UesMx/voDRhitxJ3Il
         Q2uEJaKnZB0rqUTrZLiZbUCfzdLqI7geEfIgXgDtZHgFhj1sOKCCt2M8fUxAPIE6qxF6
         nu5ZOvlpp/fCUnN2gB4IzsojUCiPv2CC5f3DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0SKhC3J984Bt9tebQiICdzNOkpC2IvMStmeSDq7Umio=;
        b=pI0YEO90mm8nsfTRUOZmPvAm8otRQ50TZdAFQs8nb91pcpEvbQmnIknVShD2UYkiXK
         13ls//RcNq4Mzj8iHBXI1CQ9phKJhl9/vTLLiLetc44lSgf2Go/NtO046kiQ0gZLGC9Y
         9tlwxCJd/1HyhdtAOHi2ga++olIw2kl6uWUuLvONoqeB2he9SMHxfHvKC3L642ArteKr
         NeaGsfK7ix1RWejGtUliWpaiM6MDHOKZZI4687lfLQQzaW6kaCSz9iwWQdhMKIAogp03
         5InD4U5xQu1+eMDc/jmxI2MsXxbxsGS5hJ2Z0zBh9q2bXMJskeAAVYqj41iqnGy++u96
         ZF3A==
X-Gm-Message-State: AOAM531X2d6bCzz0zXRgeLQBCzlFS1Vr9W4J+aW1XXnIbPljmjXXsvxJ
        0f5XwBiZ7ONlmGan588Rx/IhlA==
X-Google-Smtp-Source: ABdhPJx7rLPAWK8oaW08eAcy09Z+Kng7KwwXX57sH1FQGYMOZHVX7jnlFFhny+ti3ng6ls1qiNUl+A==
X-Received: by 2002:a62:8603:0:b029:3c8:3fdb:4aea with SMTP id x3-20020a6286030000b02903c83fdb4aeamr15702539pfd.6.1629396879394;
        Thu, 19 Aug 2021 11:14:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id y16sm4202007pfn.42.2021.08.19.11.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 11:14:38 -0700 (PDT)
Date:   Thu, 19 Aug 2021 11:14:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     linux-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>,
        Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-staging@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 56/63] RDMA/mlx5: Use struct_group() to zero struct
 mlx5_ib_mr
Message-ID: <202108191106.1956C05A@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-57-keescook@chromium.org>
 <20210819122716.GP543798@ziepe.ca>
 <202108190916.7CC455DA@keescook>
 <20210819164757.GS543798@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819164757.GS543798@ziepe.ca>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 01:47:57PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 19, 2021 at 09:19:08AM -0700, Kees Cook wrote:
> > On Thu, Aug 19, 2021 at 09:27:16AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Aug 17, 2021 at 11:05:26PM -0700, Kees Cook wrote:
> > > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > > field bounds checking for memset(), avoid intentionally writing across
> > > > neighboring fields.
> > > > 
> > > > Add struct_group() to mark region of struct mlx5_ib_mr that should be
> > > > initialized to zero.
> > > > 
> > > > Cc: Leon Romanovsky <leon@kernel.org>
> > > > Cc: Doug Ledford <dledford@redhat.com>
> > > > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > > > Cc: linux-rdma@vger.kernel.org
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > >  drivers/infiniband/hw/mlx5/mlx5_ib.h | 4 +++-
> > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
> > > > index bf20a388eabe..f63bf204a7a1 100644
> > > > +++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
> > > > @@ -644,6 +644,7 @@ struct mlx5_ib_mr {
> > > >  	struct ib_umem *umem;
> > > >  
> > > >  	/* This is zero'd when the MR is allocated */
> > > > +	struct_group(cleared,
> > > >  	union {
> > > >  		/* Used only while the MR is in the cache */
> > > >  		struct {
> > > > @@ -691,12 +692,13 @@ struct mlx5_ib_mr {
> > > >  			bool is_odp_implicit;
> > > >  		};
> > > >  	};
> > > > +	);
> > > >  };
> > > >  
> > > >  /* Zero the fields in the mr that are variant depending on usage */
> > > >  static inline void mlx5_clear_mr(struct mlx5_ib_mr *mr)
> > > >  {
> > > > -	memset(mr->out, 0, sizeof(*mr) - offsetof(struct mlx5_ib_mr, out));
> > > > +	memset(&mr->cleared, 0, sizeof(mr->cleared));
> > > >  }
> > > 
> > > Why not use the memset_after(mr->umem) here?
> > 
> > I can certainly do that instead. In this series I've tended to opt
> > for groupings so the position of future struct member additions are
> > explicitly chosen. (i.e. reducing the chance that a zeroing of the new
> > member be a surprise.)
> 
> I saw the earlier RDMA patches where using other memset techniques
> though? Were there flex arrays or something that made groups infeasible?

Which do you mean? When doing the conversions I tended to opt for
struct_group() since it provides more robust "intentionality". Strictly
speaking, the new memset helpers are doing field-spanning writes, but the
"clear to the end" pattern was so common it made sense to add the helpers,
as they're a bit less disruptive. It's totally up to you! :)

-- 
Kees Cook
