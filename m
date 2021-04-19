Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F67F363B37
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 08:01:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhDSGBs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 02:01:48 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:26271 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbhDSGBr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 02:01:47 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 13J614fR006538;
        Mon, 19 Apr 2021 15:01:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 13J614fR006538
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618812064;
        bh=LjMjQplpEZKJQ2+adiMzT+2ffkJUxksC9SdRLj29amQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M1vlZdMRAhNuL1wLw0z3bFue338JiinXUxj2Ck1FHTmZ0WX4rxzWA9R/X1fzHhP+r
         Y/Jb6j4Rtrsz1WfgTW4oAntkUytqW35kqDu3neEdyMWZq7oSea3WU80pReTO8tT6B/
         kCca9aoUEcP8J8uXid7+HOHgW+bpSkzsHzZCyDPkwYQg8ZjdFBMZwfvCBE7NZy5iZq
         /CI0MjLnvM6aWdz68+ErR5j9/NnZnoa/ZjuWohYsv6fGSoIyT2QpMcmMz/ibpIQ02E
         wBPtCGvVkfh+6WhHfZM1LipaAGhjUWQT28IfsbCWBiY5db5IW2bBUxwQUiUEdPRG3r
         vScnen/m6vwcg==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id u11so13613096pjr.0;
        Sun, 18 Apr 2021 23:01:04 -0700 (PDT)
X-Gm-Message-State: AOAM531MmFYGUB8JIEnx3MjDfc3tbtKhl1Lqj/WsJFyoeJxdE6CFfNWU
        gXKA7atUdOa012mtPtL0J3PHEJIP4QOghSBv0zQ=
X-Google-Smtp-Source: ABdhPJwjYnINgjNogQsvFM/RIaLu0R3cHoylWXMrTKr3zAX447xpBYJPM37YIRS25P8fsvNyiAaMhjewZ8aiIDXnfwU=
X-Received: by 2002:a17:902:8bcb:b029:ec:a192:21cf with SMTP id
 r11-20020a1709028bcbb02900eca19221cfmr4781309plo.71.1618812063849; Sun, 18
 Apr 2021 23:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210418055123.14085-1-rdunlap@infradead.org>
In-Reply-To: <20210418055123.14085-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 19 Apr 2021 15:00:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQsXh5XRh9MdasczTu=gbKz+6nfw+_596PU-A1+VYdCRg@mail.gmail.com>
Message-ID: <CAK7LNAQsXh5XRh9MdasczTu=gbKz+6nfw+_596PU-A1+VYdCRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: highlight gconfig 'comment' lines with '***'
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 18, 2021 at 2:51 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Mark Kconfig "comment" lines with "*** <commentstring> ***"
> so that it is clear that these lines are comments and not some
> kconfig item that cannot be modified.
>
> This is helpful in some menus to be able to provide a menu
> "sub-heading" for groups of similar config items.
>
> This also makes the comments be presented in a way that is
> similar to menuconfig and nconfig.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> ---

Both applied to linux-kbuild. Thanks.




-- 
Best Regards
Masahiro Yamada
