Return-Path: <linux-kbuild+bounces-530-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF0882C0CD
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 14:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08391F22635
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jan 2024 13:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A1A6D1A8;
	Fri, 12 Jan 2024 13:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="T3qA3z5I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A586D1A4;
	Fri, 12 Jan 2024 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705065680;
	bh=sPz7qlYsrHlq3cCOtHZi7BOxHqEKVr3tJDgaD7Qlm4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T3qA3z5IeURvAorefJ8yBC9ViApTUBJv7sEOilZu1dK9dPr99ixr/x5svUv3Yc5xQ
	 j3hW3cAO3CKI73X3LCB6LyfIviNFq8IOOCkJWSj/b2SDVr2KH3hNsm7Ks6P1SZBvK2
	 sHkvvm2bN8OLRPTVc2UU3pRk+0hveFvAsNqDv5PE7yX+xfeHVsqKVEqCwVLplS2YvO
	 YRFiZbvuNUZ/5cV5CyYuYP1iRikzbXEmE/gwzMfWZr3G2RpxOHEcEgYNDcvvsGWQ3l
	 DmdrGOnVYVpVKwkpAfd/G2poivJI35vMzqBeQl3vaySdsB3fhd/tFdCeVSADM1Ktlk
	 h8PtR3BdBI3RA==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 685293782032;
	Fri, 12 Jan 2024 13:21:15 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chrome-platform@lists.linux.dev,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Abhijit Gangurde <abhijit.gangurde@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] firmware: coreboot: Generate aliases for coreboot modules
Date: Fri, 12 Jan 2024 10:18:31 -0300
Message-ID: <20240112131857.900734-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112131857.900734-1-nfraprado@collabora.com>
References: <20240112131857.900734-1-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Generate aliases for coreboot modules to allow automatic module probing.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

(no changes since v1)

 include/linux/mod_devicetable.h   |  8 ++++++++
 scripts/mod/devicetable-offsets.c |  3 +++
 scripts/mod/file2alias.c          | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index f458469c5ce5..24e0dcfde809 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -960,4 +960,12 @@ struct vchiq_device_id {
 	char name[32];
 };
 
+/**
+ * struct coreboot_device_id - Identifies a coreboot table entry
+ * @tag: tag ID
+ */
+struct coreboot_device_id {
+	__u32 tag;
+};
+
 #endif /* LINUX_MOD_DEVICETABLE_H */
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index e91a3c38143b..518200813d4e 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -274,5 +274,8 @@ int main(void)
 	DEVID(vchiq_device_id);
 	DEVID_FIELD(vchiq_device_id, name);
 
+	DEVID(coreboot_device_id);
+	DEVID_FIELD(coreboot_device_id, tag);
+
 	return 0;
 }
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 4829680a0a6d..5d1c61fa5a55 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1494,6 +1494,15 @@ static int do_vchiq_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
+/* Looks like: coreboot:tN */
+static int do_coreboot_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD(symval, coreboot_device_id, tag);
+	sprintf(alias, "coreboot:t%08X", tag);
+
+	return 1;
+}
+
 /* Does namelen bytes of name exactly match the symbol? */
 static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 {
@@ -1575,6 +1584,7 @@ static const struct devtable devtable[] = {
 	{"ishtp", SIZE_ishtp_device_id, do_ishtp_entry},
 	{"cdx", SIZE_cdx_device_id, do_cdx_entry},
 	{"vchiq", SIZE_vchiq_device_id, do_vchiq_entry},
+	{"coreboot", SIZE_coreboot_device_id, do_coreboot_entry},
 };
 
 /* Create MODULE_ALIAS() statements.
-- 
2.43.0


