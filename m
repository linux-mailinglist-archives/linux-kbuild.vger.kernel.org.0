Return-Path: <linux-kbuild+bounces-13289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CH8qFwteDWpuwgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13289-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 09:08:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FEA588AFC
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 09:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CBA9B3049169
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 May 2026 07:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AAF0376A19;
	Wed, 20 May 2026 07:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="MJ/RNlRv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EB727B32C;
	Wed, 20 May 2026 07:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260908; cv=none; b=kLUWiMA3wUSEWGPyL4xfOEbwQvJGExyGGT/K9ugOtuIy9Gl8WNc7jXQ1mq7LvJvHDe6nj4xYtEsIb4ovc5KLJF5m0hwWJLFp3J+mdDudoz3MfzTbRVXkBhW3cTRgpLAqBwVhfztpSGm8V+JguIRrmIOIAqGp8NAgipODouhsR4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260908; c=relaxed/simple;
	bh=30YNb+ICmtkuCOdWfYEtcH14wRki+VRiQTnAwHUipvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OrhvSMy5Z2f6vykMsTlPIlVUjBRZHPfCEj7FkSaaKQ3sjhQKNYzTUPbubAsxCauPmaJkKmlEWuZS20IqLuwJk07aodImxzEVNhi2tng8cZFwXrmYWstzCgPzhPJ+DgN9SWTUmo56r6ikhPKRLOsMD7SevAkUSeOVDdWc/DSPy/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=MJ/RNlRv; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=UR
	VLCX6cOHGNU5Im5A9NJgG8x3QeuTqqcS9Om5knmwM=; b=MJ/RNlRvOnUZ+v/XZu
	GFKsGP4v8ZL2SUiTU1vVxOodnXGBj5DHkl7maKqmgCcsB/kL5sJ5dsluaQQGaQc9
	7YwcecyrSrCBNHzeMZ+1X0uW0bQKNoPTU1EcbRG9Mus9UFtU71bkZZoxEI/sNcLJ
	elEyr2+MFlCmvsLEscYc6qv3E=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDHoNLSXQ1qVsZtCQ--.5594S2;
	Wed, 20 May 2026 15:08:04 +0800 (CST)
From: Zhou Yuhang <zhouyuhang1010@163.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhou Yuhang <zhouyuhang@kylinos.cn>
Subject: [PATCH] kconfig: Fix repeated include selftest expectation
Date: Wed, 20 May 2026 15:08:00 +0800
Message-Id: <20260520070800.2265479-1-zhouyuhang1010@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDHoNLSXQ1qVsZtCQ--.5594S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar1rZrWktFyUWFWrXry7KFg_yoW8XFyrpr
	1kJ3WDGrWUJFyfAFWjk34SkayDuws7Gry5Gr1xCw1xCF90kw1jyrs7Kr1rWrWUXFZ8Z3WD
	ZryrWa1Yvry7AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jnhL8UUUUU=
X-CM-SenderInfo: 52kr35xxkd0warqriqqrwthudrp/xtbCzhRqkGoNXdRKegAA3+
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13289-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[zhouyuhang1010@163.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,kylinos.cn:email]
X-Rspamd-Queue-Id: C1FEA588AFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhou Yuhang <zhouyuhang@kylinos.cn>

The err_repeated_inc test was added with an expected stderr fixture
that does not match the diagnostic printed by kconfig.

Running "make testconfig" currently fails in that test even though the
parser reports the duplicated include correctly:

  [stderr]
  Kconfig.inc1:4: error: repeated inclusion of Kconfig.inc3
  Kconfig.inc2:3: note: location of first inclusion of Kconfig.inc3

The fixture expects "Repeated" and "Location" with capital letters, but
the diagnostic emitted by scripts/kconfig/util.c uses lowercase words.
Update the fixture to match the real message.

Fixes: 102d712ded3e ("kconfig: Error out on duplicated kconfig inclusion")
Signed-off-by: Zhou Yuhang <zhouyuhang@kylinos.cn>
---
 scripts/kconfig/tests/err_repeated_inc/expected_stderr | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/tests/err_repeated_inc/expected_stderr b/scripts/kconfig/tests/err_repeated_inc/expected_stderr
index 95d90d6a93c5..53071430ea7d 100644
--- a/scripts/kconfig/tests/err_repeated_inc/expected_stderr
+++ b/scripts/kconfig/tests/err_repeated_inc/expected_stderr
@@ -1,2 +1,2 @@
-Kconfig.inc1:4: error: Repeated inclusion of Kconfig.inc3
-Kconfig.inc2:3: note: Location of first inclusion of Kconfig.inc3
+Kconfig.inc1:4: error: repeated inclusion of Kconfig.inc3
+Kconfig.inc2:3: note: location of first inclusion of Kconfig.inc3
-- 
2.43.0


