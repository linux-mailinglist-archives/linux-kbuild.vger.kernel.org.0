Return-Path: <linux-kbuild+bounces-13663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z9D6IXV4J2o9xwIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13663-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 04:20:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8DE65BD66
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 04:20:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=q8i7OAug;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13663-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13663-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 015093003ED0
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 02:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC231A9F83;
	Tue,  9 Jun 2026 02:17:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C522285072
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 02:17:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780971440; cv=none; b=BVrEuaXcvZPQzL7I7uwlCP4e4B7bV8WWu7OvJirYln+LKW0YwZApmPBYJJEoN4hREzwWPVpBeq8YSEyUP2W0JK+Ko1sRKEkfFQW0bVLa71hyW1BvPBVQPUShJsMNsanP8cCzmGR+ci/pdJ9ua598gJ2AF5QaY+kNFmWVKSSx2zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780971440; c=relaxed/simple;
	bh=mma+Wuw3lo+tHda5xzAEqIhIdZv5wFlIlltOrz6nq+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=of3MgM86FDxD9+whXx+US810mVIBXKJvv/NBU9ycgskhz0qY48I86dYTsSQOmeMn3AwqAI1zDr45XJXuB3oaZAzlIdtilgow3GVLwNp/5+cQ/3qqfljvDeBsAehArlUv85c3ZTMurrFlcJw+NPrvjXBaEa3VAPQ9kqs9cjmXP4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q8i7OAug; arc=none smtp.client-ip=74.125.82.67
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1363fe80fe8so7148176c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 19:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780971438; x=1781576238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZ4As2XRQc46bCmzVumLKrmrw3WuBNQWyDamyJ9R3Tk=;
        b=q8i7OAuggHoC2ex8xzWzC1wfRCR9n0zwLkIY9WG+tfoq276qaJgt1jelzC76cv034O
         RtPEBTpzzxegxUZStosREvibd93LBmcEXHPbkbjrlwEhk6RaEqAnzgHjp927t4y2m3lP
         axiB5wooEJaxLE7tQ5Wwyj7j6xEO5hQ2w2TSh1lwz8eL2z28hKebdc1CQVfUPlDfP0bp
         y9mp3hQuvqX3CgpFlls3li669vGNLX4INWcZUnhii+Trs5xGh7pmCvz7Gm4IMYy9XJ9t
         fi5fK9gYOD3d2LXanI1H5eELctxW5ER00eohKS+4hr7JbMYvSda/FqVR522n1lrRAaZl
         Z8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780971438; x=1781576238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZ4As2XRQc46bCmzVumLKrmrw3WuBNQWyDamyJ9R3Tk=;
        b=DKFlgcC+5fjhgOY0GsR+pFrFCa4uevtELGzqh2XcQWPww90oyEe0scZxAMgVOpIhlt
         1/Gcoq66hsiX9nEG+1MdNycWlItGqdBEcgjixw3Mogn6JTS1jx7ae8qDvq0GsTsitua5
         ++qyZQCGsH+KMbTP+LWGWigEMIUyQRtJdBGILhb9hOgLlC2YhNuUyHbVvYQ5z65lj0JP
         rZklbhRD/uDN5NDz7KATNyiot39iVEBM/v1TgnbKjigIE2Ueethc2IfczfSk5fr0Skk/
         eMnuXXc+8iQoWYm5w9MrZKGqC6jqSNA00APN6POryuZTdyOkQEFs0qgXFjAhqMWD70R3
         CwWQ==
X-Gm-Message-State: AOJu0Ywsx9u1ivTEv6nTTRAdQ4fBfQDl5kupO7//O/D5EAJnJNqRxsb+
	9gXxlwtGF9uH/6dPgW/XVJjIcqPuggtvWe2jhHzNmk0wMr6MKQogsJGes7ygHt0X
X-Gm-Gg: Acq92OHiFDPq1Y7N3mYLSKLaf7vxwGfx6cG7fcwnpstCeDSFngYqht/DlFOPX935SOj
	vomBArR6vHmmR4AbgSIA8UhDPYFF1piToxqFm5AmX6f2Npt4Vj732jU47+AJf/YnQmCqW2MY2fv
	p7ZBW0Ydo8Rvs8gEKT4QiyoQTEXYiG7A3LpR1GpdHRvVKOFR+IWfHRj+ai0GtX08xcMUK8nlMM7
	vG0+wJGSLM33ibC1n9qWv+90ogJLuncsWo6um6wBTKNoxW6t7dnYJAgS4bwg+wO81UVuUoaDSif
	tUJTp5ReeTyNetsd3IbuHyPAeF6SEVcdtJ0t94G6s8OUZ5Pcd6TRmutg/jLYbIFBXZ1pAhiUG3J
	TxYxDXB9+TPQrHuVGIJTbsA095UjPR3BO/cUgzf9sD/r9uv7NWY5/wk6bQ+4BpBLmPvaXSSxAP9
	zkSxgTahGD4w1JkE3PR+G7wFXEdcn/kEClF/wjymWP2/7ODBFOcOxRr+YxTuh3RVibMAtaV3GTm
	Q8oudvgRIKPugNbGnc0B/LOliurDYJYtW/tYO7HxqXqVBKdPGmi27fCmkpW6Qe+h4+R3I0YjNuR
	/xXyFt33y5wg7loiMCa8EiKlVPfu
X-Received: by 2002:a05:7300:2327:b0:304:5db8:da95 with SMTP id 5a478bee46e88-3077b7855c1mr9869641eec.23.1780971438374;
        Mon, 08 Jun 2026 19:17:18 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm24880629eec.23.2026.06.08.19.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 19:17:18 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Subject: [PATCH] kconfig: tests: fix typo in comment
Date: Mon,  8 Jun 2026 19:17:10 -0700
Message-ID: <20260609021712.7965-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13663-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kbuild@vger.kernel.org,m:enelsonmoore@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE8DE65BD66

scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py contains a typo
"COFIG_" for "CONFIG_". Fix it.

Discovered while searching for typos in CONFIG_* variable references.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py b/scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py
index ffd469d1f226..791ed659c76b 100644
--- a/scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py
+++ b/scripts/kconfig/tests/no_write_if_dep_unmet/__init__.py
@@ -8,7 +8,7 @@ for symbols with unmet dependency.
 This was not working correctly for choice values because choice needs
 a bit different symbol computation.
 
-This checks that no unneeded "# COFIG_... is not set" is contained in
+This checks that no unneeded "# CONFIG_... is not set" is contained in
 the .config file.
 
 Related Linux commit: cb67ab2cd2b8abd9650292c986c79901e3073a59
-- 
2.43.0


