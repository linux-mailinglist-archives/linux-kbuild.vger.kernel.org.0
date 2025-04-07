Return-Path: <linux-kbuild+bounces-6494-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCA2A7EBD6
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 21:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C2E51744DE
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 18:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101C6259C8E;
	Mon,  7 Apr 2025 18:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLh1tXPV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DD9224882;
	Mon,  7 Apr 2025 18:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744050076; cv=none; b=LN6BRVj4rVGEKOYZCTLDgtTjDlp5LHdFLq4X9EzhAeQK/XQXcxmSIxD7oYPmtMilYXfS7tAXmS87j8XrTk+3tVK6DQhYE1ZM4nNCEWmSDlne5WysKhyklFj5tnWS30qQvWOr7peWqkF7iOgqfjNGSHHJaGdUGSs0ydJbnDT19qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744050076; c=relaxed/simple;
	bh=8wC0V3F7d+ilyrpMWafa8egm5sgRBCeyFuJIZP4vVRk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=scQ/Mnak8RXr4NmT/FHeg9VODNj04DhyYlirN+EfUijmybrp+Bm9XORFBI4OYkgbLaQtDx0syRrZ44vS+S3lCb6Q3VaT72O2ODHnHjMuvliXZDJ4FSWO6YraBJ+xrLrCye3fSqoAtQBKpva/pMwiwN6czXb9kIfaXHnz8O8qAjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLh1tXPV; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so19967485e9.0;
        Mon, 07 Apr 2025 11:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744050072; x=1744654872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES21mMERPPnSMI71+d30thtG1PyOJaAorY/1IBZ9Fis=;
        b=RLh1tXPVIM8MjiBxxPBUK95dcSPJ5jr2pkYaq4Ne4OSVUoMg83cOXhES7v4ekW9SKx
         10EPSLD5PH7L4WQRCJXbX+tVNtffvR01hs7/Y+ydWtTRJWsJS4YIIB6r8u5EbH1y+8Bn
         Wy4B0DFmwJq2292+/mE9nZoWzHGV/x1uy/ofgHRnzAnlt3Emh5Ne6DZH92YOoXJ3iEUW
         IIFUPt6+AvYVT5qP+xZiXl3PgCiBmYfCsVo82pAL+N4ksUoG2KEjUQ63yeinntOScBlu
         Oe+CS2DIXh/hch8RVkfgGRv5EyL4cgK6Ev0EXxvsGm6c4l/NVuCKA3C0abL2rZ/rscxk
         Mnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050072; x=1744654872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES21mMERPPnSMI71+d30thtG1PyOJaAorY/1IBZ9Fis=;
        b=I3KVtG/oO0wG4+LKPjXQ3p6n4AbdQkCxj2Pg7vL7W2pE0tPHxmJM8nym6dNkodr58x
         4xClfmOgYjSEK5qblFi+CxPkA/BVkMOkhNNQOlB2lU7caVRYawnHYxSYETtb1AdojtHR
         dHHd5rTosnaF36ty/Etav0FAHE5WYM8gk5/7kAWD90A77oG17/A2weQNDM344eyjLW5c
         Ibf/wbTX2XnNqZSBicSg9gambTJERupHfHyNP3pTW/fIGaGqi/AW9Bk6XZSTi92/3jpX
         2rylYTg+/4bMZR/6FDGOXzKHyuZb15VzcMii/JswRrGVC+6x6GE81SfArAcKEQYBu+mk
         Ckfg==
X-Forwarded-Encrypted: i=1; AJvYcCUCsoUMmhqNXaKqp0hIhgs/hEGzE5wa0U2L8kt0IwuMT3OQM4iRh7XVwe9UVt3wiWTiAupfqWdAsIOjNRQS@vger.kernel.org, AJvYcCUQju+Tg3r2unjrYWSIhyr2/UEnC5XKsms/GOoLLYoUo0DCCe2BaUxukTTrGxvTnJJ9+k5DaiOh1k2qOqk=@vger.kernel.org, AJvYcCUwvWNr4cNkq4cm9KgqdorsoqmxY3JWmn/6usp8N4bVe/LKFR1/6LJJWxZ3Ywe5TCuhJorRqWZVYooT5+GC@vger.kernel.org, AJvYcCVTEToWl3r0KCVHMZ2GnmW1bpEXP4i1dO+/X6XYHZEt9IqoOMZvaLxCvl7qmVGkCx/K/BzR0Jl3G+fG@vger.kernel.org, AJvYcCWXb4TeKCIz7+ffGSu6YZM9jBjFeIsE5wTzS3cotQ5FjbESq53nQNITlAbErgTBCAXpD8jDrctEe/1g8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ7CSspDsfbBiQ8tGlyFvoHGUHOBK/xN92azAo7GwEkURZeXSL
	klriQVBddRCDOkwzCdWUskl4CUEEO8JbEl3NLGDwgYG2GEez5i0I
X-Gm-Gg: ASbGncuhJNIXaszIMEtbAGHgUGxvOWj7l8aDGZQD8uHd6+w8h0RU2QTgafKixD6ggao
	bghsVI1prsFRDg1VYmWuQg6I8OF/sY7yKD0gZ4QTph18NEDYodvHd6gYDtqQg7giORWwq/cCWjB
	oFEBkToYO2cbJvQI8jcaNwDZxUhgfgQI11bgYe65Bhr+OZihgptS0XalMDztG98MwqKDh2rDLHn
	+y5if9Zg4ua9migkuRI5h/lSMKA9OmxI60Cg4waOZ9SppSvyAGJqIhPy+7kc8bAwkgazRDr6W1i
	Mha/mHTnyH+YS1ldcLnQ25sI3Jo7yGtOm8XPv1coVeamdAsLEY+D8muA2iN6XZc0uIS5YEZR3y8
	REWJH5Sk=
X-Google-Smtp-Source: AGHT+IH7UT5+ww2+1FoGL9t0kvvVtsQUX0Zd7DaWfpx4PLfPCluuGh6+cQNvkvF3tn8WY4k8enhO3A==
X-Received: by 2002:a05:600c:8411:b0:43d:d06:3798 with SMTP id 5b1f17b1804b1-43ecf9fe1f0mr113598395e9.20.1744050072429;
        Mon, 07 Apr 2025 11:21:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm142595365e9.0.2025.04.07.11.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:21:11 -0700 (PDT)
Date: Mon, 7 Apr 2025 19:21:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel
 <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>, Brian Gerst
 <brgerst@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Masahiro
 Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>, Thomas
 Gleixner <tglx@linutronix.de>, Uros Bizjak <ubizjak@gmail.com>, Will Deacon
 <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <20250407192110.5a7ad777@pumpkin>
In-Reply-To: <20250407164151.GB2536@sol.localdomain>
References: <20250407094116.1339199-1-arnd@kernel.org>
	<20250407164151.GB2536@sol.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Apr 2025 09:41:51 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
> > actually go through all  version checks and make this is the minimum
> > for all architectures.
> > 
> > Most of the actual resulting changes are actually for raising the
> > binutils version, which eliminates version checks on x86 and arm64.
> > 
> > Arnd Bergmann (4):
> >   kbuild: require gcc-8 and binutils-2.30
> >   raid6: skip avx512 checks
> >   x86: remove checks for binutils-2.30 and earlier
> >   arm64: drop binutils version checks  
> 
> This is intended to supersede the patches from Uros that removed checks for
> binutils < 2.25, right?  See:
> 
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
> * https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/
> 
> If we can indeed bump up the requirement to 2.30, that would be great.
> 
> Just a note though: I recently added VAES and VPCLMULQDQ instructions to
> BoringSSL, which increased the binutils requirement of building BoringSSL to
> 2.30, and this caused issues in a downstream project; e.g. see
> https://github.com/briansmith/ring/issues/2463.  Specifically people complained
> about being unable to build on Amazon Linux 2 and CentOS/RHEL/Oracle Linux 7.

Just tell them RHEL 7 is no longer supported :-)
(Was a right PITA installing an extra package on a CentOS 7 system we use as
a build machine...)

In any case it is relatively easy to install a later gcc - even though it ends
up in a very obscure place.

	David

> 
> So I just thought I'd mention that, based on past experience with this sort of
> thing, those are the specific cases where it seems people are most likely to be
> trying to use binutils < 2.30.
> 
> But if those distros are not going to be supported any longer (without
> installing newer tools on them), or even are already unsupported due to the gcc
> requirement, bumping up the binutils requirement to 2.30 sounds good to me.
> 
> - Eric
> 


