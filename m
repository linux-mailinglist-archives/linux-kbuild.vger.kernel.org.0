Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A15E1465C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2020 11:30:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAWKaW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jan 2020 05:30:22 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34370 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726194AbgAWKaW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jan 2020 05:30:22 -0500
Received: by mail-wr1-f68.google.com with SMTP id t2so2500100wrr.1
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Jan 2020 02:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YAxfzxPfurgTuk1uerQYc1sz/OcAPQINb4RTts1Vwgk=;
        b=mRAIWj0Hzjh8x5+CEVTJV9/rU+71i26UegzQBtdAjpfR5oWHJxcBa6xCfOw/QTpicE
         O1oc3s0ihL3piv/L4wB6oAk9fyJVOVFEuIoZ1DwFHsssdUVHrBL/FZFZWRaLUMux5kHX
         t3Ds4+cxE5bjLD2NHoMA0sd5hmFBDdurnbiPSezMhgIvPjfrk5RBwjrnsxeDyNFqjrdK
         AIcSTy2LwzEyZ86RdC8piBDme9PM0NgK+o2lKu0PMC5O052482JNG+QOwmkXv0fr2L5o
         pT7p1RvyHqZEr3MRpb9DbUdRw+SWnSiQeeuT81P2EG4Vm7fGH40J7GS8qDrzBZv4PcKC
         AZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YAxfzxPfurgTuk1uerQYc1sz/OcAPQINb4RTts1Vwgk=;
        b=nvMWZorl4rIT14PZBzhQ1QpgJ/6vE6L0j7ryPx/0pQ1m+XaFwH4amdmaf26vj8qufE
         Yn5e+Zzm4IKF2li47CYR+yEL29LE6vTGbBkd0/v8sDxkzG2lXF8Zt8IoDQyH9YguEv9H
         FSHD+ScjeTF6dPYr0TIbzbjf9VZ0tVTlQk1IeESQ7XtzLWhI4y/f6YR5mkp1fb/K5eV5
         c98/r6HlbCQQy7I2ktux2NWlmJFbi4U8dTXlDfoat2Af0TEaY8Ph+v1SUyw+AvBez6Is
         K3KTVJqvYYnDicO/j076ZYC7Qj3EBR1ISXi9o4tnWn2bBD0NYqib00HGu0H6MbMqz+cK
         +INQ==
X-Gm-Message-State: APjAAAX1sYVeRvOIoqrltQjSzzKlR8NTXga1XMVwskhN7HEtGjwr9ubI
        BhcAIxYi3uM8FbIqqc2+1ioucKqVthLEN7SCDS3GvQ==
X-Google-Smtp-Source: APXvYqxHzUbhdPRBofY+UYqHsRyY5yd2S/u+ZLpTFFlVGUZfVWmiweiHVsEo5waGSZt9/e+1G3lBKWkRZedw7a4VRr4=
X-Received: by 2002:adf:e6d2:: with SMTP id y18mr16636656wrm.262.1579775419984;
 Thu, 23 Jan 2020 02:30:19 -0800 (PST)
MIME-Version: 1.0
References: <1579774839-19562-1-git-send-email-amit.kachhap@arm.com> <1579774839-19562-16-git-send-email-amit.kachhap@arm.com>
In-Reply-To: <1579774839-19562-16-git-send-email-amit.kachhap@arm.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Thu, 23 Jan 2020 11:30:09 +0100
Message-ID: <CAKv+Gu-r4d1bBNJK0BZAX=b2+SDqMztAHx+cpq1dxB2q8O1YJA@mail.gmail.com>
Subject: Re: [PATCH v4 15/17] kconfig: Add support for 'as-option'
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
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 23 Jan 2020 at 11:22, Amit Daniel Kachhap <amit.kachhap@arm.com> wrote:
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
> Changes since v3:
> *) Changed the assembler option to -c instead of earlier -E.
> *) Added Masahiro Acked-by.
>
>  scripts/Kconfig.include | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index d4adfbe..c4b4424 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
>  # Return y if the linker supports <flag>, n otherwise
>  ld-option = $(success,$(LD) -v $(1))
>
> +# $(as-option,<flag>)
> +# Return y if the assembler supports <flag>, n otherwise
> +as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)

Did you mean '-o /dev/null' here?

> +
>  # check if $(CC) and $(LD) exist
>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> --
> 2.7.4
>
