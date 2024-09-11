Return-Path: <linux-kbuild+bounces-3509-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387B974B64
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 09:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B5AB328AA19
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Sep 2024 07:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7505114290C;
	Wed, 11 Sep 2024 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBt8u00X"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D16A33B;
	Wed, 11 Sep 2024 07:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039748; cv=none; b=aaKeiGa1FfBW3wff93AD2K6AE94tR7U8pJ9xiz+qyFg3qR5o7PRrDmG49UVfDqePNeUSxzLHfyGiMHObzkYrDeYkI/xckSjP163ZXEP9dEp9N5/HcYBAkOXQiH6sZW6SEKtwY92jIzuxOJcCWMj8S9Bo3p6kUxDl6UVJ7dzVG3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039748; c=relaxed/simple;
	bh=KbUoUBvcWX9rFYePbVpImFGQLgDAvUmaqTioMBxsWfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndDq8LXdgx9bM5s4DkpeNoiLvh8xQmbSb9sOok4gpZYM2ROnENF23nfMZY2JlQ3Db0hLyDUp8BzfXuO6pUeU2gA6E9lq3ytYRdN8ItAtMQqtZi6jUjubbLYHZ7BNcFTCdqzNhxawXM7l1K66vBAywmXB3biBEFA9GshZFTb1Wpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBt8u00X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F26C4CEC6;
	Wed, 11 Sep 2024 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726039747;
	bh=KbUoUBvcWX9rFYePbVpImFGQLgDAvUmaqTioMBxsWfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cBt8u00XQHt/nU03fXmbDp/LdHs0RRP/Ha6rtdbyOZsTsLCyETX1h8OiRxzc1V4Oy
	 b1GUSuQ9TYd8oZLCtO29JEkzU3fl4spcbFOcbjiVkiciV2eAYK0oVMT32zvN859B/X
	 b0lYN8vocfrbCssIc3bJAZvGm3ksNLShOacCrMaIEe2Mxp51Q2N6FKBHkB1mNSO5YQ
	 FkaXcyEfeQBNbzOVCGFK6eaOX6+D96Ui5RWyHgNGCihBp4Q+hQLmYBg2SAG9P42V0q
	 2vOmx7sFPK9MQbirI1uZA2ZSpPfmLY1JakQUTbf0cK8wEUg0xFQNLseSiO6ZNhriPx
	 UZ3/jlnMkBSdQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75d044201so5752111fa.0;
        Wed, 11 Sep 2024 00:29:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV9Riqx1iQ6yCg47lx7027wmadhbvUZrFkjQrdh1/3pNAlyl26+nWXAgDTOmX6/4vUARb0yisfI0cMpgz8=@vger.kernel.org, AJvYcCWXBind/CPa6B3lbvwoAy/W2Zl0vWT6XkhsccxPr4E/fTjiGr00XSpXqX/5r+g2xQXSXzm43JN/xoJ8CtVS@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7Qubf0Rflq4mE/l/h5lu349fayBVvWiTQXBbuAn4K/xNhUxL
	1v5tFlJ9joyLhHjMZgn7Q5/m+rHIVfiHAVe1CcUNy/sSl06p5wESM1MmWQJpzIQj3VE8fKTO9dH
	k5Tl9N9Cy6W360ZemssqCuF/XjYM=
X-Google-Smtp-Source: AGHT+IHRZZMu7s1CwuHZGaWoY2UgPTfkO8OHLCmhRY0wGYeMecrs07iKYrpRq++AoCZwC3W5T4Utz6ngqDv8O7R6snE=
X-Received: by 2002:a05:651c:1987:b0:2f7:5c20:5daf with SMTP id
 38308e7fff4ca-2f772603a6cmr19792991fa.2.1726039746520; Wed, 11 Sep 2024
 00:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aowpzz4rbedjkwkl7b4a2f5pf2p5cgsu6knsgxnayckhbumxf3@aznrm7oliydb>
 <442e8058.43a4.191dea175d7.Coremail.3090101217@zju.edu.cn>
 <lnizw6jklneisxkhah7ezy4tcrn2wpm52ibh5euz7ipyfansde@kc4onuvrrmxr> <mesi5e46iumhgdbvzl2gfwdamtv34baydb5d4pmud4fu7n4dto@fewx4uzbtjl6>
In-Reply-To: <mesi5e46iumhgdbvzl2gfwdamtv34baydb5d4pmud4fu7n4dto@fewx4uzbtjl6>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Sep 2024 16:28:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDVN9ukAJdztobZ=aMLvfgE_wW1N_gsB-x3OiRE-Jrog@mail.gmail.com>
Message-ID: <CAK7LNATDVN9ukAJdztobZ=aMLvfgE_wW1N_gsB-x3OiRE-Jrog@mail.gmail.com>
Subject: Re: External modules with O=... (was: Re: [PATCH] kbuild: Fix include
 path in scripts/Makefile.modpost)
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jing Leng <3090101217@zju.edu.cn>, Michal Marek <michal.lkml@markovi.net>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jing Leng <jleng@ambarella.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 11, 2024 at 1:36=E2=80=AFPM Lucas De Marchi
<lucas.demarchi@intel.com> wrote:
>
> On Tue, Sep 10, 2024 at 09:43:14PM GMT, Lucas De Marchi wrote:
> >On Wed, Sep 11, 2024 at 09:10:09AM GMT, Jing Leng wrote:
> >>>-----Original Messages-----
> >>>From: "Lucas De Marchi" <lucas.demarchi@intel.com>
> >>>Send time:Tuesday, 09/10/2024 22:00:29
> >>>To: "Masahiro Yamada" <masahiroy@kernel.org>
> >>>Cc: 3090101217@zju.edu.cn, "Michal Marek" <michal.lkml@markovi.net>, "=
Nick
> >>> Desaulniers" <ndesaulniers@google.com>, "Linux Kbuild mailing list" <=
linux-kbuild@vger.kernel.org>, "Linux Kernel Mailing List" <linux-kernel@vg=
er.kernel.org>, "Jing Leng" <jleng@ambarella.com>
> >>>Subject: External modules with O=3D... (was: Re: [PATCH] kbuild: Fix i=
nclude path in scripts/Makefile.modpost)
> >>>
> >>>Hi, I was pointed to this thread since I'm trying something similar
> >>>in kmod's testsuite. See below.
> >>>
> >>>On Tue, May 24, 2022 at 02:52:45AM GMT, Masahiro Yamada wrote:
> >>>>On Tue, May 17, 2022 at 7:51 PM <3090101217@zju.edu.cn> wrote:
> >>>>>
> >>>>> From: Jing Leng <jleng@ambarella.com>
> >>>>>
> >>>>> When building an external module, if users don't need to separate t=
he
> >>>>> compilation output and source code, they run the following command:
> >>>>> "make -C $(LINUX_SRC_DIR) M=3D$(PWD)". At this point, "$(KBUILD_EXT=
MOD)"
> >>>>> and "$(src)" are the same.
> >>>>>
> >>>>> If they need to separate them, they run "make -C $(KERNEL_SRC_DIR)
> >>>>> O=3D$(KERNEL_OUT_DIR) M=3D$(OUT_DIR) src=3D$(PWD)". Before running =
the
> >>>>> command, they need to copy "Kbuild" or "Makefile" to "$(OUT_DIR)" t=
o
> >>>>> prevent compilation failure.
> >>>>>
> >>>>> So the kernel should change the included path to avoid the copy ope=
ration.
> >>>>>
> >>>>> Signed-off-by: Jing Leng <jleng@ambarella.com>
> >>>>> ---
> >>>>>  scripts/Makefile.modpost | 3 +--
> >>>>>  1 file changed, 1 insertion(+), 2 deletions(-)
> >>>>>
> >>>>> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> >>>>> index 48585c4d04ad..0273bf7375e2 100644
> >>>>> --- a/scripts/Makefile.modpost
> >>>>> +++ b/scripts/Makefile.modpost
> >>>>> @@ -87,8 +87,7 @@ obj :=3D $(KBUILD_EXTMOD)
> >>>>>  src :=3D $(obj)
> >>>>>
> >>>>>  # Include the module's Makefile to find KBUILD_EXTRA_SYMBOLS
> >>>>> -include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
> >>>>> -             $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
> >>>>> +include $(if $(wildcard $(src)/Kbuild), $(src)/Kbuild, $(src)/Make=
file)
> >>>>>
> >>>>>  # modpost option for external modules
> >>>>>  MODPOST +=3D -e
> >>>>> --
> >>>>> 2.17.1
> >>>>>
> >>>>
> >>>>
> >>>>I do not think "M=3D$(OUT_DIR) src=3D$(PWD)" is the official way,
> >>>>but this patch is a clean up.
> >>>
> >>>I tried what is in this patch and also tried to find an official way i=
n
> >>>the docs.


There is no official way.

> >>>
> >>>In kmod's testsuite we build dummy kernel modules to exercise the API.
> >>>https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/testsui=
te/module-playground
> >>>
> >>>This works:
> >>>     make -C /lib/modules/$(uname -r)/build M=3D$PWD
> >>>
> >>>This doesn't:
> >>>     make -C /lib/modules/$(uname -r)/build M=3D$PWD O=3D/tmp/kmod_tes=
t_modules



O=3D points the output directory of the kernel,
not the output directory of the external modules.


/lib/modules/$(uname -r)/build
is the clean source tree.

/tmp/kmod_test_modules
contains the build artifacts of vmlinux and
in-tree modules.

Then, the command you gave would work.






> >>>
> >>>I also tried the variants above with setting src, but all of them give
> >>>me errors - I used 6.10 and 6.11-rc7 for these tests.
> >>>
> >>>Is there a way to do this?
> >>>
> >>>thanks
> >>>Lucas De Marchi
> >>>
> >>>>
> >>>>Applied to linux-kbuild. Thanks.
> >>>>
> >>>>
> >>>>--
> >>>>Best Regards
> >>>>Masahiro Yamada
> >>
> >>Hi Masahiro,
> >
> >I guess you meant Lucas :)
> >
> >>
> >>I think your intention is to separate the source code from the compiled=
 output.
> >>The correct command should be:
> >>   make -C /lib/modules/$(uname -r)/build src=3D$PWD M=3D/tmp/kmod_test=
_modules
> >
> >oh, looks like this works. Apparently my mistake was trying to set O=3D
> >like I normally do for in-tree modules.
>
> spoke too early... It worked because I was in another machine pointing
> to a 6.8 kernel. It seems like something broke between 6.9 and 6.10.
>
> Running a quick bisect, it's pointing to this commit:
> 9a0ebe5011f4 ("kbuild: use $(obj)/ instead of $(src)/ for common pattern =
rules")


Overriding 'src' from the command is not allowed. That's why.


> Error like below:
>
> $ make -j$(nproc) -C ~/p/linux-dim/src MddPWD/build srcx=3D$PWD
> make: Entering directory '/home/ldmartin/p/linux-dim/src'
> make[2]: *** No rule to make target '/home/ldmartin/p/kmod/testsuite/modu=
le-playground/build/mod-simple.o', needed by '/home/ldmartin/p/kmod/testsui=
te/module-playground/build/'.  Stop.
> make[1]: *** [/home/ldmartin/p/linux-dim/src/Makefile:1922: /home/ldmarti=
n/p/kmod/testsuite/module-playground/build] Error 2
> make: *** [Makefile:240: __sub-make] Error 2
> make: Leaving directory '/home/ldmartin/p/linux-dim/src'


I suggested M=3Drelative-path + VPATH=3D
but I do not know what you want to achieve.

https://lore.kernel.org/linux-kbuild/CAK7LNATGGibmjZzYX_A2SkJthmOPbKw2K3R7J=
YuHTWzgGL2Zjg@mail.gmail.com/







> Lucas De Marchi
>
> >
> >Thanks
> >Lucas De Marchi
> >
> >>
> >>You also can refer to:
> >>   https://github.com/lengjingzju/cbuild-ng/blob/main/scripts/core/inc.=
mod.mk
> >>1. The complete command is as follows:
> >>   make -C <Linux kernel source code directory> O=3D<Linux kernel compi=
lation output directory> src=3D<Current driver module source code directory=
> M=3D<Current driver module compilation output directory>
> >>2. If the <Linux kernel source code directory> and the <Linux kernel co=
mpilation output directory> are the same, <O=3Dxxx> can be omitted:
> >>   make -C <Linux kernel source code directory> src=3D<Current driver m=
odule source code directory> M=3D<Current driver module compilation output =
directory>
> >>2. If the <Current driver module source code directory> and the <Curren=
t driver module compilation output directory> are the same, <src=3Dxxx> can=
 be omitted:
> >>   make -C <Linux kernel source code directory> O=3D<Linux kernel compi=
lation output directory> M=3D<Current driver module source code directory>
> >>
> >>Best Regards!
> >>Jing Leng



--=20
Best Regards
Masahiro Yamada

