Return-Path: <linux-kbuild+bounces-12606-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCifOkJ8zmnBnwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12606-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 16:25:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD738A775
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 16:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D9733019809
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 14:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D24453E63AC;
	Thu,  2 Apr 2026 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="D8L2ZSre"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE43DFC98;
	Thu,  2 Apr 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139521; cv=none; b=jco8ZyR8YWqUaQKg1pVS+5XP6GiIYOX1zpsiVXuRi61NqgU7tY7x3DLAtHtkI05krqrj8AGKYSbK+GFLi6ijSxrb66Nc/ZIrbBECfl62gYn9beyxU5sHgi7Q98P8k7WIHTBlUIjIhiljddxn07THGgI+WKFNn3I3+aqUgeuU2dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139521; c=relaxed/simple;
	bh=Wp2l/n6aHC0C2hq33VTOIm1dcPX9dMjd74WYKwe4UOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RPq9xxNfPsfuS1WkGu93+zDW42GZkeVL+7WqstHouQrFY/p2MaJ3Rle1iq8B8de/vJvEXtjqXVUxdQN2J2/0sssCTaYarc4OyqG5bZRcXRR4D57G3XdTQlLvN9MLK73p4VMd4nRBnlhZF7JeVJ9F2rlXv5n0INMOcSyQxyvHwnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=D8L2ZSre; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=CeN4IE2Ay1ANQOOnv/D9/UAM/er4E0OS9J+0/wHapto=; b=D8L2ZSreXVv4
	vTZckTWt4t2DaxC6jFcIYGoyEGdhvWGCXJoQth3vZ3ZE7CuXYBSNvdvNrnCeXkVOFMMrgOGqx+lEe
	wclLFftjTmAFJtP4JRDtROI7O3mNWIUhL3LDeziJFeXfqB5Ao7kuqliYYyG+cmMxxctiF5KtGGYIz
	OQM4h0090eWBQsY0AthhmuZRsi1gDDkU/JSdT40+lQHKvaDvU1xvjNwn8NXQVcwxBeu3GGuI5BWuM
	CxtsclR/wPe8SddIhmb7nzdgmMOPvjQGhiCQDaBejguXCY+IrpxAf0p0IuQUHiWbzP6P8y69SRz8M
	OTtQOlJjWUFLR/bBfts/OA==;
Received: from [130.117.225.5] (helo=finist-alma9.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1w8IqH-003geR-2P;
	Thu, 02 Apr 2026 16:18:30 +0200
From: Konstantin Khorenko <khorenko@virtuozzo.com>
To: Peter Oberparleiter <oberpar@linux.ibm.com>,
	Mikhail Zaslonko <zaslonko@linux.ibm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Konstantin Khorenko <khorenko@virtuozzo.com>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 0/1] gcov: add -fprofile-update=atomic to fix concurrent access crashes
Date: Thu,  2 Apr 2026 17:18:30 +0300
Message-ID: <20260402141831.1437357-1-khorenko@virtuozzo.com>
X-Mailer: git-send-email 2.43.5
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=relay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12606-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[virtuozzo.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[virtuozzo.com:dkim,virtuozzo.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EFD738A775
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds -fprofile-update=atomic to global CFLAGS_GCOV in the
top-level Makefile to fix crashes caused by GCC merging GCOV counters
with loop induction variables in concurrent code paths.

History
-------

This was originally posted as a zlib-only fix:
  https://lore.kernel.org/lkml/20260330143256.306326-1-khorenko@virtuozzo.com/T/#t

During review, it was suggested to apply the flag globally instead of
per-subsystem, as it not only fixes the observed crash but makes GCOV
coverage data more consistent overall.  A combined series was posted:
  https://lore.kernel.org/lkml/20260401142020.1434243-1-khorenko@virtuozzo.com/T/#t

That combined series is now split per subsystem as requested by
reviewers.

The GCC bug report for the underlying compiler issue:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=124749

Dependencies
------------

This patch requires the following preparatory fixes to be applied first,
otherwise CONFIG_GCOV_PROFILE_ALL=y builds will fail:

 - net: fix skb_ext BUILD_BUG_ON failures with GCOV (sent to netdev):
   __no_profile on skb_ext_total_length() and skb_extensions_init()
   https://lore.kernel.org/lkml/20260402140558.1437002-1-khorenko@virtuozzo.com/T/#t

 - iommu/generic_pt: disable GCOV for iommu_amdv1.o (sent to iommu):
   GCOV_PROFILE_iommu_amdv1.o := n
   https://lore.kernel.org/lkml/20260402141012.1437095-1-khorenko@virtuozzo.com/T/#t

Without those patches, -fprofile-update=atomic prevents GCC from
constant-folding expressions inside profiled inline functions, breaking
BUILD_BUG_ON / FIELD_PREP compile-time checks.

The crash
---------

Observed during LTP IPComp stress testing on a GCOV-enabled kernel:

  BUG: unable to handle page fault for address: ffffd0a3c0902ffa
  RIP: inflate_fast+1431
  Call Trace:
   zlib_inflate
   __deflate_decompress
   crypto_comp_decompress
   ipcomp_decompress [xfrm_ipcomp]
   ipcomp_input [xfrm_ipcomp]
   xfrm_input

GCC merged a global GCOV counter with the loop induction variable.
Another CPU modified the counter between loads, causing a write 3.4 MB
past a 65 KB buffer.  -fprofile-update=atomic forces atomic counter
updates and prevents this merging.

Testing
-------

Build-tested with CONFIG_GCOV_PROFILE_ALL=y using GCC 11.4.1 and
GCC 16.0.1 20260327 (experimental). Both fail without the full set
of patches, both succeed with all three series applied.

Assembly-verified that -fprofile-update=atomic prevents counter-IV
merging in inflate_fast() on both compiler versions.

Also tested by Peter Oberparleiter:

Quote: "Successfully tested this series on s390 (except for patch 3 which
depends on x86) using GCC 15.2.0, GCC 10.1.0, and current Clang from git
(20260401)."

Konstantin Khorenko (1):
  gcov: use atomic counter updates to fix concurrent access crashes

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.5

