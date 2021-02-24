Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08573234DD
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 02:20:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhBXBGF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 20:06:05 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28112 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbhBXApE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 19:45:04 -0500
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 11O0i056013733;
        Wed, 24 Feb 2021 09:44:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11O0i056013733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614127441;
        bh=gqVP6d2SKOXptycBAEkQVPJQ40imMk4X+NRYHoNFmDc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GZZZPYvB+xxwOXFzf1W/xgGJt0APRHozpU+eyvTHqhGodj3Z+mBOafmDJ8ogpYfl0
         3FLmHpTWjcq032FQYR+R1COVFXeSK6yT2cszAvoBPeSYKR5azB+Mvt1Ktw+Ndk/RrY
         ZqGzqtus7F4bIS9MRu6jtdMifvrOlEivPH2ctDv3eIsy9Ok8t0PYhayfl07aupXGF4
         TErGqrzvHF93UMqqIbCHskdjFF6VQpSUl/srz2HzJT+niUQ6oc+jFaotaV3XGQhVGx
         nPoAfP9igTjXRpsdidbDyA76pnuPJDweqeBskNv40w724yf3bdvPBkBeMFQRXdhzbb
         6a8UUV6E5nORg==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id kr16so126880pjb.2;
        Tue, 23 Feb 2021 16:44:01 -0800 (PST)
X-Gm-Message-State: AOAM5324Ru5qE6frcYaSAAAAL+Xg/8onhJY6ddQHpL5ZcBfW8TK+HAZv
        e/5XcCqPf52UN6JoQ+IelcVR9zWMu77ybc58Ugw=
X-Google-Smtp-Source: ABdhPJxoYbk4hKXDEekzKWVKkgxqUjdEcOWXSmH/qH7JhhT7xE0dmHFI7agXK9bpp2ZUa8y/LrCSMKFCUBFfWOaiX9Q=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr1448151pji.87.1614127440348;
 Tue, 23 Feb 2021 16:44:00 -0800 (PST)
MIME-Version: 1.0
References: <20210223181425.4010665-1-robh@kernel.org> <20210223181425.4010665-2-robh@kernel.org>
In-Reply-To: <20210223181425.4010665-2-robh@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 24 Feb 2021 09:43:23 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQYfMGTUehk4-=UGcT4Tc66fZ67vbJKr36YDpxB52mDJQ@mail.gmail.com>
Message-ID: <CAK7LNAQYfMGTUehk4-=UGcT4Tc66fZ67vbJKr36YDpxB52mDJQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Make old-atomics and missing-syscalls phony targets
To:     Rob Herring <robh@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 24, 2021 at 3:14 AM Rob Herring <robh@kernel.org> wrote:
>
> The old-atomics and missing-syscalls targets are not files, so they
> should be marked as PHONY.
>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Kbuild | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Kbuild b/Kbuild
> index fa441b98c9f6..032157c3ffd2 100644
> --- a/Kbuild
> +++ b/Kbuild
> @@ -44,6 +44,7 @@ always-y += missing-syscalls
>  quiet_cmd_syscalls = CALL    $<
>        cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)
>
> +PHONY += missing-syscalls
>  missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
>         $(call cmd,syscalls)
>
> @@ -55,5 +56,6 @@ always-y += old-atomics
>  quiet_cmd_atomics = CALL    $<
>        cmd_atomics = $(CONFIG_SHELL) $<
>
> +PHONY += old-atomics


I do not think this is the right fix.

always-y (specified a few lines above) adds $(obj)/ prefix,
and is not supposed to work with PHONY.


It is wrong to blindly eliminate
the errors detected by your 3/3



>  old-atomics: scripts/atomic/check-atomics.sh FORCE
>         $(call cmd,atomics)
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
