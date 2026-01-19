Return-Path: <linux-kbuild+bounces-10692-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 751B6D3B77F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 20:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71A3B30875CA
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Jan 2026 19:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C15F2E229F;
	Mon, 19 Jan 2026 19:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="mmSiMYG6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9552E0910;
	Mon, 19 Jan 2026 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768851819; cv=none; b=S+G0jSqQnUKG54DLT1Vh3+FdyKTQOXtWq2CpGXZ8FBlBwcVaiGzm2zevxE4eGkcJr1qMufLD+hUI91LXO+pQIFbCYob29iVFnTFJW3oD4PyvynO2LWZfMF+OZsc2zJTYT9sOVlA4F3pAKeBvbWM63TFpGLk4syAZCc5bbOG2DGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768851819; c=relaxed/simple;
	bh=s9GRY0FJY6iHKv2Hjum9gopPHHwQIkfpO/pEZWZdRvM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EUFbHKxjubNVaWFFoEwQyRsGrY2YUpfkP6LJkynoLSDlMdY8zFCU4G1ZMWz2q3o9y/f2H69dUCFejfpkqrbEjU4kNyBGzZ1v68uEUIfDn5+xPwESH0c82pbILZBX/tsdF9iR/tqfTYzSwfGabRjAHuo78g99HMX6Gg2dv4+6KwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=mmSiMYG6; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768851808; x=1769111008;
	bh=s9GRY0FJY6iHKv2Hjum9gopPHHwQIkfpO/pEZWZdRvM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mmSiMYG64YPT+CQ2wjQHoHi/YZc2cnwxdRHwxNUlyF5nEW8PzpH0VZc3HhOYq+8CF
	 FaChEkwkVLmrBvz027ugXCYoa9Dw6oR8nhShXt8fMNoMsjirTcTsUdKc4tfa+87dWo
	 g7J8yzuqRHz69j8YjGEwC+wz4kxz3xf27HtjEkhcHnr2TfHaHL9kzwwRGG9v5F4slZ
	 0bSFQATgcmirIgLi2xLDI0kRXAqEuT/gvcJiLCpDytXAsVoLUTj5+IxONZb80FXluD
	 w6lymthWpVEPALccPThV3E4Ok9EXUMEWIuvoAnAPIDgpBGOlzcZxqD2ddjWZuKPFwT
	 R1bShR6pmJUTA==
Date: Mon, 19 Jan 2026 19:43:23 +0000
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: corbet@lwn.net, morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org, catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org, jackmanb@google.com, samuel.holland@sifive.com, glider@google.com, osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org, akpm@linux-foundation.org, Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com, thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com, axelrasmussen@google.com, leitao@debian.org, bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com, urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com, andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org, vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com, samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com, surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
	yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com, kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org, bp@alien8.de, ardb@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <aW6HcGjkAZ3lITeA@wieczorr-mobl1.localdomain>
In-Reply-To: <e273571e-ab8f-46d6-a44e-c1d0d06d3cbf@gmail.com>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <e273571e-ab8f-46d6-a44e-c1d0d06d3cbf@gmail.com>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 85c5e72275bf1238c6f06b30c2b28981083b1095
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-01-19 at 17:33:35 +0100, Andrey Ryabinin wrote:
>On 1/12/26 6:26 PM, Maciej Wieczor-Retman wrote:
>
>> =3D=3D=3D=3D=3D=3D=3D Compilation
>> Clang was used to compile the series (make LLVM=3D1) since gcc doesn't
>> seem to have support for KASAN tag-based compiler instrumentation on
>> x86.
>>
>
>It appears that GCC nominally supports this, but in practice it does not w=
ork.
>Here is a minimal reproducer: https://godbolt.org/z/s85e11T5r
>
>As far as I understand, calling a function through a tagged pointer is not
>supported by the hardware, so GCC attempts to clear the tag before the cal=
l.
>This behavior seems to be inherited from the userspace implementation of H=
WASan (-fsanitize=3Dhwaddress).
>
>I have filed a GCC bug report: https://gcc.gnu.org/bugzilla/show_bug.cgi?i=
d=3D123696
>
>For the kernel, we probably do not want this masking at all, as effectivel=
y 99.9=E2=80=93100%
>of function pointer calls are expected to be untagged anyway.
>
>Clang does not appear to do this, not even for userspace.

Cool, thanks, nice to know why the kernel didn't start with gcc.

I'm going to check in on the bug report every now and then and once it gets
resolved I'll test if everything works as expected on both compilers.

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


