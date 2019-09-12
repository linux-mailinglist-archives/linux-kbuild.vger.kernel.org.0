Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 104ADB064E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 02:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728768AbfILAxC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Sep 2019 20:53:02 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:55862 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728762AbfILAxC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Sep 2019 20:53:02 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x8C0qemV031825;
        Thu, 12 Sep 2019 09:52:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x8C0qemV031825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568249561;
        bh=NKUMKkNtqrTDWVT1RfLccaVJ+xpM7V6DZTRRz/GPGuw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RzDfyOI55EA7WF2xdjs7tkxM22KbWfvxPD1sifXO1FtLjiIfV65YxTizktZcuyqj8
         c2bfyOHKAFI9geummPzJ7TjFboyxopJcSgnprroGE/FobXeHsAqgCtHGvOE3W5gKqe
         ouH3pFBjTf55YJHAdv5aO85BZMm99/Kh1bb7EpUMjqJFFNSTEhHvUCK9n1dINncUAs
         N7ocOOdaurLi6hQk9iI51a3SxL8s1el/rqU3nFx6IB7+p+1eqnAqTzXiU+HUV4WrfF
         s+//lApTUSIifRjGTJ9mfsQmB4qyV4qkwM21WzJKS6sX3dfh4pSIlabRpn2fC40jdT
         473stFcb60nhA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id m22so15039440vsl.9;
        Wed, 11 Sep 2019 17:52:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWsDqiZ7lUOhv7IfQ3BKSp1ZgXVHWtyRvyHg8/vMDuDt4Y6qXo5
        hO3m4R8bIJXclAVVJF7neScH3LyoKWfStb+E7Zs=
X-Google-Smtp-Source: APXvYqzqoiDkP84GVdQRATv6NHL348lP9+WwfJKOqB3cvmaSODCnoCOjiv71A4zCzLOntY7ISObv/nmkVN1okIGiPpM=
X-Received: by 2002:a67:1a41:: with SMTP id a62mr22692085vsa.54.1568249560218;
 Wed, 11 Sep 2019 17:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190911173453.958-1-cai@lca.pw> <CAO4ZVTMUMKMOqef5yV=5bwHLXLMsNtTegGGMkw0GbFaDHvrV6g@mail.gmail.com>
 <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
In-Reply-To: <08E1DEDD-D82F-41C1-966B-ECCE445C8FA1@lca.pw>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 12 Sep 2019 09:52:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASuqYP6kCvkkWQSw1=_DqyYPjgGwxjg3yCtXqyB2KKqrg@mail.gmail.com>
Message-ID: <CAK7LNASuqYP6kCvkkWQSw1=_DqyYPjgGwxjg3yCtXqyB2KKqrg@mail.gmail.com>
Subject: Re: [RFC PATCH] gpu: no need to compile drm/ if CONFIG_DRM=n
To:     Qian Cai <cai@lca.pw>
Cc:     Maxime Ripard <maxime.ripard@anandra.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        maarten.lankhorst@linux.intel.com,
        Michal Marek <michal.lkml@markovi.net>, mripard@kernel.org,
        Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 12, 2019 at 2:41 AM Qian Cai <cai@lca.pw> wrote:
>
>
>
> > On Sep 11, 2019, at 1:37 PM, Maxime Ripard <maxime.ripard@anandra.org> =
wrote:
> >
> > Hi,
> >
> > Le mer. 11 sept. 2019 =C3=A0 19:35, Qian Cai <cai@lca.pw> a =C3=A9crit =
:
> > The commit c0e09200dc08 ("drm: reorganise drm tree to be more future
> > proof.") changed the behavior from only compiling drm/ if CONFIG_DRM=3D=
y
> > to always compiling drm/. This restores the behavior, so people don't
> > need to waste time compiling stuff they don't need.
> >
> > Fixes: c0e09200dc08 ("drm: reorganise drm tree to be more future proof.=
")
> >
> > You are missing your signed-off-by
>
> That is intentional because this is a RFC patch to gather the feedback as=
 I am no
> expert in DRM and may miss something important.
>
> Once people are happy with it, I plan to send a formal patch with Signed-=
off-by.
>


CONFIG_DRM is tristate.

Your patch requires everything under drivers/gpu/drm/
modular when CONFIG_DRM=3Dm.

At least, drivers/gpu/drm/drm_mipi_dsi.c
is built-in only.

I guess that is the reason why
they use 'obj-y +=3D drm/'.


In other words, if you are able to
make all the drm code modular,
your patch is applicable.


--=20
Best Regards
Masahiro Yamada
