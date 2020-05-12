Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70CE51CEC1B
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 06:36:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbgELEg4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 00:36:56 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55760 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgELEgz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 00:36:55 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 04C4agRg024102;
        Tue, 12 May 2020 13:36:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 04C4agRg024102
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589258203;
        bh=M7pPl0uhaWalct9g6BCdULpeDSI8S9KQBWYPCMKJKgI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2VF7+rIF9BbhzddPNxO+hbgG4Xd+ZSa/eJ1ceOboGl/V6s+qsQFW7VvqTwL4t7Hzn
         FasVwPx4UnLA8GXOiq0U9BGUpZ2MWZOgI0PRhgGNP4iRSmMfxw0yw80RTnOrYTSC4q
         B9qhEJp3GFNOZndqU/0jqpjhKF09ntVz886MKbndbc9VK6mUN0Crh6oWDnB160zPIH
         ov4cMpB6p1KptwHE87XnQxuzjwniO3v7tHWpiZLBLWDM9XF/nB/jLaRX8nsROUVhLf
         OM/jA5bROr0dgLRv9pGsOolXXaklJjj1YBhoB3fONxhB+uLoHh+OrL6Ke5NWT6bNCK
         I4JQYbFuTYiWg==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id g15so2914463uah.5;
        Mon, 11 May 2020 21:36:42 -0700 (PDT)
X-Gm-Message-State: AGi0PuYIhP6yU0TdcKr+rbcMKke9G+Z84hMzzDK8+xwlSoKJs1X4eIdn
        bmiq3Lq7WURC3oOla7sFCOt+A7m5necyj6hcAlc=
X-Google-Smtp-Source: APiQypJ1hIAmyKRJrnfUNcq0Srrx5XhJvKWp2EPUXPVdCU43bQZYvw9Z+SH0uATsRcc1jf2OCEXkmm29fmZusJ4VtIc=
X-Received: by 2002:ab0:7298:: with SMTP id w24mr14784934uao.95.1589258201684;
 Mon, 11 May 2020 21:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200504080807.126396-1-masahiroy@kernel.org>
In-Reply-To: <20200504080807.126396-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 May 2020 13:36:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0U_QAeQR_Ab2wD06pNKvKXcoG6OJL+SFaCtJymuG5Kw@mail.gmail.com>
Message-ID: <CAK7LNAQ0U_QAeQR_Ab2wD06pNKvKXcoG6OJL+SFaCtJymuG5Kw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove misleading stale FIXME comment
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 4, 2020 at 5:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This comment was added by commit ("kbuild: Restore build nr, improve
> vmlinux link") [1].
>
> It was talking about if_changed_rule at that time. Now, it is unclear
> what to fix.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=ea52ca1b3e3882b499cc6c043f384958b88b62ff
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>
>  Makefile | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9ff00bfe0575..ffd80afcd0bb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1827,9 +1827,6 @@ tools/%: FORCE
>         $(Q)mkdir -p $(objtree)/tools
>         $(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ $*
>
> -# FIXME Should go into a make.lib or something
> -# ===========================================================================
> -
>  quiet_cmd_rmdirs = $(if $(wildcard $(rm-dirs)),CLEAN   $(wildcard $(rm-dirs)))
>        cmd_rmdirs = rm -rf $(rm-dirs)
>
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
