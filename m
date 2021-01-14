Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9192F586F
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 04:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727039AbhANCYg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 21:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbhANCYf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 21:24:35 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39F25C061575;
        Wed, 13 Jan 2021 18:23:55 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id w1so3923574pjc.0;
        Wed, 13 Jan 2021 18:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8m3H5QC/MlByR96wrIq8TBNeXOK8D2jl9OpLzaXEOXM=;
        b=WsknhtEYMWb2HbUPemXtcY45PVhieKGmEHxaaIlQ7QUoD/CCcnhlu1QWchWKI/OTtf
         HHf980xd59sONqZxvSCYNkHCGbznJ4sUuPHB3h8quces3YNrwXi/8ZQF7/NuTDooWLmH
         IQx/tjJJPGyVH7jxwotlem/Zyda2uGiEaIIhT2DC21oyEnG2GC3jFeurA4yGoeqvIext
         S+yG3YNWDEgTD4c0fSrSFypI0RTEeyt758UneRkiQ611eceQBru9DyUx8ImxAMUg+Loq
         g3yo0GgQmHsXK4AmqhG4JlDekK+9uicxr9alhoM05nGIl5+YVxq1Xsran0+01MQ1JAcB
         iB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8m3H5QC/MlByR96wrIq8TBNeXOK8D2jl9OpLzaXEOXM=;
        b=tfqD6led2BSlIXmKt31tEWmiCSJuDnHwZvXCkM3pNt+4U6FLba1kU4JPHgGBg0Miu1
         0CTwnM1O1F8AkhWya973Iqa0nEzVQfBgWwfpIuBakFduX6k6ixHtTu2HLtgKGq9MA/nC
         uMU/jNHEHPpDvNGC2DXjtEJcWbIOFXEffv+lCF6T3KuAQ17bmtwk1C+vsEdzTybG90Lu
         cN5ErvbCnod7K6pNgaGmiIw5lEKhF1X+pjbmWI60nyXqvEwn6Bllo10HRF/XtHbuyeFj
         onPDrcPIvM/0khONO1lZZXSmx4NWRgEB+mvSD8k6HhWUxGDmLoYfb9WvvwqY6CSfC0Rn
         GWPQ==
X-Gm-Message-State: AOAM533m+TYSAx+vnyPIEyYQLvuArrxTaDggsmGxVDe4bpU65aw38ZTD
        7kkhVFye9FaV9weQtyWX/k0=
X-Google-Smtp-Source: ABdhPJyrp53u1V+Rw9s2PJshoglaAcYbe7HYRmBm4YtRJUE4uR1nTalkrPlPcdm6NX8fgz8/cWzxwA==
X-Received: by 2002:a17:90a:bf88:: with SMTP id d8mr2572623pjs.124.1610591034728;
        Wed, 13 Jan 2021 18:23:54 -0800 (PST)
Received: from Ryzen-9-3900X.localdomain (ip68-104-204-241.ph.ph.cox.net. [68.104.204.241])
        by smtp.gmail.com with ESMTPSA id z5sm3680920pff.44.2021.01.13.18.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 18:23:53 -0800 (PST)
Date:   Wed, 13 Jan 2021 19:23:52 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported
 architectures
Message-ID: <20210114022352.GA9913@Ryzen-9-3900X.localdomain>
References: <20210114003447.7363-1-natechancellor@gmail.com>
 <CAKwvOdnJ0VUjTX-cyLgtHvy68DHG1VMj7s0huk_FKh1E9pH9Cg@mail.gmail.com>
 <CAKwvOdmr7RttdM25wWKiV8t+tzn8W-C_U6avwrQXQWphT8XhXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdmr7RttdM25wWKiV8t+tzn8W-C_U6avwrQXQWphT8XhXQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 13, 2021 at 06:05:32PM -0800, Nick Desaulniers wrote:
> On Wed, Jan 13, 2021 at 5:19 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Patch looks fine, but `make -j htmldocs` seems to be taking forever
> > for me so I can't render it. Is this a known issue?
> >
> > $ make -j htmldocs

A clean "make -skj24 htmldocs" takes me a little over three minutes or
so on my Ryzen 9 3900X. Just to give some perspective.

> Just took a while, lots of warning spew (but not from this addition AFAICT).
> Reviewed-by: Nick Desaulniers <ndesaulnier@google.com>

Thanks for the review!

Cheers,
Nathan
