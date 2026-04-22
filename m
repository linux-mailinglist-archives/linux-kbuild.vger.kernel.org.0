Return-Path: <linux-kbuild+bounces-12852-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDhqGzPJ6GklQQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12852-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 15:12:19 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F84468BC
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 15:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B84D0306DEA7
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 13:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF53A3EAC61;
	Wed, 22 Apr 2026 13:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="kZszklg/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87213E9F93;
	Wed, 22 Apr 2026 13:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863242; cv=none; b=LfQygPq3h3XnThR/KdfS0bd1cF/ZbYz58MWzHntTWMUHG6OeWI+x4sV1Q4Rw/BNbnDFbzAADCYbagtmgDL9BQTu98Oxn9xNjE0HTgAow+d0KQNShYItkURzE0WrL2wADB98Vu4zZHNnM67CkS65T/Dris+pYMpD48pk9QEegCIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863242; c=relaxed/simple;
	bh=/Z8LSG0HFpfexJuBdVnuvmnAlcJTQ74i5kzEek3kQW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IGQvGhxoJ/iusHAL94kzs7aRxcoBEmhIwl6Wv/x4eE0urOUEpJrVrnsMMwT+aIBi9fIfZPwStlI0o1bL6dwq76UOTTkjoqRTz0rrHmnajNYKbcJPm5fs5cNvFmbrgAKyYNEeM9n8rtD7W8x4+Pl35eQwaCJkZlJ8jUWh1wqzYrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=kZszklg/; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=mO6gEj5gP5uWX1qVD+4zDL3jj6QWAq33DiIsMQzCVG4=; b=kZszklg/LyCY
	VxS2k0g645CuMxTYNv+Y2RFRS6FZ75qVGmM41D3VWJNkyRmGy9fNY+NQ2IJtOL3sL3tyLiLQBMdAB
	E46quvX5cW9jXADZjdGHjojQATbqYo7S5cefFiY1in5T6PdqOIRTZQdtWbFoZT21CWN8VcIkccDft
	VTGxvm1OwJjrxnhJaox6N/LhCP494uo2loSc6qW4W6xCB6qc6js91AZRPd1eK+XvsOaotjiFxhAlV
	HzT8Qxi8SXpLEsBpGoYVeWU5K+yTdTn+8PJ0GI8OXFzJjoPpckxHmrb5e2uqraw8r4Ui0IrsPb6X/
	bRvFkFxf7E0nAM6qMq3LLw==;
Received: from [130.117.225.5] (helo=finist-alma9.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1wFX0G-00Efps-2U;
	Wed, 22 Apr 2026 14:51:12 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: Peter Oberparleiter <oberpar@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konstantin Khorenko <khorenko@virtuozzo.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
Subject: [PATCH v2] gcov: use atomic counter updates to fix concurrent access crashes
Date: Wed, 22 Apr 2026 15:51:12 +0300
Message-ID: <20260422125112.3583649-2-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260422125112.3583649-1-khorenko@virtuozzo.com>
References: <20260422125112.3583649-1-khorenko@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[virtuozzo.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=relay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-12852-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[virtuozzo.com:+];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,virtuozzo.com:email,virtuozzo.com:dkim,virtuozzo.com:mid]
X-Rspamd-Queue-Id: E00F84468BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
the top-level Makefile. On architectures where the target supports
atomic profile updates (x86_64, arm64, ...) GCC emits atomic
instructions (e.g. lock addq) for GCOV counter updates instead of plain
load/store, which prevents the compiler from merging counters with loop
induction variables and fixes the observed concurrent-access crash.

On architectures that do not support atomic profile updates (m68k and
other small/UP targets) GCC silently falls back to the non-atomic
'single' mode, so behaviour there is no worse than before this patch.

Applying this globally rather than per-subsystem not only addresses the
observed crash in zlib but makes GCOV coverage data more consistent
overall, preventing similar issues in any kernel code path that may
execute concurrently.

Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>
Tested-by: Peter Oberparleiter <oberpar@linux.ibm.com>
Reviewed-by: Peter Oberparleiter <oberpar@linux.ibm.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 54e1ae602000..402c640120ac 100644
--- a/Makefile
+++ b/Makefile
@@ -824,7 +824,7 @@ all: vmlinux
 
 CFLAGS_GCOV	:= -fprofile-arcs -ftest-coverage
 ifdef CONFIG_CC_IS_GCC
-CFLAGS_GCOV	+= -fno-tree-loop-im
+CFLAGS_GCOV	+= -fno-tree-loop-im -fprofile-update=prefer-atomic
 endif
 export CFLAGS_GCOV
 
-- 
2.43.5


