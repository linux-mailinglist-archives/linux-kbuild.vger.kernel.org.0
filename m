Return-Path: <linux-kbuild+bounces-1086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05B86BF0E
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Feb 2024 03:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8A8E1F21CA5
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Feb 2024 02:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00403612E;
	Thu, 29 Feb 2024 02:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FduDucVB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B09286A7
	for <linux-kbuild@vger.kernel.org>; Thu, 29 Feb 2024 02:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709174304; cv=none; b=T0P1lOiXOhPI1WNKGGaITQyyywj4bosHGqlGfrROs7Y5EIafm2KV0052OZrzTc7tjs43jZFnaEwQr2zixnINejMSoQpCiQc5d5rjDbO+foiCQKUF/su99OmYnRY1mH5H1SD+qFAs04Sj2e4i+2/kSlcNaWNIaqBDMUmgZSxnEhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709174304; c=relaxed/simple;
	bh=EHqzcvrAjGTqF0FUUhRXEgsqfEJuL5cpgsPjwQavpCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YOtZfy57FnoGISZymui/QH6SXUActCyvGwk9jal/sCtsn8v9GOfdlCTLA+8S7fbiA0xywAn6nWMPl88rR561/oR7vhPpNLNSVklLGY47Es+7beAFLT7LZdEohwcvv7XVG0CVQNWIUmYRWeW8RtCGfdWaVS5l72BpyVV87//nPZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FduDucVB; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-512f54fc2dbso296838e87.1
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Feb 2024 18:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709174300; x=1709779100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RW9mG1fsgJ5yWTE36VAoLaKyQv4fZtk4xrM7d3y8Or8=;
        b=FduDucVBEhpp03YEvK9NnRxc1QBn3PgIgPdJNDalTu3ukQpYRFIW4woHUN955DzAKE
         hLWVLD5zxrFytYGSbQPPl7UNg1/HCO71LmQ7WkC7kJpfTVErtF016mYEAaODP9NbsOye
         Wtd/2kxbU4QbcmNIIyIe3hDs1vbFji3OYM6Jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709174300; x=1709779100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RW9mG1fsgJ5yWTE36VAoLaKyQv4fZtk4xrM7d3y8Or8=;
        b=VvYofT/N82yr9Z1sJrue4tj4YjngxzVk9j1dzxlPop3IMZjGatH4XDd5xZMqWbiwfI
         /whUXLyYE9rXEpYYmgty9OeoGZEuBTo3XAi151vaPsU8Jg0ZSTgOtteNyZdPK3W3Xi/4
         GlcDbodfQeDILbVAjEvsn9LI4cpKep6qDHj9usqQPuACX0STRqHFl6iPA9CdrhdkGaud
         1AKzH1q8zeHd03Gu2r1J5PSff5/19I9b9ApnjhteBHxypZC5AA9sxS8GfYiH30RD9Z3d
         3kSIYMB15JqDLR8fkofan0nYaPQA2Yf1N8/xdY1D4EX6MTxK/fdHLaLgJM0lhAwLXra6
         kk2w==
X-Forwarded-Encrypted: i=1; AJvYcCWrvP670mgn7u6yLODiAz/92CDG+ldOUs+MOaiCt7gNXNuPU0BjKVvzN4/Y70GUj3g1hoGLtv2MdTht9YYhEXu7GQW/BmTmzIxt560z
X-Gm-Message-State: AOJu0Yztbl3XijWxpz2aZ6ibSWIntNlAIwVPBibaLpGeMrMktgQX+kHn
	/NOHFPZwgP4dgD2bYQr9HOGUhn+HRb+odbODgmv8mHXDelmF5VuYPPjrczXlCds0JdUwfzWlpUa
	iPlpzllF+NO2PblMtSVWCwZl0cBjQPhhwCN3eKUZWbGuvDildGw==
X-Google-Smtp-Source: AGHT+IHZ98hYmy4tu4i4CaVlSixbmrFQkXLEDBVuULa/wzyr9RRs5GlMTPf1ifS8zFNMl2CmV4tgGKS3HxaWVHFPqS0=
X-Received: by 2002:a05:6512:481e:b0:512:e00b:8da4 with SMTP id
 eo30-20020a056512481e00b00512e00b8da4mr359209lfb.53.1709174299728; Wed, 28
 Feb 2024 18:38:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223092338.2433632-1-wenst@chromium.org> <CAK7LNAQmvyftnFJaByyjH+f4nxcNUKpjkDXwebEH5AhMF6U0Kw@mail.gmail.com>
In-Reply-To: <CAK7LNAQmvyftnFJaByyjH+f4nxcNUKpjkDXwebEH5AhMF6U0Kw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 29 Feb 2024 10:38:08 +0800
Message-ID: <CAGXv+5GmkZdqpNZDFN4dcTyZ-qVS0TjrrqBrBAei6DP+eXLnJg@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: create a list of all built DTB files
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Simon Glass <sjg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2024 at 4:21=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> On Fri, Feb 23, 2024 at 6:23=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > It is useful to have a list of all composite *.dtb files, along with
> > their individual components, generated from the current build.
> >
> > With this commit, 'make dtbs' creates arch/*/boot/dts/dtbs-components,
> > which lists the composite dtb files created in the current build. It
> > maintains the order of the dtb-y additions in Makefiles although the
> > order is not important for DTBs.
> >
> > This compliments the list of all *.dtb and *.dtbo files in dtbs-list,
> > which only includes the files directly added to dtb-y.
> >
> > For example, consider this case:
> >
> >     foo-dtbs :=3D foo_base.dtb foo_overlay.dtbo
> >     dtb-y :=3D bar.dtb foo.dtb
> >
> > In this example, the new list will include foo.dtb with foo_base.dtb an=
d
> > foo_overlay.dtbo on the same line, but not bar.dtb.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Hi,
> >
> > I hacked up this new thing to list out the individual components of eac=
h
> > composite dtb. I think this information would be useful for FIT image
> > generation or other toolchains to consume. For example, instead of
> > including each dtb, a toolchain could realize that some are put togethe=
r
> > using others, and if the bootloader supports it, put together commands
> > to reassemble the end result from the original parts.
> >
> > This is based on and complements Masahiro-san's recent dtbs-list work.
>
>
>
> This is another format of my previous per-dtb "*.dtlst"
> (but I did not pick up 3/4, 4/4 because I did not know what we need after=
 all).
>
> This should be discussed together with how Simon's script will look like.
>
> I can understand your Makefile code, but I still do not know
> how the entire overlay stuff will work in a big picture.

How would you like to proceed? I can through together some changes on top
of Simon's patches as an initial proposal if that helps?

I can use your format if you prefer.


ChenYu

> >
> >  .gitignore             |  1 +
> >  scripts/Makefile.build | 16 ++++++++++++++++
> >  scripts/Makefile.lib   |  8 ++++++--
> >  3 files changed, 23 insertions(+), 2 deletions(-)
> >
> > diff --git a/.gitignore b/.gitignore
> > index c59dc60ba62e..bb5b3bbca4ef 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -52,6 +52,7 @@
> >  *.xz
> >  *.zst
> >  Module.symvers
> > +dtbs-components
> >  dtbs-list
> >  modules.order
> >
> > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > index 4971f54c855e..ba85c2385c9e 100644
> > --- a/scripts/Makefile.build
> > +++ b/scripts/Makefile.build
> > @@ -72,6 +72,7 @@ endif
> >  subdir-builtin :=3D $(sort $(filter %/built-in.a, $(real-obj-y)))
> >  subdir-modorder :=3D $(sort $(filter %/modules.order, $(obj-m)))
> >  subdir-dtbslist :=3D $(sort $(filter %/dtbs-list, $(dtb-y)))
> > +subdir-dtbscomp :=3D $(sort $(filter %/dtbs-components, $(multi-dtb-y)=
))
> >
> >  targets-for-builtin :=3D $(extra-y)
> >
> > @@ -390,6 +391,7 @@ $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(ob=
jtree)/scripts/asn1_compiler
> >  $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
> >  $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
> >  $(subdir-dtbslist): $(obj)/%/dtbs-list: $(obj)/% ;
> > +$(subdir-dtbscomp): $(obj)/%/dtbs-components: $(obj)/% ;
> >
> >  #
> >  # Rule to compile a set of .o files into one .a file (without symbol t=
able)
> > @@ -422,6 +424,20 @@ $(obj)/modules.order: $(obj-m) FORCE
> >  $(obj)/dtbs-list: $(dtb-y) FORCE
> >         $(call if_changed,gen_order)
> >
> > +#
> > +# Rule to create dtbs-components
> > +#
> > +# This is a list of composite dtb(s), along with each dtb's components=
,
> > +# from the current Makefile and its sub-directories.
> > +
> > +cmd_gen_dtb_components =3D { $(foreach m, $(real-prereqs), \
> > +               $(if $(filter %/$(notdir $@), $m), cat $m, \
> > +                       echo $m: $(addprefix $(obj)/,$($(notdir $(m:%.d=
tb=3D%-dtbs))))); \
> > +       ) :; } > $@
> > +
> > +$(obj)/dtbs-components: $(multi-dtb-y) FORCE
> > +       $(call if_changed,gen_dtb_components)
> > +
> >  #
> >  # Rule to compile a set of .o files into one .a file (with symbol tabl=
e)
> >  #
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index dbcac396329e..7c2127a84ac2 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -61,7 +61,6 @@ real-search =3D $(foreach m, $1, $(if $(call suffix-s=
earch, $m, $2, $3 -), $(call
> >  multi-obj-y :=3D $(call multi-search, $(obj-y), .o, -objs -y)
> >  multi-obj-m :=3D $(call multi-search, $(obj-m), .o, -objs -y -m)
> >  multi-obj-ym :=3D $(multi-obj-y) $(multi-obj-m)
> > -
> >  # Replace multi-part objects by their individual parts,
> >  # including built-in.a from subdirectories
> >  real-obj-y :=3D $(call real-search, $(obj-y), .o, -objs -y)
> > @@ -91,6 +90,11 @@ real-dtb-y :=3D $(call real-search, $(dtb-y), .dtb, =
-dtbs)
> >  # Base DTB that overlay is applied onto
> >  base-dtb-y :=3D $(filter %.dtb, $(call real-search, $(multi-dtb-y), .d=
tb, -dtbs))
> >
> > +ifdef need-dtbslist
> > +multi-dtb-y    +=3D $(addsuffix /dtbs-components, $(subdir-ym))
> > +always-y       +=3D dtbs-components
> > +endif
> > +
> >  always-y                       +=3D $(dtb-y)
> >
> >  # Add subdir path
> > @@ -406,7 +410,7 @@ cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assemb=
ler-with-cpp -o $(dtc-tmp) $< ;
> >  quiet_cmd_fdtoverlay =3D DTOVL   $@
> >        cmd_fdtoverlay =3D $(objtree)/scripts/dtc/fdtoverlay -o $@ -i $(=
real-prereqs)
> >
> > -$(multi-dtb-y): FORCE
> > +$(filter-out %/dtbs-components, multi-dtb-y): FORCE
> >         $(call if_changed,fdtoverlay)
> >  $(call multi_depend, $(multi-dtb-y), .dtb, -dtbs)
> >
> > --
> > 2.44.0.rc0.258.g7320e95886-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada

