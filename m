Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68F753D0541
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jul 2021 01:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbhGTWmp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 18:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233487AbhGTWmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 18:42:44 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C0C3C061797
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 16:23:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 8so425545lfp.9
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 16:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9UMNLgXsjce3FCFX2HrFE+hubu4C2zganX9QHeWUC5k=;
        b=VOZraKhMzkQJNMDtxTEw3IeOAaj9jfYkfX3AnUFI4sPxh13Nh6QzQM41dGtfrdsCR3
         m7YVPeQkOsnpWDR5Ovi2nsMuKFzaAZ6qlJvuydFhPSusBHUx3//IXrR3qFljv1apq0Uc
         EOxNaqYELtMu/scDTMBvpmdmbWQ7KWxq1dZVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9UMNLgXsjce3FCFX2HrFE+hubu4C2zganX9QHeWUC5k=;
        b=XiQfut8Ep5pC66jDlkqFQqPlpJo9ia+pR5Kc6cxISBhStsa7ndGlcPtE9poLelktYF
         T5r8/+/aTqu0M3bN8ZRYDfcPD1oVR3zZaxh6nkd31HfpB2BHzB1Mka7se4EOGebTG1V3
         u2lkEd014TR9xSNiTwryod2eGrh9cXS8tiqw0MkDqMqP1A1ATNgkHBMFRO5zV++PF4aU
         BeGeSCnm8ENsfLyL/uJPO/ndkUH8cEXjQX14rNP/ErCp2wE8/6zog/JIs+s32mg76YV1
         FYhMAcedgqcg6TP38SOScc1Yr+tQ060x5hUMpxRgr4YS0BnCjlH9cFnTrcSiuSEnRFfG
         lpTQ==
X-Gm-Message-State: AOAM533B6wjN1jw+lXAQ1lmtUvYClhoqQBLXwV0Bx9xYfN+q2FIkXjk/
        zO/KB8ibJGnaf2MAoHatXQ70uGImFWDQzpKd
X-Google-Smtp-Source: ABdhPJyGa8vNy2GOKellhXeZbbn+akfAdpYsIfJqclj9y0PVLsiVncEHCri7NuWbF42Z+z88lvnfhw==
X-Received: by 2002:a05:6512:33a5:: with SMTP id i5mr22935948lfg.21.1626823379755;
        Tue, 20 Jul 2021 16:22:59 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id s12sm1590329ljg.60.2021.07.20.16.22.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 16:22:58 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id f30so416885lfv.10
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jul 2021 16:22:58 -0700 (PDT)
X-Received: by 2002:a05:6512:404:: with SMTP id u4mr23082408lfk.40.1626823377989;
 Tue, 20 Jul 2021 16:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com> <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
 <CAHk-=wgGxu4_hgzdYpFuKd95SfnkJbPTWAQ9-fMgmMN1Oxs2xQ@mail.gmail.com>
 <CAKwvOdkvju7heeNpk87brsjkhXHbdKFsUgf63KWhXox9rDkQsA@mail.gmail.com>
 <CAHk-=wiZe2FuiAOwhbKR_VMmFBKekz0NFREm4fvik25PEdcK_g@mail.gmail.com> <CAHk-=whS1zBU=uhDTk2M1LwkqG7AKLsR0_+XG+saY_s2FHZr-A@mail.gmail.com>
In-Reply-To: <CAHk-=whS1zBU=uhDTk2M1LwkqG7AKLsR0_+XG+saY_s2FHZr-A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 20 Jul 2021 16:22:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj-TkHtkxSOLDzXhThvRCrRys3fo4T9=mtbUy+9kBGe4Q@mail.gmail.com>
Message-ID: <CAHk-=wj-TkHtkxSOLDzXhThvRCrRys3fo4T9=mtbUy+9kBGe4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 20, 2021 at 4:19 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> There are probably better ways to do this

Oh. In particular, it probably should use a '?=' in order to allow
overriding, and not expanding that $(shell git config..) thing every
time $(CC) is used.

Or something. I didn't really think about those things very much.
Think of that patch - as so many of my patches - as a starting point
and a "how about something like this".

              Linus
