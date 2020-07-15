Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABFA22131D
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Jul 2020 19:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgGORDC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 Jul 2020 13:03:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbgGORDB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Jul 2020 13:03:01 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA64C08C5DB
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Jul 2020 10:03:01 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t6so2638801plo.3
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Jul 2020 10:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dHGDqDpJQH4YoOfT6AcOSJnWTTovtZLnMGH7dmTa0Ck=;
        b=obRDuUAdaMmGPgvDxY4WMBIgCaUylyDUXQ8rQLlL9e9rgO61u4EuZXp0bo4/7tygXi
         c3snM96+gdf2cigjK+jL9gVfupvnkb0bht0jZny6Zk/XDrFd2w4yEPn4L/045ANV8CNP
         e2q+KpXCKg8K03+nsiDVwNo3vU5g4cz9dhfT0JYS2Ouj0L50bFmEAz88//5CDbgJpDwW
         JrsC3aL2z3XyCAXf0r6cdp3ZHX1T/pUscINoaAy93TxSDVPDk/ISdDdz5pAFStvdQPxG
         T2sxh3ER7U45hQGxKOia2ShlQydm481qPmbDTgpWwtWNULbPIteFbugPPCIzkYLvIw32
         DYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dHGDqDpJQH4YoOfT6AcOSJnWTTovtZLnMGH7dmTa0Ck=;
        b=suBvY2gIP+sWV0Ygl43Y0+RrGfverHBcktkndofqW02S0GjFgYU3W+I6RYeK3SpTVv
         QXXGElyLTTc+CGqCYuXF13sugf5H6ZlYsGejEqS06c9PoTo81P2xhEnZnGRfZp6oKlyY
         MyupUkxtXe9u7qnnByS7bImsiPkvfYDcTNHi6TxHQnWaCFS6psHTVbkafTCJy6Gg1E1p
         DEhKLN+6f6G4LAopgbwKLoXxlH9fVKMtWKsZPdKdN8tH11V6d4FjjykIMaKxX6SSXD3X
         MnzlQwcxMkrkcJv6QrNQ8wUy3XbOvn6mRtUnFxE15n0dhgvqvBi4FLvA3h67Wk30BVap
         JMfA==
X-Gm-Message-State: AOAM533E2kBEGzG6oxrQglb/6ZGdVewMOVBLMVwx+CuhVpJotZ7VnvRB
        E8bkRgvrSNL+oMtOmEUJODdMjwxD9bhnBAAsOJv0sw==
X-Google-Smtp-Source: ABdhPJwyGjUpfY+rpN8FySCcoP5Xxs6lC4Ir9qWwMIpCHB+/hlC3QOGjQEtXEPaWQqebmMgg4nthk9jPapMr4ZPmElU=
X-Received: by 2002:a17:90a:d306:: with SMTP id p6mr541629pju.25.1594832580277;
 Wed, 15 Jul 2020 10:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200715142631.GA3721@mritunjay-Lenovo-Yoga-S740-14IIL>
In-Reply-To: <20200715142631.GA3721@mritunjay-Lenovo-Yoga-S740-14IIL>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 15 Jul 2020 10:02:53 -0700
Message-ID: <CAKwvOdnTfOgxroWTOJ3RMf9wt8+CsxYCp_e+T7rfh5Y0_1RrDg@mail.gmail.com>
Subject: Re: [PATCH] Modified Makefile to print -eudyptula in the version string
To:     Mritunjay Sharma <mritunjaysharma394@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 15, 2020 at 7:26 AM Mritunjay Sharma
<mritunjaysharma394@gmail.com> wrote:
>
> Signed-off-by: Mritunjay Sharma <mritunjaysharma394@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 0b5f8538bde5..d7897ce5ab23 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -2,7 +2,7 @@
>  VERSION = 5
>  PATCHLEVEL = 8
>  SUBLEVEL = 0
> -EXTRAVERSION = -rc5
> +EXTRAVERSION = -rc5-eudyptula

oh man, I love the Eudyptula challenge. I remember running through it
not too long ago.  I don't think you're actually supposed to send this
change though.  Anyways, good job, looks like you found the right
reviewers if this is a change we'd actually want to commit.

It's usually expected to have more in the body than just the online
summary and your signoff.  A comment review comment is "-ENOCOMMITMSG"
which I think is its own meme.

>  NAME = Kleptomaniac Octopus
>
>  # *DOCUMENTATION*
> --


-- 
Thanks,
~Nick Desaulniers
