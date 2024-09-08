Return-Path: <linux-kbuild+bounces-3478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFAB9707BD
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 15:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BB3D1C20A64
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Sep 2024 13:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285DA16938C;
	Sun,  8 Sep 2024 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="UrJ2XWrr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C53167296;
	Sun,  8 Sep 2024 13:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725801988; cv=none; b=Kk/UHue53S+0TewGSowP2FpG33nKO0mUL5J2lpb3bZNdU+c3E7VdAiZKE3ZNyyLGM6zpAzvt1Y4n3H+h4LGdXnkmmWG3Nq8aPyMVMSsgDgvCp+wvBuxz7ASxzdr9EiYF2VKcvBz/JhlG5MZexxBOoYQCdhnIGbfCfchsNiYWojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725801988; c=relaxed/simple;
	bh=VDWtvNE3uEvsK6/pNswP0Jk8jyvAO95n8sbNuTrPdrg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oxFhhil7SZWGFnIl5dvtt7nNkzWhg6oVkjncsoYsA4wfzozFiUfkSxlkzmWLEWeOdNhRoR/dTN/sEL/RFvYF4ssUpsprxMQy0rmx3P/fB5su5b/Bdue+9l7PNYvZ7GVHAXuI3bhh8M/72WYT5IfS9Pj1X1HT0JXwLVfUMlH7AwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=UrJ2XWrr; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1725801970;
	bh=VDWtvNE3uEvsK6/pNswP0Jk8jyvAO95n8sbNuTrPdrg=;
	h=From:Date:Subject:To:Cc:From;
	b=UrJ2XWrr++DPK3Be2DUhS1AzkOzoC3yxJB6VrKriVM7E4fjzD7toRsAuHFvhA19my
	 LrtiuteDMhubxgT4XCydK3BLE9Z6XlllS0AN2tvZQ9gvA7cuOjl353FCeECiXRlFoM
	 HWPXqVVEkRfdDjSuo5qOwFZdrzv2SZ7kI4eojbNE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Sep 2024 15:26:00 +0200
Subject: [PATCH] kbuild: remove append operation on cmd_ld_ko_o
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240908-kbuild-cmd_ld_ko_o-v1-1-a4afc3c2d47a@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAOel3WYC/x3MTQqAIBBA4avErBPMDKyrREg2Uw39GEoRRHdPW
 n6L9x6IFJgiNNkDgS6O7PeEIs9gmPt9IsGYDEoqLWtpxOJOXlEMG9oV7eKtF6pyqGtXGk0GUng
 EGvn+p233vh/KNgroZAAAAA==
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725801970; l=1267;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=VDWtvNE3uEvsK6/pNswP0Jk8jyvAO95n8sbNuTrPdrg=;
 b=6VSS7sz9eqxyOWJIlyP4dPFm6VN6Zm5WWi29cjAbQva7ICXJ0IMRP5VCh4zyPzTKc8+5DUo4T
 PIs1b2GfJKRAonT6HIveNWV3lXPgF9zPFiFrVujvj9mG1ipvOrCndrd
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The append operation was introduced in
commit b1a1a1a09b46 ("kbuild: lto: postpone objtool")
when the command was created from two parts.
In commit 850ded46c642 ("kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG")
however the first part was removed again, making the append operation
unnecessary.

To keep this command definition aligned with all other command
definitions, remove the append again.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/Makefile.modfinal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 6b1b72257b29..1482884ec3ca 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -34,7 +34,7 @@ $(extmod_prefix).module-common.o: $(srctree)/scripts/module-common.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
 quiet_cmd_ld_ko_o = LD [M]  $@
-      cmd_ld_ko_o +=							\
+      cmd_ld_ko_o =							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
 		-T scripts/module.lds -o $@ $(filter %.o, $^)

---
base-commit: 4dda2081d84398248af60da1d519840a5d6e3390
change-id: 20240908-kbuild-cmd_ld_ko_o-25bd49b384e8

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


