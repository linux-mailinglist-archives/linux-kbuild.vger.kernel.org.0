Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAC26253125
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 16:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgHZOVs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Aug 2020 10:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728074AbgHZOVo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Aug 2020 10:21:44 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A8EC061756;
        Wed, 26 Aug 2020 07:21:39 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id f42so1587666otf.13;
        Wed, 26 Aug 2020 07:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=smJelHhXCFqUrnqw/FoLQWcE9qNM/53r52BBZYnwV+A=;
        b=uTZQ2BzRUusufQkIN7bpH6dwWZ7Pftz/1EmeTPFXcu+97M9aJ0nMwyG6sJAOrDjPgB
         3TjpliF1grzYWO2EPOl4PXHMKODNC+k2rcpMuFnSXSOUCH6s9WKv6WHGHKM6+X1XUhNQ
         /HXbz9VvkWbaDE82om5yqA0s6GS8VUAR2g3nl8ildjetqnqvKyG6aIOVITQzvrGoaXQA
         y0eKhmVV6pjea5m/xhWQcPMrm/DDG2F9z5jzlDPNI/UGwGm/tHczLDEOwOTW6ZUl5NWb
         ZNI8okDQvKBS7yQP7+okBseY7DovbX9s7/cr+4tb0nxp8En6inmXYRgUYfxRkoyaS5XA
         hzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=smJelHhXCFqUrnqw/FoLQWcE9qNM/53r52BBZYnwV+A=;
        b=rji/xyPQLlyAs0yQjYJUDVvEo0vYFw5h6xcm4WPf6aibOh6HHRBCNG3l5zA64HSqNC
         eabExy1o5/W3+hYDzpZQXuEPqQZxkESduVWUopJVHulTtjRRDBYQlFOa0B6NS9WYlaOg
         bLYOTkYwpLnwfmvsVgvM02qfHvi0N6sW57wbZyslrTQ3O0/QRxs1HpvtoYGQ3Qx8h87g
         PEIJsel5PTm3CSP/Zjet361DpB0h2aMeaJIgtgpE7IppeiwEx83fYVNphlxWptYmkGOP
         iY4EQ+pEiUXD1pz7HXtE7MA3Yk+hmFEpG3vZZfTwZBeHusxoBoisB+/b+x48lA67BW2i
         T5AQ==
X-Gm-Message-State: AOAM530LQ8LKDUwg24/Z1pB+kWHzJithELjeEW646VAnq4FUAe9IpjPs
        qol8iFB6z/uG38P0WYBLnLEGbeGYIEeGBgXQJgs=
X-Google-Smtp-Source: ABdhPJx7PwJXzIdIpieYzcLvZfV6rtiwqDpJdtMRBtNtnkHlzHm/T7vT7m7Io4qbIIpJgFEKfG8QlNJZ7P6+1C9HgEs=
X-Received: by 2002:a9d:48d:: with SMTP id 13mr10904797otm.9.1598451698912;
 Wed, 26 Aug 2020 07:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200816123248.97770-1-sedat.dilek@gmail.com> <CA+icZUUnP5JQCzMG=pMQFwqQBHy78au6E0eJCod0YOARbHoLrw@mail.gmail.com>
 <CAK7LNAQzGLCeEDHHEAzMtEBO_B3D0tGwe7n5fLesdXca-+NL+g@mail.gmail.com>
In-Reply-To: <CAK7LNAQzGLCeEDHHEAzMtEBO_B3D0tGwe7n5fLesdXca-+NL+g@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Wed, 26 Aug 2020 16:21:27 +0200
Message-ID: <CA+icZUVoKa15ubmcYGToOF2-2P7L0REKWsAKTXqmiP+Wo3Bo4Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Simplify DEBUG_INFO Kconfig handling
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 26, 2020 at 3:43 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Aug 26, 2020 at 9:04 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Just a friendly ping.
> >
> > - Sedat -
> >
> > On Sun, Aug 16, 2020 at 2:32 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > While playing with [1] I saw that the handling
> > > of CONFIG_DEBUG_INFO can be simplified.
> > >
> > > [1] https://patchwork.kernel.org/patch/11716107/
>
>
> Applied to linux-kbuild.
>
> Sorry for the delay.
>

No problem.

Thanks.

- Sedat -
