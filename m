Return-Path: <linux-kbuild+bounces-12381-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cB+ZCXqXy2mYJQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12381-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 11:44:26 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AE3367430
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 11:44:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F4C23022F61
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 09:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE64B3ED5DE;
	Tue, 31 Mar 2026 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fkr+NC5F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C23A1EEA54
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950260; cv=none; b=bi0ym/Il6F2ZZE8S6krZQXx2CNlm9z0Smj7NOjBofltwYfS4W4OThWKYY4xsrE4+RpGH3W+KWXdSePpz6X02pSznnJWBYFz1pT4pz26CqqJG4M66qp9VOdY8awagVO9HBuA/rUnv1DZu96YdccHVuhtKwGiE2KNIJRrynYKoCwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950260; c=relaxed/simple;
	bh=Y5HYmfo2hrjkYl2etfmR6FyOxfYHNvPpo+PR8dGDbSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fKuJ1SqtZbV02g7E2CviYjcDqhtwx8YOS6AFT+212SZrC9FALlu1HhnwpUZtDCj7Z3txmQVJNI/02wnzKUwmD8LtJ5mqMbiWV3hs+uedihSd53L2JJ1qG0fb7Qk9UMEh16SrJ66OCbHl3HYbLn8u0NLMFaYQGdD/Bek2AfXA8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fkr+NC5F; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774950258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HApNsJMnQkGjRCw1G9QlTLRX0WXwGT8mBK0arH4RiRo=;
	b=fkr+NC5FQnF9nmEGQ/75NEN3SxpWe/z6Ac1/dr1N1PMx2bdsJIXTMKpJuh0XPjUY4oNwkZ
	U4+aYpEEqEOa6ql3NR0p1CqYfxWcmXn4u6C0K2mMNiFQYu/Kg7TE5Zf+IXvClF7/luI2CH
	pIKShh8iHMgZhbnb19hTJl1TaLoHd2U=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-9FjosW1CPO2exaI7I-bw2A-1; Tue,
 31 Mar 2026 05:44:15 -0400
X-MC-Unique: 9FjosW1CPO2exaI7I-bw2A-1
X-Mimecast-MFC-AGG-ID: 9FjosW1CPO2exaI7I-bw2A_1774950253
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CBBF195608B;
	Tue, 31 Mar 2026 09:44:13 +0000 (UTC)
Received: from fedora-laptop-x1.redhat.com (unknown [10.72.112.121])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9E08B30001A1;
	Tue, 31 Mar 2026 09:44:06 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Cc: linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v2 0/2] selftests/mm: clean up build output and verbosity
Date: Tue, 31 Mar 2026 17:44:00 +0800
Message-ID: <20260331094402.144131-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12381-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liwang@redhat.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2AE3367430
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, the mm selftests build process can be quite noisy.

First, it leaks raw compiler errors during the liburing feature probe if
the headers are missing, which is confusing since the build system already
handles this gracefully with a clear warning.

Second, the specific 32-bit and 64-bit compilation targets ignore the
standard kbuild verbosity settings, always printing their full compiler
commands even during a default quiet build.

Notes:
  Andrew mentioned he hopes this patch merge into kbuild tree, so I resend
  to linux-kbuild@vger.kernel.org.

V2:

 - Drop 2/4, 3/4 from v1 to v2, since Andrew wasn't able to confirm the
   patch works for the rarely happening issue now, so I decided to just
   hand on the process of the parallel issue.

 - Refine the 4/4 patch only to hide compiler errors when missing liburing.

Li Wang (2):
  selftests/mm: respect build verbosity settings for 32/64-bit targets
  selftests/mm: suppress compiler error in liburing check

 tools/testing/selftests/mm/Makefile        | 9 ++++++---
 tools/testing/selftests/mm/check_config.sh | 2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.53.0


