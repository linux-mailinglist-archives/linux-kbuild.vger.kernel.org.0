Return-Path: <linux-kbuild+bounces-3626-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246897CAFD
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 16:29:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2762E1C224E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Sep 2024 14:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDA419FA65;
	Thu, 19 Sep 2024 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwSeo4nQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C0A19EEC5;
	Thu, 19 Sep 2024 14:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726756162; cv=none; b=J4MClP5+BLXROQFDcJMCq183gMOXgQyOcnWJROKEhqODCQfKhErIsocGA2g7Pbs17/9JwYr2TmCwRcjfsZWMa+ds8nk5PhL6jkbooeJh/OFM8t2LBovQUGVtMnpJDwBfvQrjNd0yoGDgHZjgqnROZqFGC+CnjB0nB9iK5JFcByI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726756162; c=relaxed/simple;
	bh=ht263jlSlLmPBUbNBH4X+2pqoE5N7JgdCaCxHMiA680=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGZVdFGctD21M+L3HSLP/wdF1G+k0XOv9L+sLEu1AKmnpvjBkLZLumEyYexuW4V1n7JMR5izjtJangy70tpanHVZTJv6T13O2akjn7GJXs2eijFMBcgR/RAsVCVc77o2Bm8Vei5K2QjLe5w2Td0I7zAJ0Wme2GMhrCYq9yCAGzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwSeo4nQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26BC9C4AF0B;
	Thu, 19 Sep 2024 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726756162;
	bh=ht263jlSlLmPBUbNBH4X+2pqoE5N7JgdCaCxHMiA680=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JwSeo4nQv6wsJpX50zt8TA+/O7DM/Hb1tmPHM2dqcbpcT301dBE9M24pnKoir2xz3
	 SCMH2KfbWQoMelwk40tE1LPOkrH1QquCAzJuH+oAwU1jN09ei5RsPrBvQZZdxABuRq
	 7Fr3jSqIQcGDfNlvHihArsZkaxyMNczbj5W4XSa4s64qtJJBLxXtyBPJBJo8iyAS+P
	 1GN9T9j+h5U4G2g+yjUEP3Artyo44SwShktCww8UU6JeY/QB+0nHopbIt4nMNzASsA
	 wV1m+3KUy4xWAyWNb7P0WzCY9ALWK8kxGpRvSffSIqizgfQUL66wSz1VRf7WoMNIsU
	 /EJoZ2qiVoD6w==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f75e5f3debso8862601fa.1;
        Thu, 19 Sep 2024 07:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEKm65sK1YnwkYZx/4SIKx3Loxyt3LO+gLOpfwVhHUTIuaJIrg4/Nk783jrfCWT8q2uWL57rPIhP1GIzE=@vger.kernel.org, AJvYcCW9mQ/qLhGQvd+Zoq1xmfToSQcqje8z9aM5oK+ppj+GHReQXTObwBPADw+T1wHjkzqzAlNCKfS8Xy0VzaxzJkwQuBE2@vger.kernel.org, AJvYcCWB6VIy6ItbDgYtx/LvPpEluSW1Rr6G9XSzekfcV/tPbDfYwXksiTaysqyGKiIhm8tI9/IViTfRVca4uxjY1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+HRcRjssaN8vOTY4B81toKJKBZQbG6keU8KY3dEBfOgbqZDNd
	1bwf7SJR9YKaXHN04Vv6GI6wll0pkvJ6ERBkBtE5+PgVgplyi3PsUtqVYJwVR4S5DV20ODUJIf8
	GM9wFfK/bf6y49ZiEZ2fHVbdauWw=
X-Google-Smtp-Source: AGHT+IFVE6zY9FexSl6ynBperG/EYYCzhp2OXZ/SQ3f6zr5+ijPUDF95zfWUkbGG96JaS2DY97+xiVz7Ooy+2mYL4rg=
X-Received: by 2002:a2e:bc09:0:b0:2f6:4cc0:5438 with SMTP id
 38308e7fff4ca-2f791a57ea7mr132240961fa.29.1726756160737; Thu, 19 Sep 2024
 07:29:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
 <20240906144506.1151789-3-kris.van.hees@oracle.com> <CAK7LNAQtuqBwheX6SLWMyKE0h2wLzApii1xyMBqNs3ge_JSUvg@mail.gmail.com>
 <Zt9P5p6XGBp2Uwde@oracle.com>
In-Reply-To: <Zt9P5p6XGBp2Uwde@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 19 Sep 2024 23:28:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS53tB708sRSbCA=_2GP_sAoNYHtLzhYMV=5U-+FfcR3Q@mail.gmail.com>
Message-ID: <CAK7LNAS53tB708sRSbCA=_2GP_sAoNYHtLzhYMV=5U-+FfcR3Q@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] kbuild: generate offset range data for builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sam James <sam@gentoo.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, 
	Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kris,



On Tue, Sep 10, 2024 at 4:43=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> On Sun, Sep 08, 2024 at 11:50:51AM +0900, Masahiro Yamada wrote:
> > On Fri, Sep 6, 2024 at 11:45???PM Kris Van Hees <kris.van.hees@oracle.c=
om> wrote:
> > >
> > > Create file module.builtin.ranges that can be used to find where
> > > built-in modules are located by their addresses. This will be useful =
for
> > > tracing tools to find what functions are for various built-in modules=
.
> > >
> > > The offset range data for builtin modules is generated using:
> > >  - modules.builtin: associates object files with module names
> > >  - vmlinux.map: provides load order of sections and offset of first m=
ember
> > >     per section
> > >  - vmlinux.o.map: provides offset of object file content per section
> > >  - .*.cmd: build cmd file with KBUILD_MODFILE
> > >
> > > The generated data will look like:
> > >
> > > .text 00000000-00000000 =3D _text
> > > .text 0000baf0-0000cb10 amd_uncore
> > > .text 0009bd10-0009c8e0 iosf_mbi
> > > ...
> > > .text 00b9f080-00ba011a intel_skl_int3472_discrete
> > > .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3472_=
tps68470
> > > .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> > > ...
> > > .data 00000000-00000000 =3D _sdata
> > > .data 0000f020-0000f680 amd_uncore
> > >
> > > For each ELF section, it lists the offset of the first symbol.  This =
can
> > > be used to determine the base address of the section at runtime.
> > >
> > > Next, it lists (in strict ascending order) offset ranges in that sect=
ion
> > > that cover the symbols of one or more builtin modules.  Multiple rang=
es
> > > can apply to a single module, and ranges can be shared between module=
s.
> > >
> > > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset range=
 data
> > > is generated for kernel modules that are built into the kernel image.
> > >
> > > How it works:
> > >
> > >  1. The modules.builtin file is parsed to obtain a list of built-in
> > >     module names and their associated object names (the .ko file that
> > >     the module would be in if it were a loadable module, hereafter
> > >     referred to as <kmodfile>).  This object name can be used to
> > >     identify objects in the kernel compile because any C or assembler
> > >     code that ends up into a built-in module will have the option
> > >     -DKBUILD_MODFILE=3D<kmodfile> present in its build command, and t=
hose
> > >     can be found in the .<obj>.cmd file in the kernel build tree.
> > >
> > >     If an object is part of multiple modules, they will all be listed
> > >     in the KBUILD_MODFILE option argument.
> > >
> > >     This allows us to conclusively determine whether an object in the
> > >     kernel build belong to any modules, and which.
> > >
> > >  2. The vmlinux.map is parsed next to determine the base address of e=
ach
> > >     top level section so that all addresses into the section can be
> > >     turned into offsets.  This makes it possible to handle sections
> > >     getting loaded at different addresses at system boot.
> > >
> > >     We also determine an 'anchor' symbol at the beginning of each
> > >     section to make it possible to calculate the true base address of
> > >     a section at runtime (i.e. symbol address - symbol offset).
> > >
> > >     We collect start addresses of sections that are included in the t=
op
> > >     level section.  This is used when vmlinux is linked using vmlinux=
.o,
> > >     because in that case, we need to look at the vmlinux.o linker map=
 to
> > >     know what object a symbol is found in.
> > >
> > >     And finally, we process each symbol that is listed in vmlinux.map
> > >     (or vmlinux.o.map) based on the following structure:
> > >
> > >     vmlinux linked from vmlinux.a:
> > >
> > >       vmlinux.map:
> > >         <top level section>
> > >           <included section>  -- might be same as top level section)
> > >             <object>          -- built-in association known
> > >               <symbol>        -- belongs to module(s) object belongs =
to
> > >               ...
> > >
> > >     vmlinux linked from vmlinux.o:
> > >
> > >       vmlinux.map:
> > >         <top level section>
> > >           <included section>  -- might be same as top level section)
> > >             vmlinux.o         -- need to use vmlinux.o.map
> > >               <symbol>        -- ignored
> > >               ...
> > >
> > >       vmlinux.o.map:
> > >         <section>
> > >             <object>          -- built-in association known
> > >               <symbol>        -- belongs to module(s) object belongs =
to
> > >               ...
> > >
> > >  3. As sections, objects, and symbols are processed, offset ranges ar=
e
> > >     constructed in a straight-forward way:
> > >
> > >       - If the symbol belongs to one or more built-in modules:
> > >           - If we were working on the same module(s), extend the rang=
e
> > >             to include this object
> > >           - If we were working on another module(s), close that range=
,
> > >             and start the new one
> > >       - If the symbol does not belong to any built-in modules:
> > >           - If we were working on a module(s) range, close that range
> > >
> > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > > Tested-by: Sam James <sam@gentoo.org>
> > > ---
> >
> >
> > If v10 is the final version, I offer to locally squash the following:
>
> Thanks!  That would be great!  v10 is indeed the final version (see bwlow=
).
>
> > diff --git a/.gitignore b/.gitignore
> > index c06a3ef6d6c6..625bf59ad845 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -69,6 +69,7 @@ modules.order
> >  /Module.markers
> >  /modules.builtin
> >  /modules.builtin.modinfo
> > +/modules.builtin.ranges
> >  /modules.nsdeps
> >
> >  #
> > diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> > index 3c399f132e2d..a867aea95c40 100644
> > --- a/Documentation/dontdiff
> > +++ b/Documentation/dontdiff
> > @@ -180,6 +180,7 @@ modpost
> >  modules-only.symvers
> >  modules.builtin
> >  modules.builtin.modinfo
> > +modules.builtin.ranges
> >  modules.nsdeps
> >  modules.order
> >  modversions.h*
>
> > If Sami reports more errors and you end up with v11,
> > please remember to fold it.
>
> Sami confirmed v10 [0].  Can you squash his reviewed-by and tested-by as =
well?
>
> Thanks for all the help!
>
>         Kris
>
> [0] https://lore.kernel.org/lkml/20240909191801.GA398180@google.com/





Can you please add a small explanation to
Documentation/kbuild/kbuild.rst ?


It documents modules.order, modules.builtin, modules.builtin.modinfo.

Having modules.builtin.ranges there will keep the consistency.



You do not need to re-submit the entire patch.

If you provide a diff in a few days,
I will locally squash it.







--
Best Regards
Masahiro Yamada

