Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 634DA160EF9
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 10:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgBQJk2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 04:40:28 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:58868 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbgBQJk2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 04:40:28 -0500
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01H9eLBq005659
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 18:40:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01H9eLBq005659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581932421;
        bh=qd+nhlAtQHiZejd/eFAwUUmC+Hbe2myXP/ofuTrA8os=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pqtU/4K+GZaFisarDcphYXVq5LWjLCMJ5HiP4wi1Mz4zfM9r8+J0t6hJ+CKu0ugdL
         HPsWs+6+HO/a1pgoHa0lnwC/rw67iGZ3nB5f4MjDBDieR25Ud3pG5IOMfE8iqOMo0p
         6wNAKfoWhzjCpELGXWYZVEOtXdl8sdN7UBG7f0SCo+FDYl0O0t9pECVnLq8yVIDz2p
         6lorG2M9OlQvguBs/8BRugjnAVtOBoTa4/nNLBeJKJ5ZuxNnvcc1AfbQIjafuFD8/N
         h/AfoCCFLJ3sF0PRjH3/pz4ZLrfk0jSzRPsx95KkVX2KjwwfOsIPHuHaHKXwFG2Sed
         J1JdmervXT6og==
X-Nifty-SrcIP: [209.85.221.170]
Received: by mail-vk1-f170.google.com with SMTP id g7so4357387vkl.12
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 01:40:21 -0800 (PST)
X-Gm-Message-State: APjAAAUaK4qLkvL3M1iHaSxHzsBEZiRMyAFGeykUqHzfiVfbcHp1Q58v
        ui3F+AbvdxjtB9OdW3v+LvOGAmDvpDSl+u5xBio=
X-Google-Smtp-Source: APXvYqzHDQKmfHzRUeVqKP2QdIcXsFGUEGcZAcGFtr/o8SGLvFfoc2iTiYZEyhaMFMDRcFoPi37kiu5pn55evA6zb9k=
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr4998194vkc.12.1581932420243;
 Mon, 17 Feb 2020 01:40:20 -0800 (PST)
MIME-Version: 1.0
References: <1581931668-11559-1-git-send-email-amit.kachhap@arm.com> <1581931668-11559-16-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <1581931668-11559-16-git-send-email-amit.kachhap@arm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 17 Feb 2020 18:39:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTD88U1ZBxMU3fCDb1KxF=PavhgoUzqTt6ar9-+7eMQA@mail.gmail.com>
Message-ID: <CAK7LNARTD88U1ZBxMU3fCDb1KxF=PavhgoUzqTt6ar9-+7eMQA@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] kconfig: Add support for 'as-option'
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

Hi.

On Mon, Feb 17, 2020 at 6:29 PM Amit Daniel Kachhap
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
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> ---
>  scripts/Kconfig.include | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 85334dc..374e251 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -35,6 +35,10 @@ ld-option = $(success,$(LD) -v $(1))
>  # Return y if the assembler supports <instr>, n otherwise
>  as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
>
> +# $(as-option,<flag>)
> +# Return y if the assembler supports <flag>, n otherwise
> +as-option =$(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
> +


I am still not convinced with using /dev/zero here.


Does this work?

as-option = $(success, cat /dev/null | $(CC) $(CLANG_FLAGS) $(1) -c -x
assembler -o /dev/null -)


[1] Could you insert as-option between ld-option and as-instr ?

[2] Could you add some comments to explain why
     /dev/null -o /dev/null does not work?





>  # check if $(CC) and $(LD) exist
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
