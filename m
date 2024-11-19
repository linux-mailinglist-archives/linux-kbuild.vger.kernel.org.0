Return-Path: <linux-kbuild+bounces-4738-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1B9D3127
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A938BB23DFE
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842BC1D7E4B;
	Tue, 19 Nov 2024 23:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HggBjD60"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C87F1D7E47;
	Tue, 19 Nov 2024 23:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060639; cv=none; b=RQmubMEkSP9ggNCP5dBueTN7xrVLD4lKIViOb/c6uJA4uQuyLF1YoIDJ6gU1pO7FULD4TEtENHvB1Tp9KtK5As51T+cR2TjntDO56Tq3i+Ju+wszfF9SPMfSFCD6RYigLX0LiSRMSGhH+cd5X3r6Hl/Y0sOFd4UZRKbVtUi7pXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060639; c=relaxed/simple;
	bh=CR5Bppza/lggdlCjRZio/vpsySOKuiI1gV6rUVBisr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxu7tnSxjgpdyA3bQJgg+Hy/20aL+GTyQVC2XUx6AEeKinZVSAa8L0C4bCVZertEODWkP+PmZTjTasI4F5+nvQNY54FjYWp6tmJ7hQHCfVUqqqsYlTLSlzvCRcj8R9WIyvFsY4EoHS4DForoDh0scfU6HwMGi6+D1Htzm6sHwCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HggBjD60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E05C4CED2;
	Tue, 19 Nov 2024 23:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060639;
	bh=CR5Bppza/lggdlCjRZio/vpsySOKuiI1gV6rUVBisr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HggBjD60Cny162DiszIW+ujn9nLcvw21jDmfDkMrbelgsXbSX4JBoziMWLxMuVWCM
	 f9YG82R4cc0/NzAflcpcreinYUxm33tYWrkhfUTXUBqg068EBMuSEjvXvueDYQVMhp
	 vu+njx2RMbQ07esgYTe6Hz4MJKQo/HZxQL1rCfePo2wgvHKKLmvSPcEf9/wGgJ2Lqu
	 q3Nh697O+ylc8hPdwNBSPEE+4Rag84cH9EcfAWiGoa9m/pu9MkGQDKRDEXzvjQWjO+
	 9/In4VHRJuCjXAWIoDb2QkRnIiziQtmXbFYW5uV/5NRvZfgcmfrnMd4X1+1mE3rVeR
	 QaJmbyG516LMw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/15] modpost: pass (struct module *) to do_*_entry() functions
Date: Wed, 20 Nov 2024 08:56:44 +0900
Message-ID: <20241119235705.1576946-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119235705.1576946-1-masahiroy@kernel.org>
References: <20241119235705.1576946-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the first argument with a pointer to struct module.

'filename' can be replaced with mod->name.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 118 +++++++++++++++++++--------------------
 1 file changed, 59 insertions(+), 59 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index d34cf418ba70..57385cdfd773 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -124,7 +124,7 @@ typedef struct {
 struct devtable {
 	const char *device_id; /* name of table, __mod_<name>__*_device_table. */
 	unsigned long id_size;
-	int (*do_entry)(const char *filename, void *symval, char *alias);
+	int (*do_entry)(struct module *mod, void *symval, char *alias);
 };
 
 /* Size of alias provided to do_entry functions */
@@ -450,7 +450,7 @@ static void do_of_table(void *symval, unsigned long size,
 }
 
 /* Looks like: hid:bNvNpN */
-static int do_hid_entry(const char *filename,
+static int do_hid_entry(struct module *mod,
 			     void *symval, char *alias)
 {
 	DEF_FIELD(symval, hid_device_id, bus);
@@ -468,7 +468,7 @@ static int do_hid_entry(const char *filename,
 }
 
 /* Looks like: ieee1394:venNmoNspNverN */
-static int do_ieee1394_entry(const char *filename,
+static int do_ieee1394_entry(struct module *mod,
 			     void *symval, char *alias)
 {
 	DEF_FIELD(symval, ieee1394_device_id, match_flags);
@@ -492,7 +492,7 @@ static int do_ieee1394_entry(const char *filename,
 }
 
 /* Looks like: pci:vNdNsvNsdNbcNscNiN or <prefix>_pci:vNdNsvNsdNbcNscNiN. */
-static int do_pci_entry(const char *filename,
+static int do_pci_entry(struct module *mod,
 			void *symval, char *alias)
 {
 	/* Class field can be divided into these three. */
@@ -536,7 +536,7 @@ static int do_pci_entry(const char *filename,
 	    || (subclass_mask != 0 && subclass_mask != 0xFF)
 	    || (interface_mask != 0 && interface_mask != 0xFF)) {
 		warn("Can't handle masks in %s:%04X\n",
-		     filename, class_mask);
+		     mod->name, class_mask);
 		return 0;
 	}
 
@@ -548,7 +548,7 @@ static int do_pci_entry(const char *filename,
 }
 
 /* looks like: "ccw:tNmNdtNdmN" */
-static int do_ccw_entry(const char *filename,
+static int do_ccw_entry(struct module *mod,
 			void *symval, char *alias)
 {
 	DEF_FIELD(symval, ccw_device_id, match_flags);
@@ -571,7 +571,7 @@ static int do_ccw_entry(const char *filename,
 }
 
 /* looks like: "ap:tN" */
-static int do_ap_entry(const char *filename,
+static int do_ap_entry(struct module *mod,
 		       void *symval, char *alias)
 {
 	DEF_FIELD(symval, ap_device_id, dev_type);
@@ -581,7 +581,7 @@ static int do_ap_entry(const char *filename,
 }
 
 /* looks like: "css:tN" */
-static int do_css_entry(const char *filename,
+static int do_css_entry(struct module *mod,
 			void *symval, char *alias)
 {
 	DEF_FIELD(symval, css_device_id, type);
@@ -591,7 +591,7 @@ static int do_css_entry(const char *filename,
 }
 
 /* Looks like: "serio:tyNprNidNexN" */
-static int do_serio_entry(const char *filename,
+static int do_serio_entry(struct module *mod,
 			  void *symval, char *alias)
 {
 	DEF_FIELD(symval, serio_device_id, type);
@@ -616,7 +616,7 @@ static int do_serio_entry(const char *filename,
  *       or _CLS. Also, bb, ss, and pp can be substituted with ??
  *       as don't care byte.
  */
-static int do_acpi_entry(const char *filename,
+static int do_acpi_entry(struct module *mod,
 			void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, acpi_device_id, id);
@@ -703,7 +703,7 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 }
 
 /* Looks like: pcmcia:mNcNfNfnNpfnNvaNvbNvcNvdN. */
-static int do_pcmcia_entry(const char *filename,
+static int do_pcmcia_entry(struct module *mod,
 			   void *symval, char *alias)
 {
 	unsigned int i;
@@ -739,7 +739,7 @@ static int do_pcmcia_entry(const char *filename,
 	return 1;
 }
 
-static int do_vio_entry(const char *filename, void *symval,
+static int do_vio_entry(struct module *mod, void *symval,
 		char *alias)
 {
 	char *tmp;
@@ -771,7 +771,7 @@ static void do_input(char *alias,
 }
 
 /* input:b0v0p0e0-eXkXrXaXmXlXsXfXwX where X is comma-separated %02X. */
-static int do_input_entry(const char *filename, void *symval,
+static int do_input_entry(struct module *mod, void *symval,
 			  char *alias)
 {
 	DEF_FIELD(symval, input_device_id, flags);
@@ -828,7 +828,7 @@ static int do_input_entry(const char *filename, void *symval,
 	return 1;
 }
 
-static int do_eisa_entry(const char *filename, void *symval,
+static int do_eisa_entry(struct module *mod, void *symval,
 		char *alias)
 {
 	DEF_FIELD_ADDR(symval, eisa_device_id, sig);
@@ -837,7 +837,7 @@ static int do_eisa_entry(const char *filename, void *symval,
 }
 
 /* Looks like: parisc:tNhvNrevNsvN */
-static int do_parisc_entry(const char *filename, void *symval,
+static int do_parisc_entry(struct module *mod, void *symval,
 		char *alias)
 {
 	DEF_FIELD(symval, parisc_device_id, hw_type);
@@ -856,7 +856,7 @@ static int do_parisc_entry(const char *filename, void *symval,
 }
 
 /* Looks like: sdio:cNvNdN. */
-static int do_sdio_entry(const char *filename,
+static int do_sdio_entry(struct module *mod,
 			void *symval, char *alias)
 {
 	DEF_FIELD(symval, sdio_device_id, class);
@@ -872,7 +872,7 @@ static int do_sdio_entry(const char *filename,
 }
 
 /* Looks like: ssb:vNidNrevN. */
-static int do_ssb_entry(const char *filename,
+static int do_ssb_entry(struct module *mod,
 			void *symval, char *alias)
 {
 	DEF_FIELD(symval, ssb_device_id, vendor);
@@ -888,7 +888,7 @@ static int do_ssb_entry(const char *filename,
 }
 
 /* Looks like: bcma:mNidNrevNclN. */
-static int do_bcma_entry(const char *filename,
+static int do_bcma_entry(struct module *mod,
 			 void *symval, char *alias)
 {
 	DEF_FIELD(symval, bcma_device_id, manuf);
@@ -906,7 +906,7 @@ static int do_bcma_entry(const char *filename,
 }
 
 /* Looks like: virtio:dNvN */
-static int do_virtio_entry(const char *filename, void *symval,
+static int do_virtio_entry(struct module *mod, void *symval,
 			   char *alias)
 {
 	DEF_FIELD(symval, virtio_device_id, device);
@@ -926,7 +926,7 @@ static int do_virtio_entry(const char *filename, void *symval,
  * in the name.
  */
 
-static int do_vmbus_entry(const char *filename, void *symval,
+static int do_vmbus_entry(struct module *mod, void *symval,
 			  char *alias)
 {
 	int i;
@@ -943,7 +943,7 @@ static int do_vmbus_entry(const char *filename, void *symval,
 }
 
 /* Looks like: rpmsg:S */
-static int do_rpmsg_entry(const char *filename, void *symval,
+static int do_rpmsg_entry(struct module *mod, void *symval,
 			  char *alias)
 {
 	DEF_FIELD_ADDR(symval, rpmsg_device_id, name);
@@ -953,7 +953,7 @@ static int do_rpmsg_entry(const char *filename, void *symval,
 }
 
 /* Looks like: i2c:S */
-static int do_i2c_entry(const char *filename, void *symval,
+static int do_i2c_entry(struct module *mod, void *symval,
 			char *alias)
 {
 	DEF_FIELD_ADDR(symval, i2c_device_id, name);
@@ -962,7 +962,7 @@ static int do_i2c_entry(const char *filename, void *symval,
 	return 1;
 }
 
-static int do_i3c_entry(const char *filename, void *symval,
+static int do_i3c_entry(struct module *mod, void *symval,
 			char *alias)
 {
 	DEF_FIELD(symval, i3c_device_id, match_flags);
@@ -980,7 +980,7 @@ static int do_i3c_entry(const char *filename, void *symval,
 	return 1;
 }
 
-static int do_slim_entry(const char *filename, void *symval, char *alias)
+static int do_slim_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, slim_device_id, manf_id);
 	DEF_FIELD(symval, slim_device_id, prod_code);
@@ -991,7 +991,7 @@ static int do_slim_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: spi:S */
-static int do_spi_entry(const char *filename, void *symval,
+static int do_spi_entry(struct module *mod, void *symval,
 			char *alias)
 {
 	DEF_FIELD_ADDR(symval, spi_device_id, name);
@@ -1032,7 +1032,7 @@ static void dmi_ascii_filter(char *d, const char *s)
 }
 
 
-static int do_dmi_entry(const char *filename, void *symval,
+static int do_dmi_entry(struct module *mod, void *symval,
 			char *alias)
 {
 	int i, j;
@@ -1056,7 +1056,7 @@ static int do_dmi_entry(const char *filename, void *symval,
 	return 1;
 }
 
-static int do_platform_entry(const char *filename,
+static int do_platform_entry(struct module *mod,
 			     void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, platform_device_id, name);
@@ -1064,7 +1064,7 @@ static int do_platform_entry(const char *filename,
 	return 1;
 }
 
-static int do_mdio_entry(const char *filename,
+static int do_mdio_entry(struct module *mod,
 			 void *symval, char *alias)
 {
 	int i;
@@ -1089,7 +1089,7 @@ static int do_mdio_entry(const char *filename,
 }
 
 /* Looks like: zorro:iN. */
-static int do_zorro_entry(const char *filename, void *symval,
+static int do_zorro_entry(struct module *mod, void *symval,
 			  char *alias)
 {
 	DEF_FIELD(symval, zorro_device_id, id);
@@ -1099,7 +1099,7 @@ static int do_zorro_entry(const char *filename, void *symval,
 }
 
 /* looks like: "pnp:dD" */
-static int do_isapnp_entry(const char *filename,
+static int do_isapnp_entry(struct module *mod,
 			   void *symval, char *alias)
 {
 	DEF_FIELD(symval, isapnp_device_id, vendor);
@@ -1114,7 +1114,7 @@ static int do_isapnp_entry(const char *filename,
 }
 
 /* Looks like: "ipack:fNvNdN". */
-static int do_ipack_entry(const char *filename,
+static int do_ipack_entry(struct module *mod,
 			  void *symval, char *alias)
 {
 	DEF_FIELD(symval, ipack_device_id, format);
@@ -1176,7 +1176,7 @@ static void append_nibble_mask(char **outp,
  * N is exactly 8 digits, where each is an upper-case hex digit, or
  *	a ? or [] pattern matching exactly one digit.
  */
-static int do_amba_entry(const char *filename,
+static int do_amba_entry(struct module *mod,
 			 void *symval, char *alias)
 {
 	unsigned int digit;
@@ -1186,7 +1186,7 @@ static int do_amba_entry(const char *filename,
 
 	if ((id & mask) != id)
 		fatal("%s: Masked-off bit(s) of AMBA device ID are non-zero: id=0x%08X, mask=0x%08X.  Please fix this driver.\n",
-		      filename, id, mask);
+		      mod->name, id, mask);
 
 	p += sprintf(alias, "amba:d");
 	for (digit = 0; digit < 8; digit++)
@@ -1203,7 +1203,7 @@ static int do_amba_entry(const char *filename,
  * N is exactly 2 digits, where each is an upper-case hex digit, or
  *	a ? or [] pattern matching exactly one digit.
  */
-static int do_mips_cdmm_entry(const char *filename,
+static int do_mips_cdmm_entry(struct module *mod,
 			      void *symval, char *alias)
 {
 	DEF_FIELD(symval, mips_cdmm_device_id, type);
@@ -1218,7 +1218,7 @@ static int do_mips_cdmm_entry(const char *filename,
  * complicated.
  */
 
-static int do_x86cpu_entry(const char *filename, void *symval,
+static int do_x86cpu_entry(struct module *mod, void *symval,
 			   char *alias)
 {
 	DEF_FIELD(symval, x86_cpu_id, feature);
@@ -1237,7 +1237,7 @@ static int do_x86cpu_entry(const char *filename, void *symval,
 }
 
 /* LOOKS like cpu:type:*:feature:*FEAT* */
-static int do_cpu_entry(const char *filename, void *symval, char *alias)
+static int do_cpu_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, cpu_feature, feature);
 
@@ -1246,7 +1246,7 @@ static int do_cpu_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: mei:S:uuid:N:* */
-static int do_mei_entry(const char *filename, void *symval,
+static int do_mei_entry(struct module *mod, void *symval,
 			char *alias)
 {
 	DEF_FIELD_ADDR(symval, mei_cl_device_id, name);
@@ -1264,7 +1264,7 @@ static int do_mei_entry(const char *filename, void *symval,
 }
 
 /* Looks like: rapidio:vNdNavNadN */
-static int do_rio_entry(const char *filename,
+static int do_rio_entry(struct module *mod,
 			void *symval, char *alias)
 {
 	DEF_FIELD(symval, rio_device_id, did);
@@ -1283,7 +1283,7 @@ static int do_rio_entry(const char *filename,
 }
 
 /* Looks like: ulpi:vNpN */
-static int do_ulpi_entry(const char *filename, void *symval,
+static int do_ulpi_entry(struct module *mod, void *symval,
 			 char *alias)
 {
 	DEF_FIELD(symval, ulpi_device_id, vendor);
@@ -1295,7 +1295,7 @@ static int do_ulpi_entry(const char *filename, void *symval,
 }
 
 /* Looks like: hdaudio:vNrNaN */
-static int do_hda_entry(const char *filename, void *symval, char *alias)
+static int do_hda_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, hda_device_id, vendor_id);
 	DEF_FIELD(symval, hda_device_id, rev_id);
@@ -1311,7 +1311,7 @@ static int do_hda_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: sdw:mNpNvNcN */
-static int do_sdw_entry(const char *filename, void *symval, char *alias)
+static int do_sdw_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, sdw_device_id, mfg_id);
 	DEF_FIELD(symval, sdw_device_id, part_id);
@@ -1329,7 +1329,7 @@ static int do_sdw_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: fsl-mc:vNdN */
-static int do_fsl_mc_entry(const char *filename, void *symval,
+static int do_fsl_mc_entry(struct module *mod, void *symval,
 			   char *alias)
 {
 	DEF_FIELD(symval, fsl_mc_device_id, vendor);
@@ -1340,7 +1340,7 @@ static int do_fsl_mc_entry(const char *filename, void *symval,
 }
 
 /* Looks like: tbsvc:kSpNvNrN */
-static int do_tbsvc_entry(const char *filename, void *symval, char *alias)
+static int do_tbsvc_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, tb_service_id, match_flags);
 	DEF_FIELD_ADDR(symval, tb_service_id, protocol_key);
@@ -1364,7 +1364,7 @@ static int do_tbsvc_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: typec:idNmN */
-static int do_typec_entry(const char *filename, void *symval, char *alias)
+static int do_typec_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, typec_device_id, svid);
 	DEF_FIELD(symval, typec_device_id, mode);
@@ -1376,7 +1376,7 @@ static int do_typec_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: tee:uuid */
-static int do_tee_entry(const char *filename, void *symval, char *alias)
+static int do_tee_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, tee_client_device_id, uuid);
 
@@ -1391,28 +1391,28 @@ static int do_tee_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: wmi:guid */
-static int do_wmi_entry(const char *filename, void *symval, char *alias)
+static int do_wmi_entry(struct module *mod, void *symval, char *alias)
 {
 	int len;
 	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
 
 	if (strlen(*guid_string) != UUID_STRING_LEN) {
 		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
-				*guid_string, filename);
+				*guid_string, mod->name);
 		return 0;
 	}
 
 	len = snprintf(alias, ALIAS_SIZE, WMI_MODULE_PREFIX "%s", *guid_string);
 	if (len < 0 || len >= ALIAS_SIZE) {
 		warn("Could not generate all MODULE_ALIAS's in '%s'\n",
-				filename);
+				mod->name);
 		return 0;
 	}
 	return 1;
 }
 
 /* Looks like: mhi:S */
-static int do_mhi_entry(const char *filename, void *symval, char *alias)
+static int do_mhi_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
 	sprintf(alias, MHI_DEVICE_MODALIAS_FMT, *chan);
@@ -1420,7 +1420,7 @@ static int do_mhi_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: mhi_ep:S */
-static int do_mhi_ep_entry(const char *filename, void *symval, char *alias)
+static int do_mhi_ep_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
 	sprintf(alias, MHI_EP_DEVICE_MODALIAS_FMT, *chan);
@@ -1429,7 +1429,7 @@ static int do_mhi_ep_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: ishtp:{guid} */
-static int do_ishtp_entry(const char *filename, void *symval, char *alias)
+static int do_ishtp_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, ishtp_device_id, guid);
 
@@ -1440,7 +1440,7 @@ static int do_ishtp_entry(const char *filename, void *symval, char *alias)
 	return 1;
 }
 
-static int do_auxiliary_entry(const char *filename, void *symval, char *alias)
+static int do_auxiliary_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, auxiliary_device_id, name);
 	sprintf(alias, AUXILIARY_MODULE_PREFIX "%s", *name);
@@ -1453,7 +1453,7 @@ static int do_auxiliary_entry(const char *filename, void *symval, char *alias)
  *
  * N is exactly 2 digits, where each is an upper-case hex digit.
  */
-static int do_ssam_entry(const char *filename, void *symval, char *alias)
+static int do_ssam_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, ssam_device_id, match_flags);
 	DEF_FIELD(symval, ssam_device_id, domain);
@@ -1471,7 +1471,7 @@ static int do_ssam_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: dfl:tNfN */
-static int do_dfl_entry(const char *filename, void *symval, char *alias)
+static int do_dfl_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, dfl_device_id, type);
 	DEF_FIELD(symval, dfl_device_id, feature_id);
@@ -1483,7 +1483,7 @@ static int do_dfl_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: cdx:vNdN */
-static int do_cdx_entry(const char *filename, void *symval,
+static int do_cdx_entry(struct module *mod, void *symval,
 			char *alias)
 {
 	DEF_FIELD(symval, cdx_device_id, vendor);
@@ -1516,7 +1516,7 @@ static int do_cdx_entry(const char *filename, void *symval,
 	return 1;
 }
 
-static int do_vchiq_entry(const char *filename, void *symval, char *alias)
+static int do_vchiq_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD_ADDR(symval, vchiq_device_id, name);
 	sprintf(alias, "vchiq:%s", *name);
@@ -1525,7 +1525,7 @@ static int do_vchiq_entry(const char *filename, void *symval, char *alias)
 }
 
 /* Looks like: coreboot:tN */
-static int do_coreboot_entry(const char *filename, void *symval, char *alias)
+static int do_coreboot_entry(struct module *mod, void *symval, char *alias)
 {
 	DEF_FIELD(symval, coreboot_device_id, tag);
 	sprintf(alias, "coreboot:t%08X", tag);
@@ -1545,7 +1545,7 @@ static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 static void do_table(void *symval, unsigned long size,
 		     unsigned long id_size,
 		     const char *device_id,
-		     int (*do_entry)(const char *filename, void *symval, char *alias),
+		     int (*do_entry)(struct module *mod, void *symval, char *alias),
 		     struct module *mod)
 {
 	unsigned int i;
@@ -1556,7 +1556,7 @@ static void do_table(void *symval, unsigned long size,
 	size -= id_size;
 
 	for (i = 0; i < size; i += id_size) {
-		if (do_entry(mod->name, symval+i, alias)) {
+		if (do_entry(mod, symval+i, alias)) {
 			module_alias_printf(mod, false, "%s", alias);
 		}
 	}
-- 
2.43.0


