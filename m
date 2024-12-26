Return-Path: <linux-kbuild+bounces-5247-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B99FCB40
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Dec 2024 14:56:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 129351882F09
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Dec 2024 13:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F93F19F13C;
	Thu, 26 Dec 2024 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7nrAxSE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541F518E1F;
	Thu, 26 Dec 2024 13:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735221391; cv=none; b=GphP9jDbRIH3IZ/ma/FRgQ4aCyEGXngv4UO1r/A+d1KF5crHGas3yAR/IknsL7T5IJXLthPg0v92qddO3DnUddU+yOA+0WQMB1C0YVzfOLIpPXLTG1gWZHCuwtNQAnof7wMY6A/+MMzyMvZh/Dx49zumEkBqCHVZeEzy3kJhEWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735221391; c=relaxed/simple;
	bh=rQtPaps1uCjak1GsAb0T6MZ0Udcaw509a22ogoKvfQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQ5/mq9bfPkSjqBK1AD2uBvQUcHyD8b3rBCTUZ1GRTLemgTsWXRD1cbCBuKKoDDJJBXkwSrQDepmRjegRyuOC1O1VL7sol9ExKXZOb8tyut066dOfiiqpz9dCCV73GWoLwGZQAR5Omd/QxYRJQqPqG9Tu7wCKzaEypVCgxNmKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7nrAxSE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FA6C4CED2;
	Thu, 26 Dec 2024 13:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735221390;
	bh=rQtPaps1uCjak1GsAb0T6MZ0Udcaw509a22ogoKvfQ0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=P7nrAxSEHTclguVe69cSAJOX7qxWjYMz6oYdGuCRzXZoNkH244tGbiRNdIW4cKoeT
	 OYNrfv9Gh5ktqfWQXqHPCQ5vkUn4bRn0FK6QObrbJMufwNuK4lk+HTk8dbn8iz/zQw
	 fp3CwoRQQlvnjK7V6ocQ1qx2Sn/PY1gB/NM2l0ukgu83bH7alDgif4oep7N7tWVVk1
	 hCKIJ9s+CySulXLs/804n4zWcZNgbfCoQVv2FoiIR2jLufItODyBR9X6A9aSoa1Kya
	 MuVMcPHijXwRPDAk4aJDJKBMEE78aQDNevb/QRnoNc/G9KWdZOf+ptE5GtLhz9j9kX
	 nYZs0uTWzABCQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53e3a227b82so6110726e87.0;
        Thu, 26 Dec 2024 05:56:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOKexeqlJhY04wi8PGGs49wkjpJPgDcI5dT3lrSUQPsXErNH7o9WDHQzZiRk2uD4C0imDtYDPsz7CqYTs=@vger.kernel.org, AJvYcCVdi8wHvApKzBtTu3SXtimX+o30+zvXtK6Qb+fsaHgUouQbNOFOL3/7dSIx9e0bX+vbEGBo9YaKW/BKgDrG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ArAAW019twURBu+2wCtgPGokQrwIcJkuW7qh0d4WnR5K4stv
	db4YyD/5wkkGX3+SLs21NJZVIYuneQImD3TUX7fpgX1DBJQsgfAprLdI2wE8VwQuB1MUsLPt5Fi
	y7MR2hWcHfEf3ql/+dd4EbilBK8E=
X-Google-Smtp-Source: AGHT+IHKWIu7+TnvA5d8Khi9NI2HC0pclZ/WbzhtUzLIJ3LRSBAp+26TZgma/b8RIB5S6N7Ok5xldVAFNyYJuamFV8I=
X-Received: by 2002:a05:6512:4014:b0:53e:2bb0:4942 with SMTP id
 2adb3069b0e04-5422956beb5mr7528070e87.57.1735221389529; Thu, 26 Dec 2024
 05:56:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241225153343.134590-1-masahiroy@kernel.org> <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
In-Reply-To: <20241225162656.26005-1-glaubitz@physik.fu-berlin.de>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Dec 2024 22:55:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
Message-ID: <CAK7LNARRvax0ph2roGd9YmdaG-dKqj+JMHka4SDRwv0FdzKm6g@mail.gmail.com>
Subject: Re: [PATCH 0/3] modpost: work around unaligned data access
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: gregkh@suse.de, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, 
	nicolas@fjasle.eu, rusty@rustcorp.com.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 1:27=E2=80=AFAM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
>
> Hi Masahiro,
>
> > The latest binutils stopped aligning section data in relocatable ELF.
> > It saves small number of bytes that were previously inserted between
> > sections. However, modpost crashes due to unaligned access:
> >   https://sourceware.org/bugzilla/show_bug.cgi?id=3D32435
> >   https://sourceware.org/bugzilla/show_bug.cgi?id=3D32493
> >
> > Similar to kernel space, unaligned data access in userspace can be
> > problematic on some architectures.
> >
> > Simple example on ARM:
> >
> >  $ CC=3Darm-linux-gnueabihf-gcc
> >  $ echo 'int foo(int *p) { return *p + *(p + 1); }' | ${CC} -O2 -x c - =
-c -o foo.o
> >  $ echo 'int foo(int *p); int main(void) { char str[16] =3D "helloworld=
"; return foo((int *)(str + 1)); }' | ${CC} -x c - -c -o main.o
> >  $ ${CC} -static -o unalign-test main.o foo.o
> >  $ qemu-armhf unalign-test
> >  qemu: uncaught target signal 7 (Bus error) - core dumped
> >  Bus error (core dumped)
> >
> > In this case, the 'ldrd' instruction causes a bus error due to an
> > unaligned access. If the -O2 flag is omitted, this issue does not occur=
.
> >
> > To avoid potential unaligned access, use the get_unaligned() approach
> > as seen in the kernel space.
>
> I have just applied this series against Linus' tree and I can confirm tha=
t it fixes the
> unalignment access anymore on sparc64. There is no more "Bus error" and t=
he build succeeds.
>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>


Thanks for the compile test.

Loadable modules (*.ko files) are relocatable ELF.
So, there is no alignment in *.ko files any more
if the latest binutils is used.

Just in case, I did run-tests for arm and arm64.
Even if there is no alignment in *.ko files,
I confirmed that the kernel can load modules.

If you have time, please run-test and
double-check loadable modules are working.



--=20
Best Regards
Masahiro Yamada

