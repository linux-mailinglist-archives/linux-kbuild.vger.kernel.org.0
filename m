Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8EB72FEFFD
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 17:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732933AbhAUQRk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 11:17:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732100AbhAUQRZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 11:17:25 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E27CC061756;
        Thu, 21 Jan 2021 08:16:44 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id v126so2115772qkd.11;
        Thu, 21 Jan 2021 08:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8WXB9ll3nuCQCMfyocR9odXhllARQS8g9DNS6GFa+Bs=;
        b=qyOOy7u/lZWtARlr/KbL/lOXGMRQ3ta3fhT6rTEr2ds55R/SXUkCS7cr610WWSJ8xf
         RQTX+qsP8SVCmXuguGUMfOcvrj9Q+CYMYC5JptDRnU9Dd4EaYIGGbgLgHiCtiWxVGg5u
         M5QMSex1MDgPF9BotOVhbtz3i59vbqMwFis68+08/cQDs4L5hrXduxrg3p0vU503oPBI
         7oUZxcOacFO1BW/JTdtQ2QS4HSf26z49OnxBx2CinN1GoU783qPk9YbOi8LWFDqxRolE
         WGdRNmHrcK3bRveyZqjY5BqvE9vDT7gSqGzm3IRESCPtEnHOFVkJZZT2ia0VStrogi7o
         +/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8WXB9ll3nuCQCMfyocR9odXhllARQS8g9DNS6GFa+Bs=;
        b=HUIoC/pOmRZmpUjmu4XRLIve46ybBmAe0d6WJKPQJz+5BSMRK5YHTznrXL69Ajh49N
         hHBOkQ/xTJSvKWMQnVojI4OxRs41FHxEz3P0M0hGZyZcmEv3X8pg54sYi5HfTYBEUGKv
         Yl1Pi3fRLvwTiTNJkBvzy+cJ8UQqURkR82r242oujEaT2idRn5sZnLlwwafuq3uU4zmf
         0l+dNF3hvVR004mpzN/YF5EqfaaAvKHHtuXOXGhe6pL8e89OlkEzkLNOlKUmKPyu+gEU
         4yR0zMfkwCn3FPMLckTLcsSnAFk2AD3jIfH1zMHn0KHuNXS0P3vID08bosiKXdwqjzAP
         K/Ow==
X-Gm-Message-State: AOAM530p5QH/GByv0aeoLgoygGKEhlYQVs2xyG3B0Q9gb7hmKcbQo7Mo
        VN4qReqbZ9FCRzLrycTUTHI=
X-Google-Smtp-Source: ABdhPJxftqiLA0H2Hkji6SwjnmUPv/W9UlOTZ/Wx6jiCN0OgAzb22W1Q8U9qrFD6QrnBeCQgJXgo+w==
X-Received: by 2002:a37:a5ca:: with SMTP id o193mr504611qke.394.1611245803705;
        Thu, 21 Jan 2021 08:16:43 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id k19sm3827755qkh.6.2021.01.21.08.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 08:16:42 -0800 (PST)
Date:   Thu, 21 Jan 2021 09:16:40 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
Message-ID: <20210121161640.GA1101379@ubuntu-m3-large-x86>
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210121160115.4676-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 05:01:15PM +0100, Lukas Bulwahn wrote:
> Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> Kconfig") removed ./scripts/clang-version.sh and moved its content to
> ./scripts/cc-version.sh.
> 
> Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    scripts/clang-version.sh
> 
> The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> changes in ./scripts/clang-version.sh; as the file is removed, track
> changes in ./scripts/cc-version.sh instead now.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210121
> 
> Masahiro-san, please pick this quick fix-up patch.

Masahiro cannot pick this up because the patch to add clang-version.sh
to MAINTAINERS is in mmotm.

I think the better solution is for Andrew to drop the current version of

maintainers-add-a-couple-more-files-to-the-clang-llvm-section.patch

and pick up the second one I sent, which allows us to deal with this:

https://lore.kernel.org/lkml/20210114171629.592007-1-natechancellor@gmail.com/

I am not sure it is right for us to maintain cc-version.sh but I am open
to it if Masahiro agrees.

>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e5d7cf38ec82..aafbea806a82 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4355,8 +4355,8 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
>  C:	irc://chat.freenode.net/clangbuiltlinux
>  F:	Documentation/kbuild/llvm.rst
>  F:	include/linux/compiler-clang.h
> +F:	scripts/cc-version.sh
>  F:	scripts/clang-tools/
> -F:	scripts/clang-version.sh
>  F:	scripts/lld-version.sh
>  K:	\b(?i:clang|llvm)\b
>  
> -- 
> 2.17.1
> 
