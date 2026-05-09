Return-Path: <linux-kbuild+bounces-13091-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPMCOshG/2mo4AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13091-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 16:38:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A8650018D
	for <lists+linux-kbuild@lfdr.de>; Sat, 09 May 2026 16:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 77F213003D1A
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 May 2026 14:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D6439479F;
	Sat,  9 May 2026 14:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="rjOcTWc3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E782836606E;
	Sat,  9 May 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778337478; cv=none; b=FsWgSZUYUQk+mTwCR2VOiXgVYgYbxbnicAgoEzd0TxkRnjWBaJeb3ZHDlkzWOm3jKZ/wrMRhRZXEmEQM+/piU0QJIwjTx7UBR8d3PTMtmry3Wp69kPgTPHqBuuwQMzM/fXeg3lvrWbM5Atd958TXpEZ7KoOonU8UUJT7Cx/ZYJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778337478; c=relaxed/simple;
	bh=2QICU0Vzku11V94F5gcvrHsTRXDEyj//j013W3IZTlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBkoGu6mtbbOcEoVV/wVwHjMDcYI1LuSddff/jUHVH8k4dTSY/7V88+fxOqeMNY5ndWE1WgXwgBn00wZrLWmaVnksvgZrW/AIJUgfOwSFWeuk3rFPIrrX2jqHJYPFAnTJk25PD44Kjgf4hpfVomrHK/KZLRQs+QgZ4Ojip7E0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=rjOcTWc3; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=PAgEcNvxGyyw50041uYA09OO6BOYSpnqy6MLsyuMNMY=; b=rjOcTWc30RS3
	ZtW6KCoO1ci1o1dBsGpFa8xC5yFw2Zsj1/OLZstv0PWyh4zdthsvK3Ve506ePo7fDzYl1rsrV8HTi
	wHcj+TPUlrZH7PqytN9lVwS/UNrLf+uqCYT+x4iEYMTNraHILYR1+h+Z+k6WodowJi8KlPKkcHtb3
	k11emtL9ThPquM9s/0Nq0tG7iW3FGuJUcCm+5y/KbanxO/JP71YefIpsQblXJN2R2TZ3S+5BQHuHv
	Hmo8NB7v5IOb0GSJ315sGvqAr5Kcq7MHn+q1mE17VXIk6WkIDfWpQnJHNDPN+hOXCvkadTw1DilZ9
	5kvWRY2Yfr4uwrEGyQx+kQ==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1wLiWJ-00DXIv-1A;
	Sat, 09 May 2026 16:22:12 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Peter Oberparleiter <oberpar@linux.ibm.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Konstantin Khorenko <khorenko@virtuozzo.com>
Subject: [PATCH v3 0/1] gcov: use -fprofile-update=prefer-atomic with compile-time guard
Date: Sat,  9 May 2026 16:22:15 +0200
Message-ID: <20260509142216.382205-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 87A8650018D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=relay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13091-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[virtuozzo.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,virtuozzo.com:mid,virtuozzo.com:dkim]
X-Rspamd-Action: no action

This is v3 of the patch to add -fprofile-update=prefer-atomic to
CFLAGS_GCOV.

v2 was reported to cause link failures on some architecture/config
combinations because GCC emits calls to libatomic runtime functions
for 64-bit atomic counter increments, and the kernel does not link
against libatomic:

  https://lore.kernel.org/all/ff2a4c49-463d-4d8a-9519-bb51308f7ba1@linux.ibm.com/

Arnd Bergmann hit this with GCC-16 randconfig builds:

  x86_64:  undefined reference to `__atomic_fetch_add_8'
  aarch64: undefined reference to `__aarch64_ldadd8_relax'

The kernel test robot confirmed the same on i386-allmodconfig with
GCC 14 (Debian):

  https://lore.kernel.org/all/202605030611.mBKmkPOF-lkp@intel.com/

v3 adds a compile-time try-run check that determines whether
-fprofile-update=prefer-atomic is safe to use with the current
compiler and architecture.

=== Approach ===

The check compiles a minimal test program twice using the full
KBUILD_CFLAGS -- once without and once with -fprofile-update=prefer-atomic
-- then compares the undefined symbols in both resulting .o files using
nm.  If prefer-atomic introduces any NEW undefined symbols, the flag is
not added.

Several alternative approaches were considered and rejected:

1) Grepping assembly output for known libatomic symbols
   (__atomic_fetch_add, __aarch64_ldadd, etc):
   Fragile -- requires maintaining a list of arch-specific symbol names.
   New architectures or GCC versions may use different names.

2) Checking nm output for any undefined symbol beyond __gcov_*:
   Fails because KBUILD_CFLAGS adds kernel-specific instrumentation
   (__fentry__, __x86_return_thunk, etc) that creates "expected"
   undefined symbols unrelated to libatomic.

3) Grepping only for "__atomic" in undefined symbols:
   Misses aarch64 outline-atomics symbols (__aarch64_ldadd8_relax)
   which do not contain "atomic" in their name.

4) Filtering KBUILD_CFLAGS to pass only -m32/-m64/-march=* to try-run:
   Brittle whitelist -- misses flags like -mno-outline-atomics on arm64
   and will break when new relevant flags are added.

The chosen diff-based approach is fully architecture-agnostic: it uses
the real KBUILD_CFLAGS, does not depend on knowing libatomic symbol
names, and will not break when new flags or architectures are added.
The only assumption is that -fprofile-update=prefer-atomic should not
introduce any new linker dependencies.

Also, the CFLAGS_GCOV block is moved after the final KBUILD_CFLAGS
assignments so the try-run test sees the complete set of compiler flags.

=== Testing ===

Verified on:
  - x86_64, GCC 17.0.0 (trunk 2026-05-09): flag IS added, inline
    lock addq for GCOV counters
  - arm64 cross-compile, GCC 14.1.1 (aarch64-linux-gnu-gcc):
    flag is NOT added (__aarch64_ldadd8_relax detected)

arm64 example showing the try-run detection in action:

  $ echo 'long long x; void f(void){x++;}' | \
    aarch64-linux-gnu-gcc [KBUILD_CFLAGS] -fprofile-arcs \
    -ftest-coverage -c -o base.o
  $ nm base.o | grep ' U '
                   U __gcov_exit
                   U __gcov_init
                   U __gcov_merge_add

  $ echo 'long long x; void f(void){x++;}' | \
    aarch64-linux-gnu-gcc [KBUILD_CFLAGS] -fprofile-arcs \
    -ftest-coverage -fprofile-update=prefer-atomic -c -o test.o
  $ nm test.o | grep ' U '
                   U __aarch64_ldadd8_relax   <-- new, from libatomic
                   U __gcov_exit
                   U __gcov_init
                   U __gcov_merge_add

  The undefined symbols differ => try-run fails => flag not added.

Changes since v2:
  - Added try-run compile-time check (option 3 from Peter's proposal)
  - Moved CFLAGS_GCOV definition after KBUILD_CFLAGS is finalized
  - Split -fprofile-update=prefer-atomic from -fno-tree-loop-im

Konstantin Khorenko (1):
  gcov: use atomic counter updates to fix concurrent access crashes

 Makefile | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

-- 
2.47.1


