Return-Path: <linux-kbuild+bounces-4693-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 095109CFD16
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 08:52:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87E96B27FE1
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Nov 2024 07:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD9218FDD5;
	Sat, 16 Nov 2024 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sJHMum9f"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01750802;
	Sat, 16 Nov 2024 07:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731743546; cv=none; b=m+7rOmDt8AadE43zsx/9wd9MA5rF61alN0LsSVr7ofP6xHBaT+6MEFlAHBDRPfv4PkLvHrNsilvIYCsut9ZJP34QFl8KEYow9MVGbPW7H8mrttNf/1hUJvX0yNSjBWjWN5wX5nJI2y2NScOzkWq2ZT62sTJvl6Ngs0uTHNCRMEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731743546; c=relaxed/simple;
	bh=fNHtc0+zCXKiZQYMDhUkNxMQ3/p8uayzt8FfmcFP2Gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUy0JUfseBdrpHm32i/97pmzbPDfEcVNueAB57BAJQB1aDaOyk6Hb26J1SydNvQSZwEM39sTNfAKboQZUH4hUKNFA3ucoHX92OKr01gt5rK/5T53HdsCPbIzqLQWwDpL/qDJBcpEAKuVbXSYiBl+SJZgEnkBhas/IykTr9vdaJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sJHMum9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86158C4CED6;
	Sat, 16 Nov 2024 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731743545;
	bh=fNHtc0+zCXKiZQYMDhUkNxMQ3/p8uayzt8FfmcFP2Gk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sJHMum9fLZ8UH0we95bArJDc70uXpo26juyPImMv1T+TAc3Zd5f6XHMj5VMn0Eq5x
	 iXbXYQfgslu4iVgFBO4k3SdjVWQlYniXNqTNgIddhyRpVxwtmvcMXvQ6+WdC/5ciJA
	 +dwUJgt35CjgrpuDxorQcF2/wmIaEjbugEjCqysKMBe5JColjc0RL5uC1ZwDfdsWNB
	 xg+vlACR4gdjX9o5CSVLIq2ovM+z+Y+g2Zwtqf0diIe3QR7vFsd6o5jWJ1zh3yINA1
	 5K85NSPN4aO/fT9XVDNfAi0LRNyC9YTkReA0SHHDabuv7XTX37F2opw+BEMxoFHPCH
	 znJi7uJgsEiEA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ff589728e4so27312721fa.1;
        Fri, 15 Nov 2024 23:52:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWu1WSXaRK0PDBotctgsXEhDkS35SJhJ5294Lbo7MKWNXNmnLMvroWvBJzdZnWTV3maCN3jG1n3ZPjDAUI=@vger.kernel.org, AJvYcCXjOBuMOnARWDflrZDulUxLvQRZ9al4+uU13DTCNqBkfGXE3bHeG01N1Hiv+vtqJi7ygCBoZagT@vger.kernel.org, AJvYcCXlb5oZAcO6qdDttslt3lRSjM6smSYZoFstgsueF262N8/9e4HCiptKnsPmHzacII37atjtX1GyhohmAUY1@vger.kernel.org
X-Gm-Message-State: AOJu0YwYPjIi3L9BWmUCFtzao5dXyclklFEIX6urGJiI4XwkZ5lrdvaP
	b2rHKFqsHDLthTKgpk+JFRjlflZBnPwM+ZFBtdpj8xz03Nvw00dV5+pwlg/nukigAhG/5wSbg9E
	CKjVgQC8RCXw00ZkV3svuj26cHf8=
X-Google-Smtp-Source: AGHT+IEZYgHnEjSADdFNIcJ4Ry1Iwc5OrBqNExR4qHnevoPuz7uyulNZ1ZHGJZ4WUUb6vtKmfVvpRvXIVNthUJD1v0M=
X-Received: by 2002:a2e:a721:0:b0:2ff:5e66:81a3 with SMTP id
 38308e7fff4ca-2ff5e6683cemr14570031fa.11.1731743544213; Fri, 15 Nov 2024
 23:52:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145645.563356-1-parth105105@gmail.com>
 <2024111442-yeast-flail-fcea@gregkh> <20241115083940.GA3971@francesco-nb>
 <2024111541-antiquity-footpath-e221@gregkh> <ZzcYLAFqTSlFm2uF@gaggiata.pivistrello.it>
In-Reply-To: <ZzcYLAFqTSlFm2uF@gaggiata.pivistrello.it>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 Nov 2024 16:51:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk1Yiidch9KMxEQ@mail.gmail.com>
Message-ID: <CAK7LNAS0VzqcKDz_1ds5qJcASqxVizE3kkdRk1Yiidch9KMxEQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: switch from lz4c to lz4 for compression
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Greg KH <gregkh@linuxfoundation.org>, Parth Pancholi <parth105105@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Parth Pancholi <parth.pancholi@toradex.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Francesco Dolcini <francesco.dolcini@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 6:45=E2=80=AFPM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
>
> On Fri, Nov 15, 2024 at 10:22:13AM +0100, Greg KH wrote:
> > On Fri, Nov 15, 2024 at 09:39:40AM +0100, Francesco Dolcini wrote:
> > > On Thu, Nov 14, 2024 at 05:02:01PM +0100, Greg KH wrote:
> > > > On Thu, Nov 14, 2024 at 03:56:44PM +0100, Parth Pancholi wrote:
> > > > > From: Parth Pancholi <parth.pancholi@toradex.com>
> > > > >
> > > > > Replace lz4c with lz4 for kernel image compression.
> > > > > Although lz4 and lz4c are functionally similar, lz4c has been dep=
recated
> > > > > upstream since 2018. Since as early as Ubuntu 16.04 and Fedora 25=
, lz4
> > > > > and lz4c have been packaged together, making it safe to update th=
e
> > > > > requirement from lz4c to lz4.
> > > > >
> > > > > Consequently, some distributions and build systems, such as OpenE=
mbedded,
> > > > > have fully transitioned to using lz4. OpenEmbedded core adopted t=
his
> > > > > change in commit fe167e082cbd ("bitbake.conf: require lz4 instead=
 of
> > > > > lz4c"), causing compatibility issues when building the mainline k=
ernel
> > > > > in the latest OpenEmbedded environment, as seen in the errors bel=
ow.
> > > > >
> > > > > This change also updates the LZ4 compression commands to make it =
backward
> > > > > compatible by replacing stdin and stdout with the '-' option, due=
 to some
> > > > > unclear reason, the stdout keyword does not work for lz4 and '-' =
works for
> > > > > both. In addition, this modifies the legacy '-c1' with '-9' which=
 is also
> > > > > compatible with both. This fixes the mainline kernel build failur=
es with
> > > > > the latest master OpenEmbedded builds associated with the mention=
ed
> > > > > compatibility issues.
> > > > >
> > > > > LZ4     arch/arm/boot/compressed/piggy_data
> > > > > /bin/sh: 1: lz4c: not found
> > > > > ...
> > > > > ...
> > > > > ERROR: oe_runmake failed
> > > > >
> > > > > Cc: stable@vger.kernel.org
> > > >
> > > > What bug does this resolve that it needs to be backported to stable
> > > > kernels?
> > >
> > > This is not solving any existing actual bug, and therefore there is n=
o
> > > fixes tag.
> > >
> > > The issue here is that the kernel build system is using lz4c, that is
> > > deprecated since 2018, and now distributions are actively moving away=
 from it.
> > >
> > > openSUSE Tumbleweed and OE already removed it, so you would not be ab=
le
> > > to compile a stable kernel on such distribution when using lz4 unless=
 we
> > > backport such a patch.
> > >
> > > Everything should be properly documented in the commit message alread=
y.
> > >
> > > My understanding is that something like that would be a reason for
> > > backporting to stable, if my understanding is not correct we'll remov=
e
> > > the cc:stable and send a v3.
> >
> > Please read:
> >     https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.=
html
> > for what meets stable kernel requirements.  I don't think that this
> > patch is that.
>
> Greg, ack.
>
> Masahiro, can you please let me know if we should send a v3 with the stab=
le
> tag removed or you can remove it yourself when applying?
>

I applied this with the stable tag removed.
Thanks.

(I guess someone may want to backport this eventually,
as such distros cannot build stable kernels with ld4 compression.)



--=20
Best Regards
Masahiro Yamada

