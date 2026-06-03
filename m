Return-Path: <linux-kbuild+bounces-13541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xVxNO1lWIGqy1QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13541-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 18:29:13 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F3E639BA2
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Jun 2026 18:29:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=uniontech.com header.s=onoh2408 header.b=K6Emjply;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13541-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13541-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=uniontech.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AEACB302589A
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2026 16:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC413E16BD;
	Wed,  3 Jun 2026 16:18:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C33DC4D0;
	Wed,  3 Jun 2026 16:18:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780503523; cv=none; b=teJt6Kf4IntwEbhg5jVoLJxsHCxUKM+m6arNxISaRX6cCRIDkTZaHgTOS5rfpOgbCEurf4j/bIVUFquLeuMiti4lX4GWxGrXpAAAgSkVBaEkyurYdgCXSAmAC4QnV7h9GgBEDNU4QdNnW7TuZb2p/MqX9NQHzbNc0HgafmgGa7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780503523; c=relaxed/simple;
	bh=vjmr7WEjEaY/WJ8evMokJUo/Wo/Gph5hKQEOlE82gnc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JLyFa8oYatvhAqpdBZ3m7giB7OzshdNuYUDRHEBJYEvLIok/V8qfuZKj2FSfBdoq47+8aczpJRJHwRoD6tZ3DKKmVIPkoDghluI8J36iTSa+bSBENtNOF5KDZmdcgnpQ3gUEenH5n3wouACWBQLYI1KP7Xgt4HYfoSD8US1D3HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=K6Emjply; arc=none smtp.client-ip=18.132.163.193
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780503481;
	bh=zv4U+xdMNavjqRbjaAH1pAOTpd8FgKQX5vBSiYlSIR8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=K6EmjplyDm6iUyKkTFgjB9ZaELLnjpvDT9O7VDCuel0ib5/QjMEF64tk6tvcZRQgA
	 UWlDES/4AWKLbtwHyWQPhtbXv5uKMrysti25pUm89fB9QIqPoZWJt7cBot4/FTZtPJ
	 u8ow96AKm/yl+G2h/bCaXHG9rh7ziJyBOUNl1sxE=
X-QQ-mid: esmtpsz10t1780503457t4bb3a136
X-QQ-Originating-IP: A/3tDgEoMSVP9ZVZD0rG/6jVatyj8XS0NGHwkNX1Pq8=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 04 Jun 2026 00:17:35 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4368549760479085
EX-QQ-RecipientCnt: 7
From: Wentao Guan <guanwentao@uniontech.com>
To: nathan@kernel.org
Cc: nsc@kernel.org,
	tamird@kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	petr.pavlu@suse.com,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH] kbuild: try readelf first in gen_symversions
Date: Thu,  4 Jun 2026 00:17:32 +0800
Message-Id: <20260603161732.52477-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OBpqy79whgIZPcrU4y5kQnuGkKSe5DtC5K0JlX98WrxrAno3qaTRXEoz
	atr4maQottI86ZC8JpCKpb8ma+kbAmQ9ABwgyiq+yklvuyjKLAaF/lUAlSCwarJmtgmVdTn
	3aUq9zc9GXXeodnZizjac3CNMRJMZGiSC5e3MNxMXRWaZ8OJw+Q1oUZEgwDcfXolTyhvHk7
	jDO7CX4RE8M+Ah6ga9Ko2wtPTHRW2yacGKKRJiMxxx8SeDeQgYLek8ULuunuUUnVSlh3wup
	VufA9M/Fr/7UkE98z0lnedSjLGpAcVp5VN79lF9tXC8buRCzk62hmWe5jpIEVf1zjIlWvH1
	wxLwVr7CTaPSHbtYTecCU1AZqoZYwyYYjqL0hm6YIRikgopliW97oC+coDd0BcMC3mhTqZu
	wwY67+J2w7tixd5Ij2HFf5KJ21UEdo69rFmiITQyd5NQYZcQwgLPRfadhFQ+8OKEXfV8Z74
	TanMxsPf3a81BpKpTa/aN6F+f+LIV14L+Ljw2ED1TthqeUjbLI8rLwbkAYC6JPbrkA/rFNo
	Gk2UDcb8rtSKTu1mqVBpWv6vVTXnsElvilXHQ3HZgS0jkis1ySMPa9lnKzeQ9HyY9mI3WS7
	TnNtf4lnI53LNMiZ9majpq44rKG+4+RbCXmzcv8ITprc9gDiILzWTcVvyPUZiKdd87LjhfD
	1abJtU+HfS7G8RTneGnNRz3TY+UUtmGDtOSQQ8Q4KxYlNjaaRF1kCWrWKMzHDYhgqpSieNn
	lpnpJ2OiYhedfogpw0mP1Ec9UXA7DhSJ0f6+BdKpDL70jCQfJ02qDmcaiH7/C4rN+8vXiWK
	3ZGwHhQROZOL6ywuI1NQm9y+UtXwc6/y1eCl2r5MivMsLrd/qpryLvfuC/Ul0Yi75tK0oJC
	/+7NOF32vabx1pQQAFcts9NBNQKxBdpMNzhkycnOdL10me3FSch68vmJnD0mXXmh8aDqgPd
	D5/8U5EAZaQaApf0fRnhzoV8a1+a8rw99e9nNs5iKOASKRwgmDrbF7JygQmB1esK8PGevuu
	Xt5d5Xe03buFxoRCL5+NmB0VPtXfDtW202M8QgFYHzl/zttFLPpCUFTZK33te98ojBG/B1+
	9dJlqVLNeWc
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13541-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:tamird@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:petr.pavlu@suse.com,m:guanwentao@uniontech.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[guanwentao@uniontech.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guanwentao@uniontech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,uniontech.com:mid,uniontech.com:dkim,uniontech.com:from_mime,uniontech.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67F3E639BA2

Use readelf to dig out if <file>.o contain a __export_symbol_*.

Instead of nm, readelf is more faster, and significantly improve speed
when enable CONFIG_MODVERSIONS.

Build x86_64_defconfigs in 2C4T cloud server with CONFIG_MODVERSIONS=y:
With patch:
real    17m21.019s
user    61m48.388s
sys     4m27.709s
Without patch:
real    17m39.435s
user    62m24.686s
sys     5m3.200s

Link: https://lore.kernel.org/all/tencent_2FA16E0A18D6D0C0703F5D49@qq.com/
Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 scripts/Makefile.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3498d25b15e85..54a91bc144cce 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -233,7 +233,7 @@ ifdef CONFIG_MODVERSIONS
 #   be compiled and linked to the kernel and/or modules.
 
 gen_symversions =								\
-	if $(NM) $@ 2>/dev/null | grep -q ' __export_symbol_'; then		\
+	if $(READELF) -sW $@ 2>/dev/null | grep -q ' __export_symbol_'; then		\
 		$(cmd_gensymtypes_$1) >> $(dot-target).cmd;			\
 	fi
 
-- 
2.30.2


