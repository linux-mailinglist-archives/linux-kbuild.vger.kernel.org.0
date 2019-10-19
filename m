Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14344DD5B1
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2019 02:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390966AbfJSAOg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Oct 2019 20:14:36 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31458 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728453AbfJSAOg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Oct 2019 20:14:36 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x9J0EQ12017747;
        Sat, 19 Oct 2019 09:14:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x9J0EQ12017747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571444067;
        bh=jg/eXGyBfqdH6nB+1CskRFiRjZ94TWBa2fkgBewpyNM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZE3i/BU8XE/OIXMQ+xOn9e77aYjfQ0xXtY8oGLNADJ5F7yBQPT8JTaxfzPUWgjYWS
         gFuGZn7s5J+ey5rr0xRyRuyFkiYi4KXWg97JT+H7bD0va2yisdE4zf+SH14z70ixf3
         UA7cKtbrmqqQO9ZZLLK4955TIcAPFFLut7iSuJR5uQv4PX4kR0HpS/WlZFEXKj3DWQ
         UvgOaXek2cKMl9zz7B5m48od2Ufx8ax/6MQv4byRwZuOmBuZ4I4yNNK0RcO9kW/NH4
         b0ANyuNubWO0WdqK+m7FYiSzJsLLzHRxGyoab6afwh3verlZUe5pTTenLXsiF5qgCm
         Z0F86ymC72+mg==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id w195so5183213vsw.11;
        Fri, 18 Oct 2019 17:14:27 -0700 (PDT)
X-Gm-Message-State: APjAAAXQFqsgNYlo8EGfkZ8Qo/hvhXQTs2TVoWIPihM4mXRFXrRjay2i
        F3BsSwK57hNF6Xg/uREXJTsb7cN22M3Y5o25BvA=
X-Google-Smtp-Source: APXvYqxxkVJMcHAaRI2dEK4yn+EJLRjNcwuBbcZh6wI/Foo5AiA9SNvrYojNwgQcOWboD0ggpokVJk20wxLbACnFlnk=
X-Received: by 2002:a67:ff86:: with SMTP id v6mr7263663vsq.181.1571444066259;
 Fri, 18 Oct 2019 17:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20191018220753.10002-1-sashal@kernel.org> <20191018220753.10002-39-sashal@kernel.org>
In-Reply-To: <20191018220753.10002-39-sashal@kernel.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 19 Oct 2019 09:13:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNASOb9RwtO-qV5Fh9ezA791Q8Jv8KU740dkzQVaht8fKzw@mail.gmail.com>
Message-ID: <CAK7LNASOb9RwtO-qV5Fh9ezA791Q8Jv8KU740dkzQVaht8fKzw@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.14 39/56] kbuild: fix build error of 'make
 nsdeps' in clean tree
To:     Sasha Levin <sashal@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable <stable@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 19, 2019 at 7:15 AM Sasha Levin <sashal@kernel.org> wrote:
>
> From: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> [ Upstream commit d85103ac78a6d8573b21348b36f4cca2e1839a31 ]
>
> Running 'make nsdeps' in a clean source tree fails as follows:
>
> $ make -s clean; make -s defconfig; make nsdeps
>    [ snip ]
> awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
> make: *** [Makefile;1307: modules.order] Error 2
> make: *** Deleting file 'modules.order'
> make: *** Waiting for unfinished jobs....
>
> The cause of the error is 'make nsdeps' does not build modules at all.
> Set KBUILD_MODULES to fix it.
>
> Reviewed-by: Matthias Maennich <maennich@google.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Jessica Yu <jeyu@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

nsdeps was introduced in v5.4

Please do not backport this commit.




>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 93c3467eeb8c9..731a2ce8a749a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -554,7 +554,7 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>
> -ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
> +ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
>    KBUILD_MODULES := 1
>  endif
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
