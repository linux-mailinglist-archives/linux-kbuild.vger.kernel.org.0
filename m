Return-Path: <linux-kbuild+bounces-4490-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2289BA573
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 13:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D676C1F21808
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Nov 2024 12:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789221632E0;
	Sun,  3 Nov 2024 12:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMNY2Lj9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F712A50;
	Sun,  3 Nov 2024 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730638129; cv=none; b=Qr457aQlqA2b5YBVCcEC6l5Jy1Ke1OJDTJPyOI0joHI6Yg6fDrfJ3WPg89He0+mDYgGfbMKuIBi7pd2xgqReG3xV/GsVniDMgUlQz7uhlA7g0RDOGc8qPGEreiXhPzJbDEh9MIG2HmuvbF0eBwKrL2FwOMHhrphBl3aYJkujFPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730638129; c=relaxed/simple;
	bh=yRsc704e28gilI0jtwvNSgF3XyPJU6SssUGWiEtSHs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zu/tx+1qf/goDfjxQ79aUOe1BkUB8NwvDDTkYZKvkto2QqiJsBj6JB+zZa4WWpnySMZEutIp5qJUblAc506zE3BgEUaCr48pKyE3Zvj6ROl8UIl8dX2NwBA5VEx5qJnvfmPlz18rK+bJs34rm1lcMjR4eIWz3sKbT2nMBSWZLuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMNY2Lj9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AEFC4CECD;
	Sun,  3 Nov 2024 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730638128;
	bh=yRsc704e28gilI0jtwvNSgF3XyPJU6SssUGWiEtSHs8=;
	h=From:To:Cc:Subject:Date:From;
	b=sMNY2Lj9JG0AdiuMN4x1w5VJyc8P0nXInPsdQ0lgpx/UGdW6oCF0AIX4FM7DxW2Sr
	 wbkmUzNEjL9hWeva+b7r5BoRioR8Nikpw6zgihQlyLztkKDVpDsx3H0iYjEt9JsFS5
	 jQyEVF1yotCNZTnPFk0TGL3X2M3lS1d9b9hzGNqIWg+UDIGd5GmUF+oypO3AZ9/85W
	 wBgWTaJo3XkNRuB1x8b3hZDVQCsEANKGmxn65Yz8g/MKIiUytehbH03EEQOPUDnrom
	 0XF1a12M+CUbtFo0WXPtlk//PEHdlcYNyfKJ8xmTAmybV0rFXBEtiieaU3a/L/M9R6
	 q8h5IlqRL1Iqw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	"Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] modpost: fix acpi MODULE_DEVICE_TABLE built with mismatched endianness
Date: Sun,  3 Nov 2024 21:46:50 +0900
Message-ID: <20241103124824.943659-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When CONFIG_SATA_AHCI_PLATFORM=m, modpost outputs incorect MODULE_ALIAS()
if the endianness of the target and the build machine do not match.

When the endianness of the target kernel and the build machine match,
the output is correct:

  $ grep 'MODULE_ALIAS("acpi' drivers/ata/ahci_platform.mod.c
  MODULE_ALIAS("acpi*:APMC0D33:*");
  MODULE_ALIAS("acpi*:010601:*");

However, when building a little-endian kernel on a big-endian machine
(or vice versa), the output is incorrect:

  $ grep 'MODULE_ALIAS("acpi' drivers/ata/ahci_platform.mod.c
  MODULE_ALIAS("acpi*:APMC0D33:*");
  MODULE_ALIAS("acpi*:0601??:*");

The 'cls' and 'cls_msk' fields are 32-bit.

DEF_FIELD() must be used instead of DEF_FIELD_ALIAS() to correctly handle
endianness of these 32-bit fields.

The check 'if (cls)' was unnecessary; it never became NULL, as it was the
pointer to 'symval' plus the offset to the 'cls' field.

Fixes: 26095a01d359 ("ACPI / scan: Add support for ACPI _CLS device matching")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 99dce93a4188..16154449dde1 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -567,12 +567,12 @@ static int do_acpi_entry(const char *filename,
 			void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, acpi_device_id, id);
-	DEF_FIELD_ADDR(symval, acpi_device_id, cls);
-	DEF_FIELD_ADDR(symval, acpi_device_id, cls_msk);
+	DEF_FIELD(symval, acpi_device_id, cls);
+	DEF_FIELD(symval, acpi_device_id, cls_msk);
 
 	if (id && strlen((const char *)*id))
 		sprintf(alias, "acpi*:%s:*", *id);
-	else if (cls) {
+	else {
 		int i, byte_shift, cnt = 0;
 		unsigned int msk;
 
@@ -580,10 +580,10 @@ static int do_acpi_entry(const char *filename,
 		cnt = 6;
 		for (i = 1; i <= 3; i++) {
 			byte_shift = 8 * (3-i);
-			msk = (*cls_msk >> byte_shift) & 0xFF;
+			msk = (cls_msk >> byte_shift) & 0xFF;
 			if (msk)
 				sprintf(&alias[cnt], "%02x",
-					(*cls >> byte_shift) & 0xFF);
+					(cls >> byte_shift) & 0xFF);
 			else
 				sprintf(&alias[cnt], "??");
 			cnt += 2;
-- 
2.43.0


