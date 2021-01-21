Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB512FF01C
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 17:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731880AbhAUQXA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 11:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733007AbhAUQWz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 11:22:55 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88FBC06174A;
        Thu, 21 Jan 2021 08:22:12 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id u17so5149546iow.1;
        Thu, 21 Jan 2021 08:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pOZTpMXT17PVYMkulSbikIGTBpiuv8HOqsaxEWDtVj8=;
        b=A3vzMQb/36J0lVy1OgWr3dblEGH46YVOUARzBjLKwh4wXOIuveHBCLjBoTEbDsJV8i
         PPmFl0n5n0U10vZncreFQLS7jKCTyWNF2CXZ0ERHcCe3qt/MCxmMcjuiPo5TVnQsYoAp
         1esqElXwHTmxMxxpJcVg+otxUpi7POoTTcZ6JKN+3Rob7dCLemR28AE/z3Y9x3ziW9nr
         iH1KmeEK2rW9MJZjpvDpSyzgczGftUwlGsfR92iyUWiSJZYINffOZHkRcBtElAomU3O2
         rIjwmN8cHT95xar57P4J7VBHdoUm9BMq8xFvAzruQdwGWB/qwypE+WwWqO8VQnwvaynQ
         AJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pOZTpMXT17PVYMkulSbikIGTBpiuv8HOqsaxEWDtVj8=;
        b=E5FjXGJIEWcdO+7+JSlUBIpyOQmXj0DNHt0HxlH2LLE237DEnRjwe6NlBkQzWQenFD
         O47adZEsisRyWl7pNlb28E4TYmBC/fRPCyMSA8SvHAM3EkwTLE3Xkga9Rane+oJt/EjV
         SDfMNurUW3o61TSbFfhbXUEUBWsQJctVKlnqaygO9OsPa0XHZ7mmpGGxq1L1etR/bPI3
         wWG5seIhuP1MBfUI5azd4bXtintHXyQ2iImhRHGhXj/sD9IYTHTOci0zDedPsBBtmggg
         QaUtLuL/UXKoNcmd2cBHPxjP4vqIxaLoTSElELg7KDzaDZ0demI1GtcBpgFrfpoxjUC0
         pNAg==
X-Gm-Message-State: AOAM532wYfRmOZ56Z6y+ycJdpuBlaHRyca/5guLZSiI6mQ3r7A+c9mK3
        dYxk2DaOTB7MftDkkg1F2h+zKXMtbkey6lTaA28=
X-Google-Smtp-Source: ABdhPJyoOU2GKeESIlStRxScs834KK8VsGmEz5CPl4TBgGbpem/m6DC6szMsWlSSmtoWFKmWyBcBd14QozAIrvGajIc=
X-Received: by 2002:a05:6638:138e:: with SMTP id w14mr12101645jad.98.1611246132168;
 Thu, 21 Jan 2021 08:22:12 -0800 (PST)
MIME-Version: 1.0
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com> <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
In-Reply-To: <CA+icZUV3p+yQYXn=iVseNNQwUSvoMwztLxNDOFpdFb731kDOJg@mail.gmail.com>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Thu, 21 Jan 2021 17:22:01 +0100
Message-ID: <CAKXUXMyrZ7oaA2K5vBkG4uVMbjDBg0yHrQwiJNGCnXq_ZBhmLg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 5:16 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Jan 21, 2021 at 5:01 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > ./scripts/cc-version.sh.
> >
> > Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches    F:    scripts/clang-version.sh
> >
> > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > changes in ./scripts/clang-version.sh; as the file is removed, track
> > changes in ./scripts/cc-version.sh instead now.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>
> Good catch, Lukas.
>
> As a tipp:
> Next time you can pass '--subject-prefix="PATCH next-YYYYMMDD"' when
> doing 'git format-patch ...' (or whatever you use to generate the
> patch).
>

Thanks for the hint.

> Cannot say if we can add a "Fixes:" tag with commit hash-id of
> "kbuild: check the minimum compiler version in Kconfig" - this missed
> that move.
> Maybe Masahiro does a respin and can fold this into above commit?
> That's not my decision.
>
> Reviewed-by: Sedat Dilek <sedat.dilek@gmail.com>
>

...and thanks for the review.

Lukas
