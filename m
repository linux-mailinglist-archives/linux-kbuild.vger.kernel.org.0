Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4357118435F
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Mar 2020 10:11:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgCMJLg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Mar 2020 05:11:36 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22969 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbgCMJLf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Mar 2020 05:11:35 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 02D9BTrZ018439
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Mar 2020 18:11:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 02D9BTrZ018439
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584090690;
        bh=HcS9IuwF6vfbYV8WrFmhDVFaVs/mT4OyGN+dJB/LxOc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p8aumDNgjstpkNqQCuL1Rb5JWXLkkXxij/AEU/L0HMKac7j52gMa6uKD8TSuTR7FU
         gFJ3sddAEjd3k4v+UIArfTJA7WWbggypha3ifDNafW/zXqTUYDhvR9QbjbhWm8Defn
         hFDwk7n2ldwbrxMbbMv90wvzuQbZmfPeUgc3seN5FMLeJBN5vPRUJNzi/wrnrKOVLF
         aIzj2NinQEBG93jTymbQFdQgrgaEYqAeGKYZ8egejnaXwmq/GCMVzeH/mE48k6vwsJ
         CCxFrqF5vBBY09sUAr4oGl7hSu1mx3WvDZ9Itu/B/1hbcffEVMx4JIeAHboN3Nigin
         M/S/Ckpp0BJOg==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id 8so3253785uar.3
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Mar 2020 02:11:29 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3KobkhmKFoY+7KtcFJEq4Gy7THE3+6ENv0U64/rCQbSR2lFOLs
        Nz/EHL7a0nWKkPGVioFXOuENqd18PQH2Ob71BOQ=
X-Google-Smtp-Source: ADFU+vvC4/IvcN8PE6AISInueTAeQeJyKvRciErDhMEom2AyUN0v7VvUMWMSPj92WFLmQuCGp9kh7avRhsVm+/ApNMs=
X-Received: by 2002:a9f:32da:: with SMTP id f26mr7651610uac.40.1584090687991;
 Fri, 13 Mar 2020 02:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <1584090304-18043-1-git-send-email-amit.kachhap@arm.com> <1584090304-18043-16-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <1584090304-18043-16-git-send-email-amit.kachhap@arm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 13 Mar 2020 18:10:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNATKkdd5RqB-E0_F3WidxmdBZxhjc2g6bkgCxaUu2vO2eA@mail.gmail.com>
Message-ID: <CAK7LNATKkdd5RqB-E0_F3WidxmdBZxhjc2g6bkgCxaUu2vO2eA@mail.gmail.com>
Subject: Re: [PATCH v7 15/17] kconfig: Add support for 'as-option'
To:     Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc:     linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        James Morse <james.morse@arm.com>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Amit,

On Fri, Mar 13, 2020 at 6:06 PM Amit Daniel Kachhap
<amit.kachhap@arm.com> wrote:
>
> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> Currently kconfig does not have a feature that allows to detect if the
> used assembler supports a specific compilation option.
>
> Introduce 'as-option' to serve this purpose in the context of Kconfig:
>
>         config X
>                 def_bool $(as-option,...)
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-kbuild@vger.kernel.org


If you have a chance for v8,
could you please drop these Cc lines?

I had already given Ack, and am satisfied.
I have no more comment.

Thanks.



> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> ---
>  scripts/Kconfig.include | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 85334dc..a1c1925 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -31,6 +31,12 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /de
>  # Return y if the linker supports <flag>, n otherwise
>  ld-option = $(success,$(LD) -v $(1))
>
> +# $(as-option,<flag>)
> +# /dev/zero is used as output instead of /dev/null as some assembler cribs when
> +# both input and output are same. Also both of them have same write behaviour so
> +# can be easily substituted.
> +as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
> +
>  # $(as-instr,<instr>)
>  # Return y if the assembler supports <instr>, n otherwise
>  as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
