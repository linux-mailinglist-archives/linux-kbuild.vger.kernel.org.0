Return-Path: <linux-kbuild+bounces-5047-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D244A9E8F90
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 11:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1ED61886A9D
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Dec 2024 10:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABB5174EDB;
	Mon,  9 Dec 2024 10:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="k7mnslmj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D082156FD;
	Mon,  9 Dec 2024 10:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733738531; cv=none; b=rMaNDvoC76T8vf8ple9ugHzgYHgh1ANcqehXLJhUgBjSCllyTzslU4kaNf2KmfjqEKTAbjBZCunQB4Rr52qUyXMlY3QsTZ1LAtlrIyI4JkolkwECZVgDUU5kgx/NOVqDecKXa0bX6xhXZHdSBP4D10v5wcOuWPQ18UoZYUbVzp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733738531; c=relaxed/simple;
	bh=nCw09gUb6A0TBEAcl+53+XyKQr0NNYN7MMLtG6B4iH4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fg7IlIcM1AtVygc3Sf57nX9R6dUxkDkt5i61n6ESXqo/QlE2nAC1QqjXA5f8duo3Ak/6VrTi5fHcMZA+sJUaGjNYTOZ27vmJSyZ7Q1LUVlzXnn/7J5mm9Dch+tjStfC09mtunSPyVHIa3VouVt80ub5kBNWvVtU8N5GaoAz79ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=k7mnslmj; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1733738521;
	bh=1WbLyzuvdIwJ3vdPjX4KAu3bQ20/S08GDISFmM/a/hY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=k7mnslmjF0UpiUirKVsAu6sAz//avIw5LaFizm5xP1zNOgMWIsNHEwmijsuR4Pmoe
	 9qi4R8V1r0uGn9gocDmpgEgUg0hX4FclBN0KYhfGq1Z1akKB6XqrzP3ShndhlT2W71
	 0KHdqHfaZUmTSb2ffSizMXPxvL+7spvGuZwH/lJM=
Received: from [192.168.124.9] (unknown [113.200.174.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id AAA8C1A3F68;
	Mon,  9 Dec 2024 05:01:58 -0500 (EST)
Message-ID: <c9a43e5da01ee2215393c0f3c50956171fe660ab.camel@xry111.site>
Subject: Re: [PATCH 6.1&6.6 0/3] kbuild: Avoid weak external linkage where
 possible
From: Xi Ruoyao <xry111@xry111.site>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Huacai Chen	
 <chenhuacai@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>, Sasha Levin	
 <sashal@kernel.org>, Xuerui Wang <kernel@xen0n.name>, Masahiro Yamada	
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers	 <ndesaulniers@google.com>, Nicolas Schier <nicolas@fjasle.eu>,
 	stable@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Date: Mon, 09 Dec 2024 18:01:56 +0800
In-Reply-To: <CAMj1kXEV+HC+2HMLhDaLfAufQLrXRs2J7akMNr1mjejDYc7kdw@mail.gmail.com>
References: <20241206085810.112341-1-chenhuacai@loongson.cn>
	 <2024120635-wham-campsite-b62b@gregkh>
	 <CAAhV-H4Db0tVrqcfXHceJeODgnK0ggHpx9_6vwXAAV0LohCD-w@mail.gmail.com>
	 <2024120748-preaching-reshape-06e9@gregkh>
	 <ccb1fa9034b177042db8fcbe7a95a2a5b466dc30.camel@xry111.site>
	 <CAMj1kXEV+HC+2HMLhDaLfAufQLrXRs2J7akMNr1mjejDYc7kdw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2024-12-09 at 09:31 +0100, Ard Biesheuvel wrote:
> Given that this is relatively new toolchain behavior, I'd suggest
> fixing the compiler to emit weak external references via GOT entries
> even when=C2=A0 -mdirect-extern-access is in effect.

I'm working on an approach in the linker instead.  A PC-relative address
in +/- 2GiB range is

pcalau12i.d $a0, %pc_hi20(sym + addend)
addi.d $a0, $a0, %pc_lo12(sym + addend)

If doing a static linking, when sym is weak undefined, we should just
load addend.  The compiler already guarantees addend is in [-2**31,
2**31) range, so we just need to rewrite the pair to

lu12i.w $a0, ((addend + 0x800) & ~0x7ff)
addi.d $a0, $a0, (addend & 0x7ff)

OTOH if not doing a static linking, the user shouldn't use -mdirect-
extern-access at all [this rule is the thing related to copy relocation:
if copy relocation was available it would be possibly valid to use -
mdirect-extern-access w/o static linking] and the linker is correct to
report an error (but the error message is unclear and I need to fix it
anyway).

--=20
Xi Ruoyao <xry111@xry111.site>
School of Aerospace Science and Technology, Xidian University

