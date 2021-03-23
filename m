Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 004E2346759
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Mar 2021 19:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhCWSO3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Mar 2021 14:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbhCWSOT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Mar 2021 14:14:19 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC2C6C061763
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 11:14:18 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id h25so9887999vso.2
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Mar 2021 11:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xTzROt3itpnrti9j03LZlWtci24fIc0v/ID50osegOI=;
        b=G9LSManCEm0ynRFxL0KfpbSwtGY42D+BJO4aqZzpdazH47X+7OW3AeHQu+vt1dxlqs
         kwCKfidzEMs/NtW9YLoiTyqbHNBfbS4Yi7HlukT7486VJk65AVQBWpIz6rLwBLEpoRZz
         WV1AQnUw5w5TdbQC7GVTCoww2Jfxqaun1PhzG506nw5O9sb6Bw8k8y9H6uwbl53s/EnQ
         Jwm5E7scoO1KiMcv+Kxg2BxJn4sjd/waOuiDsgUuCggMxVQYtv8dM5HPBSgNOKe5E0a4
         09TrE34zYUlHs3NO0pShHjk8Fu6ej5luUqS70hK5ZU4YMoOyHcI3lT/nTVz4ZDkRohVP
         awjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xTzROt3itpnrti9j03LZlWtci24fIc0v/ID50osegOI=;
        b=gnBAno/pjptq5THj8HtqhLB4mSlb2jlsACz62viW7NFbBBiXa+bUtnpwzAxthVH2Cs
         Oz/zJ2OsQtP1svOz+eUbI1R9uUqgsjNneyZj2K1AwYKbMd1IQyRNkRF2fh9jPBtNdFtZ
         AMTdP90lCl+LNpovO6cpoAF5pVAAu8BkWyQAJ5ab+7sNfIpNAHgSVfMBe9w6wPkvHMC2
         EFRWBX1rTNzXY3WLYqiWsQn38YeaOaMITvYLACV/+GZy8CZc9psxGYOjpDF0mQVL6rcY
         xJAtXz1BSmncApFsLVMzTs3LE/pxukI/RLWqesl/Z1zEofCt5iZzzpFEvThbhGXSfY82
         3uNA==
X-Gm-Message-State: AOAM533Bcnhd3qMCMZmrSFbd6NFxKkNmANHxylkkV9bqy351zt4Yi6wd
        ZowCwW/Vi9Zdlwysq1eI/8K41FDBo4k5v72Joj+htg==
X-Google-Smtp-Source: ABdhPJxQfxePiAdqx2wIwj6cBcYftbaRTO90H9j82jX3SXWm+vInqDNP1WYjNB0ajdqoiCxSC2u3vyD9/cPX/2nCIDU=
X-Received: by 2002:a67:641:: with SMTP id 62mr4620421vsg.23.1616523257117;
 Tue, 23 Mar 2021 11:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210322234438.502582-1-seanjc@google.com> <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
 <YFoZBY1SqilWAmx4@google.com>
In-Reply-To: <YFoZBY1SqilWAmx4@google.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 23 Mar 2021 11:14:05 -0700
Message-ID: <CABCJKucYHQ893LS1iCHXivPS05RMDN2BpDFou306jOEbWnt1Dg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Merge module sections if and only if
 CONFIG_LTO_CLANG is enabled
To:     Sean Christopherson <seanjc@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 23, 2021 at 9:36 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > On Mon, Mar 22, 2021 at 4:44 PM Sean Christopherson <seanjc@google.com> wrote:
> > >
> > > Merge module sections only when using Clang LTO.  With gcc-10, merging
> > > sections does not appear to update the symbol tables for the module,
> > > e.g. 'readelf -s' shows the value that a symbol would have had, if
> > > sections were not merged.
> >
> > I'm fine with limiting this to LTO only, but it would be helpful to
> > understand which sections are actually getting merged here.
>
> It doesn't appear to matter which sections get merged, the tables only show the
> correct data if there is no merging whatsoever, e.g. allowing merging for any
> one of the four types (.bss, .data, .rodata and .text) results in breakage.
> AFAICT, merging any sections causes the layout to change and throw off the
> symbol tables.

Thanks for the clarification. I can reproduce this issue with gcc +
bfd if any of the sections are merged, but gcc + lld produces valid
symbol tables.

Perhaps someone more familiar with bfd can comment on whether this is
a bug or a feature, and if there's a flag we can pass to bfd that
would fix the issue. In the meanwhile, this patch looks like a
reasonable workaround to me.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Tested-by: Sami Tolvanen <samitolvanen@google.com>

Sami
