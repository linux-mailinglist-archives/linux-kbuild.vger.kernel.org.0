Return-Path: <linux-kbuild+bounces-4971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0341B9E28C6
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 18:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A034B82408
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 14:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F6281F75B5;
	Tue,  3 Dec 2024 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XYTDcMQ8";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="XYTDcMQ8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B6213B5B6;
	Tue,  3 Dec 2024 14:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733237789; cv=none; b=HxLgxjSoYxATO9OZ0UurC6lY4tJIDJPQTucW9wRDOp28STAy16Y2qyB1lhryRBDps9FaL+fL4uauTidRSf3tpKoJPDiFcyq8B15wyzs6UrwwnN+FBDiknbf7o9mRBk2H0Mrqh4t7hFV+aBlr0RTLenCt7l/qb0I5r1oTajQZxuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733237789; c=relaxed/simple;
	bh=FJKpHkNUIEy8qBiV6qVOAnWInSJ7UZV2AuQMwcgogQU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JeT45Pzw9DyF+4XmPKt1OttpOfUAh2Jb7aN7VfT2x5lkWfnazs4gtJUVnlWzULro6NmmuK8TUSQ+2kycVeaUcWE6FmEy6lj+DwUMIC2PTpLwaN0yk78UgjzWMJrzpDabzZSECCKKcanr50ZpMeF3YbTDdsYO/au21Op+kYf0jPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=XYTDcMQ8; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=XYTDcMQ8; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733237785;
	bh=FJKpHkNUIEy8qBiV6qVOAnWInSJ7UZV2AuQMwcgogQU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=XYTDcMQ8jzSMHl2IMuMiilPsER1rY2cGziCdLbA5pIvglb7WxPHuSSrJaQsSrtQhn
	 hK3W+tL72RQzOXXGjg4Qp6NWZsLvapPmBnoGY6lzxAcMQOGU5G8Aa5h/P0d2YXm9tH
	 KRjguKM72Mh+nJJwBArcqcPoOxbECMfuMlJavGY4=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C3E74128793E;
	Tue, 03 Dec 2024 09:56:25 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id ZwVRGJ733QGk; Tue,  3 Dec 2024 09:56:25 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733237785;
	bh=FJKpHkNUIEy8qBiV6qVOAnWInSJ7UZV2AuQMwcgogQU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=XYTDcMQ8jzSMHl2IMuMiilPsER1rY2cGziCdLbA5pIvglb7WxPHuSSrJaQsSrtQhn
	 hK3W+tL72RQzOXXGjg4Qp6NWZsLvapPmBnoGY6lzxAcMQOGU5G8Aa5h/P0d2YXm9tH
	 KRjguKM72Mh+nJJwBArcqcPoOxbECMfuMlJavGY4=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 19E4512871C9;
	Tue, 03 Dec 2024 09:56:25 -0500 (EST)
Message-ID: <6d21ce25bab39922c5c8b9f9433267e9d3e40d52.camel@HansenPartnership.com>
Subject: Re: section mismatch error in aesgcm causing a build failure
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kbuild@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>
Date: Tue, 03 Dec 2024 09:56:22 -0500
In-Reply-To: <CAMj1kXFGEeAkxpqsfp0G3VqTRs+Sve-pULDXBKvzSqAc_AVFMA@mail.gmail.com>
References: 
	<81560af7526138aa5221e5900ee7462f55bb090d.camel@HansenPartnership.com>
	 <CAMj1kXFGEeAkxpqsfp0G3VqTRs+Sve-pULDXBKvzSqAc_AVFMA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 2024-12-03 at 09:35 +0100, Ard Biesheuvel wrote:
> On Mon, 2 Dec 2024 at 21:27, James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > 
> > I'm getting this in 6.13-rc1:
> > 
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1
> > causes a section type conflict with aesgcm_tv
> >  static const u8 __initconst ptext1[16];
> >                              ^~~~~~
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note:
> > ‘aesgcm_tv’ was declared here
> >  } const aesgcm_tv[] __initconst = {
> >          ^~~~~~~~~
> > make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194:
> > lib/crypto/aesgcm.o] Error 1
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:212:29: error: ptext1
> > causes a section type conflict with aesgcm_tv
> >  static const u8 __initconst ptext1[16];
> >                              ^~~~~~
> > /home/jejb/git/linux-tpm/lib/crypto/aesgcm.c:570:9: note:
> > ‘aesgcm_tv’ was declared here
> >  } const aesgcm_tv[] __initconst = {
> >          ^~~~~~~~~
> > make[5]: *** [/home/jejb/git/linux-tpm/scripts/Makefile.build:194:
> > lib/crypto/aesgcm.o] Error 1
> > 
> > I think it's way older than 6.13-rc1, but the inclusion of the
> > sevguest
> > driver in the merge window now means that something actually
> > selects
> > it.  I can fix it simply by adding a zero initialization to the
> > file:
> > 
> > -static const u8 __initconst ptext1[16];
> > +static const u8 __initconst ptext1[16] = { 0 };
> > 
> > Which I think means that by default the traditional zero
> > initialization
> > of a static variable is in the wrong section (and actually likely
> > is
> > wrong for all our __initX variables as well).
> > 
> > In case it matters, this is with gcc-7
> > 
> 
> This also works
> 
> static const u8 __section(".init.rodata,\"a\",@progbits #")
> ptext1[16];

That also works for me.

> and so this suggests that without the @progbits annotations, the
> compiler is placing ptext1 into a SHT_NOBITS section, causing a
> conflict with the SHT_PROGBITS annotation of aesgcm_tv.

I'm not so sure about that:

static const u8 __section(".bss.init,\"a\",@nobits #") ptext1[16];

Also works for me.

> Given how unusual it is to have a static const variable without an
> initializer, I don't think this suggests that there is a wider issue
> with __initconst/__initdata.

What I meant was that uninitialized static __initX variables point to
the bss section.  We don't seem to have a discardable init bss section,
so they remain allocated for the life of the kernel.

> We're about to bump the minimum GCC version to 8 for other reasons,
> and I couldn't reproduce it with GCC 8.5.0. But the fix is
> straight-forward and actually clarifies this rather odd occurrence,
> so I think we should apply it nonetheless.

Hm, that's going to cause some problems: I'm on openSUSE Leap. 
Although all gcc's up to gcc-13 can be installed, the default compiler
is still gcc-7

Regards,

James


