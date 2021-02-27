Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5D4326C0E
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 08:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhB0HAl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Feb 2021 02:00:41 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51262 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhB0HAl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Feb 2021 02:00:41 -0500
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 11R6xZeD003195
        for <linux-kbuild@vger.kernel.org>; Sat, 27 Feb 2021 15:59:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11R6xZeD003195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614409175;
        bh=gjGuLN10r+Spw4hXXI1/ZeHFeqI2b91gozQ6xa7eLd8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PCogB1C7odsRGbL9CfGYOGDzn1nskxExKQB5JytaL3pMyE0NJ0uzDS7RF97XnAXao
         Gy1zDvF0zdjBPfLI/kmr3T+B4XqlZw0Vnwk0edTZF115wYaB4S5TYM67adHjKGgC0I
         oA8jQYNWM6CTmI9cZNkGpBqEoqS74GDR5MAXccWfJdReeZJnQerprnBkbWuotff5Rf
         DEiQhM/vpVFjQ3uLBtbUm5eAGK+lK0OIctQWwUWS+QQA1J7L+7yFd0BVn1gjWeyHl9
         N3vcLep+PiewH2AMIl4J+aaP3lAJFJwW7VM8x/w06k8ej5pZZfdFxOz4UCRTCZON5H
         m29wspQLe1t8g==
X-Nifty-SrcIP: [209.85.215.172]
Received: by mail-pg1-f172.google.com with SMTP id n10so7618296pgl.10
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Feb 2021 22:59:35 -0800 (PST)
X-Gm-Message-State: AOAM5329WGwAkQcB+KlrkGCdx3O2PgeyNpFjVvtvpUZca509aUij+Ijp
        7GIHwCiISRMl3+D+rMvT1waStz85jydWw/l1omA=
X-Google-Smtp-Source: ABdhPJzWhskt08NLkC8ThqWRqsKDwlhT4lAuUupaRMriQJqZLpt2nB2wjP69caiWISgSB9L+Tndc3AGQe6w25T0D6Kk=
X-Received: by 2002:a62:1412:0:b029:1ec:bc11:31fd with SMTP id
 18-20020a6214120000b02901ecbc1131fdmr6460904pfu.76.1614409174878; Fri, 26 Feb
 2021 22:59:34 -0800 (PST)
MIME-Version: 1.0
References: <YDm7iZFSxLypXRg5@lady-voodoo.scabb>
In-Reply-To: <YDm7iZFSxLypXRg5@lady-voodoo.scabb>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 27 Feb 2021 15:58:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARQi2fMEDKP_r8wviekwc3WSj6=GBVh5B3hmtVLwz88ew@mail.gmail.com>
Message-ID: <CAK7LNARQi2fMEDKP_r8wviekwc3WSj6=GBVh5B3hmtVLwz88ew@mail.gmail.com>
Subject: Re: [PATCH] build: print short version command only for quiet build
To:     bertrand@jacquin.bzh
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 27, 2021 at 12:29 PM Bertrand Jacquin <bertrand@jacquin.bzh> wrote:
>
> On verbose build, most shell scripts enable set -x making short version
> command output redundant. On silent build, no output is expected. Hence
> the short version should only be printed for quiet build.
>
> --
> Bertrand


It is true this patch will make the short log policy consistent,
but V=1 builds will become quieter than the normal builds
in some places, which is odd too.

Probably, this is not the direction I want to go in.



-- 
Best Regards
Masahiro Yamada
