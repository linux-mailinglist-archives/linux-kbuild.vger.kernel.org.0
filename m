Return-Path: <linux-kbuild+bounces-2009-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDCA8FD50C
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 20:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0F3B2876FD
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 18:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21B214A082;
	Wed,  5 Jun 2024 18:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="BH3LY5Bs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F388F145322;
	Wed,  5 Jun 2024 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610570; cv=none; b=hrIbskc4yfL7OuuyfrQAtXZTBEeRa0Vn23EShfglt46x18vgkE/LinLiwF4zJfgiL5YL1ks5OD1fM6k86eQpa3eLNxifhW9OHWGoHJLfNND75NuB2+f7YWleMbMMUvHlZ4JzDKS+8ANk7lanyFCTvaXguGN0hWaaRQQGqNwRAaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610570; c=relaxed/simple;
	bh=uwUrfu/yzS/YNseKipCZSPaE2sZQzojPJmfSYmfQ2II=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=McuLFB9mc4G5a+VyT6iLFMyTo+Eoqrh/WmluKPjeeBvr+aSV9xs0GSCqZQ4YqejDW/H6ANwnznJ/JVxZFAA8CA8NWQi8yNMIRqAf9k1++Vxra0BCozVMxyFrC3Gcn7I1OneDFVPIabJLfrXKgAPPUxorEXTzLPZSr+xcyDHDK1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=BH3LY5Bs; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=uwUrfu/yzS/YNseKipCZSPaE2sZQzojPJmfSYmfQ2II=;
	t=1717610568; x=1718820168; b=BH3LY5Bsae9vIWyOsa/qXHUk7LcIgC3yavKg8JyM+FPTk2E
	JguRCm6uYy3EvBeXqtsmuVgDehf5zk5cHYlV84elBBcRuaF2NwCz5KEOGtpjZj3//kHccqA2vbKlc
	qKrUC+/GNb+NiTFvs2gEdOLMmYJoRg54EKctmsEmxKNsXexWvVJhmjsijnrALB+OS4HM6uBePOL3u
	7J19mdPD146PGqGlM+EkbbmOdrlZy/GSpfCnynK7yTWfN1iHBe636xh3QfyN4djFTbzyhw1bTZulR
	lVfUEifRRRKQ2mukbi8mP9aE70jaJetG16zmlNGgiezxT0oQfBzkwahewv/jJ9aw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sEuxm-0000000ErED-3wIf;
	Wed, 05 Jun 2024 20:02:19 +0200
Message-ID: <b46fd359f62fc7c50790fb19a8814c89a10a7c1c.camel@sipsolutions.net>
Subject: Re: [PATCH] arch: um: rust: Add i386 support for Rust
From: Johannes Berg <johannes@sipsolutions.net>
To: Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Cc: David Gow <davidgow@google.com>, Brendan Higgins
 <brendan.higgins@linux.dev>,  Rae Moar <rmoar@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,  Miguel Ojeda
 <ojeda@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada
 <masahiroy@kernel.org>,  Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>,  kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org,  linux-um@lists.infradead.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,  Wedson Almeida Filho
 <wedsonaf@gmail.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, Alice
 Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Date: Wed, 05 Jun 2024 20:02:17 +0200
In-Reply-To: <CAMj1kXHa58Zcq3extXw4VXGnpVHbd5urzCGnh_oCo-BLMxMrJQ@mail.gmail.com>
References: <20240604224052.3138504-1-davidgow@google.com>
	 <20240605062234.GE279426@thelio-3990X>
	 <CAMj1kXHa58Zcq3extXw4VXGnpVHbd5urzCGnh_oCo-BLMxMrJQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2024-06-05 at 19:59 +0200, Ard Biesheuvel wrote:
>=20
> > > -ifdef CONFIG_X86_64
> > > +ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
> >=20
> > These configurations are mutually exclusive, so would it look more
> > readable to have it be:
> >=20
> >=20
> > ifeq ($(CONFIG_X86_32)$(CONFIG_X86_64),y)
> >=20
>=20
> Or simply
>=20
> ifdef CONFIG_X86

No, we're talking about ARCH=3Dum, so CONFIG_X86 isn't set, but
CONFIG_X86_{32,64} are set as the "sub" or "host" arch. :)

johannes

