Return-Path: <linux-kbuild+bounces-2017-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6A8FE7FC
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 15:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48F67285F27
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Jun 2024 13:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE9D19644E;
	Thu,  6 Jun 2024 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1O06Use"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D781D19644C;
	Thu,  6 Jun 2024 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717680981; cv=none; b=Rqp7GOgNaeRbcQlx9QNbPcNJ7D1NryR1h3gvbWk55QG5Wcnwsvxc/IaqlazF0fTAwc9S2OKguhPVQKkETS4M9KJfR1QLIinPMgHBBPkui2wpRrLl3UDLgLDGVM+SulrSj8mMwrWPrfJudCA0F5bWXSNXgzX9YFPP2QkxCIZYU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717680981; c=relaxed/simple;
	bh=MM6fkK8XHPM0718xjZqOzva4JDdePDF+AbiQ7dw5a7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UgsUfwrE1qaCcgpm4hyQdFDbkqwc/3WW1eLcsdyIVp2DRcYean/RsVnv1nTlJKeCRZ4AJ+6zpRtzI05P2jl4ID+ARRp8/5aSkah14+0MQSVSxxdin4DjbR82ygQh3riCpe6J2sxN/2Ilf7t7daXul3bXIBI4Bo76YFdszXl2WNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1O06Use; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6BB0C2BD10;
	Thu,  6 Jun 2024 13:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717680981;
	bh=MM6fkK8XHPM0718xjZqOzva4JDdePDF+AbiQ7dw5a7M=;
	h=From:To:Cc:Subject:Date:From;
	b=K1O06UseC055ZhGFRluqlbSzmMQBEQAPMxFY+PmTyF+Z7A4YA2qoLiX/e0dfHt9/i
	 0HQW2ODRjikdjWd6pfHgiMUY2WDhSeTJ2/QEmK48t9GrsG2y20/amNjTW6C5tF87C4
	 InSfk2oJ/+ys+PrPaccHMYqONAVw9r9wD/9HGnx7ZZgP3S1y/hXaOxQFXaFmtP40hB
	 elAx9C2zW/OOCMmVLji3DmRXnXth8AjEcuLuwiKiqnG5q0pFOG1Yu0VytE/xDSIgTE
	 smRtTye7falKPwEAQoPsXY2MNsuChXIC56YWbi5Vkx2CrF96V/tezQF1DXhKzsf3Xx
	 Ms18IJ+uQQMcA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: alsa-devel@alsa-project.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] slimbus: generate MODULE_ALIAS() from MODULE_DEVICE_TABLE()
Date: Thu,  6 Jun 2024 22:36:14 +0900
Message-ID: <20240606133615.986035-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 9e663f4811c6 ("slimbus: core: add support to uevent") added the
MODALIAS=slim:* uevent variable, but modpost does not generate the
corresponding MODULE_ALIAS().

To support automatic module loading, slimbus drivers still need to
manually add MODULE_ALIAS("slim:<manf_id>:<prod_code>:*"), as seen in
sound/soc/codecs/wcd9335.c.

To automate this, make modpost generate the proper MODULE_ALIAS() from
MODULE_DEVICE_TABLE(slim, ).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/devicetable-offsets.c |  4 ++++
 scripts/mod/file2alias.c          | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 518200813d4e..9c7b404defbd 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -153,6 +153,10 @@ int main(void)
 	DEVID_FIELD(i3c_device_id, part_id);
 	DEVID_FIELD(i3c_device_id, extra_info);
 
+	DEVID(slim_device_id);
+	DEVID_FIELD(slim_device_id, manf_id);
+	DEVID_FIELD(slim_device_id, prod_code);
+
 	DEVID(spi_device_id);
 	DEVID_FIELD(spi_device_id, name);
 
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 5d1c61fa5a55..99dce93a4188 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -960,6 +960,16 @@ static int do_i3c_entry(const char *filename, void *symval,
 	return 1;
 }
 
+static int do_slim_entry(const char *filename, void *symval, char *alias)
+{
+	DEF_FIELD(symval, slim_device_id, manf_id);
+	DEF_FIELD(symval, slim_device_id, prod_code);
+
+	sprintf(alias, "slim:%x:%x:*", manf_id, prod_code);
+
+	return 1;
+}
+
 /* Looks like: spi:S */
 static int do_spi_entry(const char *filename, void *symval,
 			char *alias)
@@ -1555,6 +1565,7 @@ static const struct devtable devtable[] = {
 	{"rpmsg", SIZE_rpmsg_device_id, do_rpmsg_entry},
 	{"i2c", SIZE_i2c_device_id, do_i2c_entry},
 	{"i3c", SIZE_i3c_device_id, do_i3c_entry},
+	{"slim", SIZE_slim_device_id, do_slim_entry},
 	{"spi", SIZE_spi_device_id, do_spi_entry},
 	{"dmi", SIZE_dmi_system_id, do_dmi_entry},
 	{"platform", SIZE_platform_device_id, do_platform_entry},
-- 
2.43.0


