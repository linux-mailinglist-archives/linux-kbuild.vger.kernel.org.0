Return-Path: <linux-kbuild+bounces-10827-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FO2F1iZcmnBmwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10827-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 22:40:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A326DDB9
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 22:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59C743004927
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 21:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4831D3A89C4;
	Thu, 22 Jan 2026 21:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/sJlU3n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A18A3C23AA
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769118034; cv=none; b=Bx/gJVj50UIcJTk7zqyojOa/jgHf3feyi3F8CVcLG+GlbPFaax7Q2ACgl2vNLkMLuvpOjuVaG2J3G6Z0cTZARh6Go8nC4UEOkggHxqSP/qDSZP8mk9hh6uKB+S89nZC51bEyddl0CC+23K5A9IVD+8yDKjqrwGJTxvHI18XerOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769118034; c=relaxed/simple;
	bh=fLTdLGpxuMVcl+CnLuR11M/GDOl3+DTIo4Z4TeES6nY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kSbgjj6aAVoZGpAwV9o6WzAv6ZnGNBzrdkRejUWVDZ4Cu1A8qb0XJ0mDrCG9x3utldJHNZklFXc1uuAG5OJT+WxDV24UlCGIWLr5lHP/6dWAkplowwWTVKeVcgHFdrVleT2wiXu0t9R5MVq2T0vyfzNK8djATW+41otJCzqyr/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/sJlU3n; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a09757004cso14167125ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 13:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769118021; x=1769722821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VAdamMJze9wFaykc+RxocQglt5n399XEQI+Upov/H48=;
        b=B/sJlU3neut6HRECzbuN3mwC6ckL2wrR6Eu37i8UKk9Ivzo2ukyUGJ+1H1x0rOnDhJ
         Ho0/GqYjWPWD50xpWcJ9VIzFz7y276Lbd3mYFMo2zAfVamNTbtuFrKqFfVv1zenPyFzS
         fC8kFxdkrAKj5edi7o+CyxCHqWMKZVTTORRLWNCYfrB77SlkOjIpufONHi3TJ9ItYeUA
         hcYTW7+GYkvE8yJrWJbZOoQugbDM7uPNembuCJLjT8OvezdDdYvtTQ93qH+LF+95yE7H
         UwU27k1B344pftmvVyVAjwFThSIjW38f498n4Nwn4vwjPxQzFlOVDCzWSLGpNKVGlbUM
         RzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769118021; x=1769722821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VAdamMJze9wFaykc+RxocQglt5n399XEQI+Upov/H48=;
        b=gxhRQT+Ahtfrig9qfSlilUvsRFV08RxK9nW44sEqAJR3NbDpF4PphIc7O+5SmJjkkz
         DAWkpR3grXUzaOn1jxGMdZTxVjgGoYR5eSjql0iWkUgUaTyWzpdpayLpafTpVO6RNHak
         NavcqA67pUb2zZHFr+TJTQK3pzfVKjnFUZR9tneBBdGmbntI11OoHiXefIILJ3f7NoQI
         n2fBGO5lKmJWSzkaTuDc5GQ/jrGOY6J/69BsQ40o98ABiK8zvnaVItuPCcb6z0wAGV2Y
         4ss7y/6JEEob+ntyX5pJ9R8iiSyy/b2aW/9s6F59bkIhP7yczXUUY2E7iHXsLNc/3bgo
         QsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKfRPnshMU9i7tWlwsDK9MirxNTwDvVNTt3NUdwnYyO2DeLjceR1UZyB2euMx/VXKlwdbLg5SPfTY5PqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe7rGbQuxbzeZPfbVYMn3+TCWR8TA+YDgOyU1bk31pOPyCUhVa
	fLgOfDgIeoHtrWxw1aXaoWcTVlpp1d8KJpe/ZGxOHEgO+HLpLdlih2Qi
X-Gm-Gg: AZuq6aLodNdj0qK+Wk81NJKRe8VJYYznMJoJGeuuldQN2I2/xeNreVivClOASIaFH1N
	h7tJYApR4VnGDQSebKHyWemoxqvGIcd2VPyu/QMaL3BSlaW867Dt97mmRicxp6A6c8oy8GWO3Ti
	c55EljGu6Yomovx79DROa34D4oCezk4xJkuqk3IRyBbdISaWMCoPgklFhXaqZ+pfSoil6jgxArp
	Ph2iE+BxRHz8DyD/NCx7zCqpf7bqTxglrxTSd6KZyN1w+3/rVbSbwjzNbslLqc6kKAD/T/+by0e
	olzC9fQXHXCfilD/nE6w3NBBw1jRO1JEmWEraqM8Z+fuR5uuhKHyXp4+Nj9e5nRp5BCQeufUQkr
	2ANq1HViGBsF7ZtAM7sZab2O3qAaYWj1dNupN7dtZsy8IkAWYtykRSd2f2NejBq9NMMG3GYNMCT
	nJPXHkY9AEtJMnPCE8H2Xg8p5Tnl5eQ48c+TjbiW8Af+/cBS+7IpVjXxmCHnuznGewQ7I7Jqw+s
	28sNFnMy/m7jYKcxPnuDCqsZj3cY4AV6/DpAV3GhQ==
X-Received: by 2002:a17:903:41c7:b0:2a7:aac1:7205 with SMTP id d9443c01a7336-2a7fe733f69mr6295805ad.48.1769118020807;
        Thu, 22 Jan 2026 13:40:20 -0800 (PST)
Received: from arch.localdomain ([2401:4900:ad2f:b6fa:8cb2:5884:b62f:4e7e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97a81sm1539345ad.47.2026.01.22.13.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 13:40:20 -0800 (PST)
From: krishgulati7@gmail.com
To: Shuah Khan <skhan@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add custom extraversion to Makefile
Date: Fri, 23 Jan 2026 03:10:11 +0530
Message-ID: <20260122214016.19719-1-krishgulati7@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10827-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishgulati7@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 06A326DDB9
X-Rspamd-Action: no action

From: Krish Gulati <krishgulati7@gmail.com>

Update the EXTRAVERSION field in the top-level Makefile
to identify this custom kernel build.
This is a requirement for the Basic Kernel Skills
task of the LFX Mentorship application.

Signed-off-by: Krish Gulati <krishgulati7@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d208066bcbb6..32df45e55685 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 18
 SUBLEVEL = 0
-EXTRAVERSION = -rc7
+EXTRAVERSION = -krish-mentorship-application-task2
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.52.0


