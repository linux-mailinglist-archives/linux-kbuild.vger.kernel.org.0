Return-Path: <linux-kbuild+bounces-9647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB21C635F0
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EAF024EE43C
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Nov 2025 09:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3C52D24B7;
	Mon, 17 Nov 2025 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="mcrsu2KI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BDF2D0C8C;
	Mon, 17 Nov 2025 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763372864; cv=none; b=hrrngSKfXehrmnbCU4Na6oY7HhGBGglaL2hotJAEidpyTCSgVBx7ocz7xeaHUIwA+83UrpMZUpOarEWtuitqUUiKzwwsQ0+yaM/QJpv/gQf/rRyO4xk7vGAcgh+vJKbfuyGzrHbhdzPrPTJ6A2xr0JXqsL+6Ms2IHVJJ39p0Xcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763372864; c=relaxed/simple;
	bh=d5Vf5iyzChW6Mpz0zplhVRlqd7j1Cbo+M0BhKDpMZDg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+OiG+mhVDcJ7JAkWoYMN4TUdFV8UDCJG0sS0wiJrYl5UCZP4qtNlL8NkMZtHrvMz0/CDJ0V9EjHEs+X/ZIACwj6SmCweRWM0hyN6Lhn6Pu53qp5uB1JDJlz4XlKcTqn2EwtWD3OLI6Vp1tG34aeKH7wmZNiwS2kdKWvLs9cS7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=mcrsu2KI; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1763372848; x=1763632048;
	bh=ihq7qfJz6+gs5FNsdIMwz9cXAydO9ORjjGo1TVl8LXw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mcrsu2KIWRBuWP34fnaTEh2MJNkVwIexwJGZLPXXX8yXyfC6BVMRE0pwA0f836XBU
	 UpCxiJRetz1cvCIHZAK97aG637iimF1G6z/rv35RGWp/5AHDknha1iBHirylJDw7M+
	 306KxxrDTs2lhPnbOZQ8W//vM6e3Yq0mySSt3Jj72gcEiVI/wkkaKvxxXGcJFfbZGQ
	 Xf3TP+8S6SNTxCKDROm1/FW3BdZ/Xx/MNDofPUimmPwmBY1JUkJsGtEbSHUpH0zpBu
	 R4nsgQ8dvLZLK5ODLUBLrAnXcP6hEEmkdZOTveuEmMB8lVsdZigLkuR3CPDc5gq2r1
	 XrzHunj7MULtQ==
Date: Mon, 17 Nov 2025 09:47:20 +0000
To: Peter Zijlstra <peterz@infradead.org>
From: =?utf-8?Q?Maciej_Wiecz=C3=B3r-Retman?= <m.wieczorretman@pm.me>
Cc: xin@zytor.com, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, ardb@kernel.org,
	Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 15/18] x86/kasan: Handle UD1 for inline KASAN reports
Message-ID: <a4vtlaxadmqod44sriwf2b6cf5fzzvngl6f5s2vg6ziebahjtv@yctbqspkdn2b>
In-Reply-To: <20251111102719.GH278048@noisy.programming.kicks-ass.net>
References: <cover.1761763681.git.m.wieczorretman@pm.me> <8b0daaf83752528418bf2dd8d08906c37fa31f69.1761763681.git.m.wieczorretman@pm.me> <20251111102719.GH278048@noisy.programming.kicks-ass.net>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: c252819bcd42668f3ed4c2d3435f49dcbb5a823f
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 2025-11-11 at 11:27:19 +0100, Peter Zijlstra wrote:
>On Wed, Oct 29, 2025 at 08:09:51PM +0000, Maciej Wieczor-Retman wrote:
>> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>>
>> Inline KASAN on x86 should do tag mismatch reports by passing the
>> metadata through the UD1 instruction and the faulty address through RDI,
>> a scheme that's already used by UBSan and is easy to extend.
>>
>> The current LLVM way of passing KASAN software tag mode metadata is done
>> using the INT3 instruction. However that should be changed because it
>> doesn't align to how the kernel already handles UD1 for similar use
>> cases. Since inline software tag-based KASAN doesn't work on x86 due to
>> missing compiler support it can be fixed and the INT3 can be changed to
>> UD1 at the same time.
>>
>> Add a kasan component to the #UD decoding and handling functions.
>>
>> Make part of that hook - which decides whether to die or recover from a
>> tag mismatch - arch independent to avoid duplicating a long comment on
>> both x86 and arm64 architectures.
>>
>
>> diff --git a/arch/x86/include/asm/kasan.h b/arch/x86/include/asm/kasan.h
>> index 396071832d02..375651d9b114 100644
>> --- a/arch/x86/include/asm/kasan.h
>> +++ b/arch/x86/include/asm/kasan.h
>> @@ -6,6 +6,24 @@
>>  #include <linux/kasan-tags.h>
>>  #include <linux/types.h>
>>  #define KASAN_SHADOW_OFFSET _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> +
>> +/*
>> + * LLVM ABI for reporting tag mismatches in inline KASAN mode.
>> + * On x86 the UD1 instruction is used to carry metadata in the ECX regi=
ster
>> + * to the KASAN report. ECX is used to differentiate KASAN from UBSan w=
hen
>> + * decoding the UD1 instruction.
>> + *
>> + * SIZE refers to how many bytes the faulty memory access
>> + * requested.
>> + * WRITE bit, when set, indicates the access was a write, otherwise
>> + * it was a read.
>> + * RECOVER bit, when set, should allow the kernel to carry on after
>> + * a tag mismatch. Otherwise die() is called.
>> + */
>> +#define KASAN_ECX_RECOVER=090x20
>> +#define KASAN_ECX_WRITE=09=090x10
>> +#define KASAN_ECX_SIZE_MASK=090x0f
>> +#define KASAN_ECX_SIZE(ecx)=09(1 << ((ecx) & KASAN_ECX_SIZE_MASK))
>>  #define KASAN_SHADOW_SCALE_SHIFT 3
>
>> diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
>> index 6b22611e69cc..40fefd306c76 100644
>> --- a/arch/x86/kernel/traps.c
>> +++ b/arch/x86/kernel/traps.c
>> @@ -179,6 +179,9 @@ __always_inline int decode_bug(unsigned long addr, s=
32 *imm, int *len)
>>  =09if (X86_MODRM_REG(v) =3D=3D 0)=09/* EAX */
>>  =09=09return BUG_UD1_UBSAN;
>>
>> +=09if (X86_MODRM_REG(v) =3D=3D 1)=09/* ECX */
>> +=09=09return BUG_UD1_KASAN;
>> +
>>  =09return BUG_UD1;
>>  }
>>
>> @@ -357,6 +360,11 @@ static noinstr bool handle_bug(struct pt_regs *regs=
)
>>  =09=09}
>>  =09=09break;
>>
>> +=09case BUG_UD1_KASAN:
>> +=09=09kasan_inline_handler(regs);
>> +=09=09handled =3D true;
>> +=09=09break;
>> +
>>  =09default:
>>  =09=09break;
>>  =09}
>
>> +void kasan_inline_handler(struct pt_regs *regs)
>> +{
>> +=09int metadata =3D regs->cx;
>> +=09u64 addr =3D regs->di;
>> +=09u64 pc =3D regs->ip;
>> +=09bool recover =3D metadata & KASAN_ECX_RECOVER;
>> +=09bool write =3D metadata & KASAN_ECX_WRITE;
>> +=09size_t size =3D KASAN_ECX_SIZE(metadata);
>> +
>> +=09if (user_mode(regs))
>> +=09=09return;
>> +
>> +=09if (!kasan_report((void *)addr, size, write, pc))
>> +=09=09return;
>> +
>> +=09kasan_die_unless_recover(recover, "Oops - KASAN", regs, metadata, di=
e);
>> +}
>
>I'm confused. Going by the ARM64 code, the meta-data is constant per
>site -- it is encoded in the break immediate.
>
>And I suggested you do the same on x86 by using the single byte
>displacement instruction encoding.
>
>=09ud1=090xFF(%ecx), %ecx
>
>Also, we don't have to use a fixed register for the address, you can do:
>
>=09ud1=090xFF(%ecx), %reg
>
>and have %reg tell us what register the address is in.
>
>Then you can recover the meta-data from the displacement immediate and
>the address from whatever register is denoted.
>
>This avoids the 'callsite' from having to clobber cx and move the address
>into di.
>
>What you have here will work, and I don't suppose we care about code
>density with KASAN much, but it could've been so much better :/

Thanks for checking the patch out, maybe I got too focused on just
getting clang to work. You're right, I'll try using the displacement
encoding.

I was attempting a few different encodings because clang was fussy about
putting data where I wanted it. The one in the patch worked fine and I
thought it'd be consistent with the form that UBSan uses. But yeah, I'll
work on it more.

I'll also go and rebase my series onto your WARN() hackery one since
there are a lot of changes to traps.c.


