Return-Path: <linux-kbuild+bounces-4515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C9C9BD972
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 00:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E8301F218E1
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2024 23:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995A021644D;
	Tue,  5 Nov 2024 23:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acbI68KO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDFD216425;
	Tue,  5 Nov 2024 23:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730847970; cv=none; b=DrPwA7UPX1lzvpwjs0P7xbvj26zBNovMjZjk7bTp0x2mLJ5C3aIxCLDJiwsDVVwQJEJWS8THs+EOUDnIClNdwZ8sJ7oxV4lMni1fwU7zwHkjBCfxdZ7XcSSb0yVHLJob6tVQUKMpM0Ilg5rmx5Y5OQe7spakIqQyckEZRza/V70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730847970; c=relaxed/simple;
	bh=nkdPiLSe0tzVDY9FdjQGLriU0+bHnFmdfGk9gTDvDyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UkdVCnWL/+sE41oeZlE7pVSTHTCoqUZJi+Uo7VGpYpEsxfl/kYRSza3jmFp7UFqmUVbX1xjFwBmKYrpEph5Qn5KqX0QsNqNV8H9HpPOdSBX0Bwydg6ykJgbIHyaVt3xkstv+4A3lhn/BizRwZFQ/0gKn6ddRDqiqrVSPS7EPl4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acbI68KO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043BFC4CED1;
	Tue,  5 Nov 2024 23:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730847970;
	bh=nkdPiLSe0tzVDY9FdjQGLriU0+bHnFmdfGk9gTDvDyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=acbI68KO5mDQ1bqMqwayNm4sJrIZo+uSpiRUmTdEsMBnKjWh+jMOBc66/TJwVpICU
	 rt29/VG3tGEy2KmEgePdzOqVV7VP3vwqXP2qYAgFGm9Th7LKT50ATnXK+YU2Vtu8bm
	 niQ6IjNM/7tqGK6n6GDvIPTBdgg9D2oXZGKAgoBIAri4fG6u5MeB+s+wU2Gn+vgArC
	 YZ2QTcsm56BpHJNQ/1QiElhj5G8VeZZpa4KMAeg9RIqmYaSm5Md2RuZK/BtbCVeyZw
	 YwAQQb2anva/eTP8icCMjp1zsrueviMxiUTbBh2genGPOX8mtTZpjTIzDeWlkDNSPF
	 /nNI5u9SysPUg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso55767941fa.0;
        Tue, 05 Nov 2024 15:06:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW05K1HIPK6cN4tMiU3gohvt+QkmoG1tc+xdHvfuyl2ZuciG7rpuoho+GzcExZ1r1QDM1gf2rkSZZtom1c=@vger.kernel.org, AJvYcCX47uCTeVWr+dMYdLOZckK+H80YNiduoVfUxJa9wfKCHityghme/zJ6TQuL1s5Cv5A0goNBneJAEQVzqDMm@vger.kernel.org
X-Gm-Message-State: AOJu0YykOxxiL9i2p2a87FQEJqHor3KTwOgyjq4B0LeDXLzwhQMWccXm
	3p26cohJcI7jHz6c4c6biGhXm2Q72jS4s+VHVggO2aRZuFZbnVfC5ko6VKEg4x9JmtF3ljobaZq
	1ch7jcWMNwv6yMg/RytGouEMxG0o=
X-Google-Smtp-Source: AGHT+IHtg7iG+EPTbiQbKk37eg3U4JCmPImELogKBwQXb2mA1rkPkhRDLDrtzsbKyNQ9MwPIfqoZcpoMS/RNNXkbQ94=
X-Received: by 2002:a2e:a7ca:0:b0:2fb:8c9a:fe37 with SMTP id
 38308e7fff4ca-2fdec5ebe28mr90883591fa.16.1730847968718; Tue, 05 Nov 2024
 15:06:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241014141345.5680-1-david.hunter.linux@gmail.com>
 <20241014141345.5680-3-david.hunter.linux@gmail.com> <20241015190929.077535b4@gandalf.local.home>
In-Reply-To: <20241015190929.077535b4@gandalf.local.home>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 6 Nov 2024 08:05:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR8TQx=r-esfi+dJ3=TQ+6Om+LPadhDPqn3TLH93xi4WQ@mail.gmail.com>
Message-ID: <CAK7LNAR8TQx=r-esfi+dJ3=TQ+6Om+LPadhDPqn3TLH93xi4WQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] streamline_config.pl: ensure all defaults are tracked
To: Steven Rostedt <rostedt@goodmis.org>
Cc: David Hunter <david.hunter.linux@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shuah@kernel.org, 
	javier.carrasco.cruz@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 8:09=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Mon, 14 Oct 2024 10:13:32 -0400
> David Hunter <david.hunter.linux@gmail.com> wrote:
>
> Hi David,
>
> Thanks for sending these.
>
> > Track default options on the second line. On the second line of some
> > config entries, default and depndency options sometimes appear. In thos=
e
>                               "dependency"
>
> > instances, the state will be "NEW" and not "DEP".
>
> Can you list some examples of where this happens?


As described in the commit log, the def_bool, def_trristate, and default
can appear in the second line.


config FOO
         def_tristate BAR

Then, FOO has dependency on BAR.



> Thanks,
>
> -- Steve
>
> >
> > Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> > ---
> > V1 https://lore.kernel.org/all/20240913171205.22126-4-david.hunter.linu=
x@gmail.com/
> >
> > V2
> >       - changed the subject
> >       - changed the condition to be more in line with the script style
> > ---
> >  scripts/kconfig/streamline_config.pl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/str=
eamline_config.pl
> > index a85d6a3108a1..85f4712e2bf3 100755
> > --- a/scripts/kconfig/streamline_config.pl
> > +++ b/scripts/kconfig/streamline_config.pl
> > @@ -220,7 +220,7 @@ sub read_kconfig {
> >           $depends{$config} =3D $1;
> >       } elsif ($state eq "DEP" && /^\s*depends\s+on\s+(.*)$/) {
> >           $depends{$config} .=3D " " . $1;
> > -     } elsif ($state eq "DEP" && /^\s*def(_(bool|tristate)|ault)\s+(\S=
.*)$/) {
> > +     } elsif ($state ne "NONE" && /^\s*def(_(bool|tristate)|ault)\s+(\=
S.*)$/) {
> >           my $dep =3D $3;
> >           if ($dep !~ /^\s*(y|m|n)\s*$/) {
> >               $dep =3D~ s/.*\sif\s+//;
>


--
Best Regards
Masahiro Yamada

