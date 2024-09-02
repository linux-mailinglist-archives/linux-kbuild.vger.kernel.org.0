Return-Path: <linux-kbuild+bounces-3317-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 445DD968B73
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE160B20DBA
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D4719F121;
	Mon,  2 Sep 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tN0ATU2F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309142AB7;
	Mon,  2 Sep 2024 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725292853; cv=none; b=biPTJtvLCP8xLzFbK5y+mifGcXMNKfw+VILiL/NWhxxWHHypjNCvuN1l1ZHrSD/7tXA9zPr7aDVC3iVvt7NhfsyMr6+WcXfaQKX1q9IH6xa22cr5zDeCb9SLF1I+K5449qpIgGAPHR8ATkseTf+d7kv7NTiYElR6jN6Mo37D8Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725292853; c=relaxed/simple;
	bh=ogcoaCE/hyJvig97eJHYDHvFIzNpURG66q1HV4z1iy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cfsp4cmARHvsBuXGn/DtTZbOiGwG8ztSORcMHzXXl4GAAFvP+GvRhsbUmjyvhvAkoCufJN+FgO6TRDwbIFKyctv4lUHc0dVvF4z6N+rXOvadba3B/IXCl9FttytzM3q6j1yOhJjDprEmfCnei+/TLYff5eNh9OEe/MoSL4fMExY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tN0ATU2F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F48C4CEC2;
	Mon,  2 Sep 2024 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725292853;
	bh=ogcoaCE/hyJvig97eJHYDHvFIzNpURG66q1HV4z1iy4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tN0ATU2FHBJdmSMiE/DBN3UTsO6kQtIwiLi/PqmKMD1xuOqvglPItBh63mm1RjQD/
	 sMXFt9VQNBG2BNT/5Gbna5tvj1yW4ju6eRf1vaQiLQRVCohSW1Iu7ByKlPSUQwMwt1
	 fqLMlqFIBPeVTNIS9DrXeDbhIo4aSOedvTinLtVjGM6t6C5iU2zZ5onevncQuRI93n
	 Nzq2leFFSIafQQgHxoXGNUQTF3YLfmWTKX7bexRsozKggim7SdsT+Z4E3U22nCtJTX
	 7zfSaoXcr2qmCESRQWGru8PQmQ5yg4ZDiyvIcL8Gvrv8f+LNInBIJMgnswBEOOrU9W
	 n+tpu+Gtu7RWQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f3f68dd44bso46090811fa.3;
        Mon, 02 Sep 2024 09:00:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXU2HhMxiniHEJwYett1XGrbpKYT+oiMqoC7UCCGE9R7A30YZUHwnDgFVc3hQXDyOiey3CQHA65yQjLDIzOYg==@vger.kernel.org, AJvYcCXiEEa29CValFCMnWj/qV8RxyvZK1NkflB8DQP2mQEanibIypqfYpmW5YiJMPBp2uIXKu54fv0n4aEwjwfQEFi0PyPl@vger.kernel.org, AJvYcCXmB8HVFYbumotPoiTgZm8/SUXRLeDUXBwBiixZL3DREwoZuFB4pIOtRa2YzcxFob/lxQp5+i5twRLUEXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz80d5hkpiRGbJqSlxk/c9O+J4MOBhESjYliSPhGwRD5lJiWJj/
	lm5rck5w6l5zz4WhtZmWrhV/ydm63L9X5nCGqV+G/fd8TyPbd8bmPygLHzdimd129zeCaAo7I9Z
	1Eujzm0gGBf2t+j9RmN5UZ62W4vI=
X-Google-Smtp-Source: AGHT+IFEY/3qcPIqsP4Hv2V66aWhFkcl/thx86RrU/BVKXB9nQwevtgL9rJQltD5ebYJ8pH25LWHZ2HG8OzZ8+0JzL8=
X-Received: by 2002:a05:651c:1548:b0:2f3:f193:d2d0 with SMTP id
 38308e7fff4ca-2f61e0a5a5cmr72768981fa.33.1725292851911; Mon, 02 Sep 2024
 09:00:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824033757.52005-1-kris.van.hees@oracle.com>
 <20240824033757.52005-3-kris.van.hees@oracle.com> <CAK7LNASKaCcmyTJPV+PhNyNu2ogFMU4OzgM0UncLRSoZa64ejA@mail.gmail.com>
 <ZtXGYoexkGO7AwbA@oracle.com>
In-Reply-To: <ZtXGYoexkGO7AwbA@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Sep 2024 01:00:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR5+WifCJh_OfE14XNatVEGisS2rOu-dJejhD3skXVnUQ@mail.gmail.com>
Message-ID: <CAK7LNAR5+WifCJh_OfE14XNatVEGisS2rOu-dJejhD3skXVnUQ@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] kbuild: generate offset range data for builtin modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Nick Alcock <nick.alcock@oracle.com>, Alan Maguire <alan.maguire@oracle.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:06=E2=80=AFPM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> On Mon, Sep 02, 2024 at 04:26:48PM +0900, Masahiro Yamada wrote:
> > On Sat, Aug 24, 2024 at 12:38???PM Kris Van Hees <kris.van.hees@oracle.=
com> wrote:
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
> > > ---
> > >     Changes since v8:
> > >      - Added support for built-in Rust modules.
> > >      - Added optional 4th argument to specify kernel build directory.
> >
> >
> > When is the 4th parameter useful?
> >
> > The map file knows all object paths.
> >
> > The object file and its .*.cmd file exist in the same directory.
> >
> > I did not find a use-case where the kdir prefix plays a role.
> >
> > Did I miss something?
>
> I added it as an optional parameter in case there is a reason to run the
> script manually and the kernel was built using O=3D<objdir>.


I do not think it is so useful.

You would end up with adding the build path to all four parameters.

$ scripts/generate_builtin_ranges.awk \
  /path/to/build/dir/modules.builtin \
  /path/to/build/dir/vmlinux.map \
  /path/to/build/dir/vmlinux.o.map \
  /path/to/build/dir




If you need to manual execution,
I'd suggest the following:

$ cd /path/to/build/dir
$ source/scripts/generate_builtin_ranges.awk \
   modules.builtin vmlinux.map vmlinux.o.map

(Please note that the build directory has
a symbolic link to the source directory)









--=20
Best Regards
Masahiro Yamada

