Return-Path: <linux-kbuild+bounces-10530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA46D15282
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 21:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C232302BA5C
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 20:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D2E32C939;
	Mon, 12 Jan 2026 20:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="QT4Gpkfe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709A32C302;
	Mon, 12 Jan 2026 20:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248519; cv=none; b=bQPDtsuxrn0wMchyvwQMsBdJZ/wXHjd0ZzT5rhsingmZrCpp6KI4sbmFmXbrDVdmiiCSBF4YVQ1Fm7j6g0xkMaEbWA7EApHe3pu55fuHck20noKY4fAQTk78qT9AUUDDdMpylAsnm4RWzdY8AAKbd/kk/hnBUYx6aa/3YrCLbNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248519; c=relaxed/simple;
	bh=6HlH6fTgDaIxuF6BqTtRulNWBD0wkhs1+qui3XV4hRk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQO1gNEG/0PZnPNKcV2QSpt07a8FWqN+FmpO/+4aMTOXzbcjIv742yymzd5g/qn33vK3qqAe3VbMU/z6fJgP5V4LNmler4wy89ebYaODdb1CiSkmGj/wxNnE/J37y+MVb4kCXIu3cy9Mm4MKvn/H015Kju3XIJESt2n77uqNXbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=QT4Gpkfe; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1768248514; x=1768507714;
	bh=0xx91FMArzFMWklxJ23UJVUdtYrv0ESnhx5I4mmt2rU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QT4GpkfeDeiZhEH0UHFstVyzQKRlUDyyzO3NyBJ4KpGqlaKOkHJ9suj9ZyeqrjLMI
	 dU1YDifSGjmZNM3qKkvKMgpskAglgi05UxiDWwfhkh8rX+s/2lZb76KG3QD7v51syV
	 0B3XohFYhfPIvGVCtMKCqW5/zpjF9fPlI3L34+4MkYznIaFJ2Yc9D3QRFDR6w9Ijap
	 nrTxnMyLEwwurUV6I+I4XP8Hz1wtDy+uAR/LBbsc4LqgkTw2cK9GoTnicbBOiEonAf
	 OMQntpaTaWtrP2VUSiCzqFMGh5mkUD6C225v9M2ytPNklm/HL+ToP6GKFuKce+qo4B
	 OrUUPcrIkR7Bg==
Date: Mon, 12 Jan 2026 20:08:23 +0000
To: Andrew Morton <akpm@linux-foundation.org>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: corbet@lwn.net, morbo@google.com, rppt@kernel.org, lorenzo.stoakes@oracle.com, ubizjak@gmail.com, mingo@redhat.com, vincenzo.frascino@arm.com, maciej.wieczor-retman@intel.com, maz@kernel.org, catalin.marinas@arm.com, yeoreum.yun@arm.com, will@kernel.org, jackmanb@google.com, samuel.holland@sifive.com, glider@google.com, osandov@fb.com, nsc@kernel.org, luto@kernel.org, jpoimboe@kernel.org, Liam.Howlett@oracle.com, kees@kernel.org, jan.kiszka@siemens.com, thomas.lendacky@amd.com, jeremy.linton@arm.com, dvyukov@google.com, axelrasmussen@google.com, leitao@debian.org, ryabinin.a.a@gmail.com, bigeasy@linutronix.de, peterz@infradead.org, mark.rutland@arm.com, urezki@gmail.com, brgerst@gmail.com, hpa@zytor.com, mhocko@suse.com, andreyknvl@gmail.com, weixugc@google.com, kbingham@kernel.org, vbabka@suse.cz, nathan@kernel.org, trintaeoitogc@gmail.com, samitolvanen@google.com, tglx@kernel.org, thuth@redhat.com, surenb@google.com, anshuman.khandual@arm.com, smostafa@google.com,
	yuanchu@google.com, ada.coupriediaz@arm.com, dave.hansen@linux.intel.com, kas@kernel.org, nick.desaulniers+lkml@gmail.com, david@kernel.org, bp@alien8.de, ardb@kernel.org, justinstitt@google.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v8 00/14] kasan: x86: arm64: KASAN tag-based mode for x86
Message-ID: <aWU-oL8oYS_PTwzc@maciej>
In-Reply-To: <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
References: <cover.1768233085.git.m.wieczorretman@pm.me> <20260112102957.359c8de904b11dc23cffd575@linux-foundation.org>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 74b6155b55c4853d5925984570fe14ed71d1c92c
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2026-01-12 at 10:29:57 -0800, Andrew Morton wrote:
>On Mon, 12 Jan 2026 17:26:29 +0000 Maciej Wieczor-Retman <m.wieczorretman@=
pm.me> wrote:
>
>> The patchset aims to add a KASAN tag-based mode for the x86 architecture
>> with the help of the new CPU feature called Linear Address Masking
>> (LAM). Main improvement introduced by the series is 2x lower memory
>> usage compared to KASAN's generic mode, the only currently available
>> mode on x86. The tag based mode may also find errors that the generic
>> mode couldn't because of differences in how these modes operate.
>
>Well this is a hearty mixture of arm, x86 and MM.  I guess that means
>mm.git.
>
>The review process seems to be proceeding OK so I'll add this to
>mm.git's mm-new branch, which is not included in linux-next.  I'll aim
>to hold it there for a week while people check the patches over and
>send out their acks (please).  Then I hope I can move it into mm.git's
>mm-unstable branch where it will receive linux-next exposure.

Thank you :)

>
>> [1] Currently inline mode doesn't work on x86 due to things missing in
>> the compiler. I have written a patch for clang that seems to fix the
>> inline mode and I was able to boot and check that all patches regarding
>> the inline mode work as expected. My hope is to post the patch to LLVM
>> once this series is completed, and then make inline mode available in
>> the kernel config.
>>
>> [2] While I was able to boot the inline tag-based kernel with my
>> compiler changes in a simulated environment, due to toolchain
>> difficulties I couldn't get it to boot on the machine I had access to.
>> Also boot time results from the simulation seem too good to be true, and
>> they're much too worse for the generic case to be believable. Therefore
>> I'm posting only results from the physical server platform.
>>
>> =3D=3D=3D=3D=3D=3D=3D Compilation
>> Clang was used to compile the series (make LLVM=3D1) since gcc doesn't
>> seem to have support for KASAN tag-based compiler instrumentation on
>> x86.
>
>OK, known issues and they are understandable.  With this patchset is
>there any way in which our testers can encounter these things?  If so
>can we make changes to protect them from hitting known issues?

The gcc documentation states that the -fsanitize=3Dkernel-hwaddress is
similar to -fsanitize=3Dhwaddress, which only works on AArch64. So that
hints that it shouldn't work.

But while with KASAN sw_tags enabled the kernel compiles fine with gcc,
at least in my patched qemu it doesn't run. I remember Ada Couprie Diaz
mention that passing -march=3Darrowlake might help since the tag support
seems to be based on arch.

I'll check if there's a non-hacky way to have gcc work too, but perhaps
to minimize hitting known issue, for now HAVE_ARCH_KASAN_SW_TAGS should
be locked behind both ADDRESS_MASKING and CC_IS_CLANG in the Kconfig?

--=20
Kind regards
Maciej Wiecz=C3=B3r-Retman


