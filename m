Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6A9305852
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314214AbhAZXAm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:42 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:17200 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727923AbhAZShh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:37:37 -0500
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 10QIaGw3020487;
        Wed, 27 Jan 2021 03:36:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 10QIaGw3020487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611686177;
        bh=jdWLcQFJpvkL7fnNbIXEjnV5zSV4ldy1W6fJJer0SS0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vZ/bW+lTZyrd1ERgU+miNz8+GOlqwTLVOxxzyQasaF86h98Ay6qOjXhWuULGJqKM5
         4z0X+NPL3o3SXxb8sugDW+V96GjyO8LJGIbkTltMuPaaexC7hTuXQymVd9kVXx3xIt
         M59p3RVAhxPGJIbLGtDIMcTEHzCk3AuPUHHNzVXWI4h8HM9cXZOXZD1KbO7F0Xuq+O
         IDejtgYMTP+WsY2imeqglLzgoFd263QtQdDQft8FNDcAwrztsHTgHzlDmNfWkXy7sZ
         gHs/PaHuMLLlXqWAx95l8qKaJof9ym1H10wBL2jg72B+onuMC65bDq1FCmdLPAfw3K
         ZwGcG9UUQ2o+g==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id l18so2751623pji.3;
        Tue, 26 Jan 2021 10:36:17 -0800 (PST)
X-Gm-Message-State: AOAM532JH5rHQWuJ1wk8pqRPf/4+Y7+rlW6Ah8pXVbw1sRTqkzUqYtDd
        F9PFlzGJkbhzJAl0UAi4uoQcDbd0rt3uOjcqz54=
X-Google-Smtp-Source: ABdhPJzm8VWDgbWt/Qh9yT3e9UPSeoJupJWOrfVdaMJGhEFCxF7zQGgkjL8RLxx7C1vvctvqdHBbnBzSIJslbdB9RU8=
X-Received: by 2002:a17:902:a5c5:b029:de:30b0:f1d with SMTP id
 t5-20020a170902a5c5b02900de30b00f1dmr7207458plq.1.1611686176307; Tue, 26 Jan
 2021 10:36:16 -0800 (PST)
MIME-Version: 1.0
References: <20210120062351.3011786-1-masahiroy@kernel.org> <20210120213929.GA875847@robh.at.kernel.org>
In-Reply-To: <20210120213929.GA875847@robh.at.kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 27 Jan 2021 03:35:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQe9Vq4KEZJwqL=3etTedGVnieKA5vyVoXFr7-a03Nwgg@mail.gmail.com>
Message-ID: <CAK7LNAQe9Vq4KEZJwqL=3etTedGVnieKA5vyVoXFr7-a03Nwgg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use always-y instead of extra-y
To:     Rob Herring <robh@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        DTML <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 6:39 AM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jan 20, 2021 at 03:23:51PM +0900, Masahiro Yamada wrote:
> > As commit d0e628cd817f ("kbuild: doc: clarify the difference between
> > extra-y and always-y") explained, extra-y should be used for listing
> > the prerequsites of vmlinux. always-y is a better fix here.
>
> prerequisites

Thanks.

I fixed it up, and applied to linux-kbuild.



> Glad to see this clarified. I think just tried both and picked one.
>
> Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Documentation/devicetree/bindings/Makefile |  8 ++++----
> >  drivers/gpu/drm/i915/Makefile              |  2 +-
> >  scripts/Makefile.lib                       | 10 +++++-----
> >  scripts/gdb/linux/Makefile                 |  2 +-
> >  4 files changed, 11 insertions(+), 11 deletions(-)



-- 
Best Regards
Masahiro Yamada
