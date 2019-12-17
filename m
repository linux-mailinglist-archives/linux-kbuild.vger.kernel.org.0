Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEDE12225D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Dec 2019 04:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfLQDHQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Dec 2019 22:07:16 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17117 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbfLQDHQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 22:07:16 -0500
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id xBH375bO008091;
        Tue, 17 Dec 2019 12:07:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com xBH375bO008091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576552026;
        bh=ZhOcBgDSv8Hn1El6HF4muJCBjTHKz+oJ4fyRLFMkLLE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rqOJJ85K6CnWdEJYWWO0P4r8X9FyJrVU4m6wPXIwbJft4ahV4MSuiyqDVMC0u0iMo
         h/xSDQiLASw9tP9HTnA1ejHpDhmLG8dxdEeTmtWvjjBLdy8CyOqNOsjDR7xkGPRwBO
         a7Yjw2S0oFEF5rZcgWyEOs1WFvT5oGNFMJ4bB4c60akwb+kUu0/FR4WpQ3x63jxQMy
         edL+jENzz+qgUMyAUZFA+adkfw4h4XEW/Z6FuqmBWBu47MGy/Yw2094YksI62FOaka
         nTPSIMQmrNi2FuYSfLVHkzLhv5cLjyNqymsjuc9koPQ2SJ9wyCin4OLY/Di+2htiE6
         8db7yD4dYXe9w==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id f8so5556239vsq.8;
        Mon, 16 Dec 2019 19:07:05 -0800 (PST)
X-Gm-Message-State: APjAAAXEw3RnpUnYQpM9j+B+LemvNuonkTRMsspw3AR9NL8LrOGY7oqK
        Q8QfyZ+VdLs7+3QKm8JYSArESHKkQJWvK2ZGzl8=
X-Google-Smtp-Source: APXvYqw2xitO9pwMZ6r85qIc8vitKa7NvLz0X5hNFTgzj0IsuLeRUcKkvHmMGWgd1nGYfruahJVR4hf8o63tn/AUm7w=
X-Received: by 2002:a67:7904:: with SMTP id u4mr1438775vsc.155.1576552024754;
 Mon, 16 Dec 2019 19:07:04 -0800 (PST)
MIME-Version: 1.0
References: <20191206130302.11473-1-masahiroy@kernel.org> <20191206130302.11473-2-masahiroy@kernel.org>
In-Reply-To: <20191206130302.11473-2-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Dec 2019 12:06:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNARF5WzJhX2HS8U7uGX3D8D5aDi_ah1JUaM27iS49xYMAA@mail.gmail.com>
Message-ID: <CAK7LNARF5WzJhX2HS8U7uGX3D8D5aDi_ah1JUaM27iS49xYMAA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mkcompile_h: use printf for LINUX_COMPILE_BY
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Dec 6, 2019 at 10:03 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 858805b336be ("kbuild: add $(BASH) to run scripts with
> bash-extension") shed light on portability issues. Here is another one.
>
> Since commit f07726048d59 ("Fix handling of backlash character in
> LINUX_COMPILE_BY name"), we must escape a backslash contained in
> LINUX_COMPILE_BY. This is not working on distros like Ubuntu.
>
> As the POSIX spec [1] says, if any of the operands contain a backslash
> ( '\' ) character, the results are implementation-defined.
>
> The actual shell of /bin/sh could be bash, dash depending on distros,
> and the behavior of builtin echo command is different among them.
>
> The bash builtin echo, unless -e is given, copies the arguments to
> output without expanding escape sequences (BSD-like behavior).
>
> The dash builtin echo, in contrast, adopts System V behavior, which
> does expand escape sequences without any option.
>
> Even non-builtin /bin/echo behaves differently depending on the system.
> Due to these variations, echo is considered as a non-portable command.
> Using printf is the common solution to avoid the portability issue.
>
> [1] https://pubs.opengroup.org/onlinepubs/009695399/utilities/echo.html
>
> Fixes: 858805b336be ("kbuild: add $(BASH) to run scripts with bash-extension")
> Reported-by: XXing Wei <xxing.wei@unisoc.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuid.


>
>  scripts/mkcompile_h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index 3097fec1756a..3a5a4b210c86 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -69,7 +69,7 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
>
>    echo \#define UTS_VERSION \"$UTS_VERSION\"
>
> -  echo \#define LINUX_COMPILE_BY \"$LINUX_COMPILE_BY\"
> +  printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
>    echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"
>
>    echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//'`\"
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
