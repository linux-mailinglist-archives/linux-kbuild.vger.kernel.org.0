Return-Path: <linux-kbuild+bounces-12429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MM8eN2sLzGnGNgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12429-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:59:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D12436F91C
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:59:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28BD130A6BF0
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 17:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F4244105C;
	Tue, 31 Mar 2026 17:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="I+U7IW49"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F9C441037;
	Tue, 31 Mar 2026 17:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979428; cv=none; b=eR4C66MrNiNhtP2nqss3pXcBewycl1r2rJQVBSHhi/hEm1nnvOuLClrHR7oWtN2oOSqupl6aRwClUxaaZwiHzMIc9oXD44nSu51jdelRdFokWOED15GjdFPFoF/8ie/kW6U7mGUqki/C7fb/sKMPGehAKwX7CNVjbOGIV7r26B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979428; c=relaxed/simple;
	bh=hLUz8zQGrUGwTqqMl4TF4YPgdp0E2S0+yu6rruoAxx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NjPG5SitS0gjQGFXGSl56aMq9YKk2M5volXNuOVCHj50KmX3Ag3SO4d5Oob70ZdVJ12OsYCbOdtVtE0q1iwQZwyuK2xBoCpZDoCXJoaPi4f40kesI1e/nxCUe6B7l/QWDQy35CqgYlWh5gvJmOdqMMo7P7r9VJlMUI/DyNevZGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=I+U7IW49; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774979424;
	bh=hLUz8zQGrUGwTqqMl4TF4YPgdp0E2S0+yu6rruoAxx4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I+U7IW49M/DAk8IEMbSJqPr+RqE2WmjCxC4oVerAX1KA4m3YZ1YRF0wfARM6owdVQ
	 tvv0VZO5fOvfU8UgSzv0DPlU0G7U602GamfVOT4TV1JnMjuYy3bKKdNQ2rayEsYPzT
	 lejhStr4wwIKOHVasj4L19uVlCmlc88A+hYQUt2c=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 31 Mar 2026 19:50:21 +0200
Subject: [PATCH v2 3/4] kbuild: vdso_install: gracefully handle images
 without build ID
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260331-kbuild-vdso-install-v2-3-606d0dc6beca@weissschuh.net>
References: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
In-Reply-To: <20260331-kbuild-vdso-install-v2-0-606d0dc6beca@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774979424; l=952;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=hLUz8zQGrUGwTqqMl4TF4YPgdp0E2S0+yu6rruoAxx4=;
 b=0AQ7iiaWEAS7ng1Y5vuCUtOdXvP9RQ2+GY5wK54taKBVWEIP7I1ct5c2Pimd7f6t1/dk9Siaa
 Zxom03mJwioAtI1nG6UDsFgBTWK2s6pNYwK2gJRfyzf5V1+IbahEs7Z
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12429-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,p:email]
X-Rspamd-Queue-Id: 4D12436F91C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the vDSO does not contain a build ID, skip the symlink step.
This will allow the removal of the explicit list of architectures.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
---
 scripts/Makefile.vdsoinst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/Makefile.vdsoinst b/scripts/Makefile.vdsoinst
index aed153b3120b..3de70218b8d4 100644
--- a/scripts/Makefile.vdsoinst
+++ b/scripts/Makefile.vdsoinst
@@ -22,12 +22,15 @@ $$(dest): $(1) FORCE
 # Some architectures create .build-id symlinks
 ifneq ($(filter arm s390 sparc x86, $(SRCARCH)),)
 build-id-file := $$(shell $(READELF) -n $(1) 2>/dev/null | sed -n 's@^.*Build ID: \(..\)\(.*\)@\1/\2@p')
+
+ifneq ($$(build-id-file),)
 link := $(install-dir)/.build-id/$$(build-id-file).debug
 
 __default: $$(link)
 $$(link): $$(dest) FORCE
 	$$(call cmd,symlink)
 endif
+endif
 
 endef
 

-- 
2.53.0


