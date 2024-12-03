Return-Path: <linux-kbuild+bounces-4948-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF70D9E1346
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 07:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 944DF160EB2
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 06:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB6C154430;
	Tue,  3 Dec 2024 06:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sG6hM3D9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DBF29A9
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 06:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733206556; cv=none; b=F9YQefY6bLz4In1peKpOLg6y7jtvjK+oSdTSyiio70FaI5G470wCVkvzS+XtOi7F3rT7bPYME378Ajj6Q34JWk21ti4dl79/Sx5BQ38nR+u4nm6YwLMbo0vBAnDe8Y72ZKH4jqh0v36POm9Mq2K6zAhABLaX5zBaAhAfVxQYS6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733206556; c=relaxed/simple;
	bh=aUN4btWaise441m3rNd1xYW2vmbTBY73AVKHahODaOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XudfecX3fnZt625sUkhvPwbUhhX70b+B5JePuPrklUpimFOTqXp4Kuc3Jz3g7Pstgj4gZtWsgM+Zy1wQti9Ad5N5SxLYgcRM1ud02aIjHGUJWhbiTNES8ZlyswqzjY4tCUDTmxiPch/6gpEuu2UJn3JcosnfbazI1kovjLYoy1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sG6hM3D9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35DBC4CECF
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Dec 2024 06:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733206555;
	bh=aUN4btWaise441m3rNd1xYW2vmbTBY73AVKHahODaOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sG6hM3D9nHmKxINuca0ftCfN85ziFNtbdQfnDYiyNAW2vaS4JePTm5OixHYf4pANH
	 HuCiAfDfWoM0N8Qdk32moGwGntSh6BA0N/D9pY1/S8XMICQaIo47wyavx5HbIuWqZt
	 yWwLdfWJpDAN54mPkpkh8dX0/NzXqSGkzATOcS3H/uOsuL+CWExbgsNfbr02xlMPoL
	 Oews9/8lzwlSn1hV5Jpk7KnqwUAqzhhhNxpk9vKLpcv0NYBsW7IGsXX76XyD70DKzd
	 cWl/kAcXLox7BN0MXDWk3JPPKsVvdqyKuXgIZ+FpKP7lQIRykJ55lwzF3nI0CQDQKy
	 xy6gAdPvfI8gQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso5347270e87.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Dec 2024 22:15:55 -0800 (PST)
X-Gm-Message-State: AOJu0Ywn3D04cI/TZb8D3wKbspTsJir+g8+1OQQspbl3lbTeX5FmbSaB
	KW+Nc1Zde+t4XW2/SXgqqHcyUzYdNubofgv06cWeOMdDTXSHMX2Fqc3aWXA+Nzte2xLjnv9vpbP
	kJg+sVpvIm9GD7zSulnftvcF296s=
X-Google-Smtp-Source: AGHT+IEoPvgwdLWwfyIRdtrjs4m95xJQTbGGBeWdf2jNnOfsyIXXuwxhs0eXD5W0THHY+O78kejAeoU6j5UucQqm0fo=
X-Received: by 2002:a05:6512:3e1b:b0:53d:e430:2276 with SMTP id
 2adb3069b0e04-53e12a26440mr616485e87.45.1733206554380; Mon, 02 Dec 2024
 22:15:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNARMBTf8usS0UxZ06gVZDbTTrhXt73mpVaGZRby-Zcdtsw@mail.gmail.com>
 <20241128062940.1708257-1-josch@mister-muffin.de> <20241128062940.1708257-2-josch@mister-muffin.de>
 <CAK7LNATyvVGt8j7bcwsWKaophdBU3x53=_UnPajKjtSMtoS9iA@mail.gmail.com> <173316233246.3934267.15523840202340139145@localhost>
In-Reply-To: <173316233246.3934267.15523840202340139145@localhost>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 3 Dec 2024 15:15:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com>
Message-ID: <CAK7LNARarqG2Okacbp4TKJAFz9OagB2NF=qs-Cq2rzOW4CA2Bg@mail.gmail.com>
Subject: Re: [PATCH 1/1] scripts/package/builddeb: allow hooks also in /usr/share/kernel
To: Johannes Schauer Marin Rodrigues <josch@mister-muffin.de>
Cc: linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 2:59=E2=80=AFAM Johannes Schauer Marin Rodrigues
<josch@mister-muffin.de> wrote:
>
> Hi,
>
> Quoting Masahiro Yamada (2024-12-02 16:42:02)
> > > @@ -84,7 +93,26 @@ install_linux_image () { # Tell initramfs builder
> > > whether it's wanted export INITRD=3D$(if_enabled_echo CONFIG_BLK_DEV_=
INITRD
> > > Yes No)
> > >
> > > -               test -d ${debhookdir}/${script}.d && run-parts --arg=
=3D"${KERNELRELEASE}" --arg=3D"/${installed_image_path}" ${debhookdir}/${sc=
ript}.d
> > > +               # run-parts will error out if one of its directory ar=
guments does not
> > > +               # exist, so filter the list of hook directories accor=
dingly.
> > > +               hookdirs=3D
> > > +               for dir in ${debhookdir}; do
> > > +                       test -d "\$dir/${script}.d" || continue
> > > +                       hookdirs=3D"\$hookdirs \$dir/${script}.d"
> > > +               done
> > > +               hookdirs=3D"\${hookdirs# }"
> > > +               test -n "\$hookdirs" || exit 0
> > > +
> > > +               # If more than one hook directory remained, check ver=
sion of run-parts. If
> > > +               # run-parts is too old, fall back to only processing =
the first.
> > > +               case \$hookdirs in *" "*) if ! run-parts --help 2>&1 =
\
> > > +                               | grep -Fxq "Usage: run-parts [OPTION=
]... DIRECTORY [DIRECTORY ...]"; then
> > > +                               echo "E: run-parts >=3D5.21 is requir=
ed for multiple hook directories, falling back to $firsthookdir" >&2
> >
> > Same comment as in the previous version.
> > If both /etc/kernel/postinst.d/ and /usr/share/kernel/postinst.d/ exist=
,
> > can we assume the run-parts>=3D5.12 on that system?
>
> since KDEB_HOOKDIR can now be any directories and any number of directori=
es,
> the question should rather be: if more than one directory from KDEB_HOOKD=
IR
> exists, can we assume that run-parts>=3D5.12 exists on that system?
>
> Personally, I'd prefer a best-effort fallback mechanism. The alternative =
would
> be that kernel installation would just error out in case a (buggy) packag=
e on a
> distro ships something in /usr/share/kernel/postinst.d/ but failed to als=
o
> declare a versioned dependency against debianutils. The error message can=
not
> (or rather only with considerable effort) tell the user *why* their kerne=
l
> installation errored out. By only considering the first hook directory
> (probably /etc) in those situation, the kernel would succeed to install a=
nd the
> hooks from the (buggy) package would be skipped. I understand that such a
> behaviour comes with its own set of disadvantages. One could also argue, =
that
> it is better to error out loudly in case of an error instead of hiding a
> message prefixed with a "E:" in a bunch of console output when a kernel p=
ackage
> gets installed.
>
> What is your position on this question? What behaviour would you prefer? =
If you
> strongly prefer the kernel installation to error out loudly if run-parts =
is too
> old, then my next patch will implement just that. I think whether "we can
> assume run-parts>=3D5.12" depends on what we declare to be the right way =
to hold
> this feature. If we say "packages must declare this versioned dependency =
and if
> they fail to do this then it is their bug and not ours" then yes, then we=
 can
> assume run-parts>=3D5.12 in case of multiple directories.

My preference is to pass the existing hook directories to run-parts.
If KDEB_HOOKDIR specifies two directories and both exist,
pass them to run-parts.



>
> > Do we need to check the help message and offer the fallback mechanism?
>
> The answer two that question depends on the answer to the last question. =
If we
> want to error out loudly with unsupported run-parts, then no help message=
 has
> to be checked. Otherwise, when we want to check what version of run-parts=
 we
> have, then there are two options. Either parsing the --version output (wh=
ich is
> not trivial itself because run-parts prints six lines of copyright inform=
ation)
> or parsing the --help output. The debianutils maintainer encouraged using=
 the
> latter option which is why I chose that one.
>
> Thanks!
>
> cheers, josch



--=20
Best Regards
Masahiro Yamada

