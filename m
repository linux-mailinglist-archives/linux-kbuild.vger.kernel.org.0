Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0103F2FD659
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 18:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390101AbhATRCc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 12:02:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732743AbhATRCV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 12:02:21 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4ABC061575
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 09:01:40 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id p185so8940080ybg.8
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zip1YNjoZXFgZ8lroULvsuiHYsaE4S6un/EkVy9J4nQ=;
        b=rkq48BkM1/dH4LDxPLmEIvYSQWvXf93lUmaFUZWrmGoO28g03x1j237DGaFFGSvbQq
         Z6kB2gIZs2p1/3sywlp10v80pisStM6DN2HvXhVpiKCEBdAI6oCZe+3dVAED9NDiuwLr
         /JPQNXxrTknEUZ2MpZvfjbOJpQ/vtErl5pxrCM9rFdzXLyJaOJ6P/oCq+XBcQhQQhSqE
         MpcdejhHwv6xDhx2agOUT3wah8og0hbLsNimRIbUIsnt6fPcODI4Cb5XJfPHk/uv9kbK
         auKQ1LnGLx9w3uR2DzDPCH1sv3HAA4JBMq3itwh1YDat+DtWVBwiIciZTHqIpZbHnlHF
         9qNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zip1YNjoZXFgZ8lroULvsuiHYsaE4S6un/EkVy9J4nQ=;
        b=JtNz8Q4FyczqWyi4SHCU/FaL0nQbDuMrxHVwgOoYlznsZ4hRl//1xQM30BbIdVW0ul
         Ix3pYWky2nS73kdPpVPN3iSP1PnWQ1OuSkcxhAqJJfrYfsElImCuoONASe7iy5002ddc
         oHuMI/7dAggjEGe+r9UNvIdZOG09uozeZBnog8VrOvOVTbxsANCYQ+OC1JiNS9SZaUh5
         nCw6yOxf6EuPn/ggyhJILB7FeRt6jer7vFn835J/0mfVWgf6Jk4WclxqPo+svtjUZsgX
         Ek83IA/dwiQxksZvNUooKtYwZo3rOr+6foZPEESFmuZsPGU3ozdsFAMV2D2h/DPND7Ew
         y4tQ==
X-Gm-Message-State: AOAM531TL++mtt/hU2NC2slLBshCl5nfWB2qfDBAFr+yfSFh0HxWdo0L
        5gFHeadHw1ZVUCVVUcDQYFqEZ8L8Xj26cHoLenH6Yg==
X-Google-Smtp-Source: ABdhPJwoXiCYrvCK7pZVgBOUHGw/w5iVrfobl6K0B5/haIGG5Z2zrY0RqZofY1TjUylAvW8z3QHlBLbTCubwe4PAazs=
X-Received: by 2002:a25:8b8b:: with SMTP id j11mr13833445ybl.310.1611162099713;
 Wed, 20 Jan 2021 09:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20210108003035.1930475-1-willmcvicker@google.com> <20210120142526.GA3759754@infradead.org>
In-Reply-To: <20210120142526.GA3759754@infradead.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 20 Jan 2021 09:01:03 -0800
Message-ID: <CAGETcx_a1-BrPfiKT0pXMkJ2gxMCBr2SSCyNij_3+vFXVKGQoA@mail.gmail.com>
Subject: Re: [PATCH v5] modules: introduce the MODULE_SCMVERSION config
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 6:26 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Fri, Jan 08, 2021 at 12:30:35AM +0000, Will McVicker wrote:
> > For example, we have a CI setup that tests new kernel changes on the
> > hikey960 and db845c devices without updating their kernel modules. When
> > these tests fail, we need to be able to identify the exact device
> > configuration the test was using. By including MODULE_SCMVERSION, we can
> > identify the exact kernel and modules' SCM versions for debugging the
> > failures.
>
> Sorry, but this still has no business in the upstream kernel as every
> change to the kernel is free to just change any API.

Sure, and this patch is making no claims one way or the other on that topic.

> That is whatever
> you test there is a completely unsupported setup.

Plenty of distributions maintain stable kernels based on LTS. We've
done that too and we are able to do LTS kernel binary updates (so
better security) without waiting around for the modules to get
updated. Keep in mind, that not all modules might be updated at the
same time either. That's something that's definitely feasible and
works.

And if the API changes, MODVERSIONS catches + CI helps catch them. And
if something slips in and things fail, we want to find out what kernel
source was used vs what module source was used to debug the problem.
This is all relevant even for in-tree modules.

> More importantly the "scmversion" of a module simply does not matter,
> as we only support modules from the kernel tree and it thus must be the
> kernel version.
> be supported.

This is all talking about only in-tree modules. If you update the
kernel vs the modules separately, the scmversion does matter. Also, by
your argument, the vermagic or srcversion properties in a module
shouldn't be there either.

> You are still trying to sneak out of tree module infrastructure in here
> with a bad cover story.  Please stop doing that.

If Will needs to maintain a downstream patch for adding out-of-tree
module support, maintaining this additional patch isn't going to
significantly increase his work. But he's trying to upstream at least
the part that's useful for upstream. This is still a real problem for
a device/board that's fully upstream. Please stop ignoring real
upstream problems just because it can also be a problem for out of
tree modules. This is not how we encourage folks to upstream their
changes.

-Saravana
