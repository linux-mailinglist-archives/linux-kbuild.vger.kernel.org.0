Return-Path: <linux-kbuild+bounces-11288-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id b2OjEsrcjWnE8AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11288-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 14:59:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3ECC12E051
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 14:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13DD03012D20
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 13:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE242349B0F;
	Thu, 12 Feb 2026 13:59:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0.herbolt.com (mx0.herbolt.com [5.59.97.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE642F28FB
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Feb 2026 13:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.59.97.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770904774; cv=none; b=j+c5u9r0t7/huWY+Ozm/zce5V1cJIAexDnJ/9cLsD7KtQDyCrrXL7fKfxhYMtp8m8HhYzrrW77wTE/JK5KNCGHGfQX9X6fHh0vl3cHN16PPgbCJ5WuUpjEvOahLgFPGByrMGSDR652OKYGOgn+Du+rF7nurGV5D9njCEb9Lki8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770904774; c=relaxed/simple;
	bh=3I42+xaWATnANNkxqINipeJ3a+/E9Kt2Qth8BPBlG0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i76dVMKllFUSKm8s6rTdT6FM6EX8iB/0m6kLFsbRR6wYTZRYbb/rE9rUChsVbNVSg9MddZ1XvuEgFB0NLOoRfs6RSsQFHEDgyzJz2FhJOZLlo32hB0Jmqy4qmWA47tkb81Oe9gDAndm9l36UH0F2ZVAQKFCkYmRvdrD4LMwrapo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herbolt.com; spf=pass smtp.mailfrom=herbolt.com; arc=none smtp.client-ip=5.59.97.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herbolt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herbolt.com
Received: from mx0.herbolt.com (localhost [127.0.0.1])
	by mx0.herbolt.com (Postfix) with ESMTP id C82BC180F2C6;
	Thu, 12 Feb 2026 14:59:25 +0100 (CET)
Received: from trufa.intra.herbolt.com.com ([172.168.31.30])
	by mx0.herbolt.com with ESMTPSA
	id uAXPKr3cjWlpZAEAKEJqOA
	(envelope-from <lukas@herbolt.com>); Thu, 12 Feb 2026 14:59:25 +0100
From: Lukas Herbolt <lukas@herbolt.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Lukas Herbolt <lukas@herbolt.com>
Subject: [PATCH] kbuild: rpm-pkg: Fix generating debuginfo manually.
Date: Thu, 12 Feb 2026 14:58:56 +0100
Message-ID: <20260212135855.147906-2-lukas@herbolt.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[herbolt.com];
	TAGGED_FROM(0.00)[bounces-11288-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@herbolt.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,p:email,herbolt.com:mid,herbolt.com:email]
X-Rspamd-Queue-Id: D3ECC12E051
X-Rspamd-Action: no action

The ${OBJCOPY} and ${READELF} are not expanded into path to readelf
and objcopy binary so just use the binary name with the %{_bindir}
makro.

Signed-off-by: Lukas Herbolt <lukas@herbolt.com>
---
 scripts/package/kernel.spec | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
index 0f1c8de1bd95..d032f6aff91b 100644
--- a/scripts/package/kernel.spec
+++ b/scripts/package/kernel.spec
@@ -109,11 +109,11 @@ echo /usr/lib/debug/lib/modules/%{KERNELRELEASE}/vmlinux > %{buildroot}/debuginf
 while read -r mod; do
 	mod="${mod%.o}.ko"
 	dbg="%{buildroot}/usr/lib/debug/lib/modules/%{KERNELRELEASE}/kernel/${mod}"
-	buildid=$("${READELF}" -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+	buildid=$(%{_bindir}/eu-readelf -n "${mod}" | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
 	link="%{buildroot}/usr/lib/debug/.build-id/${buildid}.debug"
 
 	mkdir -p "${dbg%/*}" "${link%/*}"
-	"${OBJCOPY}" --only-keep-debug "${mod}" "${dbg}"
+	%{_bindir}/objcopy --only-keep-debug "${mod}" "${dbg}"
 	ln -sf --relative "${dbg}" "${link}"
 
 	echo "${dbg#%{buildroot}}" >> %{buildroot}/debuginfo.list
-- 
2.53.0


