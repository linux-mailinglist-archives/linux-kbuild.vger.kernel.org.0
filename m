Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 614991AEE6
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727424AbfEMC1X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:27:23 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57694 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMC1W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:27:22 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x4D2RHb2019663;
        Mon, 13 May 2019 11:27:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x4D2RHb2019663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714438;
        bh=WhLWdZ+pu9RJTOAD/OapbUDCuOgdw4mGeEP2JnsK4PA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ncwlzJlRvZhTVI/c24kIR0JhwDmHCLdWvTaiJkBg884WQoR2dwGW7Y5Gh6VTFrjou
         PPfNfeaPW/WFIvrP9cFt8zFHgdF7akr1v2LUwMf3nEN2rdi30f5iWQMbFWzWwdXfxw
         vD6FVbAhOCxJtLni/ueyZ3/oe1q/TW4f7WcOEHeosch2tnpeo2eu7TDPfK0rDmp2sW
         Sq2AAkk6PfaoOgdmnTEoC3FiMgEsJymjG9NFBpvWvdSAn5ri3rEXeYiw9smhegWhzO
         amu0SmOrlgfeu62FnW8FfSAF2v6vQvzSAPtam5OSoqRBHey0Q6PuQEtO7M4JTfHrhU
         JPkBkXV8zuK1Q==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id v9so7045594vse.5;
        Sun, 12 May 2019 19:27:18 -0700 (PDT)
X-Gm-Message-State: APjAAAXIdujWZQJyLHskOQZnX7E2fVDQ0hJg4THTnZwldgDETk9TZy/6
        /JaQxjvTKqKNERCYMFF4/gEMTNPOgHHLj+q4xlw=
X-Google-Smtp-Source: APXvYqxwWDZEdYviObWMU+ViWmdcJ6KyG5WJOuuHs/jJ4hKsVtt3rkNjVZ8SaeUvM/4yB9DQRMBqZFKiQWLmZL4LyRk=
X-Received: by 2002:a67:f443:: with SMTP id r3mr12371953vsn.179.1557714437360;
 Sun, 12 May 2019 19:27:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190509024631.14406-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190509024631.14406-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:26:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQf3_mTpMwQ-sfxR9xsifGbOk5m7avO3kbj1C4CimW5aA@mail.gmail.com>
Message-ID: <CAK7LNAQf3_mTpMwQ-sfxR9xsifGbOk5m7avO3kbj1C4CimW5aA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove trailing whitespaces
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 11:46 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> There are still some trailing whitespaces under scripts/kconfig/tests/,
> but they must be kept. Otherwise, "make testconfig" would break.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/gconf.c                  | 2 +-
>  scripts/kconfig/lxdialog/BIG.FAT.WARNING | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index 5d4ecf309ee4..e36b342f1065 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -638,7 +638,7 @@ on_set_option_mode3_activate(GtkMenuItem *menuitem, gpointer user_data)
>  void on_introduction1_activate(GtkMenuItem * menuitem, gpointer user_data)
>  {
>         GtkWidget *dialog;
> -       const gchar *intro_text =
> +       const gchar *intro_text =
>             "Welcome to gkc, the GTK+ graphical configuration tool\n"
>             "For each option, a blank box indicates the feature is disabled, a\n"
>             "check indicates it is enabled, and a dot indicates that it is to\n"
> diff --git a/scripts/kconfig/lxdialog/BIG.FAT.WARNING b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
> index a8999d82bdb3..7cb5a7ec93d2 100644
> --- a/scripts/kconfig/lxdialog/BIG.FAT.WARNING
> +++ b/scripts/kconfig/lxdialog/BIG.FAT.WARNING
> @@ -1,4 +1,4 @@
>  This is NOT the official version of dialog.  This version has been
>  significantly modified from the original.  It is for use by the Linux
> -kernel configuration script.  Please do not bother Savio Lam with
> +kernel configuration script.  Please do not bother Savio Lam with
>  questions about this program.
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
