Return-Path: <linux-kbuild+bounces-13903-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WnfxKLcsQmpe1QkAu9opvQ
	(envelope-from <linux-kbuild+bounces-13903-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2026 10:28:39 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3886D77FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2026 10:28:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mq1O+wpo;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13903-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13903-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 170A33001BED
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jun 2026 08:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839323F23BB;
	Mon, 29 Jun 2026 08:28:35 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686643F23AF
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jun 2026 08:28:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782721715; cv=none; b=cjObZGtoUvwYxY3wAx8X2Duf6M5tr36OZjW/P+ofP09AxYRphDp/u0qtj452GgW+CxrZDMs0hucqupdkyToBymHK6rl9U7biu8Mm4hrse0F3jACHiPlxkqB+e255FhXmwLhjO4ubDWrHv9b76PKbVvqaYW+fdnZA80e+E6ZwkrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782721715; c=relaxed/simple;
	bh=k0RWSufpXOI+EoRLYmiUyX6W5PyF5ctFucjAZ20r9oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SqcTZdkhFGvxMLQSmYtmmPqdX4AEZnr5FoiWBuBUZMhI6Lid8iJtMiq/OWxHxHXKFTl05x+jR6wl/tVdnidaA5S38U1WN1EbAMWF2OoxRTyLhAqpxTZfIX+Y0EDjEl5Hcv9StsaM2tzNp2Aye0hrZ2/rGwVlFo9D1LHeN+RGM3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq1O+wpo; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-37ff798fe89so494568a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jun 2026 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782721709; x=1783326509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2OJLNtVJD076iBi2QYQy7Gwiez0WU33Md/XI3XIOiYg=;
        b=mq1O+wpo7p0fj3BjBTgUYhe4HzEiQ+uCLNfks9as2rrTvnNaz3UakrFuBQZvI16Uen
         y1yqmw2KM6/6etZeIg+suKstiBT0NrqXD4q3h2O3ZGKzA+bmAk/NNA7wMukcbfTAFA/M
         6gqwuVutakC24T4HfP4dAdgos46mpqcM72+xt71WK7HJ7zgytWJ87ssC9MIvPOveiUj/
         Qgu76W4Kqretdo0b2qW66B26MmuaSYpJgh0CmWfQkHTGd7NF7V+/eBIyOtFTafInsVQF
         DISrUx3sxfEtn/HxYoLst7irHvx70/eKxIDIRMq7mqhbaFnTFvLfn/is9nUXNunFynAC
         ptLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782721709; x=1783326509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OJLNtVJD076iBi2QYQy7Gwiez0WU33Md/XI3XIOiYg=;
        b=eE/uCHWD61d/eYiW5BLXgdrNvgFdF7B3kgXcx2NHgZxaslbv7i7+7cT9nZZyplOiOo
         npjMldFUN0c5GvQ6OmJkXwniHWuMN/gYVnE+fmLOnLEj0FisuJJtGL9nfUFmRRD92TtH
         KkETjf5kbXerehgBsf6BiTKjt/VDJG6glcVB97ae17SRbDFlizAkcEIJ+WMW5NcCKlrx
         KI8js/8UlR/ysUTOZEG/C6HHM62NoSKlTPFYXuA1i2oHuZigVqAisjBdXG4ol3aH6xQw
         d3p7se4pkmPo4PDsA/HmJOxRKOuSKYPQdSlp0BirBKO1b4Dg+BWyU4WQSQqcwU1NwjCE
         OITQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEsWVbs3eVdU/3Fl/RLwjthzhRLcR9pT8d7DErTJ467slP70rFZyMI6cAyxGpoyTZPiv/ADYkjTjhhDaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY5bcaW9wdckovBI1NZrPj77iFm2flpGAlKlE8fp0EjrG94FIP
	eJCQJB7whm7qV3OaEFUtnFkh9PeEJndCq955mwa1J/4jfoWZX7FHhNB0
X-Gm-Gg: AfdE7cmrqCcIBmE+vEazyEQV6t3rbFUXnMikgGdB3ylgtPnG5nSM+uyktcMSI1obESR
	k6Qkm2b+T2/eoeDxskFwJ24HDdzDo5Siq4HwylVzZAJzgd2GpwyfCvFSKSqCWR2W12yjkVlElEF
	CyIwaDMQr4bmI/Pg7471qsMxTlqKjOvVVKxFKEBd0SZhnG8dLZW/YyEc35DCy7Altgq46as8xzj
	wiRieG8p5rP809RpNQ+5Dx3bzh/3EMgXWGu7BSDzXpvkysDBEBJUQkW++6DDHm2gQ6e3iBAaO+T
	7ICBeX48RkXyGbX42WRiPgqCaUGyWawRyFkp1fPddf6N98uk3Sx6ia8oT8360WfRtNvJu17xXEM
	WyCwxF3Qh3zr8QTmSFHfRRjyKghkEaVASxGmHGwa5pGjdLiW9noVzaHY3DmaEafhLB8mUVuAUJE
	NJ1X9DXX0PX3xj92s=
X-Received: by 2002:a17:90b:1812:b0:37d:f0f4:14c7 with SMTP id 98e67ed59e1d1-37dfa18f2d2mr13919094a91.3.1782721709310;
        Mon, 29 Jun 2026 01:28:29 -0700 (PDT)
Received: from martin ([2405:9800:b862:14dc:12ff:e0ff:fecd:7ddc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37fd2bd0e49sm3259343a91.0.2026.06.29.01.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 01:28:28 -0700 (PDT)
From: Martin Weiss <martin.githubacc@gmail.com>
X-Google-Original-From: Martin Weiss <Martin.weiss2410@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Martin Weiss <Martin.weiss2410@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 1/4] scripts: fix spelling mistakes
Date: Mon, 29 Jun 2026 15:28:06 +0700
Message-ID: <20260629082812.551273-1-Martin.weiss2410@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.dev,goodmis.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-13903-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:Martin.weiss2410@gmail.com,m:nathan@kernel.org,m:nsc@kernel.org,m:ihor.solodrai@linux.dev,m:ast@kernel.org,m:ardb@kernel.org,m:legion@kernel.org,m:jpoimboe@kernel.org,m:rostedt@goodmis.org,m:linux-kbuild@vger.kernel.org,m:Martinweiss2410@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[martingithubacc@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[martingithubacc@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F3886D77FC

Signed-off-by: Martin Weiss <Martin.weiss2410@gmail.com>
---
 scripts/config          | 2 +-
 scripts/link-vmlinux.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/config b/scripts/config
index ea475c07de28..dfa78cfcba67 100755
--- a/scripts/config
+++ b/scripts/config
@@ -38,7 +38,7 @@ commands:
 
 options:
 	--file config-file   .config file to change (default .config)
-	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
+	--keep-case|-k       Keep next symbols' case (don't upper-case it)
 
 $myname doesn't check the validity of the .config file. This is done at next
 make time.
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f99e196abeea..c8f27e4175f9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -38,7 +38,7 @@ is_enabled() {
 }
 
 # Nice output in kbuild format
-# Will be supressed by "make -s"
+# Will be suppressed by "make -s"
 info()
 {
 	printf "  %-7s %s\n" "${1}" "${2}"
-- 
2.54.0


