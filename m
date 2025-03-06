Return-Path: <linux-kbuild+bounces-5982-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FBBA54CD3
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 15:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C7567A4199
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Mar 2025 14:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A317112F5A5;
	Thu,  6 Mar 2025 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A68GK8Yh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CB823DE;
	Thu,  6 Mar 2025 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269808; cv=none; b=pCHibRbZKaaq2/i15zb4nccTU1Rwf95GFtyA1Z0dwpvzHY9DcKVEagxdFI2PMAnfzbb86rnGDn6+O26FvKwoP/rDYKG8k0gEc5RSdMurTWFeEa4FLdPzblMfVOTBOjfM1FKJOhRtPxGH69L0OdbhcUxiwhD4frW046SOGHwNO5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269808; c=relaxed/simple;
	bh=/BuLHcCIGXRIYVKJCuf+dvgwPEDJO2Qr9HcpSrXU6EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFBnHnhDV7nb/8EGfpsodqFqZkPamKZ44fCdjl4hk/YKSl4S+6ehm6BqHrdlFvm5/X7exRYPasZSDfik+YH/FTDGsckwXYtiMw57HGaRWJx2CNxzlcSv6zBVy9RDoPtw4cTTpQI9W4YlU9B4FzIR3pz0D/p/QwgajE9FHtlfP3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A68GK8Yh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E014FC4CEE5;
	Thu,  6 Mar 2025 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741269807;
	bh=/BuLHcCIGXRIYVKJCuf+dvgwPEDJO2Qr9HcpSrXU6EA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A68GK8YhfK/9HDnKSG6Wx1WyZlq1YdfJfNSgwd4/6Jpqnwgb1FOq25dXbeEFvi87Q
	 0EsDn34BJX7nx935O8MJQkcbTHl0+8V9ex76nARmgedRFnEzq17m6G5cicIWcmQEin
	 9cEfRFB2qejMjC7NV6RvGLFwTGaA1fA4VQwIEakW4d1X2KNoEte1BWlgSkXFNt2f6q
	 d/SpNE3LFowlDUsgQK/SRHBi0peytncLlSUb3zkFxZBfBgDYw81DuYKOIduq8eGvs7
	 vORJfu9Zna3o+SYQujdLnGNt20qRJN0r8HD6G2vciW9TEcP3q3yJaPqs82Jergo+nJ
	 ioL2qlXoQoJ/g==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5497590ffbbso884904e87.1;
        Thu, 06 Mar 2025 06:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPrdcqUgrV5v+fHDq8HlCo+15zYGeNhfr9BD8RdTQUFJIeT4suki1svv/rgHA7V/+oL56yiPOmqTA2CFM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+nFCOeOnsCNzTokUYcF2poNsIfOJcgmpZtJ+hzQmxmWYoV6Bf
	yka0HHKyEWrqMVIPSFSME9iueGN2f4/zunX87xgECklCZTrt1MfzdJq4eixcFOgzLAV77ra2ZWR
	byGqgpYFIG4Ur2kaxD51NnE7Uq+g=
X-Google-Smtp-Source: AGHT+IHqaIWrWvhQZHVT31BbRrv3p02mYjqO1VoTm+3hyyNM1G8zigzk22q4InIcx246jrQL9pcSZsnlOvGzOsRTfJE=
X-Received: by 2002:a05:6512:2815:b0:545:f0a:bf50 with SMTP id
 2adb3069b0e04-5497d3774d5mr2592605e87.35.1741269806413; Thu, 06 Mar 2025
 06:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207193133.506076-1-masahiroy@kernel.org> <20250224-vivid-merry-oriole-f0cb8a@l-nschier-z2>
In-Reply-To: <20250224-vivid-merry-oriole-f0cb8a@l-nschier-z2>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 Mar 2025 23:02:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNATdpJ9uprUTowFjA8XFWk1_wttWPcG11-X+A3b-CwLZ5g@mail.gmail.com>
X-Gm-Features: AQ5f1Jq0v6PU-fDPJCVcuQv5kmI-4ZowOC8UQTigSXwLfuWpvrl6ko47dyUUY40
Message-ID: <CAK7LNATdpJ9uprUTowFjA8XFWk1_wttWPcG11-X+A3b-CwLZ5g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add Kbuild bash completion
To: Nicolas Schier <n.schier@avm.de>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 11:25=E2=80=AFPM Nicolas Schier <n.schier@avm.de> w=
rote:

> > +     O | KBUILD_OUTPUT | M | KBUILD_EXTMOD | MO | KBUILD_EXTMOD_OUTPUT=
 | *_PATH)
> > +             # variables that take a directory.
> > +             _filedir -d
>
> Would it make sense to temporarily switch cwd to ${srctree} to allow
> completion of KBUILD_OUTPUT and friends with relative paths from
> ${srctree}?

I do not think so.
The completion should work against the current working directory

This usually matches to ${srctree}, as many people work
at the top of the kernel source tree. However, it is not necessary
to start the kernel build at the top of the kernel source tree.
You can start Kbuild at any arbitrary directory by using
the -f option to specify the top-level Makefile.


> A simple approach (probably with some bad side-effects), works for me:
>
>                 local opwd=3D$OLDPWD
>                 cd ${srctree} && _filedir -d && cd $OLDPWD
>                 OLDPWD=3D$opwd
>
> But this is quite a step further, if there is no clean solution right
> now, I'd prefer leaving it as it is for now.







> > +             return
> > +             ;;
> > +     KBUILD_EXTRA_SYMBOL | KBUILD_KCONFIG | KCONFIG_CONFIG)
> > +             # variables that take a file.
> > +             _filedir
> > +             return
> > +     esac
> > +
> > +     COMPREPLY+=3D($(compgen -W "${keywords[*]}" -- "${cur}"))
> > +}
> > +
> > +# Check the -C, -f options and 'source' symlink. Return the source tre=
e we are
> > +# working in.
> > +__kbuild_get_srctree()
> > +{
> > +     local words=3D("$@")
> > +     local cwd makef_dir
> > +
> > +        # see if a path was specified with -C/--directory
> > +        for ((i =3D 1; i < ${#words[@]}; i++)); do
>
> indent ^^: spaces instead of tab

Thanks. I fixed all indentation errors.

> > +             if [[ ${words[i]} =3D=3D -@(f|-?(make)file) ]]; then
>
> (I am really impressed: everytime I am reviewing one of your new shell
> scripts, I learn something new.  TIL: '-@()' and '?()'.)

This line was copy-pasted from the bash-completion project.  :-)

You can find the same code in
/usr/share/bash-completion/completions/make




> > +     KBUILD_*)
> > +             # There are many variables prefixed with 'KBUILD_'.
> > +             # Display them only when 'KBUILD_' is entered.
> > +             # shellcheck disable=3DSC2191 # '=3D' is appended for var=
iables
> > +             keywords+=3D(
> > +                     KBUILD_{CHECKSRC,EXTMOD,EXTMOD_OUTPUT,VERBOSE,EXT=
RA_WARN,CLIPPY}=3D
> > +                     KBUILD_BUILD_{USER,HOST,TIMESTAMP}=3D
> > +                     KBUILD_MODPOST_{NOFINAL,WARN}=3D
> > +                     KBUILD_{ABS_SRCTREE,EXTRA_SYMBOLS,KCONFIG}=3D
>
> Did you leave-out KBUILD_OUTPUT by intention?  I think it would be nice
> to complete it here, too.

I just forgot to add it.
Will fix it.


>
> I am unsure, if I like the mix of quoted and unquoted use of variables.
> But as they all look correct to me, this is just a question of personal
> style.

I added quotes where required (i.e. shellcheck warns).
Otherwise, I do not add quotes.




>
>
> Thanks, I really appreciate this kbuild bash-completion.
>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>
> Tested-by: Nicolas Schier <n.schier@avm.de>

Thanks for the review.

--
Best Regards
Masahiro Yamada

