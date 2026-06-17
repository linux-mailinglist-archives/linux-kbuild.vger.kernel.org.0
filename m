Return-Path: <linux-kbuild+bounces-13802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id py7kHH4MM2p98wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13802-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:07:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1069C782
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 23:07:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linux.dev header.s=key1 header.b=gVAULkYD;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13802-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13802-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linux.dev;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C72130226A1
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 21:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EFA31282F;
	Wed, 17 Jun 2026 21:06:38 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B7025A655
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 21:06:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781730398; cv=none; b=kxTHIlMu44sHRPtHrGhtT/HP8Wvi1IsKo6TMD9sTHURWDjmGYSDN4Pl9P9yDLgIcMKC1cC5Fz2J9ccaANroXKQdOVbAXoNk/z11nssHKV/05/q5G3ftVJu3doVHPOINCVz5qOlGM9T4Q4/+J2T0GhMHxMqOLc2/dcagk0NCHpoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781730398; c=relaxed/simple;
	bh=ImCorexCHKs3wwtgqmautq9poNOhtuTIaO10LwNFEEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kTVSWqmEgZCwSYAB2Y+RtVicfZrE2Og38imJTTm+B8nWaXr9164yrGlYa7g2VXG8LEcb2U8vl83hNzcyHk8eeA9tPe+dSoaBcvYHZ/dsCUfBOmOWsijKmccRcQImoyRics3Zs9CAh7/8RKMxeThQp0kwHgeZInj1TL/tHytvhT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gVAULkYD; arc=none smtp.client-ip=95.215.58.186
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781730393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FzKkvAI6IDkJ/GSGce1kn1qarUTe5R9d6P9gmh7cRMo=;
	b=gVAULkYDp0L5VsteP/punwjgrdDl0mYCQvmLDtf+D1IBsKMUAtvmIgf1yGak/LLHEwLunk
	oCE2dzF508nSl8SkNCRzED8Op1s5zu8qWjeA+1to24y2dpj96hP2d0GIuA14GwytcAbWDm
	0C1kvSiPisu2dNXyLX3KroAvOqfLwcs=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1 0/4] Modernize resolve_btfids selftest
Date: Wed, 17 Jun 2026 14:06:15 -0700
Message-ID: <20260617210619.1562858-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13802-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ast@kernel.org,m:andrii@kernel.org,m:daniel@iogearbox.net,m:eddyz87@gmail.com,m:memxor@gmail.com,m:alan.maguire@oracle.com,m:jolsa@kernel.org,m:emil@etsalapatis.com,m:bpf@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux.dev:dkim,linux.dev:mid,linux.dev:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9A1069C782

This series updates resolve_btfids selftests to use latest selftest
helpers API and add kfunc set testing.

This series was split from a bigger series [1].  It's general selftest
improvements that don't have to be entangled with resolve_btfids
development, and makes the main series a bit smaller.

[1] https://lore.kernel.org/bpf/20260601221805.821394-1-ihor.solodrai@linux.dev/

Changes compared to original 4 patches:
  * various nits from Jiri, Andrii and Emil
  * in patch #3 (that adds gcc pragma) definitions are moved such that
    .local BTF_ID_* containers are grouped together and we have a
    single pragma scope

---

Ihor Solodrai (4):
  tools/bpf: Sync btf_ids.h to tools
  selftests/bpf: Modernize resolve_btfids test scaffolding
  selftests/bpf: Fix resolve_btfids test reads of BTF ID sets in PIE
    builds
  selftests/bpf: Add kfunc set test to resolve_btfids

 tools/include/linux/btf_ids.h                 |  78 +++++++++-
 .../selftests/bpf/prog_tests/resolve_btfids.c | 140 ++++++++++++------
 tools/testing/selftests/bpf/progs/btf_data.c  |  10 ++
 3 files changed, 177 insertions(+), 51 deletions(-)

-- 
2.54.0


