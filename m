Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0276D2CA482
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 14:54:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389943AbgLANyi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 08:54:38 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:37562 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390730AbgLANyh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 08:54:37 -0500
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0B1DrQTV021869;
        Tue, 1 Dec 2020 22:53:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0B1DrQTV021869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606830807;
        bh=Ok1QqgsbTvLJR9T2w9uzm16olUMbK7QKnvuiz2CLeqM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qN/IjIZBhMZoBtAgolas/uVF3Rp/Hk0w0pMlmeOop7VUsl/YaBH2movBpJWDegVJA
         vnxeRoD6m2RKQZCbqbCKvRi38r+rGpKkt/67VyTCB0b1uhKJC4Q3zf05t0W9Wf+9gi
         zS2wc/t3UJnZQz5jD9p+lnnGB5g0gGxnL+Pk2clHnx+lEPcV6tT/qblqHk6BugwW0j
         wEoPSj9tVpVUlYOjGCnzilyrjyZUnHN+lX/5F1AvnO1l1PweA91a8/l7n64FAGEviY
         3smNN36Wf4UfKU9sAdj7a4BEbKLtTU5MhX6UYu9WWFzIHQWIWZATgOza97Tb93vGyO
         m+29oJTO4+/bw==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id bj5so1184179plb.4;
        Tue, 01 Dec 2020 05:53:27 -0800 (PST)
X-Gm-Message-State: AOAM532H5py1JWCD8BMFJkeYbqoyMvvBzYj4o/FNnpa3guZzbA4gx5Sx
        gGcQ421QlcO6KJihLxKdotXHIII3PDr4XH9Qt18=
X-Google-Smtp-Source: ABdhPJytF7/TSiOE8RQwh1z0tE6AjvW8ZFpYvV7UD1hS+NhCt//ZFmmGhZxWq0ziQeW4eXdFQh/WV0dS2BmI+kOqu8Y=
X-Received: by 2002:a17:90a:5905:: with SMTP id k5mr2779502pji.198.1606830806327;
 Tue, 01 Dec 2020 05:53:26 -0800 (PST)
MIME-Version: 1.0
References: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
In-Reply-To: <1606828650-29841-1-git-send-email-asmadeus@codewreck.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 22:52:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQP+e18qAVEUJvmkwpCwTtS4Auqth7u+xPW6pBbE_+z0A@mail.gmail.com>
Message-ID: <CAK7LNAQP+e18qAVEUJvmkwpCwTtS4Auqth7u+xPW6pBbE_+z0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ld-version: use /usr/bin/env awk for shebank
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 1, 2020 at 10:18 PM Dominique Martinet
<asmadeus@codewreck.org> wrote:
>
> /usr/bin/awk is not garanteed to exist (and doesn't on e.g. nixos),
> using /usr/bin/env to have it look in PATH is more robust
>
> Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
> ---

Both applied to linux-kbuild. Thanks.


> I've been carrying these two patchs for local kernel development on
> nixos for a while, I don't think it'd break anything for anyone so
> might as well submit these -- please consider it :)
>
>  scripts/ld-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index f2be0ff9a738..05476b8f8925 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -1,4 +1,4 @@
> -#!/usr/bin/awk -f
> +#!/usr/bin/env -S awk -f
>  # SPDX-License-Identifier: GPL-2.0
>  # extract linker version number from stdin and turn into single number
>         {
> --
> 2.28.0
>


-- 
Best Regards
Masahiro Yamada
