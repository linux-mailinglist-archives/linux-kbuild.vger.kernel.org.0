Return-Path: <linux-kbuild+bounces-12103-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEhMLdiSvWnY+wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12103-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:32:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0582DF797
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 19:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2E8103044683
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 18:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5F33EB812;
	Fri, 20 Mar 2026 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="arJIf6eq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1848C3EAC83
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774031387; cv=none; b=lcebWvOpgSf+t6uIDubkpY2rNqao5nlgNDtLit00dG9WxMna9aYOHQlaL86Oy9TqEpDd24dxNYq1rc2iIs5tGe5lAIDq8621YTJ6AQalmlyoaWPKOmo3kdAfADELy+GinxRVCYKRl1EbOMKctGV0KDxglGUI6Q0jns/G1/6UGj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774031387; c=relaxed/simple;
	bh=fIPCaFmjfpw2azVfZkKjNT2Lgi+aX/SG7M/IYgDoSp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLtbqcGkGqoLSHDjsUhEotUoP0fOjGgU/xxtmZwTQUlCIR+/56enU6LZdZgfoQ4O6j96ucrAnznAQy/UGy0bsdJ6fETgCGqIXy5lAZqjiXhiYHY6r9Yukm86OQFnO9UswOsZUZLAe+oj4Y+LHZYPp4RO6de3cSg78vcwwTm3W9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=arJIf6eq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so8019245e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 11:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774031384; x=1774636184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=diCQB3Da2J9cXVPunYylAvPBplkDRKpPt7iOeuLiYGA=;
        b=arJIf6eqCnO/r87fVq0j9nlZDoKsdrAz9QC/CqBZAEULQA4nwJrq5rzuplfa4p6+Vs
         92skbfQJEg0My3hyckqGEXye5foIYdQ4WHgrT4tolcgLJ8utjfftaNzHbVyaQpBgv7V7
         A+eqHDd7K08F9F5IPhSiuiG5W3gQX7Nm4Hgp+SidQokce8FYCSfzEruIqyB9n6EIPM64
         gaHLm6etiVZBS/G5QXmneYq4kRtZg8Ugo2AJClNn1j5ws//Z3Y0bh9w9f1r2pyseWcwo
         FrOb2YA7kKxvkePYI6E9jJ+j1nxM4e7ybAxnqalxUQooEZckSbQ+awFxqhWXV9Z+hrIV
         SdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774031384; x=1774636184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=diCQB3Da2J9cXVPunYylAvPBplkDRKpPt7iOeuLiYGA=;
        b=na7mYDe6QI874tvZ8aAIymW+0YPOfp80XpNVqZzP010q0w5+a+B69W6xMvQWg5Qynj
         5WYTFs+JfLEbmR0ZDTW8AluCpfB7X7CMOLn9mBfcoZs1pDR6VqGFfc4rV8+QtI+kL7op
         SKp7vs+BFqjir0QayTZu5xwxElM8DkFxTQ+5YQCGZlR6jA3UwfYNzzgSTmBIKlvM/s1E
         KG1A44ZYA8I5xHpAwR8GBHSTYl4eq6AiO0z5QyGdNxBbw0S7paGrCJPMeCaHmpVh9MV+
         KVQaaC1PGastF97QUm/HQqG7/J2IQvfVu+Ql8lA1yjH/wvWNkbx7U1FOt4/Er6SxUzK/
         QO7g==
X-Forwarded-Encrypted: i=1; AJvYcCXkwuzzKTNiFbVpzMz3fxlEAgerr4A50eHMDm9gspG4NvsiDob70hR2CypjM/dL18TUoD9TPodUoeMgrFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaNsGI1/EEwTDlSdBm++0gPbWZf6IxFbpUFE5eDGrXD7HwydMq
	Ntgd/Bs2fNQp7pYr+2Me0MsicMXaloadsc0kWQtbwbT5jXhK0D1jGiaiD32a8RJ9SgI=
X-Gm-Gg: ATEYQzxfFMngcTmAJ67c1eUNF/ym/UFfRqyJRkg6OmZsVeEJJHOK6lS6pxgho7yemJU
	9RidXHpgMG8LFi1jjf6ILI1/pIifNGeoW15e7JwU7HEkVTp6Hx93YGR1/744wKYSXwnWqlMjMWi
	HBHWOErBFrvz6r1Xw0d5RxMULAnSBkyfBcgmoPUH7tV7wZvDbIr9zkgg1aqn7YCml89L5Me6P3R
	RFNZguGfKIYo0wGzjwpQanqYqToMsOXjgpqoP+e0md+1tvK+nwYKkG4a2Vwn1SF6bBoWe/XBlva
	ObuNosHABJl+be9dg3OpI6mmPFCBxhdW0Wwi+9tymFXw3k4KvdMilL0G2nu+MRTpD3NRpEhjf7i
	LVX+CVn0qa7+pYbHk9RBfHoryWsewMc0Abh0BA0V37XBei3bdxXo1P2/03SjiK1jzYO3HZvukbI
	+KD87Q9ph3yqxdStkbmtox
X-Received: by 2002:a05:600c:3b07:b0:485:419c:4eab with SMTP id 5b1f17b1804b1-486fedab40emr59943485e9.6.1774031384438;
        Fri, 20 Mar 2026 11:29:44 -0700 (PDT)
Received: from localhost ([189.99.238.44])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a905c1484sm19999477b3.49.2026.03.20.11.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 11:29:43 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Fri, 20 Mar 2026 15:29:21 -0300
Subject: [PATCH 6/6] kbuild: remove kselftest output in mrproper
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-selftests-fixes-v1-6-79144f76be01@suse.com>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
In-Reply-To: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
To: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openssh-sha256; t=1774031363; l=854;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=fIPCaFmjfpw2azVfZkKjNT2Lgi+aX/SG7M/IYgDoSp4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGpT78RbMs8QRjkbbReWVytimj1Elin+rBO2xOPmR2QCJdX9njQMibxOJAJYfg7SAueZrkdT3z8
 /nQc1c9IfeAM=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-12103-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rbm@suse.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid]
X-Rspamd-Queue-Id: BC0582DF797
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Selftests built with O= store generated files by default under
$(objtree)/kselftest. Those files are not removed by mrproper today, so
stale generated artifacts can survive across builds and be reused
unexpectedly.

Add kselftest to MRPROPER_FILES, so that the default kselftest output
directory as part of mrproper target.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index c9b7bee102e8..91e6ec790a0f 100644
--- a/Makefile
+++ b/Makefile
@@ -1662,6 +1662,7 @@ MRPROPER_FILES += include/config include/generated          \
 		  debian snap tar-install PKGBUILD pacman \
 		  .config .config.old .version \
 		  Module.symvers \
+		  kselftest \
 		  certs/signing_key.pem \
 		  certs/x509.genkey \
 		  vmlinux-gdb.py \

-- 
2.53.0


