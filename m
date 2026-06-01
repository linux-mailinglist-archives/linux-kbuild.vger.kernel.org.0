Return-Path: <linux-kbuild+bounces-13460-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB33KtQFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13460-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:21:08 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D45625E4A
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 082A5300E718
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162FD370AD7;
	Mon,  1 Jun 2026 22:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="swHQSmdp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37DD263C8F
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352358; cv=none; b=Ke63z29kHijcTKmHAHlH1Qs3uKV2UroedlXpuRD5tbZvQQkuJRKKTzieyW2ICZOTpYbAWYA6TsCwlRmxZUEDSfb5NrPt6TUPch5/Y7t7viIPmNzZcBWFWFMMj+GaULNAB0FN0+L0AxXK9Iv9Zs4ihEML1KsGFIHc05a/lTzyOaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352358; c=relaxed/simple;
	bh=fdAaXmr1cWg84b0wBQ8jqn/wzbTsxUaBTNoLVSNnX88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MG8ZdTTin2DDz4kchns7Auvr7ZWWkMYrsZVd6z34caH4nA4BaKTIFxPKHpVyy8ZpU+QWnm0yQe7k7dtwSpqp+y0OjbkyIis2wnWfHNBl1OWgD+9Rv68LTZ4Wg3EvxfYxZPSVxnx76qhX5yh1U6lRwF9cp6ovYtoUyQyN9EbQs/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=swHQSmdp; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qZt7AzOdQKxnXzeb5++Qplk5WRhbTV2gZxVVAInflKk=;
	b=swHQSmdpPRVl95tS2sD2Iv9P/aGeoHZ+9B3lzpPcPb6J2lPEHCmmhWr1NfEBkGEMhccAdS
	A6pUDBGGeHi/CnzZlyW0hLtDZOjCSP8adRkNcFX4yqsz/BVrpfHvKQbLrKuutNPBBKbk3I
	PHbo86AgG+NtIpjHv+5OewGxfVZPZwc=
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alan Maguire <alan.maguire@oracle.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH bpf-next v1 10/14] selftests/bpf: Verify bpf_fastcall decl tags in resolve_btfids test
Date: Mon,  1 Jun 2026 15:18:01 -0700
Message-ID: <20260601221805.821394-11-ihor.solodrai@linux.dev>
In-Reply-To: <20260601221805.821394-1-ihor.solodrai@linux.dev>
References: <20260601221805.821394-1-ihor.solodrai@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13460-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,iogearbox.net,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ihor.solodrai@linux.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linux.dev:mid,linux.dev:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 05D45625E4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend test_resolve_btfids() to assert that resolve_btfids emits a
BTF_KIND_DECL_TAG of name "bpf_fastcall" for each kfunc marked with
KF_FASTCALL flag.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 tools/testing/selftests/bpf/prog_tests/resolve_btfids.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
index 7d9c3460cbed..eeda4e3b6a7f 100644
--- a/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
+++ b/tools/testing/selftests/bpf/prog_tests/resolve_btfids.c
@@ -246,6 +246,13 @@ void test_resolve_btfids(void)
 					     kfunc_symbols[i].id),
 			    kfunc_symbols[i].name);
 
+	/* Check resolve_btfids emitted bpf_fastcall decl_tag for fastcall kfuncs */
+	for (i = 0; i < ARRAY_SIZE(kfunc_symbols); i++)
+		if (kfunc_symbols[i].flags & KF_FASTCALL)
+			ASSERT_TRUE(btf_has_decl_tag(btf, "bpf_fastcall",
+						     kfunc_symbols[i].id),
+				    kfunc_symbols[i].name);
+
 out:
 	btf__free(btf);
 }
-- 
2.54.0


