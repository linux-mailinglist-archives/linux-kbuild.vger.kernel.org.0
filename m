Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793493729D9
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 14:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhEDMKc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 08:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhEDMKb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 08:10:31 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158E5C061574;
        Tue,  4 May 2021 05:09:36 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id h202so2798060ybg.11;
        Tue, 04 May 2021 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GoONfpBLyMysB/FhmzAT7uuw2J/Ov3DAFLCcF6TfPu0=;
        b=tckQoMf463vNPurJ8/DE4FlF1sR1Nq0y0BGfCjVf8H5j3Et6hVbvUaiODNjIcMs8Mt
         /jviFaGyjUN7LjTPIxRHFL6MbcW/qsfvx7daHYGdThRFhwx1eXpFdf80lgbrdZv5XAjV
         q4gQ4TPa7fL+vnbwn0z/rAJc/sZkrwddRBwa++gDz+AHI7QIQYmqAdOtMto9fFmvT2bc
         fVvw/3LRWi+nbFtSTZbFEIN/PYyaBpsjosnuewLM9WmkMpdXmIGMx9D0R9AaZW8PuyET
         eTYCcWQ8qBfkV4daDjJf5RPZUriDmdZ2ym+kRWtgTKy71x49yqybOjhVhEz2ORMPpte6
         O99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GoONfpBLyMysB/FhmzAT7uuw2J/Ov3DAFLCcF6TfPu0=;
        b=Ytl7GZmSG/jfO8+Ioj824A6wjIKkjRKfDls3nSiocZMqc3dMTq7+He0UwuaK/z5GTk
         eES2DgQBEh6E90AKuMoevKKxE9emIB6I+PKkiE2BYhm4gnAPuUN7MCzD+KSTicUF4AVM
         PAByFOr4aJ2WaUJhG+C5e3tTJEkNmJSR45UwVh4z/QzoJqSdcJgOm+GrlPtH35ZHLDGx
         hv4mkMFFT4k7pb+inthvELPFjGRyCAbf4f0FCE06QcqUnZ+rtXEtCwooOH4CAbTIXV2B
         J2RPsAHMzRfDB3p3xiDN4MikU4MaSRh62vZTIEAWf7PxMcaJdwevZmf6PYXWTbMKo6fz
         CQWQ==
X-Gm-Message-State: AOAM5337EPOxsvaqGpZn9I0E6Fn/HsUskTw1C0tkvol3iAv+ubWYLPx7
        e8Fn+kD0v2H6XCxjgY4xvh07G7iKs9sRypYNXIA=
X-Google-Smtp-Source: ABdhPJyVieeZ40YfvrO3ib1FXeZbp8MAXFqo0Q4vUyeRjydd2sG818ixSt8PiKN39BRhtEFPC21X4DYHtphGIkl2Kro=
X-Received: by 2002:a25:bc8b:: with SMTP id e11mr34501993ybk.115.1620130175246;
 Tue, 04 May 2021 05:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210501151538.145449-1-masahiroy@kernel.org> <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <65cda2bb-1b02-6ebc-0ea2-c48927524aa0@codethink.co.uk> <CANiq72mk84uay--BWOLT4zF12-rat9erohKazB8SpTPoVCTX1A@mail.gmail.com>
 <20210504092225.GS6564@kitsune.suse.cz>
In-Reply-To: <20210504092225.GS6564@kitsune.suse.cz>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 4 May 2021 14:09:24 +0200
Message-ID: <CANiq72kHwAeQ+vhFqg9tiQA-QHEK_xvP_Sro-_c5LJ2XDzjzxQ@mail.gmail.com>
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
To:     =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>, Will Deacon <will@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Joe Perches <joe@perches.com>,
        Paul Mackerras <paulus@samba.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 4, 2021 at 11:22 AM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
>
> Except it makes answering the question "Is this bug we see on this
> ancient system still present in upstream?" needlessly more difficult to
> answer.

Can you please provide some details? If you are talking about testing
a new kernel image in the ancient system "as-is", why wouldn't you
build it in a newer system? If you are talking about  particular
problems about bisecting (kernel, compiler) pairs etc., details would
also be welcome.

> Sure, throwing out old compiler versions that are known to cause
> problems makes sense. Updating to latest just because much less so.

I definitely did not argue for "latest compiler" or "updating just because"=
.

> One of the selling point of C in general and gcc in particular is
> stability. If we need the latest compiler we can as well rewrite the
> kernel in Rust which has a required update cycle of a few months.

Rust does not have a "required update cycle" and it does not break old
code unless really required, just like C and common compilers.

Concerning GCC, they patch releases for ~2.5 years, sure, but for many
projects that is not nearly enough. So you still need custom support,
which is anyway what most people care about.

> Because some mainline kernel features rely on bleeding edge tools I end
> up building mainline with current tools anyway but if you do not need
> BTF or whatever other latest gimmick older toolchains should do.

It would be better to hear concrete arguments about why "older
toolchains should do", rather than calling things a gimmick.

Cheers,
Miguel
