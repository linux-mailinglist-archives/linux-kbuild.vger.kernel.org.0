Return-Path: <linux-kbuild+bounces-7035-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD7AAF53B
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 10:15:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 372881BC7AD0
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 08:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010FE226534;
	Thu,  8 May 2025 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A52oFjrq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5B26F073;
	Thu,  8 May 2025 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746692093; cv=none; b=OwJ58Ru+hXZEAH7JO7k0Udc7Q1e47h/qb4Lq4VVSH8hpslBSfq43ssIaeQ4kGiSMkMFU/jXO36ajO1/QRVT2dwsvQu264QoCFtZvHCKWol/aUo3F06ZMPOLl2rUIT3mlkWM/RjtREhh6wHpyIdBgz7dSrThzCWqjtRT54jXHygY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746692093; c=relaxed/simple;
	bh=a90R/RVtpbilNz7s62Jg8u91/OCcf1dJCeMzvHKzX2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8cucbhY2pj246KOILhTuE+Al1zbXmxYlbdncwSxRdwOhG3zkGfoHmakb2GAHD743jAsp0yFZGDP+lsFpeT+NT4qYqW2Pv74S8LJlf11hiEbxITDNWbjNgncse4uJFWn2mFs1dGIt/5MVcsX7nBz0zVdI7GduXl8/nraT53EJHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A52oFjrq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486EBC4AF09;
	Thu,  8 May 2025 08:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746692093;
	bh=a90R/RVtpbilNz7s62Jg8u91/OCcf1dJCeMzvHKzX2o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=A52oFjrqemalMSdOL5Jmf+c40wj1sXuWYLl3QItkyf8Aqq/xG84ltalPNi2KEG/fq
	 ABli4aqrCKNLjztj/+3aUSi9l+2nt/WM6JzKW4nKCDdxi3YEPTXXrxPhPHVBjH68Ql
	 Ri2XOSRQxtmhtCmCLya0Hp11BXH8gJ/hZHf3u8a96PiTaJSp4JwsxXIZQkErTJ2E0g
	 Xy4LgLvC4i/ZOKRMlEdcvIRN5jBO/kNIaNBZ6DOcXfFkf7IOuSYm/K6GeoT/a8BO7T
	 aEG/E4OMKhoe3/ngc8pHwi5btrsjtQjEqJ8mkiuyn4PouIID1ct9uWjprupBP2SyG5
	 YvHfgMoFzbtNQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-326bb1d3e34so4023311fa.3;
        Thu, 08 May 2025 01:14:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUjLDvCYRQE+ee7mamAmV8GSDBpIRZwyKM69oD/iQj5tO4y9MHz05Ibf7i5FkdosKDB1lJfirJM6Y51qhoT@vger.kernel.org, AJvYcCVAYWfcvPhe+NoSfGkFXwjQvM5vAuPw8ujRRQuJqlwE0k+c0Tf10KklSN0aIHpwx/zci8pgYerKxU0EiEU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2o1kmrFzeLycqe0GYInCO5UiY14gSeV0QHsUVWLwie45VC9aH
	9laEd46kAZpezP9dX9iHLeOyid8kx0UKmWqLt2+8LewufDZunG5dRbgXqsu2yrfkYQc+keOJqao
	F0k4xvlNdNiaZovxGvJzNvdcS1LM=
X-Google-Smtp-Source: AGHT+IG5/r3K74rrgmP4jjN2TrL5tduvKzUd/NyUq1PVkJzbIiLe5Exi6qlai9lYrJkj3vGsc13NepVCII6zThmGhHQ=
X-Received: by 2002:a2e:a9ab:0:b0:31b:4770:4957 with SMTP id
 38308e7fff4ca-326ad15e61amr23735871fa.3.1746692091963; Thu, 08 May 2025
 01:14:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507074936.486648-1-masahiroy@kernel.org> <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
 <b1e4e83c0965e10f2fe59826d19eaf131ec7aef9.camel@sipsolutions.net> <CAMuHMdUwE7btR+ebG8-gvPb8GPnxUGPWw3yKR4qM4Uc_mYcHhg@mail.gmail.com>
In-Reply-To: <CAMuHMdUwE7btR+ebG8-gvPb8GPnxUGPWw3yKR4qM4Uc_mYcHhg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 8 May 2025 17:14:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_m+R3Keyys2NpmQWRmZzHNv9FM_ALv=vn_WMzTSWhyw@mail.gmail.com>
X-Gm-Features: ATxdqUFvuCFG5NyS8UC8wsCetGd3jkgaQucz2-cP5mFw3Psg07oK3WaW20XowMg
Message-ID: <CAK7LNAT_m+R3Keyys2NpmQWRmZzHNv9FM_ALv=vn_WMzTSWhyw@mail.gmail.com>
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as well
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Richard Weinberger <richard@nod.at>, 
	linux-um@lists.infradead.org, David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 4:38=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Johannes,
>
> On Thu, 8 May 2025 at 07:29, Johannes Berg <johannes@sipsolutions.net> wr=
ote:
> > On Wed, 2025-05-07 at 15:38 -0600, Shuah Khan wrote:
> > > My workflow:
> > >
> > > - Build kernel on x86_64 with CONFIG_AMD_MEM_ENCRYPT enabled
> > >
> > > - Check for arch/x86/realmode/rm/pasyms.h
> > >    ls arch/x86/realmode/rm/pasyms.h
> > >       arch/x86/realmode/rm/pasyms.h
> > >
> > > - make ARCH=3Dum O=3D/linux/build
> > >
> > >    This patch cleans the source tree, but doesn't remove
> > >    arch/x86/realmode/rm/pasyms.h
> > >
> > > - ls arch/x86/realmode/rm/pasyms.h
> > >       arch/x86/realmode/rm/pasyms.h
> >
> > Is that even _expected_ to work? If you have x86 built first, I'd almos=
t
> > expect you to have to do "make ARCH=3Dx86 mrproper" before building
> > another ARCH. I don't see how ARCH=3Dum would know how to do a full cle=
an
> > up of ARCH=3Dx86, unless this is somehow arch-independent?
> >
> > Or maybe that's not an issue with other architectures because UML is
> > special in that it uses parts of x86?
>
> Probably.
> I only use my linux-next source tree for fixing reported build issues on
> various architectures, and I never use make clean/mrproper.  Works fine.
>
> > Though I guess the patch here should make it do that, more or less, but
> > it can't, likely because you're also switching from in-tree build to O=
=3D
> > build?
>
> Yeah, mixing in-tree and out-of-tree builds causes issues.
> Never build in-tree in a source tree you use with O=3D (except for
> e.g. "make tags").
>

I argue this.

You can start out-of-tree builds after running 'make mrproper'
for the architecture you want to build the kernel for.

Hence, Kbuild suggests to do so when it determines
the source tree is not clean enough.

Unfortunately, "make mrproper ARCH=3Dum" did not clean the tree
deeply enough.   Hence, this patch.


--=20
Best Regards
Masahiro Yamada

