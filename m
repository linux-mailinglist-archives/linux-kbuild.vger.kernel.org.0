Return-Path: <linux-kbuild+bounces-13111-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEpIBl21AWr2igEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13111-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 12:54:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EAF50C4A0
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 12:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76A69301910D
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120E3DBD4E;
	Mon, 11 May 2026 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="SWeh5ofR"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA0E3BB9F8;
	Mon, 11 May 2026 10:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496669; cv=none; b=KmI40QoxHzMIQxadBKMZ/+vXEydvMiL68pIcaEnsHenHDiQQZx15JonUDms3EhoXvq9Gr0dweCIMJxt0XDKY9QKnL32+1rzc/nB5ddwmsNRW7SrJyALHDSX1fnmGqGwm8giPu7QsA1wch+WI2rJ+6x/2rAhA1tV02hMOq2ir7VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496669; c=relaxed/simple;
	bh=+OrIHSkAROcf4j8foZdjfxJsguHRn1mDKTMEBG/QytQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IXHXRB4wMo8uEwRYMcCo120Xc2cW75750+UO1hzSrKdVgHKpD1JrcX4/mqz/vmJyWIMRrWtl86VRvAJvjbDPOiH8+3GqdBY8nKsKu4xITiX+E4JvLU+X9btRNDGsYSPEFHLqpGNSZ7XoJkTkWIoSozhDjUh1Rw9ftYXduY8N+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=SWeh5ofR; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=GGzi4h2OLA0VIsuiFSwT8ZEuO2tRRqIRu4u/mdrA6f4=; b=SWeh5ofR49XZ
	QndBrakqNuF6iZOqFjvANPA8hQkqssGTWGnioWxJSnsmSquAxb4UoXNi+qWDrQhSXjtqp7YncHjlf
	JoA6N5Xu0ocvIrDpXdE1Px0c0XArVVxbgpypOOc/uz5nIv3C4zQ7mM//VSM3PTkV0ZyWEQamanMwL
	oI+vwnnjUIGoWY9/mvCuZh9VKIfpXVzxA+HQg+ZpoZT6Yayt3G8GlQJ8pn5ReNyvy6QPpGRucZtzX
	CbMVbUHmQUT+Y2/mUpBsA0zQEfguVRcKt8GWy18OnPypmFZCUNnZ/nShk9m/R1jDMfFJimIWijSRE
	Yt4NA9gtgrc8DcshunR/lg==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1wMOAm-00DbhO-2h;
	Mon, 11 May 2026 12:50:45 +0200
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
Subject: [PATCH v4 0/1] gcov: use -fprofile-update=prefer-atomic with compile-time guard
Date: Mon, 11 May 2026 12:50:51 +0200
Message-ID: <20260511105052.417187-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 80EAF50C4A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=relay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13111-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,sashiko.dev:url,virtuozzo.com:mid,virtuozzo.com:dkim]
X-Rspamd-Action: no action

This is v4 of the patch to add -fprofile-update=prefer-atomic to
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

v3 added a compile-time try-run check that determines whether
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

Changes since v3:
  - Moved CFLAGS_GCOV block higher in the Makefile: after the core
    KBUILD_CFLAGS assignments but before scripts/Makefile.gcc-plugins
    include.  Sashiko review of v3 correctly identified that placing
    the try-run after the GCC plugins include would break on clean
    builds when plugin .so files do not yet exist:
    https://sashiko.dev/#/patchset/20260509142216.382205-2-khorenko%40virtuozzo.com

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


