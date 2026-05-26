Return-Path: <linux-kbuild+bounces-13326-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBkiMHY9FWqgTwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13326-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 08:28:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CB45D1295
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 08:28:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 631783018432
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2026 06:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86CD4324B32;
	Tue, 26 May 2026 06:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ncG7STqe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4731115A864
	for <linux-kbuild@vger.kernel.org>; Tue, 26 May 2026 06:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779776869; cv=none; b=MGONEi/V+GH8hKGSOxsHMkgJKfj7BCFGcrR0Iu2xWyh5uGYDhWcqMEy0jr9uAFBtnrD/kJrwvSUUcFhjOznWU7p7aXVCMOWOYM8dKItuTsvRdv5Zj3df+Kb35NoK6Mcvw/Bibczvk6hOXaB5rmrdC1IYHQZ5H17lDKeYwv9xAAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779776869; c=relaxed/simple;
	bh=SzNSH/ApV+5phKmZ8GLch+beFTGjzpYgLQ2wZGt3BG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dTmvR25R12D2THHoycXfcsmZfkC4aUy+L4ZG4SY0OvZ+Blwk9f9PdAdnAoyVdqpjii7sC6V1AIIjR8mtPCfmOta1vqZ9y0fhdSDPL7OPxQMAx5HXvMk7TsF0eZG/uFHyNZqj54VJRRQ8ksfRoxJ/0h1axKlrGFKmD+T0xCmDQbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ncG7STqe; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-838d0b7c950so7282186b3a.3
        for <linux-kbuild@vger.kernel.org>; Mon, 25 May 2026 23:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779776867; x=1780381667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hjwSzWHZkBaieWrPz4xe331bsRxr/TLAJPfCcfEtcQk=;
        b=ncG7STqeCmS0JEtYAWMRzN4aq9KKr9FWVLexNKSr4+zs8DcA4wtazzCCNP7dGP/ZYi
         C7u6dE4BhTDdQ0t8RUni29s5kCSuct1tNGomaWB0hcZb7fthvtg6xvw9Z+XuxQwsByWD
         kzVkM5WffipQEKE+BqbaUtW8HrfiUm/6Wv0dQ2IhUW/TZJlnNgiUBa8iCKuG/xzWUmDr
         /K+FVcPewpG5Qz8MRzS+mhUX06Kq+U6GW/iNlZa2Pcg9EEQigMEZURgc3FaaF8SOyXZU
         ZMNZNqnXhXhO1sTxHy7WMKZ1khnK3T8Jznv+8GzMnQBmCd7qMp21q+Z7h5CA0/f1h76r
         KRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779776867; x=1780381667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjwSzWHZkBaieWrPz4xe331bsRxr/TLAJPfCcfEtcQk=;
        b=GdlRZEsW/BXthXFF/a7nI7GAQhzx9l1PxfcjJhIV+Jpxz4jJQvACPAjuq0lG5cuxTA
         DYStJXcXzuLX1yuAtnocOyjkvxnDxq1O4y8MY28VAnY0Wg+KZ65Ypv9UaVD041PDcMmM
         wsEjBImvXoUB/Fsx1ACHTiQgZkmqhjfwEX/KfjTJ9d8S08PkqADLcSid+e6R1/S3uLAA
         iddLaP+1J1gMQF83+WXxiPGV6p5uJ7LnSy/UoCTvJ6dglH6LnieP/qMWLoelZgVowbCE
         FA8WFJMveNvRLy1C8gaKI96KdXuiTI3JeIockLp5NQswxQtjZcI0w6QB93pkhIdTVKl3
         u4Ww==
X-Gm-Message-State: AOJu0YxZepr+MQOiSY9j7o3ni210UNsd4mAbAdZX65ks3y7kShN+K3lf
	+oV91A9cwBGvsiBBZYpGR4kUnglafkQLEJkvXeFvvnHbQrjlNrdzmklA
X-Gm-Gg: Acq92OH31jpfMxugRcNDYYgVugbX4qA7pMcJK3KaU/545zetwWp6UKbOeSo7ir5TLxz
	ukGkBLtrsRJI3b6w2Wr1MSWeaAaSTMjq2t9bv6IPLWqWlhOgC9CvKLdpHs5oGSQwQnRMYRN3WKq
	qWUWs2GIgPMTRc0OZ7QkA3saIFOCYfNlCaNMYqEsuE1fcCRzmeWU6FgQ/dyKntl+24TZCJt2dvI
	Ie1cWfHMiAh01GXBVpopdm5yd7V2+jjtXqn/pXypOjR1MB72R/Q1KdqkFjhy8o/GMZfh0AlCxoy
	vyvgv2OsuNkrQfbb+LVpfA6Xj+LqpiH4GsUHAdIMONiH21MP+LrsIrVqHnn1zy2z32vr1kKWuYv
	GGp7hDx2XybrAt52biCw6XI4F47uM5rrAoFS9aLjIDHk7ytYsPbJuuBpe2N359P3NO91/lLm0tK
	l3pf/059pTz8UMwy3jcTq1kGMPDWQEkYebTjh4PGtCCAAj6K6YJ++zrpRsAYiohD4MTK1vD3kEj
	70=
X-Received: by 2002:a05:6a00:cc7:b0:83e:d427:9817 with SMTP id d2e1a72fcca58-8415f1560b9mr15607382b3a.11.1779776867588;
        Mon, 25 May 2026 23:27:47 -0700 (PDT)
Received: from yafangs-Air ([240e:46d:2200:6c8d:c9a5:e2c7:81eb:e280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164e9e7a5sm14158968b3a.33.2026.05.25.23.27.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 25 May 2026 23:27:46 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH] kbuild: rpm-pkg: append %{?dist} macro to Release tag
Date: Tue, 26 May 2026 14:27:32 +0800
Message-ID: <20260526062732.84006-1-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13326-lists,linux-kbuild=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[laoarshao@gmail.com,linux-kbuild@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 19CB45D1295
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the %{?dist} macro in the kernel.spec file. This enables
building and releasing kernel RPMs with a custom distribution suffix
(e.g., via rpmbuild's --define option) to better match production
environment tracking.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 scripts/package/kernel.spec | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index b3c956205af0..c732415662ef 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -6,7 +6,7 @@
 Name: kernel
 Summary: The Linux Kernel
 Version: %(echo %{KERNELRELEASE} | sed -e 's/-/_/g')
-Release: %{pkg_release}
+Release: %{pkg_release}%{?dist}
 License: GPL
 Group: System Environment/Kernel
 Vendor: The Linux Community
-- 
2.47.3


