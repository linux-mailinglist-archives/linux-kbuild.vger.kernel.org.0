Return-Path: <linux-kbuild+bounces-13463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDYgBPgFHmpRggkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13463-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:21:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C8625E6E
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 00:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF238302B0B9
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2026 22:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8846036213D;
	Mon,  1 Jun 2026 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R3rfJcd/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D36E37DE9B
	for <linux-kbuild@vger.kernel.org>; Mon,  1 Jun 2026 22:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780352367; cv=none; b=EoJv6RL+3XRcOKHUYNKdfsfhDlvngnNPwTD011kdGx5WsJCt6PzMUSB/4VpVkJ8hxIHZ62BdRrRBusUi0fJJvwTQ4VYmFE8m/ETwgDBUxTb0qKCmB3KcPCQJbBpJkV6BqeBJh3ebUWXaI8N+PYAGr/WnU3YD2wxMGceavJCfJ44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780352367; c=relaxed/simple;
	bh=CiQu1GL1yO+QJbr+TBNJQcXbqSwPCYoT1vMgw8P4WDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WH05uchFUgQ+gMB/GzZ1X0IlyXA6GNeBbXa6VZA2Ffg9LDNRdsDTvFHyRMxjcJJLIRa0Q8YnHsfYO75mjpTvPXRCo5zxYP640XW3NAmQPGxaVjZacUzqwWPBGAOJejxnpUM1QUtE96fwSpKnbkMSZXohWtqwDFzwUHHvauDFe+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R3rfJcd/; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780352364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2pfKYfeflBjT6+UOCS3RH3YoFB7i4Q9J5eNkn2sy+w=;
	b=R3rfJcd/HfaBxbdUHz3r8grUC2ki/Xu5AoevK8aPBy1xXaSucxnvCfxdkbC07bShn1csDK
	Nav+YMqKWLa1Gf1Gpb1bWVSyQzJs9uNYWnxvR7xXfcAnRBJ6pu4G3IJKwvH7VGwIfVlpIu
	aGxr3jblJhV3U07WqGKCFCW06oA3xBo=
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
Subject: [PATCH bpf-next v1 13/14] kbuild: Drop decl_tag_kfuncs and attributes from pahole flags
Date: Mon,  1 Jun 2026 15:18:04 -0700
Message-ID: <20260601221805.821394-14-ihor.solodrai@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13463-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: A19C8625E6E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

resolve_btfids now emits all kfunc-specific BTF annotations for the
kernel: the "bpf_kfunc" and "bpf_fastcall" decl tags and the
address_space(1) type attribute on arena kfunc return/arguments. These
were previously produced by pahole under the "decl_tag_kfuncs" and
"attributes" btf_features.

Drop both from the pahole invocation.

Note that "decl_tag" (generic source __attribute__((btf_decl_tag))
annotations) is a separate feature from "decl_tag_kfuncs" and must be kept.

Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
---
 scripts/Makefile.btf | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
index e66e13e79653..a1812985a61a 100644
--- a/scripts/Makefile.btf
+++ b/scripts/Makefile.btf
@@ -14,9 +14,7 @@ pahole-flags-$(call test-ge, $(pahole-ver), 125)	+= --skip_encoding_btf_inconsis
 else
 
 # Switch to using --btf_features for v1.26 and later.
-pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=encode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consistent_func,decl_tag_kfuncs
-
-pahole-flags-$(call test-ge, $(pahole-ver), 130) += --btf_features=attributes
+pahole-flags-$(call test-ge, $(pahole-ver), 126)  = -j$(JOBS) --btf_features=encode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consistent_func
 
 pahole-flags-$(call test-ge, $(pahole-ver), 131) += --btf_features=layout
 
-- 
2.54.0


