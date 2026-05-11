Return-Path: <linux-kbuild+bounces-13112-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBYSNl+1AWr2igEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13112-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 12:54:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E4250C4AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 12:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D671E300BC80
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2026 10:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CDE3DBD55;
	Mon, 11 May 2026 10:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="Lb7BDddF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B63D88E0;
	Mon, 11 May 2026 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496671; cv=none; b=VIj/S/xvTI1VAQWUCxXGs/p6jEMFFYkIgLeXuUuxS1+RTCTYjEWyPu2XMEoKbEBaYCuKTNqUgkUGhzNHfAIZms+L0pVXwRPfMxlyOKvGW67NLiyZty58MJPTWKljIPVqnQaF771BHDSjOR4tUzBR2o9O6Pigt8s9nFXOeS2kY58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496671; c=relaxed/simple;
	bh=Wt7y2dW/g5KdNolC3qnfjl+soYn6d9Rg4n0JAES7mpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EM1M9iYn48+QJhhgFSSYKQc+MW5JPSgSUHogKJy4VzkKqFK0XfoTa8JfoEe3p9+PDM0H5o3kn5YJFxNh2jJ40EMYqLZOxmGaYz/hrNtskJNa4GFP3zF8rii7g8qvAovvYaYMxQU7lTmnsOR97ukLIm+3ttwRCiCix8LdMGNh00U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=Lb7BDddF; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=xL/oEvXC0c+N5AUSKwvWC9m837UWJ1GI9J3c0nEpIQs=; b=Lb7BDddFQgjH
	H95v3Ao/2EY6e6q/l3Zjhe4/WWIItOutAIRmvmfxiq9WuFiQHhsa8XIzkegp1Bq8lpfp9gDuCQPaz
	esnVfbqDt2nym5bOiEIwr2tFUeNNIedqSO4TxuYmnHkh36fMvoshJVlvQcFvn2YxHk4rwmUWsy+s7
	FteBgKybbXC2Mi22IiLn5+GmdrvTgNIBino82JGJqctFsO/VovwAqmBO/Q1/4HY3qa2bGV+ItBt18
	jQae8LRyaMS++cdkU4i9rUmondrc5kcaSbeZv3X4pGaBTol4mbSpVfFCzdhkp45R2pEIR2eejNgo0
	eFE1MIhljF5V5MXkP3X0OA==;
Received: from ch-demo-asa.virtuozzo.com ([130.117.225.8] helo=f0.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1wMOAn-00DbhO-17;
	Mon, 11 May 2026 12:50:46 +0200
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
Subject: [PATCH v4 1/1] gcov: use atomic counter updates to fix concurrent access crashes
Date: Mon, 11 May 2026 12:50:52 +0200
Message-ID: <20260511105052.417187-2-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511105052.417187-1-khorenko@virtuozzo.com>
References: <20260511105052.417187-1-khorenko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E0E4250C4AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=relay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13112-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,virtuozzo.com:email,virtuozzo.com:mid,virtuozzo.com:dkim]
X-Rspamd-Action: no action

GCC's GCOV instrumentation can merge global branch counters with loop
induction variables as an optimization.  In inflate_fast(), the inner
copy loops get transformed so that the GCOV counter value is loaded
multiple times to compute the loop base address, start index, and end
bound.  Since GCOV counters are global (not per-CPU), concurrent
execution on different CPUs causes the counter to change between loads,
producing inconsistent values and out-of-bounds memory writes.

The crash manifests during IPComp (IP Payload Compression) processing
when inflate_fast() runs concurrently on multiple CPUs:

  BUG: unable to handle page fault for address: ffffd0a3c0902ffa
  RIP: inflate_fast+1431
  Call Trace:
   zlib_inflate
   __deflate_decompress
   crypto_comp_decompress
   ipcomp_decompress [xfrm_ipcomp]
   ipcomp_input [xfrm_ipcomp]
   xfrm_input

At the crash point, the compiler generated three loads from the same
global GCOV counter (__gcov0.inflate_fast+216) to compute base, start,
and end for an indexed loop.  Another CPU modified the counter between
loads, making the values inconsistent - the write went 3.4 MB past a
65 KB buffer.

Add -fprofile-update=prefer-atomic to CFLAGS_GCOV at the global level in
the top-level Makefile, guarded by a try-run compile test.  The test
compiles a minimal program with and without -fprofile-update=prefer-atomic
using the full KBUILD_CFLAGS, then compares undefined symbols in the
resulting object files.  If prefer-atomic introduces new undefined
references (such as __atomic_fetch_add_8 on i386 or
__aarch64_ldadd8_relax on arm64 with outline-atomics), the flag is not
added -- the kernel does not link against libatomic.

On architectures where GCC inlines 64-bit atomic counter updates
(x86_64, s390, ...) the test passes and the flag is enabled, preventing
the compiler from merging counters with loop induction variables and
fixing the observed concurrent-access crash.

On architectures where the flag would introduce libatomic dependencies,
it is silently omitted and behaviour is no worse than before this patch.

Move the CFLAGS_GCOV block from its original position (before the arch
Makefile include) to after the core KBUILD_CFLAGS assignments but before
the scripts/Makefile.gcc-plugins include.
This placement ensures the try-run test sees arch-specific flags
(-m32, -march=, -mno-outline-atomics) while avoiding GCC plugin flags
(-fplugin=) that would break the test on clean builds when plugin shared
objects do not yet exist.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
---
 Makefile | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 9f88dcaae382..2b352ad22d06 100644
--- a/Makefile
+++ b/Makefile
@@ -824,12 +824,6 @@ endif # KBUILD_EXTMOD
 # Defaults to vmlinux, but the arch makefile usually adds further targets
 all: vmlinux
 
-CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
-ifdef CONFIG_CC_IS_GCC
-CFLAGS_GCOV	+= -fno-tree-loop-im
-endif
-export CFLAGS_GCOV
-
 # The arch Makefiles can override CC_FLAGS_FTRACE. We may also append it later.
 ifdef CONFIG_FUNCTION_TRACER
   CC_FLAGS_FTRACE := -pg
@@ -1147,6 +1141,27 @@ endif
 # Ensure compilers do not transform certain loops into calls to wcslen()
 KBUILD_CFLAGS += -fno-builtin-wcslen
 
+CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
+ifdef CONFIG_CC_IS_GCC
+CFLAGS_GCOV	+= -fno-tree-loop-im
+# Use atomic counter updates to avoid concurrent-access crashes in GCOV.
+# Only enable if -fprofile-update=prefer-atomic does not introduce new
+# undefined symbols (e.g. libatomic calls that the kernel cannot link).
+CFLAGS_GCOV	+= $(call try-run,\
+	echo 'long long x; void f(void){x++;}' | \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w -fprofile-arcs \
+	-ftest-coverage -x c - -c -o "$$TMP.base" && \
+	echo 'long long x; void f(void){x++;}' | \
+	$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) -w -fprofile-arcs \
+	-ftest-coverage -fprofile-update=prefer-atomic \
+	-x c - -c -o "$$TMP" && \
+	$(NM) "$$TMP.base" | grep ' U ' > "$$TMP.ubase" || true ; \
+	$(NM) "$$TMP" | grep ' U ' > "$$TMP.utest" || true ; \
+	cmp -s "$$TMP.ubase" "$$TMP.utest",\
+	-fprofile-update=prefer-atomic)
+endif
+export CFLAGS_GCOV
+
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
 KBUILD_CPPFLAGS += -fmacro-prefix-map=$(srcroot)/=

base-commit: 70390501d1944d4e5b8f7352be180fceb3a44132
-- 
2.47.1


