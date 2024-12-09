Return-Path: <linux-kbuild+bounces-5042-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94589E8B08
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 06:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4641162BF1
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 05:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529B543AA1;
	Mon,  9 Dec 2024 05:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qQsKjIJO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623A46B8;
	Mon,  9 Dec 2024 05:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722528; cv=none; b=Cy09mJ9I2r448fXtzcWPLHwJ7QM0m9KT6Q6seGOeGNDuuwqLF33+w7+r6ubngacQizZfeMMebj4JturXo+HJBWK7l9N2vn3s04JKjR8JBf44aH1aXy+qymSa+ARuOotrvpBBNuw4THA0rPME9H7dI0JuvcA68hKiRmRoLAx17jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722528; c=relaxed/simple;
	bh=nUUgLUbptz1AhKUO1RHy4Z6m34EzZZbFM8zEr7fGwkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDOndmnjWqRvtxu0kifeIAwfQa6JQ/Yo4/WMLB8Tzb+fb8UpQkzVSuIuP5kBM/CraFBAexuGlcFv5eAmmDrXbaoSXQ9hLvoy/yPWgB13kwYObj2AgwaJ/sncSPKyAO8Y5aaY6qPCtUvV93FCfdzrpTBuMeXVLicqQkqurFhGPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qQsKjIJO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98728C4CED1;
	Mon,  9 Dec 2024 05:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733722525;
	bh=nUUgLUbptz1AhKUO1RHy4Z6m34EzZZbFM8zEr7fGwkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qQsKjIJOlB8kyDh6XXxkOi8ST2S9C+slarT4O12UGVvdnFHxV70M3pJWhToRrMFIb
	 mc7nbK5MIQI46OniUgxoFQdleQy80t8Uu3fZGzwmwWC780mopMZ5FnwHUk7fi7WtxS
	 qGmwDS6bBqWfJ3C+0MDeErbd5c4Rc2BqhnmAQ0Q58x4S8h75TMTj3kAni9dgi135La
	 W4IkJHr3I8rvYiTjwW/q+LWywpif8uwaNy+2nApjipXzREwgrfhb7PhB9f7JG2kcxr
	 aWElbDXdclnFjq8fO8cD74kUQkwYFvZQEJI3tjjPbdXbE9/+0GH299YKJ2scWeoRvH
	 fLiGFiaXNpzbA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso44579751fa.2;
        Sun, 08 Dec 2024 21:35:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWu6rLso0GPLzpl2rSsSxPeU3P7jAjZOEpA1y15yrhtQHhbGPBAUGhwFb+/d+NMobhwISacxItkOCctSOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsuWFH5Nd1Z6cbyJRXAKsvRtks5wx+WYSZ5hKXIKwYXKjalAWx
	hAXliZFHkHObqc7ct0Ib6p47MIaytmkXtr0uoUWDftPFBmVn5cpAAZgX/WPZyZBi2b+uW8b8++O
	AqciV8BKnhqEb9qpOVZ8Mjgm+Cy4=
X-Google-Smtp-Source: AGHT+IH3wBq+6UHWTGPTipIPWEarPonH3s5qwpZVRtRaMnBG3p947mT0RhMebhPJK4Aob3VxSdMZyPHrLi3IvLfzqHc=
X-Received: by 2002:a2e:a803:0:b0:302:189f:ea58 with SMTP id
 38308e7fff4ca-302189fec00mr16135091fa.27.1733722524268; Sun, 08 Dec 2024
 21:35:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
 <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com>
 <20241204084943.GM1245331@unreal> <CAK7LNATGbTxu9cYGfW6FK5VFfJ2+ut_e1dSFOfo+q6CgM4XHtQ@mail.gmail.com>
 <20241208163557.GA1245331@unreal>
In-Reply-To: <20241208163557.GA1245331@unreal>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Dec 2024 14:34:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASYp+LWyfF78rc3V=ZpR1iu9gZBj4npuE6Md86X0KcWOQ@mail.gmail.com>
Message-ID: <CAK7LNASYp+LWyfF78rc3V=ZpR1iu9gZBj4npuE6Md86X0KcWOQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next] kbuild: Respect request to silent output when
 merging configs
To: Leon Romanovsky <leon@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 1:36=E2=80=AFAM Leon Romanovsky <leon@kernel.org> wr=
ote:
>
> On Sun, Dec 08, 2024 at 11:49:12PM +0900, Masahiro Yamada wrote:
> > On Wed, Dec 4, 2024 at 5:49=E2=80=AFPM Leon Romanovsky <leon@kernel.org=
> wrote:
> > >
> > > On Wed, Dec 04, 2024 at 05:25:50PM +0900, Masahiro Yamada wrote:
> > > > On Tue, Dec 3, 2024 at 10:55=E2=80=AFPM Leon Romanovsky <leon@kerne=
l.org> wrote:
> > > > >
> > > > > From: Leon Romanovsky <leonro@nvidia.com>
> > > > >
> > > > > Builds with -s option (silent) are supposed to silence all output
> > > > > which is not an error. It is the case for target builds but not
> > > > > for configs. These builds generate prints like this:
> > > > >
> > > > > =E2=9E=9C  kernel git:(rdma-next) make -s defconfig debug.config
> > > > >  Using .config as base
> > > > >  Merging ./kernel/configs/debug.config
> > > > >  #
> > > > >  # merged configuration written to .config (needs make)
> > > > >  #
> > > > >  ...
> > > > >  Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./kerne=
l/configs/debug.config:
> > > > >  Previous value: # CONFIG_FUNCTION_TRACER is not set
> > > > >  New value: CONFIG_FUNCTION_TRACER=3Dy
> > > > >  ----
> > > > >
> > > > > Let's honor -s option and hide all non-error output.
> > > >
> > > >
> > > > Is it necessary to add the --quiet option to every script?
> > > >
> > > > Kbuild already provides a generic way to suppress the stdout
> > > > with 'make -s'.
> > > >
> > > > The following code works for me.
> > > > 'make defconfig debug.config' is as verbose as before.
> > > > 'make -s defconfig debug.config' is really silent.
> > >
> > > This is exactly what I'm doing. I'm using -s option and added -q to v=
ery
> > > specific merge_config script, because "-s" is already in use in that
> > > script.
> > >
> > > Before my change on 40384c840ea1 ("Linux 6.13-rc1"):
> > > [leonro@e534d5fa4327 kernel]$ make -s defconfig debug.config
> > > Using .config as base
> > > Merging ./kernel/configs/debug.config
> > > Value of CONFIG_DYNAMIC_DEBUG is redefined by fragment ./kernel/confi=
gs/debug.config:
> > > Previous value: # CONFIG_DYNAMIC_DEBUG is not set
> > > New value: CONFIG_DYNAMIC_DEBUG=3Dy
> > >
> > > Value of CONFIG_PRINTK_CALLER is redefined by fragment ./kernel/confi=
gs/debug.config:
> > > Previous value: # CONFIG_PRINTK_CALLER is not set
> > > New value: CONFIG_PRINTK_CALLER=3Dy
> > > ...
> > >
> > > After my change:
> > > [leonro@4dd2c2078dff kernel]$ make -s defconfig debug.config <--- sil=
ent
> >
> >
> > Not sure if you checked the attached code diff in my previous reply.
> >
> > To make my question clearer, does this suffice your needs?
> > https://lore.kernel.org/all/20241208144622.605523-1-masahiroy@kernel.or=
g/T/#u
>
> Unfortunately no, as both my development suite and our CI rely on
> merge_config script to create right config.
>
> In CI, they run add very specific config options to already
> well-established .config.
> In my development suite, I'm removing extra options with merge_config
> script.
>
>         subprocess.call(cmd + ['defconfig', 'kvm_guest.config', 'nopm.con=
fig', 'debug.config'])
>         subprocess.call(['scripts/kconfig/merge_config.sh', '-y', '-m', '=
-q',
>                          '.config', '/plugins/kernel.config'])
>         subprocess.call(cmd + ['olddefconfig'])
>
> https://github.com/Mellanox/mkt/blob/master/plugins/do-build.py#L19
> https://github.com/Mellanox/mkt/commit/26d7cbd776f508ab506f6d33cfe0e9b0bf=
44d557
>
> I need both chunks, silence make ... and silence merge_config script.


You are no longer talking about 'make -s'.

"> /dev/null" is the standard way to suppress stdout, but you do not use it=
.

Similarly, subprocess.call() supports stdout=3Dsubprocess.DEVNULL
 https://docs.python.org/3.13/library/subprocess.html#subprocess.call







> Thanks
>
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--
Best Regards
Masahiro Yamada

