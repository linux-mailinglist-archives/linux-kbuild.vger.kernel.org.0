Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2E57A07AD
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 18:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbfH1QnZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 12:43:25 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:33033 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfH1QnZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:43:25 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x7SGhKvr028731;
        Thu, 29 Aug 2019 01:43:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x7SGhKvr028731
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567010601;
        bh=59gdCQYyt4WFTLa0VJOuXipx2hC/GGa/B8YFQvrXlsg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NokCpAH5Ok9a4O3hbnVRtBVYv3wP/ncXQ1qzW7RRji/4PgZvQneDkPhT3W/yJdfhG
         9J0d3oCVQRbSRn/U1QuBd3sxpjzq1gYIoWg0/Zz9eRU7SzrrmKooDpZjBEf8cHr1+1
         lc2jm3tC0iMdpQ0+VbrcFV0T3iDOXUCyLz9FPyB6DiJKVr7twYiOKw54mLVO91u0su
         0MvfGmQ4WYkPLWXGPagsp5jP5Wp8/hAL87CeYn6cBkjAztfWjpGhbjcQJ9+QO4S3/3
         e94yaJTPK3fvbBe7abGq3t9B8AQ0zfz7tyJ/6GcHbFU9v/yd/QcqNwDcso4OapqUNz
         jEAngpbjATLFQ==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id y19so178689ual.13;
        Wed, 28 Aug 2019 09:43:21 -0700 (PDT)
X-Gm-Message-State: APjAAAV92QNBB3xEjBgPnI7RXjSKLRZpV1l7F9uGtPateDlIe8bTWE74
        eRFugVAjgmjJPvAPU8uxdplv378NoGMP6bQmjhE=
X-Google-Smtp-Source: APXvYqy5/HkNib7+qeS5rprhDQhJDWpCinBaPEKLjgEqPH2eisrLA4CBCWrqk/cIGCMYGxo93El03la3zxyErwdyizs=
X-Received: by 2002:ab0:442:: with SMTP id 60mr2209408uav.109.1567010599882;
 Wed, 28 Aug 2019 09:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190821173321.15012-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190821173321.15012-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 01:42:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS=2=D=aQDn_+iYTW6f86TnvHUL68SzCPkdqXxbNZWw-Q@mail.gmail.com>
Message-ID: <CAK7LNAS=2=D=aQDn_+iYTW6f86TnvHUL68SzCPkdqXxbNZWw-Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove unneeded dependency for $(DOC_TARGETS)
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 22, 2019 at 2:33 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Commit 415008af3219 ("docs-rst: convert lsm from DocBook to ReST")
> stopped using if_changed_rule. No more users of if_changed* for the
> doc targets. Hence, fixdep is unneeded. Remove the dependency on
> scripts_basic.
>
> All the doc targets are phony. Depending on FORCE is odd.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index c0be1a4dbfdd..7e54a821b4b0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1578,7 +1578,7 @@ $(help-board-dirs): help-%:
>  DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
>                linkcheckdocs dochelp refcheckdocs
>  PHONY += $(DOC_TARGETS)
> -$(DOC_TARGETS): scripts_basic FORCE
> +$(DOC_TARGETS):
>         $(Q)$(MAKE) $(build)=Documentation $@
>
>  # Misc
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
