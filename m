Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DC23F1395
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 08:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhHSGcx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 02:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhHSGcw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 02:32:52 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F95C061756
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:32:17 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id w6so3307459plg.9
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 23:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5dAjMEOi1u5hcGe7TyoRwNUw/I8hhdTgfzLeFcN4Q8o=;
        b=KqmpKHQRcCzunFkJgijQHZkIJ4JIL/IdZDwlGxxEpu/SpC72hIUu7EHorZp28qzuPj
         UGHb+ts9oyhH28rO0hWMJSFZsU8WCkODH51xgUHZJhGyBJ+V9erized3H7gY6x4d4E4J
         WQ0q4DYwVSgl4v5SUbFeww4VYnZwS9CyPEISI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5dAjMEOi1u5hcGe7TyoRwNUw/I8hhdTgfzLeFcN4Q8o=;
        b=AqXU0Rxr3YX/ovVTwDA9NbJKZKr7t0pyCZ7BDmPvzfKjWkxZfdH856SVdCyuvFi3wj
         UzMl8/z6A6GAElg9jsrhB/zhFPuBZpxVJbdZSkeEYPY2eE0lMlvGr8CaLD2XZbTqx2Qs
         zfIAk7e2srF6q+25Gpf4w3/hQUP5KEBWvLzBa7drEeEGk4M7to1k9le8HGFc20wP8Tr2
         wx/tYrfRWgkznCRD+bQ2jvnmjCbdjw8bcRib6NMddK4Ehg4HZ5ZxtdfRLzJAKL9Pq3Ql
         KOX0H6qCGCYIsDYiNPbmkyYywfg017gx6+ALBdK95YSeDDXrKzMxla//e7L47SBJPBCy
         z6vA==
X-Gm-Message-State: AOAM533riYooITrB13op4oTSCuzn0Jtq0e6aHsEridAtaDw4RXTIzWUq
        F+1EpAwkgkoYeD0tq7gPhOElnQ==
X-Google-Smtp-Source: ABdhPJwKJS/uO09vlswMJG+Z0q+TpTEyZ5QVAn9QjYiKntsrleHXbQ3FhRvyK5yp0MWHH3TPk3d+Mw==
X-Received: by 2002:a17:902:a5c5:b029:12c:9108:d83 with SMTP id t5-20020a170902a5c5b029012c91080d83mr10537901plq.33.1629354736716;
        Wed, 18 Aug 2021 23:32:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n185sm2046693pfn.171.2021.08.18.23.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 23:32:15 -0700 (PDT)
Date:   Wed, 18 Aug 2021 23:32:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 07/13] kbuild: do not remove 'linux' link in
 scripts/link-vmlinux.sh
Message-ID: <202108182331.70B390B@keescook>
References: <20210819005744.644908-1-masahiroy@kernel.org>
 <20210819005744.644908-8-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210819005744.644908-8-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 19, 2021 at 09:57:38AM +0900, Masahiro Yamada wrote:
> arch/um/Makefile passes the -f option to the ln command:
> 
>     $(Q)ln -f $< $@
> 
> So, the hard link is always re-created, and the old one is removed
> anyway.

Hah, yeah, that's a bit of ARCH=um redundancy.

Reviewed-by: Kees Cook <keescook@chromium.org>

> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/link-vmlinux.sh | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index a6c4d0bce3ba..7b9c62e4d54a 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -206,7 +206,6 @@ vmlinux_link()
>  			-Wl,-T,${lds}				\
>  			${objects}				\
>  			-lutil -lrt -lpthread
> -		rm -f linux
>  	fi
>  }
>  
> -- 
> 2.30.2
> 

-- 
Kees Cook
