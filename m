Return-Path: <linux-kbuild+bounces-12096-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBqkGep5vWmt9wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12096-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 17:46:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F301A2DDEE6
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 17:46:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3AED30774E3
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 16:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906DA3D0905;
	Fri, 20 Mar 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Zr+JLcBL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24489396B8E;
	Fri, 20 Mar 2026 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024636; cv=none; b=Pciu6lnhjgQ17uFH8589WJmHc11uPPPh7Ow8X27K/sJaAlr8TZOYiz/FtPFWO18f4mzIfiKI2+mUZ0OIjNeN1i7vSXs9IU1D3d/sKy1bF+Ht2ziifiQRALzSGXZnXkSE4kiwD5MMQxWjbu0A+0qFL0ynrPnOI5rArLWSTfZVL9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024636; c=relaxed/simple;
	bh=QcShHZHc+tDp046nhF8W6wfNbh7KqWcOgXW9rqyFKIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXnyLDwmPhHYXbiWJUhA91Wgq3o+dBw6QkGEujCUn/BVQhfgz837QrDl0uXFHdg4EwP7Vsui94xBTQhhX3SfKulGilRGOvlG8WFg1tupxqJz3GJlCNOEla7l0V4+ZdUIeqhEI5DcBa4SG4sVwtXHJF/aPxsFXct7Ro7fWbv3CN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Zr+JLcBL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774024624;
	bh=QcShHZHc+tDp046nhF8W6wfNbh7KqWcOgXW9rqyFKIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zr+JLcBLyrk41rEUJMfqmUiaeE7nX0WeUP15YUj5AnOkdl8ak8j0C6jXdSfYtLKrC
	 pxoHstCZCqSIOSg3MRJG0mzn7158C/FcOSRWhR1Xe51lN6mHwv5H3fnO/z7+XBvEo5
	 b8CXagWbQWcMoUW0uyzU6Y/huo7/pBDgnd3CJBJ0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 20 Mar 2026 17:36:55 +0100
Subject: [PATCH 3/4] kbuild: vdso_install: gracefully handle images without
 build ID
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260320-kbuild-vdso-install-v1-3-e2e8a0970889@weissschuh.net>
References: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
In-Reply-To: <20260320-kbuild-vdso-install-v1-0-e2e8a0970889@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774024622; l=907;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=QcShHZHc+tDp046nhF8W6wfNbh7KqWcOgXW9rqyFKIA=;
 b=+rCzIO3AAOyfz7rj+wA+jJSybrcyzn/iDtqMemUFlzrS5ne+6bwBfbIMuPymaynN7rXKnXvmy
 /4HXENEB5EXDNRvxtqh81DVIAtW3u/mtXB3ppBV+x/O3cIOlF7hU6WQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12096-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,weissschuh.net:dkim,weissschuh.net:email,weissschuh.net:mid]
X-Rspamd-Queue-Id: F301A2DDEE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If the vDSO does not contains a build ID, skip the symlink step.
This will allow the removal of the explicit list of architectures.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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


