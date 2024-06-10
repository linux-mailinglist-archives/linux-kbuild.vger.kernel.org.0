Return-Path: <linux-kbuild+bounces-2046-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB79B901A28
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 07:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7135E1F217AF
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Jun 2024 05:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3FBBD27E;
	Mon, 10 Jun 2024 05:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="vhff1sVB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CECA935;
	Mon, 10 Jun 2024 05:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717996891; cv=none; b=YP4BA/A+p8oRgOz2mXfUQC+CHSI7ObuR/xMPw4GEAWKD2TlSezQ7HO/aqvqMF6aznZD+bztQY5i7Oq8wxCB0hgYS0Np5zG0KlOvdMgC1PD0RsYobPH03UybHUTWsqnmOwRG75hVT1ipCk7EtxFaarEfJUch+l8FLAE8vQBZLkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717996891; c=relaxed/simple;
	bh=nLzdTiP3EARNEnbPxQYRy79wXc10LD+pYFR32/b0o/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qaeewWr4YQATUWvJ7cpFs3hotog8k2dSzE3/Z+ktf8WQzm7SEaT1J7MeeV0lR5kkq+FigIFEbpIvKskKaqRPOWKN8fjwhlELFsxgvfbz3Iz/pQrlFPoJPR+qNqav+1O9boOpgAT3LKBSckb0g3hOgFaVPvG9qbA2vxkgr1QrkT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=vhff1sVB; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1717996887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h/XUnRjyn1afFwbgacDGxBOr6+wZiVfhFNcVw8jYbcU=;
	b=vhff1sVBl+bNStIFEgmLQkD/jxOe3xFvX+VnLvYZadWxDFU7XOBeNX5R3JoP1GTlMY/jgC
	QNdNo1HOWATkXDx/K+86Fj1BShZU07XrzZz1yXTGX14Ji4N3e9N1lfK0bfKOqlEKIsKVaJ
	LlxpHjbAscwzlnc9Kf4l89IG+0X5ehgJfyocQp6t7Xo6FEdii7xPuOr2J5MIeGnGRvYECk
	qx/aQiPTAnQZXCJSN2CRCDwVZRtBbrM6N1TZYR0GMzH2am5DHpnDlN6RpITvyBoUaQ657X
	RMfVLQsNXHOze3m2UYiJ6vSIcPfByuAyKIwjaSfH7ADH6IgBXxAJrohFlPEcWQ==
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	Diederik de Haas <didi.debian@cknow.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] kbuild: Install dtb files as 0644 in Makefile.dtbinst
Date: Mon, 10 Jun 2024 07:21:12 +0200
Message-Id: <e1fd1b659711f59c61ec48dc43912dddccbb4d92.1717996742.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

The compiled dtb files aren't executable, so install them with 0644 as their
permission mode, instead of defaulting to 0755 for the permission mode and
installing them with the executable bits set.

Some Linux distributions, including Debian, [1][2][3] already include fixes
in their kernel package build recipes to change the dtb file permissions to
0644 in their kernel packages.  These changes, when additionally propagated
into the long-term kernel versions, will allow such distributions to remove
their downstream fixes.

[1] https://salsa.debian.org/kernel-team/linux/-/merge_requests/642
[2] https://salsa.debian.org/kernel-team/linux/-/merge_requests/749
[3] https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/rules.real?ref_type=heads#L193

Cc: Diederik de Haas <didi.debian@cknow.org>
Cc: stable@vger.kernel.org
Fixes: aefd80307a05 ("kbuild: refactor Makefile.dtbinst more")
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---

Notes:
    Changes in v2:
      - Improved the patch description, to include additional details and
        to address the patch submission issues pointed out by Greg K-H [4]
      - No changes were made to the patch itself
    
    Link to v1: https://lore.kernel.org/linux-kbuild/ae087ef1715142f606ba6477ace3e4111972cf8b.1717961381.git.dsimic@manjaro.org/T/#u
    
    [4] https://lore.kernel.org/linux-kbuild/2024061006-ladylike-paving-a36b@gregkh/

 scripts/Makefile.dtbinst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
index 67956f6496a5..9d920419a62c 100644
--- a/scripts/Makefile.dtbinst
+++ b/scripts/Makefile.dtbinst
@@ -17,7 +17,7 @@ include $(srctree)/scripts/Kbuild.include
 dst := $(INSTALL_DTBS_PATH)
 
 quiet_cmd_dtb_install = INSTALL $@
-      cmd_dtb_install = install -D $< $@
+      cmd_dtb_install = install -D -m 0644 $< $@
 
 $(dst)/%: $(obj)/%
 	$(call cmd,dtb_install)

