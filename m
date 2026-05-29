Return-Path: <linux-kbuild+bounces-13416-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOmaEZT9GWr80QgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13416-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 22:56:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C61DA608B52
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 22:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD6D9304B2B1
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 May 2026 20:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FAB3FCB09;
	Fri, 29 May 2026 20:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b="xe7AG05F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender-op-o7.zohocloud.ca (sender-op-o7.zohocloud.ca [199.67.87.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A95D3AD539;
	Fri, 29 May 2026 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=199.67.87.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780088056; cv=pass; b=VX/MHlyPD9TSd+8rVsZq/cIqX3T+igPWWw5kM0t4aoUVGV8VSGOlkxXG3mu4OjZMaAqrpQz1IBowLLgJ9NskKeVZyS/smwFpi/6nYEHcjb2ZAcMHT2iYBJhjrslfLrb8hUTKNJyO/fKNJQ7aJmUidz7SetnznA4rX1b6CzahciY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780088056; c=relaxed/simple;
	bh=V2y+beN4a6cwb7CZQM4q7m/leVS6VWazaXZMxm/ttK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JeS/epV/ycTy5dqzQB5TG1BoeHT0WRQLk4Gzj/T+RjlnUaHGz0LKdf7W7zQi7BJPKd2mSn/RFXwtmlt+QPA8lUbJfrF0MImioebD8pWUHwz7HrBVaAI+4ifRZhQ7a54IuyAJp+fdmp+sN2F1n8m2qvDSXbWdah8jLNTyPFc1/Eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev; spf=pass smtp.mailfrom=jkam.dev; dkim=pass (1024-bit key) header.d=jkam.dev header.i=contact@jkam.dev header.b=xe7AG05F; arc=pass smtp.client-ip=199.67.87.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jkam.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jkam.dev
ARC-Seal: i=1; a=rsa-sha256; t=1780088048; cv=none; 
	d=zohomailcloud.ca; s=zohoarc; 
	b=ifhAK3YgpcvQc9Uks0VZTM7alcSQUvHN7F9Gx72UBtO8iqs2ERGSED79YohlVawuUpC9xP1S74JiffVG0gIBCxBuDrbQ0tPmIY7zcwYl6rPeDniScmggWKAzaA49n7+lZIqWumdozqt8J3eRPmtzCvKQsLQQAs6ORv0m/VTrVo0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomailcloud.ca; s=zohoarc; 
	t=1780088048; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IWefKWIHIHfjoNpHLbWsCPr8PHRSaEe3cnlFps5K0xY=; 
	b=CCuxiP5lBYBlLBePLx/RHCKXri1GVT3SPyIRACfBhjfRt4Rpo5L2Mf2Wty8w/07Vop7uGrzR4x9Hfo3605qb9uQf4wgyTR75ayJOFR0rjtaCirZNkZxflVoAlMOhfIFLws7Jt1oN0eqDWe8wCVu96PuSu9w6BO4MpeMpIcXGw/I=
ARC-Authentication-Results: i=1; mx.zohomailcloud.ca;
	dkim=pass  header.i=jkam.dev;
	spf=pass  smtp.mailfrom=contact@jkam.dev;
	dmarc=pass header.from=<contact@jkam.dev>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780088048;
	s=zoho; d=jkam.dev; i=contact@jkam.dev;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IWefKWIHIHfjoNpHLbWsCPr8PHRSaEe3cnlFps5K0xY=;
	b=xe7AG05F6PYB7WAakOUNtoinxm8E5nfKhyFhg0qd+8Dj/6kvH4gWSzyOftCImPCx
	OAJgeW15RZy21J1627PGwqCzGovuZIMveCraAUWAV3HrM9G9AVouriX91B9zy7CYmBc
	WF9X6PyObT3fmwxisy1OVzAaR80nA9w8sqoBntic=
Received: by mx.zohocloud.ca with SMTPS id 1780088048533783.4336270361567;
	Fri, 29 May 2026 16:54:08 -0400 (EDT)
From: Joel Kamminga <contact@jkam.dev>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: rust-for-linux@vger.kernel.org,
	Joel Kamminga <contact@jkam.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: clean `*.long-type-*.txt` files
Date: Fri, 29 May 2026 14:53:59 -0600
Message-ID: <20260529205359.75377-1-contact@jkam.dev>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[jkam.dev:s=zoho];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13416-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[jkam.dev];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jkam.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[contact@jkam.dev,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,jkam.dev:email,jkam.dev:mid,jkam.dev:dkim]
X-Rspamd-Queue-Id: C61DA608B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This cleans up files generated by rustc compiler in the case of an
error containing an excessively long type name that doesn't fit in
a single line. Such types appear relatively frequently so the risk
of generating these files certainly exists. These files are purely
compiler artifacts and are not created intentionally by the build
system. They should be added to the `clean` target to stop from
cluttering up the source tree.

Signed-off-by: Joel Kamminga <contact@jkam.dev>
Reported-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9f59598d3a08..3a265e7e3347 100644
--- a/Makefile
+++ b/Makefile
@@ -2164,6 +2164,7 @@ clean: $(clean-dirs)
 		-o -name '*.c.[012]*.*' \
 		-o -name '*.ll' \
 		-o -name '*.gcno' \
+		-o -name '*.long-type-*.txt' \
 		\) -type f -print \
 		-o -name '.tmp_*' -print \
 		| xargs rm -rf
-- 
2.54.0


