Return-Path: <linux-kbuild+bounces-3640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA4197CFA2
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 02:24:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 405591F22E60
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2024 00:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1C6279C2;
	Fri, 20 Sep 2024 00:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4LyBNSm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B63B644;
	Fri, 20 Sep 2024 00:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726791888; cv=none; b=KusKA2KBg/gqWtSlkhiRM7vAXqyf2hj0c8YVVR2hGnNmZhVl4CnEQS4rH1Cf6pUXGvzw1T5nFKZmNdNP6A3cUECY3xCWc7w6hI/zHnNqpN6lTngr7TOs2cxXQzeJa+bV9HDWMGbLrKyA77xSZCB41zvdV51r9P8r/hEqqcLmFaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726791888; c=relaxed/simple;
	bh=Hqd6RXlwbvPRlhDdh/h6DKLVXsmzrExjE+8yh8izd/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vj4HoPggL1ZtBOwiH/eYC71w5V+X+imKxup6F1qoRD0fIisaYKFXewsvBkk+NwD2vBvKwnZh+pjjxxGmBegKeQnoQdBcZzTtY2gtc15R4goSsOwMgXpMC/MG+cP2/M9VvqKVQaUja+EhK6eHOkfQV6fkO8UnkOOrg4oz9eq4rPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4LyBNSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1575EC4CEC4;
	Fri, 20 Sep 2024 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726791888;
	bh=Hqd6RXlwbvPRlhDdh/h6DKLVXsmzrExjE+8yh8izd/w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O4LyBNSmPF/V4D3wDEE5AInT38jIIGo1jeXZ2ExXJkw9ikqTTqnozlHcJ5zK22x9L
	 5TCay6hhG64zggy+/FJNV3SJB1KL+EKeTNxQiL3Xe1XDqMK/43xLW2V6pVhD6QCOCL
	 38vt5XrQWxjSWxvWl2q46yzAEX2hiGQSPcQMksIRQ1BMbiASblrctj36RtzhPr3Ps/
	 unyc/Um5DHri1zO7A4SjPiCO4U3rDkczjDhclJKFT/aLjXrYpmg9+puK5uRIeas6f3
	 F88JmERBENTRXtO4Cm7jcqAgPcsAZsDJI9jsCRvlQaiX95uywNMBCQb8+eaUJG834Y
	 k6no0qEv7RF+g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f75c6ed428so16101111fa.0;
        Thu, 19 Sep 2024 17:24:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOHlVosLJv9pTVENQ/o4uuTgqLkw/VnEUo5eZELj44/qbPayWvbteYvrEdeH28y1Jx0rs4Ddi0CQbTwmdpuSfgLYEN@vger.kernel.org, AJvYcCXjnmVe1vQ37SFMT2NlOjD9JN/pimgVog9+KmWaMOQQZJL9Z+kfaHuHvKvJS7LpaJHndXtnCaEVvtRuuo4=@vger.kernel.org, AJvYcCXpDdkX0rKuSwk3S1KQCcEgly995T50geHEfArR0DRNMebknrlsUVjDtrsrVlrV+qHiAclzEHLK7qqx2snOyw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0o6dSs+oUry7HBUYO4JkXlp2neZ9Y0zKNhp8daHXL/rT1TTTE
	QZpzzh52Ykg1Y1XWIqDINd7w9V2xwyroeEai56yZ5sZjVNmvKiIRKFUaPeqJz7ift2dZrSxlPuf
	fDZnjq698uNKmjpaUPZ5fKc4QZTc=
X-Google-Smtp-Source: AGHT+IEfFRLhYVDcncbvSkDb1MMFX/XL/QQpOmSx9gq+6xL64xUG+xbb6AJvb+vfqRGs/2zyIj4vP4SHNMfzKtTGf1k=
X-Received: by 2002:a2e:9e10:0:b0:2f7:5b47:ac1f with SMTP id
 38308e7fff4ca-2f7cb337718mr6573311fa.29.1726791886779; Thu, 19 Sep 2024
 17:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240906144506.1151789-1-kris.van.hees@oracle.com>
 <20240906144506.1151789-3-kris.van.hees@oracle.com> <CAK7LNAQtuqBwheX6SLWMyKE0h2wLzApii1xyMBqNs3ge_JSUvg@mail.gmail.com>
 <Zt9P5p6XGBp2Uwde@oracle.com> <CAK7LNAS53tB708sRSbCA=_2GP_sAoNYHtLzhYMV=5U-+FfcR3Q@mail.gmail.com>
 <ZuyRPYFl4uDijwNg@kvh-deb-bpf.us.oracle.com>
In-Reply-To: <ZuyRPYFl4uDijwNg@kvh-deb-bpf.us.oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 20 Sep 2024 09:24:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-CdKqgthaKrh+e3isuQACQZyDyFemR9S17R4CQAJROw@mail.gmail.com>
Message-ID: <CAK7LNAQ-CdKqgthaKrh+e3isuQACQZyDyFemR9S17R4CQAJROw@mail.gmail.com>
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

On Fri, Sep 20, 2024 at 6:02=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> On Thu, Sep 19, 2024 at 11:28:44PM +0900, Masahiro Yamada wrote:
> > Hi Kris,
> >
> >
> >
> > On Tue, Sep 10, 2024 at 4:43=E2=80=AFAM Kris Van Hees <kris.van.hees@or=
acle.com> wrote:
> > >
> > > On Sun, Sep 08, 2024 at 11:50:51AM +0900, Masahiro Yamada wrote:
> > > > On Fri, Sep 6, 2024 at 11:45???PM Kris Van Hees <kris.van.hees@orac=
le.com> wrote:
> > > > >
> > > > > Create file module.builtin.ranges that can be used to find where
> > > > > built-in modules are located by their addresses. This will be use=
ful for
> > > > > tracing tools to find what functions are for various built-in mod=
ules.
> > > > >
> > > > > The offset range data for builtin modules is generated using:
> > > > >  - modules.builtin: associates object files with module names
> > > > >  - vmlinux.map: provides load order of sections and offset of fir=
st member
> > > > >     per section
> > > > >  - vmlinux.o.map: provides offset of object file content per sect=
ion
> > > > >  - .*.cmd: build cmd file with KBUILD_MODFILE
> > > > >
> > > > > The generated data will look like:
> > > > >
> > > > > .text 00000000-00000000 =3D _text
> > > > > .text 0000baf0-0000cb10 amd_uncore
> > > > > .text 0009bd10-0009c8e0 iosf_mbi
> > > > > ...
> > > > > .text 00b9f080-00ba011a intel_skl_int3472_discrete
> > > > > .text 00ba0120-00ba03c0 intel_skl_int3472_discrete intel_skl_int3=
472_tps68470
> > > > > .text 00ba03c0-00ba08d6 intel_skl_int3472_tps68470
> > > > > ...
> > > > > .data 00000000-00000000 =3D _sdata
> > > > > .data 0000f020-0000f680 amd_uncore
> > > > >
> > > > > For each ELF section, it lists the offset of the first symbol.  T=
his can
> > > > > be used to determine the base address of the section at runtime.
> > > > >
> > > > > Next, it lists (in strict ascending order) offset ranges in that =
section
> > > > > that cover the symbols of one or more builtin modules.  Multiple =
ranges
> > > > > can apply to a single module, and ranges can be shared between mo=
dules.
> > > > >
> > > > > The CONFIG_BUILTIN_MODULE_RANGES option controls whether offset r=
ange data
> > > > > is generated for kernel modules that are built into the kernel im=
age.
> > > > >
> > > > > How it works:
> > > > >
> > > > >  1. The modules.builtin file is parsed to obtain a list of built-=
in
> > > > >     module names and their associated object names (the .ko file =
that
> > > > >     the module would be in if it were a loadable module, hereafte=
r
> > > > >     referred to as <kmodfile>).  This object name can be used to
> > > > >     identify objects in the kernel compile because any C or assem=
bler
> > > > >     code that ends up into a built-in module will have the option
> > > > >     -DKBUILD_MODFILE=3D<kmodfile> present in its build command, a=
nd those
> > > > >     can be found in the .<obj>.cmd file in the kernel build tree.
> > > > >
> > > > >     If an object is part of multiple modules, they will all be li=
sted
> > > > >     in the KBUILD_MODFILE option argument.
> > > > >
> > > > >     This allows us to conclusively determine whether an object in=
 the
> > > > >     kernel build belong to any modules, and which.
> > > > >
> > > > >  2. The vmlinux.map is parsed next to determine the base address =
of each
> > > > >     top level section so that all addresses into the section can =
be
> > > > >     turned into offsets.  This makes it possible to handle sectio=
ns
> > > > >     getting loaded at different addresses at system boot.
> > > > >
> > > > >     We also determine an 'anchor' symbol at the beginning of each
> > > > >     section to make it possible to calculate the true base addres=
s of
> > > > >     a section at runtime (i.e. symbol address - symbol offset).
> > > > >
> > > > >     We collect start addresses of sections that are included in t=
he top
> > > > >     level section.  This is used when vmlinux is linked using vml=
inux.o,
> > > > >     because in that case, we need to look at the vmlinux.o linker=
 map to
> > > > >     know what object a symbol is found in.
> > > > >
> > > > >     And finally, we process each symbol that is listed in vmlinux=
.map
> > > > >     (or vmlinux.o.map) based on the following structure:
> > > > >
> > > > >     vmlinux linked from vmlinux.a:
> > > > >
> > > > >       vmlinux.map:
> > > > >         <top level section>
> > > > >           <included section>  -- might be same as top level secti=
on)
> > > > >             <object>          -- built-in association known
> > > > >               <symbol>        -- belongs to module(s) object belo=
ngs to
> > > > >               ...
> > > > >
> > > > >     vmlinux linked from vmlinux.o:
> > > > >
> > > > >       vmlinux.map:
> > > > >         <top level section>
> > > > >           <included section>  -- might be same as top level secti=
on)
> > > > >             vmlinux.o         -- need to use vmlinux.o.map
> > > > >               <symbol>        -- ignored
> > > > >               ...
> > > > >
> > > > >       vmlinux.o.map:
> > > > >         <section>
> > > > >             <object>          -- built-in association known
> > > > >               <symbol>        -- belongs to module(s) object belo=
ngs to
> > > > >               ...
> > > > >
> > > > >  3. As sections, objects, and symbols are processed, offset range=
s are
> > > > >     constructed in a straight-forward way:
> > > > >
> > > > >       - If the symbol belongs to one or more built-in modules:
> > > > >           - If we were working on the same module(s), extend the =
range
> > > > >             to include this object
> > > > >           - If we were working on another module(s), close that r=
ange,
> > > > >             and start the new one
> > > > >       - If the symbol does not belong to any built-in modules:
> > > > >           - If we were working on a module(s) range, close that r=
ange
> > > > >
> > > > > Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> > > > > Reviewed-by: Nick Alcock <nick.alcock@oracle.com>
> > > > > Reviewed-by: Alan Maguire <alan.maguire@oracle.com>
> > > > > Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > > > > Tested-by: Sam James <sam@gentoo.org>
> > > > > ---
> > > >
> > > >
> > > > If v10 is the final version, I offer to locally squash the followin=
g:
> > >
> > > Thanks!  That would be great!  v10 is indeed the final version (see b=
wlow).
> > >
> > > > diff --git a/.gitignore b/.gitignore
> > > > index c06a3ef6d6c6..625bf59ad845 100644
> > > > --- a/.gitignore
> > > > +++ b/.gitignore
> > > > @@ -69,6 +69,7 @@ modules.order
> > > >  /Module.markers
> > > >  /modules.builtin
> > > >  /modules.builtin.modinfo
> > > > +/modules.builtin.ranges
> > > >  /modules.nsdeps
> > > >
> > > >  #
> > > > diff --git a/Documentation/dontdiff b/Documentation/dontdiff
> > > > index 3c399f132e2d..a867aea95c40 100644
> > > > --- a/Documentation/dontdiff
> > > > +++ b/Documentation/dontdiff
> > > > @@ -180,6 +180,7 @@ modpost
> > > >  modules-only.symvers
> > > >  modules.builtin
> > > >  modules.builtin.modinfo
> > > > +modules.builtin.ranges
> > > >  modules.nsdeps
> > > >  modules.order
> > > >  modversions.h*
> > >
> > > > If Sami reports more errors and you end up with v11,
> > > > please remember to fold it.
> > >
> > > Sami confirmed v10 [0].  Can you squash his reviewed-by and tested-by=
 as well?
> > >
> > > Thanks for all the help!
> > >
> > >         Kris
> > >
> > > [0] https://lore.kernel.org/lkml/20240909191801.GA398180@google.com/
> >
> >
> >
> >
> >
> > Can you please add a small explanation to
> > Documentation/kbuild/kbuild.rst ?
> >
> >
> > It documents modules.order, modules.builtin, modules.builtin.modinfo.
> >
> > Having modules.builtin.ranges there will keep the consistency.
> >
> >
> >
> > You do not need to re-submit the entire patch.
> >
> > If you provide a diff in a few days,
> > I will locally squash it.
>
> Thank you for offering to locally squash the diff.
>
>         Kris
>
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuil=
d.rst
> index 9c8d1d046ea5..142be0c74761 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -22,6 +22,11 @@ modules.builtin.modinfo
>  This file contains modinfo from all modules that are built into the kern=
el.
>  Unlike modinfo of a separate module, all fields are prefixed with module=
 name.
>
> +modules.builtin.ranges
> +----------------------
> +This file contains address offset ranges (per ELF section) for all modul=
es
> +that are built into the kernel.  Together with System.map, it can be use=
d
> +to associate module names with symbols.
>
>  Environment variables
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D


Squashed to v10 2/4.
Thanks!



--=20
Best Regards
Masahiro Yamada

