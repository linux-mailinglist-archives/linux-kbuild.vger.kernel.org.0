Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4A7282941
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Oct 2020 08:51:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJDGvq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Oct 2020 02:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgJDGvq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Oct 2020 02:51:46 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8656C0613CE;
        Sat,  3 Oct 2020 23:51:44 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id cb21so631139ejb.13;
        Sat, 03 Oct 2020 23:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=lNHluM8woR+e77P0E5MEPND7G5EihPQXGymK5h4QF7U=;
        b=hH6CZfjmZcYp0czforTytT4ysTbxRlfWf//1lGT9f5uJ+1gTAn4RW0tOkzIbJuIcWY
         wH+0Bqr7cKRhMImtf2AVKsUPEBBDiH9gl71ysQLCDWNyGfVVFCGWfamFqD4N8wv6jycM
         i7vtGNd+BDb1wg9Y8tfhQuNpgh3zXi2hqh/rFFFDrmmkYNB0Gfxf+z49pMCX7GUJOInQ
         1yIYO3a+f8RxsNFJFPhngLZbAeppG91mLln5MdpHYPCCGhsSXD5zOhsdwtMsDP1i5Y7F
         DGqxOnMehD+1rAOzZVSCmLhqvaIpVyGNGF+vjHepbZBrAYxTUON5NzZO0repHsFM9l64
         ISmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=lNHluM8woR+e77P0E5MEPND7G5EihPQXGymK5h4QF7U=;
        b=jifcKmVWkoJ6WHectiSixmlURnHs57SBpj7imuA+3gHlAbYildYfJfRn4v2ExL5MzS
         6/1fXKmLIq103zCAD8uF9k2aR7Fbtgu9HqIsGTApmZVUj7mdSyi2ycCM9yFDbE+mWcDt
         qmXi5WqpdIWfvaCPz697rI2g/poWQhNJv1/WuBx/6NMGmuJ+KvZxEcOhav4yl0NPRo7w
         ZnP0a8IzpXtcMamq7JG8ZPeCUWBx+MF2p5TI9P3vyPrg61wlKhS9UrllyZ5ykGY4i1wO
         hTFWsHVUrlysdO6J6a426PdQvuKkwKcHpXAE12e3Ez4IPnzDpmU50cJa+baxqi7LTdZd
         /Zcw==
X-Gm-Message-State: AOAM533EIMpCBu+D+3uyCW8qyWDEVwvfTQMxk+s1ca7xXcVqLjSdpDsT
        mxmQPEStNY1oCP1/1rfJRHo=
X-Google-Smtp-Source: ABdhPJzVFG13oBskCpDw7Xf9Gh5IfwQdy4T1LEVT+vcHYhCkNzCRsYNp+Ene4RiTz3Hutnrhet/bWw==
X-Received: by 2002:a17:906:fa8a:: with SMTP id lt10mr9442973ejb.307.1601794303357;
        Sat, 03 Oct 2020 23:51:43 -0700 (PDT)
Received: from felia ([2001:16b8:2d26:f700:8d52:b46b:d125:e62a])
        by smtp.gmail.com with ESMTPSA id w13sm2742288eja.7.2020.10.03.23.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2020 23:51:42 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Sun, 4 Oct 2020 08:51:36 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Ujjwal Kumar <ujjwalkumar0501@gmail.com>
cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH RFC 0/2] use interpreters to invoke scripts
In-Reply-To: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
Message-ID: <alpine.DEB.2.21.2010040809230.28226@felia>
References: <2b00e566-112c-5657-c10f-7f210d3eae93@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Sat, 3 Oct 2020, Ujjwal Kumar wrote:

> This patch series aims at removing the dependency on execute 
> bit of the scripts in the kbuild system.
>

Ujjwal, your setup to send out the patch series created three unrelated 
emails rather than the default way, i.e., to have one cover letter 
and the patches in reply to the cover letter.

You can see the difference here:

https://lore.kernel.org/linux-kbuild/

The presentation of your patch series looks different than the other 
patch series on the list. Use the linux-kernel-mentees list for testing 
your setup.

For this version of the patch series, I guess it is okay; but this set up 
right for the next patch series.
 
> If not working with fresh clone of linux-next, clean the srctree:
> make distclean
> make tools/clean
>

I hit an unrelated issue on next-20201002 that make tools/clean fails.
Other than that, this is all good.
 
> To test the dependency on execute bits, I tried building the 
> kernel after removing x-bits for all files in the repository.
> Removing execute bits:
> for i in $(find -executable -type f); do chmod -x $i; done
>

Okay, I did that.
 
> Any attempts to configure (or build) the kernel fail because of 
> 'Permission denied' on scripts with the following error:
> $ make allmodconfig
> sh: ./scripts/gcc-version.sh: Permission denied
> init/Kconfig:34: syntax error
> init/Kconfig:33: invalid statement
> init/Kconfig:34: invalid statement
> sh: ./scripts/ld-version.sh: Permission denied
> init/Kconfig:39: syntax error
> init/Kconfig:38: invalid statement
> sh: ./scripts/clang-version.sh: Permission denied
> init/Kconfig:49: syntax error
> init/Kconfig:48: invalid statement
> make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
> make: *** [Makefile:606: allmodconfig] Error 2
>

I can confirm that these errors are reported on next-20201002.
 
> Changes:
> 1. Adds specific interpreters (in Kconfig) to invoke 
> scripts.
> 
> After this patch I could successfully do a kernel build 
> without any errors.
>

With this first patch, I could then successfully do:

make allmodconfig && make

So far, so good. I did check the first patch.

Lukas

> 2. Again, adds specific interpreters to other parts of 
> kbuild system.
> 
> I could successfully perform the following make targets after 
> applying the PATCH 2/2:
> make headerdep
> make kselftest-merge
> make rpm-pkg
> make perf-tar-src-pkg
> make ARCH=ia64 defconfig
> ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare
> 
> Following changes in PATCH 2/2 are not yet tested:
> arch/arm64/kernel/vdso32/Makefile
> arch/nds32/kernel/vdso/Makefile
> scripts/Makefile.build
> 
> Ujjwal Kumar (2):
>   kconfig: use interpreters to invoke scripts
>   kbuild: use interpreters to invoke scripts
> 
>  Makefile                          |  4 ++--
>  arch/arm64/kernel/vdso/Makefile   |  2 +-
>  arch/arm64/kernel/vdso32/Makefile |  2 +-
>  arch/ia64/Makefile                |  4 ++--
>  arch/nds32/kernel/vdso/Makefile   |  2 +-
>  init/Kconfig                      | 16 ++++++++--------
>  scripts/Makefile.build            |  2 +-
>  scripts/Makefile.package          |  4 ++--
>  8 files changed, 18 insertions(+), 18 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
