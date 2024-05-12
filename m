Return-Path: <linux-kbuild+bounces-1834-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C008C369E
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 15:15:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC32B21921
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2024 13:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855DA2206E;
	Sun, 12 May 2024 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H/8tBJsy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B704BA53;
	Sun, 12 May 2024 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715519718; cv=none; b=nL9C+kzS/mzaWveWO1+k2jgl1QLP3G7IxWaRT/hLlgkEZMAWBxUrlXOdifGXuOokjymYFixeoIsdwlFrmanIqPcWZB1ID0rTrDmPkUWvRE39TE8D3QOU0jz5kBUEiwcR/Vill1zZaLVovFxiLQWyHwPRBc5egHdzTWUFyvLDnyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715519718; c=relaxed/simple;
	bh=eYhsw1LKGQZmVB+OR2v9kHH1UQ9oE4THIz6+WdBwC1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RCDn25ScR2ot4+Y1H2YYcWODg5qcEn+9yXFVfHDBQt9phMTOSAXBVfZOQ2dgjeunrTIRL7EncTbrrawdXFvoCAc4vQBsdPY0+J3W0Gyi7vPdHSIafUXSZArzRahQHwCPlDBu/qz7D7GJXZS+FGKk/myEYOMj4jbz/0aK8nkcXwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H/8tBJsy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2E87C116B1;
	Sun, 12 May 2024 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715519717;
	bh=eYhsw1LKGQZmVB+OR2v9kHH1UQ9oE4THIz6+WdBwC1M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=H/8tBJsy+AYtzm6PehlcTBsHcMudfheJ3OH9CHH4yAT6mMJIzpf3f5eoZ937A85+S
	 QrXghY46lrC3y403rmvzmuIYk1pGbd3YbgWkRFDu7cN5VR8f2ZEf69AzsCJ3pSMlCj
	 tAY+pAXGlXIb+lBkJDc683Fo2/X3/CSetk1JLOCFWKqOTGRH1tea3F/uDYDYKv2slZ
	 2X8duWoA0svRRQXvcf3eDY+/WGiGWoUuhK8qwk6gmYCIWHdJTm/Wm/9iy/Z+oSWVVk
	 Vbhfoqx2uwXtpgaSTt9hCiBnN0hwdgJrIGcpesHpTp4oC9sGflQo1Wkeh7PwY0+H6w
	 w38CvPuuz0kfQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-520f9d559f6so3903041e87.3;
        Sun, 12 May 2024 06:15:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVTg7lJaWbzhVCd/RzZB2zhZ3lfLMyWVtedKiMxP+z/NgcLwt2LT4IGbtiT4xShgab5n54tGMbY+qbJcHlRhPNX/ds7TCeHDMej373
X-Gm-Message-State: AOJu0Yx0lzhg7pjPvI5Y4IqAiiN185dTqztrRAxK5nemu1uFaywWt5lG
	lfquiBLVtBV9igEFUL1LKIgH1VGXvF/WkiS8pHcHJauASxeLWSYltpgSrq6NXYtKHdUl2zvRxEc
	NvuKJuid38FQfuLKeknCpwYMITdw=
X-Google-Smtp-Source: AGHT+IFcSGRBEMbPZi5b0kaaf8AnaCCR/AgLI4LU5QEYky1ht4lu5nhLkRDNjEGFKg6XuBTs+/OM80WJaZGcW6m7Qn4=
X-Received: by 2002:a05:6512:360e:b0:51a:f362:ab30 with SMTP id
 2adb3069b0e04-5220fb699ddmr4130489e87.7.1715519716549; Sun, 12 May 2024
 06:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zj9UDiAHqX3noTsy@archie.me> <CAK7LNARrG0u2pSzAkdbzrcf_i7ByhEnDwHH=4LtaE_H7OgL=0A@mail.gmail.com>
In-Reply-To: <CAK7LNARrG0u2pSzAkdbzrcf_i7ByhEnDwHH=4LtaE_H7OgL=0A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 12 May 2024 22:14:40 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVN7he-iuSTY8Z2cvxRA=97iqZHbW3mNL_38xzdbcvyw@mail.gmail.com>
Message-ID: <CAK7LNASVN7he-iuSTY8Z2cvxRA=97iqZHbW3mNL_38xzdbcvyw@mail.gmail.com>
Subject: Re: Incorrect thinlto cache directory path in Makefile
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kernel Build System <linux-kbuild@vger.kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Xu Zhen <xuzhen@fastmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 10:04=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> +CC: Nathan
>
>
> On Sat, May 11, 2024 at 8:18=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:
> >
> > Hi,
> >
> > Xu Zhen <xuzhen@fastmail.com> reported on Bugzilla (https://bugzilla.ke=
rnel.org/show_bug.cgi?id=3D218825) thinlto build directory problem (especia=
lly on
> > DKMS modules). He wrote:
> >
> > > In Makefile, the ld flag `--thinlto-cache-dir' is set to
> > > `$(extmod_prefix).thinlto-cache'. But at that time, the variable extm=
od_prefix
> > > had not been assigned yet. Therefore, the thinlto cache dir is always=
 created
> > > in the current directory.
> > >
> > > Even worse, the cache dir cannot be deleted when executing `make clea=
n'. This
> > > is because its path was written as `$(KBUILD_EXTMOD)/.thinlto-cache' =
in the
> > > clean: target.
> > >
> > > Some users have been troubled by it: https://github.com/dell/dkms/iss=
ues/292
> > >
> > > This bug was introduced by commit dc5723b02e523b2c4a68667f7e28c65018f=
7202f
>
>
> I agree this is a bug.
>
>
>
>
> line 945:
>   KBUILD_LDFLAGS  +=3D --thinlto-cache-dir=3D$(extmod_prefix).thinlto-cac=
he
>
>
> line 1034:
>   KBUILD_LDFLAGS  +=3D $(call ld-option,--no-warn-rwx-segments)


This one is probably OK because it is guarded by CONFIG_LD_IS_BFD,
while LTO requires LD_IS_LLD.






I see another ld-option at 1043.

  LDFLAGS_vmlinux +=3D $(call ld-option,--pack-dyn-relocs=3Drelr,-z
pack-relative-relocs)


Maybe, this is related to the issue
(although I did not attempt to reproduce it).




--=20
Best Regards
Masahiro Yamada

