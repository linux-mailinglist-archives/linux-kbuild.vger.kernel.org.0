Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F944213604
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jul 2020 10:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbgGCIPd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jul 2020 04:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbgGCIPc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jul 2020 04:15:32 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEC9C08C5C1;
        Fri,  3 Jul 2020 01:15:32 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t18so6664942ilh.2;
        Fri, 03 Jul 2020 01:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=STO53GF8jJ9fwooJ/PR+LY6ObOQA6eXVQnYnb1oX2YQ=;
        b=nVrVFHObmfwCc4EDiskqGuhvjiuURaIWWhH9VmEsXrXQKhMokPft9UjpBZZKwZ8Kw5
         qtr5MtQN6wIOpNY0A27FMpEWWEuU9P+QcbhArU2WcaXFvLQxzLTzxLDx8r2zpyNUvqeK
         /ttn5Y+hzeSetuUVHHlAp5pnE/7JWwZabaEgPER1I8ARjIw+iwOt9TErXo1e+OD35hI+
         KSgVoS3ChcYlpfB/GSoWhGxe41EAUCr2dmbU+KToUaL9wVfRSY+I6+7xkjfaMaaba0Xn
         D6EqUXv9PjEepW6cHh6w7KXyd5SbeLZypnu1wTHXGbOlG37ejLZP29uEDUDTFmd4a0PM
         ASZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=STO53GF8jJ9fwooJ/PR+LY6ObOQA6eXVQnYnb1oX2YQ=;
        b=TonItFMecAlOAEZ/w863ZBg0ClqpXOAa9kUdd3lvhNNhDFlCqkyfez3s8qxzUCBHWs
         Hnx1zvj7hVepb98LMxehfMfec2E1+HiigyB6KPGcEjhA6zLNck2GfFlpm/SU0PtD6y9C
         i5OQNN11o8YZ+im1pqSsjIk6xg7ndOEGkOja6gts0g9aKiFcSSZ6GrEjfcbBWyVKqq1W
         k8HKXg0rXiTgFEB4nXiJ2hNa87PamZbMipSIXrzuBCWij50WCXwmM64igrXl8v907BfJ
         BSZrUb4rrUG3Tqx8X5ZT/iXbOa8ljpxkuJinA6e7HFN6lQuFGrlXbC1IfPpYGiL9OegC
         xN/Q==
X-Gm-Message-State: AOAM530XSAnCELj51M0nHN+TONp1+7bLAsKcM+tyrfaGtsZXRvRmkJTj
        7lX24TdzEUaWTyQMD8XxbI+wg8h7U9NVyaSXmzc=
X-Google-Smtp-Source: ABdhPJwYkSTd8ot4rjgU2UsFNopOo9xCIiSptSonbdFkDXH1DxQN1/G8cLqz9aGySz4jhdPugh78yI5qv2AYvapETB8=
X-Received: by 2002:a92:dc09:: with SMTP id t9mr16946661iln.226.1593764131855;
 Fri, 03 Jul 2020 01:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <1588791882.08g1378g67.none.ref@localhost> <1588791882.08g1378g67.none@localhost>
 <202007020818.87EA89106@keescook>
In-Reply-To: <202007020818.87EA89106@keescook>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 3 Jul 2020 10:15:20 +0200
Message-ID: <CA+icZUUBAzBNwqThSF=YS1zg9EVCuSZ-XDc5Pu3NrO6R3Fi2Zw@mail.gmail.com>
Subject: Re: Kernel compression benchmarks
To:     Kees Cook <keescook@chromium.org>
Cc:     "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
        linux-kernel@vger.kernel.org,
        Nick Terrell <nickrterrell@gmail.com>,
        Nick Terrell <terrelln@fb.com>,
        Norbert Lange <nolange79@gmail.com>, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kernel Team <Kernel-team@fb.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 2, 2020 at 5:18 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jul 01, 2020 at 10:35:48AM -0400, Alex Xu (Hello71) wrote:
> > ZSTD compression patches have been sent in a number of times over the
> > past few years. Every time, someone asks for benchmarks. Every time,
> > someone is concerned about compression time. Sometimes, someone provides
> > benchmarks.
>
> Where's the latest series for this, btw? I thought it had landed. :P It
> seemed like it was done.
>

Hi,

Again, I would like to see this upstream, too.

Last I asked for a rebase against Linux v5.8-rc1 or later.

Beyond above adaptations, the latest series "zstd-v5" of Nick T.s
patchset needs some addition of zstd to the patch (see [1]):

commit 8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294
"kbuild: add variables for compression tools"

NOTE:
"zstd-v5" was against Linux-next 20200408 or download the series from
patchwork LKML which applies cleanly against Linux v5.7 - last is what
I did.

There was a follow-up to the above patch (see [2]):

commit e4a42c82e943b97ce124539fcd7a47445b43fa0d
"kbuild: fix broken builds because of GZIP,BZIP2,LZOP variables"

Nevertheless, this is the kernel-side of doing - user-space like for
example Debian's initramfs-tools needs adaptations (see [3]).

@Kees: Can you aid Nick T. to get this upstream? You know the
processes a bit better than me.

Regards,
- Sedat -

[0] https://github.com/terrelln/linux/tree/zstd-v5
[0] https://lore.kernel.org/patchwork/project/lkml/list/?series=437934
[1] https://git.kernel.org/linus/8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294
[2] https://git.kernel.org/linus/e4a42c82e943b97ce124539fcd7a47445b43fa0d
[2] https://bugs.debian.org/955469
