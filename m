Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C417D161E38
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 01:38:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726107AbgBRAie (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 19:38:34 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:21053 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgBRAid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 19:38:33 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01I0c88x022532
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 09:38:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01I0c88x022532
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581986289;
        bh=bXAWFIIjdJAenzl5qtU8X4SaqZRjl4s+1pBIgQ3Mwak=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZD4OIc9z8+KmZoxwuYLbRMyLrVlt4A0e4LuGQUeFnk3BJXfOFPk8zDxKJtOSVGSHV
         EJSrFCCAG/VTkd7AtKl3VF/rGzCZI8MhKlGatseJY8iOvZo5rTgy6cs8UGU9TlgmlS
         JvwOauPscnZFjTJiR6VDUHeWtT4VWJrkbASrZi5OEjctu9BR4RPS5s1TktCmgmG3fh
         MzQgqE91HyE/gHkX5pp7neRcfFYoHZ2tB6bYrPhO9mKKHujNQAbrkSMJ5kAtng8WAI
         Xmm3NH8SOgo4EdmBOpAss3zzHFyqGmgtocOTA97O5fdAxKhpoFpGnjwzKvWh+UP/sK
         IcxSYUqirolMg==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id o42so6816116uad.10
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 16:38:08 -0800 (PST)
X-Gm-Message-State: APjAAAXiW8YL+Wzg8rD0C2QpvTEHmh6A2K6cQ/90Hzw4mPLUtPWOV+q7
        tJZATXvJ3tea8SuaxdLv4EIjq+NSZ78P7BwtCUk=
X-Google-Smtp-Source: APXvYqzOw1ovi899OwyLnlGE5fhlo6l0EDI8XKdkLBMX2ZcZO2qZvkDWaI/p+TlsSH24146JLZ93P8DJNlReV4uvcSI=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr9294241uay.25.1581986287690;
 Mon, 17 Feb 2020 16:38:07 -0800 (PST)
MIME-Version: 1.0
References: <1581931668-11559-1-git-send-email-amit.kachhap@arm.com>
 <1581931668-11559-16-git-send-email-amit.kachhap@arm.com> <CAK7LNARTD88U1ZBxMU3fCDb1KxF=PavhgoUzqTt6ar9-+7eMQA@mail.gmail.com>
 <7b2b8e5a-c276-4dfe-3fac-afc03cda4e3d@arm.com>
In-Reply-To: <7b2b8e5a-c276-4dfe-3fac-afc03cda4e3d@arm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 18 Feb 2020 09:37:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASELe0+MhpU-huL-jCmxsCofs-OKz_1xYYLgJtuM5bomg@mail.gmail.com>
Message-ID: <CAK7LNASELe0+MhpU-huL-jCmxsCofs-OKz_1xYYLgJtuM5bomg@mail.gmail.com>
Subject: Re: [PATCH v5 15/17] kconfig: Add support for 'as-option'
To:     Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc:     Amit Daniel Kachhap <amit.kachhap@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
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
        Mark Brown <broonie@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Mon, Feb 17, 2020 at 7:16 PM Vincenzo Frascino
<vincenzo.frascino@arm.com> wrote:
>
> Hi,
>
> On 17/02/2020 09:39, Masahiro Yamada wrote:
> > Hi.
> >
> > On Mon, Feb 17, 2020 at 6:29 PM Amit Daniel Kachhap
> > <amit.kachhap@arm.com> wrote:
> >>
> >> From: Vincenzo Frascino <vincenzo.frascino@arm.com>
> >>
> >> Currently kconfig does not have a feature that allows to detect if the
> >> used assembler supports a specific compilation option.
> >>
> >> Introduce 'as-option' to serve this purpose in the context of Kconfig:
> >>
> >>         config X
> >>                 def_bool $(as-option,...)
> >>
> >> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> Cc: linux-kbuild@vger.kernel.org
> >> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> >> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> >> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
> >> ---
> >>  scripts/Kconfig.include | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> >> index 85334dc..374e251 100644
> >> --- a/scripts/Kconfig.include
> >> +++ b/scripts/Kconfig.include
> >> @@ -35,6 +35,10 @@ ld-option = $(success,$(LD) -v $(1))
> >>  # Return y if the assembler supports <instr>, n otherwise
> >>  as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> >>
> >> +# $(as-option,<flag>)
> >> +# Return y if the assembler supports <flag>, n otherwise
> >> +as-option =$(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
> >> +
> >
> >
> > I am still not convinced with using /dev/zero here.
> >
>
> Could you please elaborate a bit more?


I am just not familiar with this usage of /dev/zero.


The behavior of /dev/null is clear.
The read/write to /dev/null is described in the standard:
https://pubs.opengroup.org/onlinepubs/009695399/basedefs/xbd_chap10.html

I just do not know whether the write to /dev/zero is
the defined-behavior or not.


Masahiro Yamada


>
> >
> > Does this work?
> >
> > as-option = $(success, cat /dev/null | $(CC) $(CLANG_FLAGS) $(1) -c -x
> > assembler -o /dev/null -)
> >
>
> I will try and get back to you.



Masahiro Yamada


>
> >
> > [1] Could you insert as-option between ld-option and as-instr ?
> >
>
> Sure, I will do it in the next version.
>
> > [2] Could you add some comments to explain why
> >      /dev/null -o /dev/null does not work?
> >
> >
>
> Comments are always a good think :) I will do in the next version.
>
> >
> >
> >
> >>  # check if $(CC) and $(LD) exist
> >>  $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> >>  $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
> >> --
> >> 2.7.4
> >>
> >
> >
>
> --
> Regards,
> Vincenzo
--
Best Regards
Masahiro Yamada
