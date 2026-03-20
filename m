Return-Path: <linux-kbuild+bounces-12094-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CKyVOMV3vWmt9wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12094-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 17:37:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 818A22DD88A
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 17:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEE473021942
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 16:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B88E3BADBE;
	Fri, 20 Mar 2026 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jXlMqN08"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FB136EAB7;
	Fri, 20 Mar 2026 16:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024635; cv=none; b=rSMvMsURkXGejSDpNeC4LBPi0+qxI9ZOgb1aTBVD9MRkgmcrdYialk7pv6AzyefTSRTBsdpdxcRq7Vm5B5ewsqB3OO6Ero2azXDCWx3fIq5g9eZDlshkwCiNBHZYkE1U5AfxSox3by3ZWbxCZDdQuKEttZcd+1GulsV8aL2WLvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024635; c=relaxed/simple;
	bh=pQT18p/Gj2K2MK50nKuJlIsVs4WndTCIDjP8Wc+ce9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nP1n0crZGHZYr5T6jaox6LR0l49aA8fdHWgbQNF6BzjI/UUfhcFiYBQ4mZ9flyl/opNBy8GxJJbwBLHsfiW979KVA5G8I29qoetecZfOfpN9DwVMXYKkbbSMpkAr2ECgYW5VdqAPJe8TwhAon/3hakaInM4OrepSGkYpwZ9eXgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jXlMqN08; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774024624;
	bh=pQT18p/Gj2K2MK50nKuJlIsVs4WndTCIDjP8Wc+ce9E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jXlMqN080YrKoZyqUxrtuDUa4qCNX36+vUh0nFe/GL75zWkk1tHodO2fgI+pwzgUJ
	 yDRZ+7A/ZHYnXkIRSQFZOote4JlEfDeYDB1IJKaM5m+mexCtw57LWXjr8RI7oPONGy
	 HaAl4qVGFR5US4SuP7XIe6/GqC+Zh15K6fU6UYew=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 20 Mar 2026 17:36:56 +0100
Subject: [PATCH 4/4] kbuild: vdso_install: drop build ID architecture
 allow-list
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-kbuild-vdso-install-v1-4-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
In-Reply-To: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774024622; l=1035;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=pQT18p/Gj2K2MK50nKuJlIsVs4WndTCIDjP8Wc+ce9E=;
 b=058gaN/V/PXUffgDVFBErADMGwFJioG82+BeWp6rcwgp/II7ii29fqPxB90UceLe5S7C7rcSB
 s1+yFYHFRWrDOaI3E5Ywu0t47qFPMBLJYAOPEt7XLc/aUvD1W83x70z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12094-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Queue-Id: 818A22DD88A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Many architectures which do generate build IDs are missing from this
list. For example arm64, riscv, loongarch, mips.

Now that errors from readelf and binaries without any build ID are
handled gracefully, the allow-list is not necessary anymore, drop it.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/Makefile.vdsoinst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index 3de70218b8d4..d9f7243217bc 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -19,8 +19,6 @@ __default: $$(dest)
 $$(dest): $(1) FORCE
 	$$(call cmd,install)
 
-# Some architectures create .build-id symlinks
-ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
 build-id-file := $$(shell $(READELF) -n $(1) 2>/dev/null | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
 
 ifneq ($$(build-id-file),)
@@ -30,7 +28,6 @@ __default: $$(link)
 $$(link): $$(dest) FORCE
 	$$(call cmd,symlink)
 endif
-endif
 
 endef
 

-- 
2.53.0


