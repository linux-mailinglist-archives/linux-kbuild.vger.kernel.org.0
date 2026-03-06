Return-Path: <linux-kbuild+bounces-11609-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAm6KUU5qmnUNQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11609-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 03:17:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 189AE21A865
	for <lists+linux-kbuild@lfdr.de>; Fri, 06 Mar 2026 03:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FADA3041A60
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Mar 2026 02:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F92E317715;
	Fri,  6 Mar 2026 02:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqmUrOVt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D8B2FD1B6
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Mar 2026 02:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772763437; cv=none; b=NHcYmZksXIgeacMMrMDL7e8RgxFqYilfgjXHvJ8HUBgfZDyGzVoY69bdaCcNOJC4K9G9llKVPhSj9/OXtcKpYtFIrsY6eSVQZGxJG9llQ/llEHuoKja29FajcFGdaHgebezpEso6CXBNC+vBcqUFRMOqUI5YYqFNzBHZO42mJuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772763437; c=relaxed/simple;
	bh=j65gApWA27BQIdeGFn5i9iKCRaNJQ4DyC0qDkjxGBzk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TwdOD4968uE9Hxergl5G3F6Y/kvtHVtJHDJOY4QlyBC6GrjqYUxtmfr8XnYJCsHv84vRn5HsNWdmdbAyG/hF8mSnnLDaegnSApKB9QPJ1uhl3F3n7OzwAvVrshNDIdXTgC5C1hbLBZIrtCyN5i8MisDY6ZmBYDEqVjqiRZQd9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqmUrOVt; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ae46fc8ec1so36013305ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Mar 2026 18:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772763435; x=1773368235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aComa1aLtd4u5sNYHRHFrAGjjOKe8ZcDgb4RgBRD3SY=;
        b=BqmUrOVtyCAo42bo0aq+dKCYa0jXo8iDY9zT+AFdmDoG5YYNrGzqGu/qPICb8t3/3J
         y+zqiW1sUkbbi/Cbu1/nYc7u2mDNtodCc4dtMUxaoQhdG/MftZ17OLGkoJvzsDgujY/I
         0RwNiBR0jo4h4zJ3U33aXka9hInl+Os+CCVY6xJhZfqWDnFg6ATxZDFZUpuDvjTZNEEc
         oXlUGfwFYgjW/N0xqvJcIvc8zYaRFQHHe8rS7xkophMOZaCua2lSvAy0u7CUPwrugrCS
         jOpUAhJwwMi1AMlAgLBThGZXM8ssQo2uIjQR72tJmKWvOZO5ICmy0EQEmS8OMoga6Tra
         At9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772763435; x=1773368235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aComa1aLtd4u5sNYHRHFrAGjjOKe8ZcDgb4RgBRD3SY=;
        b=PXjgkKvfcuO4YtgMo4AkwyJaaHfMPwgTH8HrIQChNaePrcwjKAY+hBRO0gauHGPV19
         0F8R5giJJwx9t0nzeD11qd23cqCUoXGH09CYcek58iMU2H3/kEdYLh+rkMnitmt/jf0Z
         4CV5tykiS2wA5ZfRX+PJXxvX5wtX7rXbhwNu+bTK3kP6UcPtC7JbsdlfiZ+zXpjH5/W7
         53jCzNagRY/hBF0nF19abf29XHgEEBlo0Ni6gDm1NT0iicWm6iephPB3qj7YQMBJ3eYj
         Yg+9Ak+JN6TwUxOPvuvvR27Bdnos19SVL843eog7n4cNWoffgwmuJgwvZMHsv51KhLUK
         n7mg==
X-Gm-Message-State: AOJu0Yxh3/5lh0zg0UPeoJ2ZSQDdV+jArBYeaUn9NPKntzvgAOt435FQ
	ppBeUbugk6fhuEql0t6fdFUhUMG6I4doXV/tYr3SD+4ptlR0N54YZCqNiRgoMonB
X-Gm-Gg: ATEYQzxTduAYgvBYbb+FUJCPunY2cWPQ2Imczfi+O/w6t8kVKI9T6xBu6N1/J1j0pYO
	aakdlTS1M0iDuCuxh/Nk2DL3IXF/dA1BpoM/y4PXD1X7ZQXAMFET75BXTRIEGES8mtMRw0PDl/5
	Xcb8mnVWg4nEsevMfXP4zuGtGT3tBYD/LcvRzkYsTAZmacZrqdFXgpkVoPlXdLYfxRMfbpatWUT
	vUl7MoRnp8UqA4nU5s2rYLSXuJBJ5coRy74wcpAqT7K8gKQ1mBuBsaeJ86fRsMXBS8WlIzwplsI
	IMrfCwTj5yeHxNxCA5D6OsUYRT4wEfUDjFbIL5UG4rGcpU5dhedTMAIfFhwX2D1JfTh6BxMs6lR
	gcdsN+oqDvS8TIZw52g+XFRgYvCvhbmjufoQfugZ/P4SzVPAZH/Nq06ZMGQFSGHq2QGbzasJyTY
	Opv1r53bT41zQxbXuu10nwZAHxgBE4gdmzcrYu
X-Received: by 2002:a17:903:40c5:b0:2ae:6779:c8bb with SMTP id d9443c01a7336-2ae82362cf5mr6309595ad.5.1772763435205;
        Thu, 05 Mar 2026 18:17:15 -0800 (PST)
Received: from localhost.localdomain ([111.202.175.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57c1csm1134325ad.18.2026.03.05.18.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 18:17:14 -0800 (PST)
From: Xingjing Deng <micro6947@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org,
	rdunlap@infradead.org,
	masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xingjing Deng <micro6947@gmail.com>
Subject: [PATCH v3] kconfig: fix potential NULL pointer dereference in conf_askvalue
Date: Fri,  6 Mar 2026 02:17:09 +0000
Message-Id: <20260306021709.27068-1-micro6947@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 189AE21A865
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-11609-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[micro6947@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_value)
can be NULL. While current call sites ensure that 'def' is valid,
calling printf("%s\n", def) is technically undefined behavior and could
lead to a segmentation fault on certain libc implementations if the
function were called with a NULL pointer in the future.

Improve the robustness of conf_askvalue() by providing an empty string
as a fallback.

Additionally, remove the redundant re-initialization of the 'line'
buffer inside the !sym_is_changeable(sym) block, as it is already
properly initialized at the function entry.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Xingjing Deng <micro6947@gmail.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---
v3:
- fix compile errors.
- Link to v2: https://lore.kernel.org/all/20260301053035.1950087-1-micro6947@gmail.com/

v2:
- Change commit message and use fewer characters in modify.
- Link to v1: https://lore.kernel.org/all/20260225072246.3475275-1-micro6947@gmail.com/

 scripts/kconfig/conf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index a7b44cd8a..c368bec5a 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -297,9 +297,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	line[1] = 0;
 
 	if (!sym_is_changeable(sym)) {
-		printf("%s\n", def);
-		line[0] = '\n';
-		line[1] = 0;
+		printf("%s\n", def ?: "");
 		return 0;
 	}
 
@@ -307,7 +305,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
 	case oldconfig:
 	case syncconfig:
 		if (sym_has_value(sym)) {
-			printf("%s\n", def);
+			printf("%s\n", def ?: "");
 			return 0;
 		}
 		/* fall through */
-- 
2.25.1


