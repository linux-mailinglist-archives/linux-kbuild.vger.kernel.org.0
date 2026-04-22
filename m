Return-Path: <linux-kbuild+bounces-12853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFuTEk3J6GklQQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12853-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 15:12:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4BB4468D3
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 15:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A416E30793CA
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Apr 2026 13:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C7173CE4BB;
	Wed, 22 Apr 2026 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="NLFfrkjJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415253E9F88;
	Wed, 22 Apr 2026 13:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863247; cv=none; b=SK9KW2V8iaIoF9nLQrW5LNrrKT0J7hra0WmSXwdBpa+VsSXeLJuv3I2lAK1bKEVSHTVwvOJlS4PWG201PzGO6YP2vXgdSJF5BqPt+ubcPbPrnVX3cCF7AORV/PPOAPugmTIdOQQIgIMpoLlCqrrd5h7blS+YUWeIS4WBjodnTbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863247; c=relaxed/simple;
	bh=evNR7J0pcfb6sn4T3R+aNvJ1eR6Fx606WeIXRBYH3KU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hGxkr3EM47/vrtHq26nhSTFvDCpT2t57FCLXEqx+X3yI6v9+Jl8I0YB9TBleCpGx1Hsx5ANtUE4JfpTieIzg5zdhcqTHQpG+BCHDET0Hcm9qHLMuvCVv5//8kTb2+R8869iETovdD6fUfKpiyNdsmubose1WmGPtz4Ijxi9i0HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=NLFfrkjJ; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=fOE3sgOQyp7VICH7tsJs57Cyi0la9YEcfBDY6IS2sk0=; b=NLFfrkjJwYzv
	KGdyenMrFlE0rRsvDNgq6LJ7+SKt1Eqp2fPAllFxa8qqbNJXZ9Sz8DH9JChMAwHB/lmvbLYBnxzqc
	kijJs5zPoL8xLvvTuGmBJzLXBwZQOuG4XSBCIqOXbc5CKxvMYKR6VQmsVWzdVA16tPD4bh9+ropQs
	/qMMeb9OetGeucQ6z394l3QCg9fhiSel+zpGoEMjkhMrQDtlckmGcY8tmSjSxPr7+Ln/LZ6VW+GaG
	afoPPt3hhsO+9/2bh5TupEoZ3xtJNx7S9ryWT6mbI5WjGAqNkvTDM9UKh1vrstInvJWnsw2XKoIPf
	ECrIDmyjn1mS+E9d5cMo1w==;
Received: from [130.117.225.5] (helo=finist-alma9.vzint.dev)
	by relay.virtuozzo.com with esmtp (Exim 4.96)
	(envelope-from <khorenko@virtuozzo.com>)
	id 1wFX0G-00Efps-2I;
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
Subject: [PATCH v2 0/1] gcov: use -fprofile-update=prefer-atomic to fix concurrent access crashes
Date: Wed, 22 Apr 2026 15:51:11 +0300
Message-ID: <20260422125112.3583649-1-khorenko@virtuozzo.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[virtuozzo.com:s=relay];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-12853-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[khorenko@virtuozzo.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[virtuozzo.com:+];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,virtuozzo.com:dkim,virtuozzo.com:mid]
X-Rspamd-Queue-Id: AD4BB4468D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch adds -fprofile-update=prefer-atomic to global CFLAGS_GCOV in
the top-level Makefile to fix crashes caused by GCC merging GCOV
counters with loop induction variables in concurrent code paths.

Changes in v2
-------------

 - Use -fprofile-update=prefer-atomic instead of -fprofile-update=atomic
   to avoid a "target does not support atomic profile update, single
   mode is selected" warning emitted by GCC for every translation unit
   on architectures that lack atomic profile update support (reported
   by the kernel test robot on m68k-allmodconfig):

     https://lore.kernel.org/all/202604111946.Erd3tguU-lkp@intel.com/

   On architectures that do support atomic profile updates (x86_64,
   arm64, s390, ...) behaviour is unchanged: GCC still emits atomic
   instructions (e.g. lock addq) for GCOV counter updates, which is
   exactly what prevents the counter/induction-variable merging and
   the observed crash.  On architectures that do not support atomic
   profile updates (m68k and other small/UP targets) GCC silently
   falls back to the non-atomic 'single' mode, so behaviour there is
   no worse than before this patch.

 - No functional change on all previously tested architectures (see
   Testing below).

History
-------

v1 (per-subsystem gcov submission):
  https://lore.kernel.org/lkml/20260402141831.1437357-1-khorenko@virtuozzo.com/T/#t

This was originally posted as a zlib-only fix:
  https://lore.kernel.org/lkml/20260330143256.306326-1-khorenko@virtuozzo.com/T/#t

During review, it was suggested to apply the flag globally instead of
per-subsystem, as it not only fixes the observed crash but makes GCOV
coverage data more consistent overall.  A combined series was posted:
  https://lore.kernel.org/lkml/20260401142020.1434243-1-khorenko@virtuozzo.com/T/#t

That combined series was then split per subsystem as requested by
reviewers; this is v2 of the gcov piece.

The GCC bug report for the underlying compiler issue:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=124749

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
past a 65 KB buffer.  -fprofile-update=prefer-atomic forces atomic
counter updates on supported targets and prevents this merging.

Testing
-------

Build-tested with CONFIG_GCOV_PROFILE_ALL=y using GCC 11.4.1 and
GCC 16.0.1 20260327 (experimental).

Assembly-verified that -fprofile-update=prefer-atomic prevents
counter-IV merging in inflate_fast() on both compiler versions (emits
the same atomic lock addq sequence as plain -fprofile-update=atomic on
x86_64).

Also tested by Peter Oberparleiter (on the v1 payload, which differs
only in the 'prefer-' prefix on the GCC flag):

Quote: "Successfully tested this series on s390 (except for patch 3
which depends on x86) using GCC 15.2.0, GCC 10.1.0, and current Clang
from git (20260401)."

Konstantin Khorenko (1):
  gcov: use atomic counter updates to fix concurrent access crashes

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.43.5

