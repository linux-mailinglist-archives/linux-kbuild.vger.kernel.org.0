Return-Path: <linux-kbuild+bounces-1865-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12958C7080
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 04:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC296B22AFB
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 May 2024 02:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC1B29CE5;
	Thu, 16 May 2024 02:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubbK04He"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E24249F7;
	Thu, 16 May 2024 02:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715828237; cv=none; b=l/pqNEF8nstFkrGTAqVhA5f+jDeakgqEwC7x4Ia3bcJrNhIbcLngJxItXMWHLq3TYqNSJaE2TOY/ufSKNbAzwEerr1Ms3VgSGkM0AMbMRrcMaaWBGRXTxgo/ifyobYsEC23oQrymeRzeXihg6/O12MjVULMXGlW5wl8MEr0r8AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715828237; c=relaxed/simple;
	bh=rvzB2c+5K+tSKQUQdjVcVTg7NDEPAimqY/VI6X6o7wI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXQbB1+klBKUhLOcoeKJnxhB7mdDA0Aba3UtbERZBZioaQBKWsdQHHFfg+2oJfZTF//wrwbF8wifsTiqyxTTV2yyzbKqbQxVRNW1W3+0ktqhKJPwtvLGvBQX1qv94Kp4fWfSz8CWCWmYGy/prz2wgdegTtHTKQJ2Ix+9kD45SyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ubbK04He; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AEB5C32786;
	Thu, 16 May 2024 02:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715828237;
	bh=rvzB2c+5K+tSKQUQdjVcVTg7NDEPAimqY/VI6X6o7wI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ubbK04HeSCwv4J84OA4MPWiyDbMwPAG7k0z6zkWZiE76A5iLSmCTol/3jdRKTxGru
	 tuKsQliLwtv1mZ4NcqwKAVv6KibZh9/MWvGcYTR1JreU8DbbyvMhdjoLPRMFQ9nJjn
	 erimRl+KpWBzV/XOlKx3q2OJyQFOiap/kT/rnjddQZzeuYWOsOmFJfwVPe/FyaQOuC
	 rmoobgb/ItmE1ovF/SEriJtenuObGn3ndt6FfelrfbV3Fl+6nXWet3r0JixQZqiEAQ
	 jBRMqLDuvX4+6BlL2X9PNxvNpsmjBr80MSDgJWSfi7q5tD1aVQVCC/0eZ3CYrsWyWl
	 PNj4d43qlD6qA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2df83058d48so2867851fa.1;
        Wed, 15 May 2024 19:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB6GClIdbwZ3/HeemccXuYWTH4/bYCKO/9gZZ3g1gRuxYD9SskDyLb7+cTM/dah7mYj47FnKQFWSKt0Z4k4oVO9qV4xOPHXKsWo+kuh8RQg7ZeuHg82BRKdONj+1EzaqZvPQeXagek7xV4gpdz9iDwF8IqftETC9Pdg+b7Z1v9GTJiog2/U4LnYYmNaQE07A==
X-Gm-Message-State: AOJu0YxXldtJo2shN8IiXxGRaeuF1z/ijQH1e+AOqPCe1rDl3HVY627E
	YU5aY9xOqC+5ipePA7fEsk0Rjq81PT4UN+FkhczVXgpZy5at+HIiGUsi5Tuw8PhkIRNlQ46J66P
	6lCMRHd9VCWHNImrCBLvovp3Q6j8=
X-Google-Smtp-Source: AGHT+IE7fy4YTIxImy+5LghYG+uGawZq4fEPT5h9Z75JqfrIPrMR8odl8dcIbIniOFnkPtUIdCP7vSUcSMa7WVqEHVY=
X-Received: by 2002:a2e:9ed9:0:b0:2e5:2eaf:b0a4 with SMTP id
 38308e7fff4ca-2e52eafb1e4mr102648091fa.41.1715828235704; Wed, 15 May 2024
 19:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240511224035.27775-1-kris.van.hees@oracle.com>
 <CAK7LNATwSDyAWR2FqccF5RFLpw5CYFyndR0N814nC7G7EaL2Tw@mail.gmail.com> <ZkTnwwyTF0WSMmqI@oracle.com>
In-Reply-To: <ZkTnwwyTF0WSMmqI@oracle.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 16 May 2024 11:56:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRzGt8EWhRcXnj=2G7E1KOq4E-PGUX53wBoCXAsmSr_g@mail.gmail.com>
Message-ID: <CAK7LNARRzGt8EWhRcXnj=2G7E1KOq4E-PGUX53wBoCXAsmSr_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] Generate address range data for built-in modules
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	Steven Rostedt <rostedt@goodmis.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni <elena.zannoni@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2024 at 1:50=E2=80=AFAM Kris Van Hees <kris.van.hees@oracle=
.com> wrote:
>
> On Mon, May 13, 2024 at 01:43:15PM +0900, Masahiro Yamada wrote:
> > On Sun, May 12, 2024 at 7:42???AM Kris Van Hees <kris.van.hees@oracle.c=
om> wrote:
> > >
> > > Especially for tracing applications, it is convenient to be able to
> > > refer to a symbol using a <module name, symbol name> pair and to be a=
ble
> > > to translate an address into a <nodule mname, symbol name> pair.  But
> > > that does not work if the module is built into the kernel because the
> > > object files that comprise the built-in module implementation are sim=
ply
> > > linked into the kernel image along with all other kernel object files=
.
> > >
> > > This is especially visible when providing tracing scripts for support
> > > purposes, where the developer of the script targets a particular kern=
el
> > > version, but does not have control over whether the target system has
> > > a particular module as loadable module or built-in module.  When trac=
ing
> > > symbols within a module, referring them by <module name, symbol name>
> > > pairs is both convenient and aids symbol lookup.  But that naming wil=
l
> > > not work if the module name information is lost if the module is buil=
t
> > > into the kernel on the target system.
> > >
> > > Earlier work addressing this loss of information for built-in modules
> > > involved adding module name information to the kallsyms data, but tha=
t
> > > required more invasive code in the kernel proper.  This work never di=
d
> > > get merged into the kernel tree.
> > >
> > > All that is really needed is knowing whether a given address belongs =
to
> > > a particular module (or multiple modules if they share an object file=
).
> > > Or in other words, whether that address falls within an address range
> > > that is associated with one or more modules.
> > >
> > > This patch series is baaed on Luis Chamberlain's patch to generate
> > > modules.builtin.objs, associating built-in modules with their object
> > > files.  Using this data, vmlinux.o.map and vmlinux.map can be parsed =
in
> > > a single pass to generate a modules.buitin.ranges file with offset ra=
nge
> > > information (relative to the base address of the associated section) =
for
> > > built-in modules.  The file gets installed along with the other
> > > modules.builtin.* files.
> >
> >
> >
> > I still do not want to see modules.builtin.objs.
> >
> >
> > During the vmlinux.o.map parse, every time an object path
> > is encountered, you can open the corresponding .cmd file.
> >
> >
> >
> > Let's say, you have the following in vmlinux.o.map:
> >
> > .text          0x00000000007d4fe0     0x46c8 drivers/i2c/i2c-core-base.=
o
> >
> >
> >
> > You can check drivers/i2c/.i2c-core-base.o.cmd
> >
> >
> > $ cat drivers/i2c/.i2c-core-base.o.cmd | tr ' ' '\n' | grep KBUILD_MODF=
ILE
> > -DKBUILD_MODFILE=3D'"drivers/i2c/i2c-core"'
> >
> >
> > Now you know this object is part of drivers/i2c/i2c-core
> > (that is, its modname is "i2c-core")
> >
> >
> >
> >
> > Next, you will get the following:
> >
> >  .text          0x00000000007dc550     0x13c4 drivers/i2c/i2c-core-acpi=
.o
> >
> >
> > $ cat drivers/i2c/.i2c-core-acpi.o.cmd | tr ' ' '\n' | grep KBUILD_MODF=
ILE
> > -DKBUILD_MODFILE=3D'"drivers/i2c/i2c-core"'
> >
> >
> > This one is also a part of drivers/i2c/i2c-core
> >
> >
> > You will get the address range of "i2c-core" without changing Makefiles=
.
>
> Thank you for this suggestion.  I have this approach now implemented, mak=
ing
> use of both KBUILD_MODFILE and KBUILD_MODNAME (both are needed to conclus=
ively
> determine that an object belongs to a module).
>
> However, this is not catching objects that are compiled from assembler so=
urce,
> because modfile_flags and modname_flags are not added to the assembler fl=
ags,
> and thus KBUILD_MODFILE and KBUILD_MODNAME are not present in the .cmd fi=
le
> for those objects.
>
> It would seem that it is harmless to add those flags to assembler flags, =
so
> would that be an acceptable solution?  It definitely would provide consis=
tency
> with non-asm objects.  And we already pass modfile and modname flags to t=
he
> non-asm builds for objects that most certainly do not belong in modules a=
mnyway,
> e.g.
>
> $ cat arch/x86/boot/.cmdline.o.cmd| tr ' ' '\n' | grep -- -DKBUILD_MOD
> -DKBUILD_MODFILE=3D'"arch/x86/boot/cmdline"'
> -DKBUILD_MODNAME=3D'"cmdline"'



I am fine with passing these to *.S files,
as the -D is a preprocessor option.




--
Best Regards
Masahiro Yamada

