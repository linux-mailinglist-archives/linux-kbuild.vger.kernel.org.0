Return-Path: <linux-kbuild+bounces-9320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B26C1D25E
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 21:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2139E344D2A
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Oct 2025 20:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92BE3590D5;
	Wed, 29 Oct 2025 20:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="f2ixPvRO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20CE33A036
	for <linux-kbuild@vger.kernel.org>; Wed, 29 Oct 2025 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768538; cv=none; b=YZb5S9Qc9dPnAw38FwTGGJ0NXlTVxvqWZeTjyvUayrpoq7FBXqfk40vI2wpTfG6FA8pkWAhaWPmkLChmC095gfT63+bdlMpY9OXwW24XAszKBfedmSbE1R7KJoMSB+aECqdpu6pJewpyQJw8UwqerShRNKxswSbAp/kGJyOL+aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768538; c=relaxed/simple;
	bh=Ih8wwv/hVIpNDdvgfkJCAuMYW2YA73jRDPxtzkA+aI4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tRUHM/UNNX650BFWVXO/4CsGfQmP97eLrnrp3VX9aWqljZJSZcpM6xzq75bUvrg6yoqbOJXIzYAiGLy+groZBtAyG2SUCXb2AjptXAwZ+mfQ2n7y/E+pkvNYiB2ziw8xPZ9Khl6h/UduSz40bUmEC/Rpe9k7UgujNlKT6x8wedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=f2ixPvRO; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1761768530; x=1762027730;
	bh=+vFEd2i7cGwKfB76083zqMnaJRzsau0IVtzvsF2hHkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=f2ixPvROXBBe3oYcnt46ZpuoD3whpqDkx+uWuzdhIU+YPbduMbbLBUYy3V19N8DdT
	 lJCQaItYc4V04frYC10Qp8vC4v6QealyZOWFQ9x+4qrE9lklIogwUqZ4H130zyymmQ
	 QuU0Jp39WS7X0fe1Z0N55I/Nb2bcW5EMWiLI8MAIscT6weHJpTE4qsZY5FWESEyQBa
	 XhAFbluJjDjJ4OVPWlAMCFRWCe1eIQ5pzDu9nHbw1L5wWjcHpVsCvn8VHSo6rvjAi8
	 DZuZbhfARnsZ1Xh2scxFMiBarfrU81v14JAR7983upQVZyAIOMSBej2abjtKpLwF5M
	 HwEJuccHvAyqQ==
Date: Wed, 29 Oct 2025 20:08:43 +0000
To: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, glider@google.com, mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com,
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, rppt@kernel.org, will@kernel.org, luto@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 13/18] x86/mm: LAM initialization
Message-ID: <96559d5a8e897f97879259bad3117db617e21377.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1761763681.git.m.wieczorretman@pm.me>
References: <cover.1761763681.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 0e1842514ef97eaa33355f60d534577848d5c6b8
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

To make use of KASAN's tag based mode on x86, Linear Address Masking
(LAM) needs to be enabled. To do that the 28th bit in CR4 has to be set.

Set the bit in early memory initialization.

When launching secondary CPUs the LAM bit gets lost. To avoid this add
it in a mask in head_64.S. The bitmask permits some bits of CR4 to pass
from the primary CPU to the secondary CPUs without being cleared.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v6:
- boot_cpu_has() -> cpu_feature_enabled()

 arch/x86/kernel/head_64.S | 3 +++
 arch/x86/mm/init.c        | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/arch/x86/kernel/head_64.S b/arch/x86/kernel/head_64.S
index 21816b48537c..c5a0bfbe280d 100644
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -209,6 +209,9 @@ SYM_INNER_LABEL(common_startup_64, SYM_L_LOCAL)
 =09 *  there will be no global TLB entries after the execution."
 =09 */
 =09movl=09$(X86_CR4_PAE | X86_CR4_LA57), %edx
+#ifdef CONFIG_ADDRESS_MASKING
+=09orl=09$X86_CR4_LAM_SUP, %edx
+#endif
 #ifdef CONFIG_X86_MCE
 =09/*
 =09 * Preserve CR4.MCE if the kernel will enable #MC support.
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index 8bf6ad4b9400..a8442b255481 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -764,6 +764,9 @@ void __init init_mem_mapping(void)
 =09probe_page_size_mask();
 =09setup_pcid();
=20
+=09if (cpu_feature_enabled(X86_FEATURE_LAM) && IS_ENABLED(CONFIG_KASAN_SW_=
TAGS))
+=09=09cr4_set_bits_and_update_boot(X86_CR4_LAM_SUP);
+
 #ifdef CONFIG_X86_64
 =09end =3D max_pfn << PAGE_SHIFT;
 #else
--=20
2.51.0



