Return-Path: <linux-kbuild+bounces-9323-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10424C1D29D
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4606F4E1417
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4AD435A929;
	Wed, 29 Oct 2025 20:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="IAf8Yf83"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB03590D5;
	Wed, 29 Oct 2025 20:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768638; cv=none; b=baM503Dq/UhOqEerHbAN9DB3mLDeoMfHyOjmioQTu8nSAQoDbhv5V58Y1YwgrMc0Z20N2hhGTi6UeXQEIi54XyMlMcBv0erLeJS2bWwKLhqQSggim8vrQesc3nqBKfWRioKWnTDAXj23QP2SM9kGMcEKP644K2HjPRvGqzBtYNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768638; c=relaxed/simple;
	bh=S2a1Kw0sC3CsXwE/Uet1J3QooijcrYchVxhPMvMQoO4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUhElqtpZ6dyVUI7ONuzp31WBT6K0464MWQi4Sv8b4QviOXXstRINjl/6cWQLuuVYsbCz86F2u4Qm6eCxiuTDu207MouAtINLtu2QoCiOySe7ilkYc7eV887+aPCufg9Cr67Gfgzfd8adbOJXUYPchnTGxvGlrIvQS2OBfQCvNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=IAf8Yf83; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768631; x=1762027831;
	bh=S2a1Kw0sC3CsXwE/Uet1J3QooijcrYchVxhPMvMQoO4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=IAf8Yf83jJpokLTSbKrc6oZO27DAaw7BQUnE7WCUryg0gLluEitf1I28vmC/H7oml
	 bjw+r/ilmQ+FUR4ZrZ/gaUrnBytCchvTJWpL3VZOkGgYjmYKURcbqbQHdnYxCYWLeN
	 9re+mOvg0PqgLR5FpUhW6rfiKnYi8Ry2ssLz3XCsOgvkpInMaxWEe+dOpc18CRsWgk
	 4N4hCGNQG4AJ6xEXdQIaI+pniq8mMD2ntUxxe+DxtFOWAvmeACobKS5Nqb1DTw+C6x
	 xOus8MYRr0WlJflGSWspRnnlWmjeV4ZsSgXO8DpPRXLVZTHll8Qu+wV7nOCuGbYgBC
	 QQZoRZPiCqMqQ==
Date: Wed, 29 Oct 2025 20:10:26 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 16/18] arm64: Unify software tag-based KASAN inline recovery path
Message-ID: <0a21096d806eafa679798b9844ec33bf8a5499a4.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: ab91b91b5b8eb35edef4ae212700531bcd4f5e1b
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

To avoid having a copy of a long comment explaining the intricacies of
the inline KASAN recovery system and issues for every architecture that
uses the software tag-based mode, a unified kasan_die_unless_recover()
function was added.

Use kasan_die_unless_recover() in the kasan brk handler to cleanup the
long comment, that's kept in the non-arch KASAN code.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
Changelog v6:
- Add Catalin's Acked-by tag.

Changelog v5:
- Split arm64 portion of patch 13/18 into this one. (Peter Zijlstra)

 arch/arm64/kernel/traps.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 681939ef5d16..b1efc11c3b5a 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -1071,22 +1071,7 @@ int kasan_brk_handler(struct pt_regs *regs, unsigned=
 long esr)
=20
 =09kasan_report(addr, size, write, pc);
=20
-=09/*
-=09 * The instrumentation allows to control whether we can proceed after
-=09 * a crash was detected. This is done by passing the -recover flag to
-=09 * the compiler. Disabling recovery allows to generate more compact
-=09 * code.
-=09 *
-=09 * Unfortunately disabling recovery doesn't work for the kernel right
-=09 * now. KASAN reporting is disabled in some contexts (for example when
-=09 * the allocator accesses slab object metadata; this is controlled by
-=09 * current->kasan_depth). All these accesses are detected by the tool,
-=09 * even though the reports for them are not printed.
-=09 *
-=09 * This is something that might be fixed at some point in the future.
-=09 */
-=09if (!recover)
-=09=09die("Oops - KASAN", regs, esr);
+=09kasan_die_unless_recover(recover, "Oops - KASAN", regs, esr, die);
=20
 =09/* If thread survives, skip over the brk instruction and continue: */
 =09arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
--=20
2.51.0



