Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF27014E0D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jan 2020 19:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbgA3SbY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jan 2020 13:31:24 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:47662 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727498AbgA3SbX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jan 2020 13:31:23 -0500
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 00UIVEkL013223;
        Fri, 31 Jan 2020 03:31:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 00UIVEkL013223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580409075;
        bh=XuH0JX7E36W9OatSjcjA8tbzbywGpPpH/LnDn4AAfHM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nKE7YNoB6TgH2RHD1ZxsfCRVx3ByHYGbCp7UhHfZMZ4heEg1WnqHGPd7qPek+OpH7
         sIH3ACHwQEBtzIZjSXWfHWtmj3qTBDEHhipyryGGRKc03DTRkWZtnH4u1oNnkFC+gz
         U1L2b6xdJV7nrvbAX3KHpB7RTrIzLvgdN/fPhoKEJYQ8SNTQpMGSp30WMdcMNeRInH
         g2D0bSXVqGJ8N0aeg+7lYTcbrdB3KSKseTqAqfrAJ6INvGJeTZns8mWcH9BIsvyXCh
         og+bFpj/6SLXRrxAyucekMYuXP9U/V5spEv54e7yp1hHuV0wWKCOobCFu3A5HnxS/1
         +uACf+zK528Tg==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id a12so1558302uan.0;
        Thu, 30 Jan 2020 10:31:14 -0800 (PST)
X-Gm-Message-State: APjAAAVbOjPQ+NYMlhy2+nzhel28QgOTQhugSfCfMSG5bT55yTojtbNR
        06oexo7lMSARzHcrWAFhqDz6iGiW2GzzIFeQFDg=
X-Google-Smtp-Source: APXvYqyLrFd4ATzAaclnEJKw2mEYwsjvMCVB5Hh1ERU0KpJzsIbvbDBd2WNuKA/LbBsDAX67h2WkoPfbO21Sd/UIHX4=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr3470358uay.25.1580409073723;
 Thu, 30 Jan 2020 10:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20200130122221.30029e32@gandalf.local.home>
In-Reply-To: <20200130122221.30029e32@gandalf.local.home>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 31 Jan 2020 03:30:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR1AJFDahD6cB_MryBd-79N_T5O9WV3CMEA+HOCDXZEig@mail.gmail.com>
Message-ID: <CAK7LNAR1AJFDahD6cB_MryBd-79N_T5O9WV3CMEA+HOCDXZEig@mail.gmail.com>
Subject: Re: [GIT PULL] kconfig: localmodconfig: Minor clean ups to streamline_config.pl
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Steven,

On Fri, Jan 31, 2020 at 2:22 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
>
> Linus,
>
> Just a couple of clean ups to streamline_config.pl
>
>
> Please pull the latest localmodconfig-v5.6 tree, which can be found at:
>
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-kconfig.git
> localmodconfig-v5.6
>
> Tag SHA1: ae4a98169606cf4b84bce31c4ec0003da8dd60e6
> Head SHA1: 37bf46aae4acb76e7cc0fb4d1131ece682f456d4
>
>
> Masahiro Yamada (2):
>       kconfig: localmodconfig: Remove unused $config
>       kconfig: localmodconfig: Fix indentation for closing brace



I know you are the author of streamline_config,
but actually did not know you were collecting
patches for this particular file.


I did not receive a notice email from you,
nor did these commits appear in linux-next at all.
Could you send a notice email when
you pick up a patch next time?
(Sorry, I also forgot to send a email.
I will drop them from my tree.)


Thanks.



> ----
>  scripts/kconfig/streamline_config.pl | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> ---------------------------
> diff --git a/scripts/kconfig/streamline_config.pl
> b/scripts/kconfig/streamline_config.pl index 08d76d7b3b81..e2f8504f5a2d
> 100755 --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -56,8 +56,6 @@ sub dprint {
>      print STDERR @_;
>  }
>
> -my $config = ".config";
> -
>  my $uname = `uname -r`;
>  chomp $uname;
>
> @@ -374,7 +372,7 @@ if (defined($lsmod_file)) {
>             $lsmod = "$dir/lsmod";
>             last;
>         }
> -}
> +    }
>      if (!defined($lsmod)) {
>         # try just the path
>         $lsmod = "lsmod";



-- 
Best Regards
Masahiro Yamada
