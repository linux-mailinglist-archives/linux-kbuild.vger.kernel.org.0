Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186111DD9EA
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 00:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730561AbgEUWI6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 18:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729308AbgEUWI5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 18:08:57 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34179C05BD43
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:08:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ci21so3979943pjb.3
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GtfF1PcFRLZRINro9WPSaeOm8Nx91WCKHudobnn5ez4=;
        b=U2H/VWrTg3ckpsXcrfExBsz4faobo0lqWWAugTNpy4JGANZ5sx6iCTmUzSNhyZeKmR
         XobQyf9IqamEtDYQULc1263svrHUJ4DJ1pQwgKeMVOm0piGb9T8RZYplp1I1C3snwNjs
         iz12AxVAZ/3q2XXfMpBuj/DpJsNYBOJ8Q+Imk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GtfF1PcFRLZRINro9WPSaeOm8Nx91WCKHudobnn5ez4=;
        b=ZSFbTQhlxxCEQBtgvz9cDa/3r5NDcDCH9Cvtjf54Ml20dcr85XItxrrtu/aLHc5W/Q
         GG4DFX7ty+iADtPrwCTRrxifJEXtsUWJsRPONRqoXG5xTcU960ebTBd1MqcBOvCEnzSS
         aZuS9Uiv0Pl7t4VpP7IzKIXM7frYNFTqmcVOwvcli2mQp+RXVKE86chUlfQNBSP/3ARm
         0WaoXajLK60tC0jwmZwhkD9UymYqlto0iusppYAbv8FeISHx5apRz3IoGJ2LV0mu5hME
         ln8IJOAFnLvSGxEAbKj6NRlmkwNd1tutrevWFo3NwWXWFoqxhqQk3KAWVJ7eDTdPglZ7
         5Uuw==
X-Gm-Message-State: AOAM530yPiOXv/AhLu3qGzvqWm/yglhAPBYIiS/o9AAn8juWRKgjy8KY
        Q3yan+MAiKeBsPejCxhqBbEREw==
X-Google-Smtp-Source: ABdhPJztMyB2N+44/pXohJLaLbkQ4tvVSkv+rL90DrIcJzTW8uDJ1cum87EQ4SM7yIrxuKufV9FZlg==
X-Received: by 2002:a17:902:bf43:: with SMTP id u3mr11389268pls.240.1590098935533;
        Thu, 21 May 2020 15:08:55 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t21sm4790454pgu.39.2020.05.21.15.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 15:08:54 -0700 (PDT)
Date:   Thu, 21 May 2020 15:08:53 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Message-ID: <202005211506.2700F86@keescook>
References: <20200521202716.193316-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521202716.193316-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 21, 2020 at 01:27:16PM -0700, Sami Tolvanen wrote:
> Instead of linking all compilation units again each time vmlinux_link is
> called, reuse vmlinux.o from modpost_link.
> 
> With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> in the time spent in vmlinux_link).

Nice! Any time savings at final link is a big cumulative win.

> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/link-vmlinux.sh | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index d09ab4afbda4..c6cc4305950c 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -77,11 +77,8 @@ vmlinux_link()
>  
>  	if [ "${SRCARCH}" != "um" ]; then
>  		objects="--whole-archive			\
> -			${KBUILD_VMLINUX_OBJS}			\
> +			vmlinux.o				\
>  			--no-whole-archive			\
> -			--start-group				\
> -			${KBUILD_VMLINUX_LIBS}			\
> -			--end-group				\
>  			${@}"
>  
>  		${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}	\

I think the "um" case can be updated as well too, yes?

Also, I think the comment above modpost_link() needs to be updated now
to reflect the nature of how vmlinux.o gets used after this patch.

-- 
Kees Cook
