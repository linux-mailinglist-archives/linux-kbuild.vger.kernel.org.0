Return-Path: <linux-kbuild+bounces-4739-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440929D3129
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:58:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9933B23FD3
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8830A1D86CB;
	Tue, 19 Nov 2024 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZGAlUIBO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE701C3F1D;
	Tue, 19 Nov 2024 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060641; cv=none; b=TxUh3zng5YU6DL8bBGCUPkGBuMRZ1D1NPkdRv4cJSpUIzhF1jOn3JTYeMBeVZ1HR937TkHLMJqR0ZEBDZbl6QD7pNEfQL2x/0Ia5jZ2nyKd8I+mZreMyjSzwHQIoppz/IqF5jXuYDPH/BTGtayHXkBANlnMYjolQaofaIDuzB3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060641; c=relaxed/simple;
	bh=B8fXbH/fA4laGSq3miPO8I4Ps/yosA44R4CszcDmBqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYYPW60gVL4+1Z95nVGHa8gUfZ2iM9p0V3WmbnIY3nh9weHSjx6WXNQr+McE4lyGUbd8gu9V+PXvE1PAWJNldJUtFMNWQvvzgitYkfI3aXdLVBO76bc9p7L3+AIBVC+dCSk9Nn3BqAPACeVUFHQf+WIbbelY4N29G9jPPj3zoXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZGAlUIBO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FC5C4CECF;
	Tue, 19 Nov 2024 23:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060640;
	bh=B8fXbH/fA4laGSq3miPO8I4Ps/yosA44R4CszcDmBqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZGAlUIBOLD6eKPtIrrowbo1fJoMUT/2/IsDd2eGSU+WELVnU+rLfV4Gzp0deuWqv0
	 P/I9ljWe1ze30EzrqKPemviilQ4mWYFZaEVx4WvSWjizV3ERNwLd5I0IM1fqq8+Cax
	 6HuvclvljCVnfuxw1XoHw5VxOH7IE8IKgZs6X5V3CzYt33NfBAFb9OFg0WY/Hyixcg
	 Vnjj7CBTRYC0fiWHKt0yqndfZ/rjB5DVjJMPP+bze0cdO9BruSZJSn71JMtaMi3yIj
	 99L3YSxDcqljGBtHIqRmxyN8sgZHZcDKdeRoT8TWFHrJV7383IB2zFWjZ+Z/V/zxTJ
	 1qyrb2YxHpfcg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/15] modpost: call module_alias_printf() from all do_*_entry() functions
Date: Wed, 20 Nov 2024 08:56:45 +0900
Message-ID: <20241119235705.1576946-7-masahiroy@kernel.org>
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

The do_*_entry() functions cannot check the length of the given buffer.

Use module_alias_printf() helper consistently for these functions.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 438 ++++++++++++++++-----------------------
 1 file changed, 181 insertions(+), 257 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 57385cdfd773..10da84599c1a 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -124,12 +124,9 @@ typedef struct {
 struct devtable {
 	const char *device_id; /* name of table, __mod_<name>__*_device_table. */
 	unsigned long id_size;
-	int (*do_entry)(struct module *mod, void *symval, char *alias);
+	void (*do_entry)(struct module *mod, void *symval);
 };
 
-/* Size of alias provided to do_entry functions */
-#define ALIAS_SIZE 500
-
 /* Define a variable f that holds the value of field f of struct devid
  * based at address m.
  */
@@ -156,15 +153,6 @@ do {                                                            \
                 sprintf(str + strlen(str), "*");                \
 } while(0)
 
-/* End in a wildcard, for future extension */
-static inline void add_wildcard(char *str)
-{
-	int len = strlen(str);
-
-	if (str[len - 1] != '*')
-		strcat(str + len, "*");
-}
-
 static inline void add_uuid(char *str, uuid_le uuid)
 {
 	int len = strlen(str);
@@ -450,34 +438,34 @@ static void do_of_table(void *symval, unsigned long size,
 }
 
 /* Looks like: hid:bNvNpN */
-static int do_hid_entry(struct module *mod,
-			     void *symval, char *alias)
+static void do_hid_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, hid_device_id, bus);
 	DEF_FIELD(symval, hid_device_id, group);
 	DEF_FIELD(symval, hid_device_id, vendor);
 	DEF_FIELD(symval, hid_device_id, product);
 
-	sprintf(alias, "hid:");
 	ADD(alias, "b", bus != HID_BUS_ANY, bus);
 	ADD(alias, "g", group != HID_GROUP_ANY, group);
 	ADD(alias, "v", vendor != HID_ANY_ID, vendor);
 	ADD(alias, "p", product != HID_ANY_ID, product);
 
-	return 1;
+	module_alias_printf(mod, false, "hid:%s", alias);
 }
 
 /* Looks like: ieee1394:venNmoNspNverN */
-static int do_ieee1394_entry(struct module *mod,
-			     void *symval, char *alias)
+static void do_ieee1394_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, ieee1394_device_id, match_flags);
 	DEF_FIELD(symval, ieee1394_device_id, vendor_id);
 	DEF_FIELD(symval, ieee1394_device_id, model_id);
 	DEF_FIELD(symval, ieee1394_device_id, specifier_id);
 	DEF_FIELD(symval, ieee1394_device_id, version);
 
-	strcpy(alias, "ieee1394:");
 	ADD(alias, "ven", match_flags & IEEE1394_MATCH_VENDOR_ID,
 	    vendor_id);
 	ADD(alias, "mo", match_flags & IEEE1394_MATCH_MODEL_ID,
@@ -487,14 +475,13 @@ static int do_ieee1394_entry(struct module *mod,
 	ADD(alias, "ver", match_flags & IEEE1394_MATCH_VERSION,
 	    version);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "ieee1394:%s", alias);
 }
 
 /* Looks like: pci:vNdNsvNsdNbcNscNiN or <prefix>_pci:vNdNsvNsdNbcNscNiN. */
-static int do_pci_entry(struct module *mod,
-			void *symval, char *alias)
+static void do_pci_entry(struct module *mod, void *symval)
 {
+	char alias[256];
 	/* Class field can be divided into these three. */
 	unsigned char baseclass, subclass, interface,
 		baseclass_mask, subclass_mask, interface_mask;
@@ -517,7 +504,6 @@ static int do_pci_entry(struct module *mod,
 	default:
 		warn("Unknown PCI driver_override alias %08X\n",
 		     override_only);
-		return 0;
 	}
 
 	ADD(alias, "v", vendor != PCI_ANY_ID, vendor);
@@ -537,27 +523,27 @@ static int do_pci_entry(struct module *mod,
 	    || (interface_mask != 0 && interface_mask != 0xFF)) {
 		warn("Can't handle masks in %s:%04X\n",
 		     mod->name, class_mask);
-		return 0;
+		return;
 	}
 
 	ADD(alias, "bc", baseclass_mask == 0xFF, baseclass);
 	ADD(alias, "sc", subclass_mask == 0xFF, subclass);
 	ADD(alias, "i", interface_mask == 0xFF, interface);
-	add_wildcard(alias);
-	return 1;
+
+	module_alias_printf(mod, true, "%s", alias);
 }
 
 /* looks like: "ccw:tNmNdtNdmN" */
-static int do_ccw_entry(struct module *mod,
-			void *symval, char *alias)
+static void do_ccw_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, ccw_device_id, match_flags);
 	DEF_FIELD(symval, ccw_device_id, cu_type);
 	DEF_FIELD(symval, ccw_device_id, cu_model);
 	DEF_FIELD(symval, ccw_device_id, dev_type);
 	DEF_FIELD(symval, ccw_device_id, dev_model);
 
-	strcpy(alias, "ccw:");
 	ADD(alias, "t", match_flags&CCW_DEVICE_ID_MATCH_CU_TYPE,
 	    cu_type);
 	ADD(alias, "m", match_flags&CCW_DEVICE_ID_MATCH_CU_MODEL,
@@ -566,47 +552,42 @@ static int do_ccw_entry(struct module *mod,
 	    dev_type);
 	ADD(alias, "dm", match_flags&CCW_DEVICE_ID_MATCH_DEVICE_MODEL,
 	    dev_model);
-	add_wildcard(alias);
-	return 1;
+
+	module_alias_printf(mod, true, "ccw:%s", alias);
 }
 
 /* looks like: "ap:tN" */
-static int do_ap_entry(struct module *mod,
-		       void *symval, char *alias)
+static void do_ap_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, ap_device_id, dev_type);
 
-	sprintf(alias, "ap:t%02X*", dev_type);
-	return 1;
+	module_alias_printf(mod, false, "ap:t%02X*", dev_type);
 }
 
 /* looks like: "css:tN" */
-static int do_css_entry(struct module *mod,
-			void *symval, char *alias)
+static void do_css_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, css_device_id, type);
 
-	sprintf(alias, "css:t%01X", type);
-	return 1;
+	module_alias_printf(mod, false, "css:t%01X", type);
 }
 
 /* Looks like: "serio:tyNprNidNexN" */
-static int do_serio_entry(struct module *mod,
-			  void *symval, char *alias)
+static void do_serio_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, serio_device_id, type);
 	DEF_FIELD(symval, serio_device_id, proto);
 	DEF_FIELD(symval, serio_device_id, id);
 	DEF_FIELD(symval, serio_device_id, extra);
 
-	strcpy(alias, "serio:");
 	ADD(alias, "ty", type != SERIO_ANY, type);
 	ADD(alias, "pr", proto != SERIO_ANY, proto);
 	ADD(alias, "id", id != SERIO_ANY, id);
 	ADD(alias, "ex", extra != SERIO_ANY, extra);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "serio:%s", alias);
 }
 
 /* looks like: "acpi:ACPI0003" or "acpi:PNP0C0B" or "acpi:LNXVIDEO" or
@@ -616,21 +597,19 @@ static int do_serio_entry(struct module *mod,
  *       or _CLS. Also, bb, ss, and pp can be substituted with ??
  *       as don't care byte.
  */
-static int do_acpi_entry(struct module *mod,
-			void *symval, char *alias)
+static void do_acpi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, acpi_device_id, id);
 	DEF_FIELD(symval, acpi_device_id, cls);
 	DEF_FIELD(symval, acpi_device_id, cls_msk);
 
 	if ((*id)[0])
-		sprintf(alias, "acpi*:%s:*", *id);
+		module_alias_printf(mod, false, "acpi*:%s:*", *id);
 	else {
+		char alias[256];
 		int i, byte_shift, cnt = 0;
 		unsigned int msk;
 
-		sprintf(&alias[cnt], "acpi*:");
-		cnt = 6;
 		for (i = 1; i <= 3; i++) {
 			byte_shift = 8 * (3-i);
 			msk = (cls_msk >> byte_shift) & 0xFF;
@@ -641,9 +620,8 @@ static int do_acpi_entry(struct module *mod,
 				sprintf(&alias[cnt], "??");
 			cnt += 2;
 		}
-		sprintf(&alias[cnt], ":*");
+		module_alias_printf(mod, false, "acpi*:%s:*", alias);
 	}
-	return 1;
 }
 
 /* looks like: "pnp:dD" */
@@ -703,9 +681,9 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 }
 
 /* Looks like: pcmcia:mNcNfNfnNpfnNvaNvbNvcNvdN. */
-static int do_pcmcia_entry(struct module *mod,
-			   void *symval, char *alias)
+static void do_pcmcia_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
 	unsigned int i;
 	DEF_FIELD(symval, pcmcia_device_id, match_flags);
 	DEF_FIELD(symval, pcmcia_device_id, manf_id);
@@ -719,7 +697,6 @@ static int do_pcmcia_entry(struct module *mod,
 		(*prod_id_hash)[i] = TO_NATIVE((*prod_id_hash)[i]);
 	}
 
-	strcpy(alias, "pcmcia:");
 	ADD(alias, "m", match_flags & PCMCIA_DEV_ID_MATCH_MANF_ID,
 	    manf_id);
 	ADD(alias, "c", match_flags & PCMCIA_DEV_ID_MATCH_CARD_ID,
@@ -735,13 +712,12 @@ static int do_pcmcia_entry(struct module *mod,
 	ADD(alias, "pc", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID3, (*prod_id_hash)[2]);
 	ADD(alias, "pd", match_flags & PCMCIA_DEV_ID_MATCH_PROD_ID4, (*prod_id_hash)[3]);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "pcmcia:%s", alias);
 }
 
-static int do_vio_entry(struct module *mod, void *symval,
-		char *alias)
+static void do_vio_entry(struct module *mod, void *symval)
 {
+	char alias[256];
 	char *tmp;
 	DEF_FIELD_ADDR(symval, vio_device_id, type);
 	DEF_FIELD_ADDR(symval, vio_device_id, compat);
@@ -754,8 +730,7 @@ static int do_vio_entry(struct module *mod, void *symval,
 		if (isspace (*tmp))
 			*tmp = '_';
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "%s", alias);
 }
 
 static void do_input(char *alias,
@@ -771,9 +746,10 @@ static void do_input(char *alias,
 }
 
 /* input:b0v0p0e0-eXkXrXaXmXlXsXfXwX where X is comma-separated %02X. */
-static int do_input_entry(struct module *mod, void *symval,
-			  char *alias)
+static void do_input_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, input_device_id, flags);
 	DEF_FIELD(symval, input_device_id, bustype);
 	DEF_FIELD(symval, input_device_id, vendor);
@@ -789,8 +765,6 @@ static int do_input_entry(struct module *mod, void *symval,
 	DEF_FIELD_ADDR(symval, input_device_id, ffbit);
 	DEF_FIELD_ADDR(symval, input_device_id, swbit);
 
-	sprintf(alias, "input:");
-
 	ADD(alias, "b", flags & INPUT_DEVICE_ID_MATCH_BUS, bustype);
 	ADD(alias, "v", flags & INPUT_DEVICE_ID_MATCH_VENDOR, vendor);
 	ADD(alias, "p", flags & INPUT_DEVICE_ID_MATCH_PRODUCT, product);
@@ -825,99 +799,96 @@ static int do_input_entry(struct module *mod, void *symval,
 	sprintf(alias + strlen(alias), "w*");
 	if (flags & INPUT_DEVICE_ID_MATCH_SWBIT)
 		do_input(alias, *swbit, 0, INPUT_DEVICE_ID_SW_MAX);
-	return 1;
+
+	module_alias_printf(mod, false, "input:%s", alias);
 }
 
-static int do_eisa_entry(struct module *mod, void *symval,
-		char *alias)
+static void do_eisa_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, eisa_device_id, sig);
-	sprintf(alias, EISA_DEVICE_MODALIAS_FMT "*", *sig);
-	return 1;
+	module_alias_printf(mod, false, EISA_DEVICE_MODALIAS_FMT "*", *sig);
 }
 
 /* Looks like: parisc:tNhvNrevNsvN */
-static int do_parisc_entry(struct module *mod, void *symval,
-		char *alias)
+static void do_parisc_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, parisc_device_id, hw_type);
 	DEF_FIELD(symval, parisc_device_id, hversion);
 	DEF_FIELD(symval, parisc_device_id, hversion_rev);
 	DEF_FIELD(symval, parisc_device_id, sversion);
 
-	strcpy(alias, "parisc:");
 	ADD(alias, "t", hw_type != PA_HWTYPE_ANY_ID, hw_type);
 	ADD(alias, "hv", hversion != PA_HVERSION_ANY_ID, hversion);
 	ADD(alias, "rev", hversion_rev != PA_HVERSION_REV_ANY_ID, hversion_rev);
 	ADD(alias, "sv", sversion != PA_SVERSION_ANY_ID, sversion);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "parisc:%s", alias);
 }
 
 /* Looks like: sdio:cNvNdN. */
-static int do_sdio_entry(struct module *mod,
-			void *symval, char *alias)
+static void do_sdio_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, sdio_device_id, class);
 	DEF_FIELD(symval, sdio_device_id, vendor);
 	DEF_FIELD(symval, sdio_device_id, device);
 
-	strcpy(alias, "sdio:");
 	ADD(alias, "c", class != (__u8)SDIO_ANY_ID, class);
 	ADD(alias, "v", vendor != (__u16)SDIO_ANY_ID, vendor);
 	ADD(alias, "d", device != (__u16)SDIO_ANY_ID, device);
-	add_wildcard(alias);
-	return 1;
+
+	module_alias_printf(mod, true, "sdio:%s", alias);
 }
 
 /* Looks like: ssb:vNidNrevN. */
-static int do_ssb_entry(struct module *mod,
-			void *symval, char *alias)
+static void do_ssb_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, ssb_device_id, vendor);
 	DEF_FIELD(symval, ssb_device_id, coreid);
 	DEF_FIELD(symval, ssb_device_id, revision);
 
-	strcpy(alias, "ssb:");
 	ADD(alias, "v", vendor != SSB_ANY_VENDOR, vendor);
 	ADD(alias, "id", coreid != SSB_ANY_ID, coreid);
 	ADD(alias, "rev", revision != SSB_ANY_REV, revision);
-	add_wildcard(alias);
-	return 1;
+
+	module_alias_printf(mod, true, "ssb:%s", alias);
 }
 
 /* Looks like: bcma:mNidNrevNclN. */
-static int do_bcma_entry(struct module *mod,
-			 void *symval, char *alias)
+static void do_bcma_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, bcma_device_id, manuf);
 	DEF_FIELD(symval, bcma_device_id, id);
 	DEF_FIELD(symval, bcma_device_id, rev);
 	DEF_FIELD(symval, bcma_device_id, class);
 
-	strcpy(alias, "bcma:");
 	ADD(alias, "m", manuf != BCMA_ANY_MANUF, manuf);
 	ADD(alias, "id", id != BCMA_ANY_ID, id);
 	ADD(alias, "rev", rev != BCMA_ANY_REV, rev);
 	ADD(alias, "cl", class != BCMA_ANY_CLASS, class);
-	add_wildcard(alias);
-	return 1;
+
+	module_alias_printf(mod, true, "bcma:%s", alias);
 }
 
 /* Looks like: virtio:dNvN */
-static int do_virtio_entry(struct module *mod, void *symval,
-			   char *alias)
+static void do_virtio_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, virtio_device_id, device);
 	DEF_FIELD(symval, virtio_device_id, vendor);
 
-	strcpy(alias, "virtio:");
 	ADD(alias, "d", device != VIRTIO_DEV_ANY_ID, device);
 	ADD(alias, "v", vendor != VIRTIO_DEV_ANY_ID, vendor);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "virtio:%s", alias);
 }
 
 /*
@@ -926,8 +897,7 @@ static int do_virtio_entry(struct module *mod, void *symval,
  * in the name.
  */
 
-static int do_vmbus_entry(struct module *mod, void *symval,
-			  char *alias)
+static void do_vmbus_entry(struct module *mod, void *symval)
 {
 	int i;
 	DEF_FIELD_ADDR(symval, hv_vmbus_device_id, guid);
@@ -936,68 +906,57 @@ static int do_vmbus_entry(struct module *mod, void *symval,
 	for (i = 0; i < (sizeof(*guid) * 2); i += 2)
 		sprintf(&guid_name[i], "%02x", TO_NATIVE((guid->b)[i/2]));
 
-	strcpy(alias, "vmbus:");
-	strcat(alias, guid_name);
-
-	return 1;
+	module_alias_printf(mod, false, "vmbus:%s", guid_name);
 }
 
 /* Looks like: rpmsg:S */
-static int do_rpmsg_entry(struct module *mod, void *symval,
-			  char *alias)
+static void do_rpmsg_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, rpmsg_device_id, name);
-	sprintf(alias, RPMSG_DEVICE_MODALIAS_FMT, *name);
 
-	return 1;
+	module_alias_printf(mod, false, RPMSG_DEVICE_MODALIAS_FMT, *name);
 }
 
 /* Looks like: i2c:S */
-static int do_i2c_entry(struct module *mod, void *symval,
-			char *alias)
+static void do_i2c_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, i2c_device_id, name);
-	sprintf(alias, I2C_MODULE_PREFIX "%s", *name);
 
-	return 1;
+	module_alias_printf(mod, false, I2C_MODULE_PREFIX "%s", *name);
 }
 
-static int do_i3c_entry(struct module *mod, void *symval,
-			char *alias)
+static void do_i3c_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, i3c_device_id, match_flags);
 	DEF_FIELD(symval, i3c_device_id, dcr);
 	DEF_FIELD(symval, i3c_device_id, manuf_id);
 	DEF_FIELD(symval, i3c_device_id, part_id);
 	DEF_FIELD(symval, i3c_device_id, extra_info);
 
-	strcpy(alias, "i3c:");
 	ADD(alias, "dcr", match_flags & I3C_MATCH_DCR, dcr);
 	ADD(alias, "manuf", match_flags & I3C_MATCH_MANUF, manuf_id);
 	ADD(alias, "part", match_flags & I3C_MATCH_PART, part_id);
 	ADD(alias, "ext", match_flags & I3C_MATCH_EXTRA_INFO, extra_info);
 
-	return 1;
+	module_alias_printf(mod, false, "i3c:%s", alias);
 }
 
-static int do_slim_entry(struct module *mod, void *symval, char *alias)
+static void do_slim_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, slim_device_id, manf_id);
 	DEF_FIELD(symval, slim_device_id, prod_code);
 
-	sprintf(alias, "slim:%x:%x:*", manf_id, prod_code);
-
-	return 1;
+	module_alias_printf(mod, false, "slim:%x:%x:*", manf_id, prod_code);
 }
 
 /* Looks like: spi:S */
-static int do_spi_entry(struct module *mod, void *symval,
-			char *alias)
+static void do_spi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, spi_device_id, name);
-	sprintf(alias, SPI_MODULE_PREFIX "%s", *name);
 
-	return 1;
+	module_alias_printf(mod, false, SPI_MODULE_PREFIX "%s", *name);
 }
 
 static const struct dmifield {
@@ -1032,12 +991,11 @@ static void dmi_ascii_filter(char *d, const char *s)
 }
 
 
-static int do_dmi_entry(struct module *mod, void *symval,
-			char *alias)
+static void do_dmi_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
 	int i, j;
 	DEF_FIELD_ADDR(symval, dmi_system_id, matches);
-	sprintf(alias, "dmi*");
 
 	for (i = 0; i < ARRAY_SIZE(dmi_fields); i++) {
 		for (j = 0; j < 4; j++) {
@@ -1052,80 +1010,75 @@ static int do_dmi_entry(struct module *mod, void *symval,
 		}
 	}
 
-	strcat(alias, ":");
-	return 1;
+	module_alias_printf(mod, false, "dmi*%s:", alias);
 }
 
-static int do_platform_entry(struct module *mod,
-			     void *symval, char *alias)
+static void do_platform_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, platform_device_id, name);
-	sprintf(alias, PLATFORM_MODULE_PREFIX "%s", *name);
-	return 1;
+
+	module_alias_printf(mod, false, PLATFORM_MODULE_PREFIX "%s", *name);
 }
 
-static int do_mdio_entry(struct module *mod,
-			 void *symval, char *alias)
+static void do_mdio_entry(struct module *mod, void *symval)
 {
+	char id[33];
 	int i;
 	DEF_FIELD(symval, mdio_device_id, phy_id);
 	DEF_FIELD(symval, mdio_device_id, phy_id_mask);
 
-	alias += sprintf(alias, MDIO_MODULE_PREFIX);
-
 	for (i = 0; i < 32; i++) {
 		if (!((phy_id_mask >> (31-i)) & 1))
-			*(alias++) = '?';
+			id[i] = '?';
 		else if ((phy_id >> (31-i)) & 1)
-			*(alias++) = '1';
+			id[i] = '1';
 		else
-			*(alias++) = '0';
+			id[i] = '0';
 	}
 
 	/* Terminate the string */
-	*alias = 0;
+	id[32] = '\0';
 
-	return 1;
+	module_alias_printf(mod, false, MDIO_MODULE_PREFIX "%s", id);
 }
 
 /* Looks like: zorro:iN. */
-static int do_zorro_entry(struct module *mod, void *symval,
-			  char *alias)
+static void do_zorro_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
 	DEF_FIELD(symval, zorro_device_id, id);
-	strcpy(alias, "zorro:");
+
 	ADD(alias, "i", id != ZORRO_WILDCARD, id);
-	return 1;
+
+	module_alias_printf(mod, false, "zorro:%s", alias);
 }
 
 /* looks like: "pnp:dD" */
-static int do_isapnp_entry(struct module *mod,
-			   void *symval, char *alias)
+static void do_isapnp_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, isapnp_device_id, vendor);
 	DEF_FIELD(symval, isapnp_device_id, function);
-	sprintf(alias, "pnp:d%c%c%c%x%x%x%x*",
+	module_alias_printf(mod, false, "pnp:d%c%c%c%x%x%x%x*",
 		'A' + ((vendor >> 2) & 0x3f) - 1,
 		'A' + (((vendor & 3) << 3) | ((vendor >> 13) & 7)) - 1,
 		'A' + ((vendor >> 8) & 0x1f) - 1,
 		(function >> 4) & 0x0f, function & 0x0f,
 		(function >> 12) & 0x0f, (function >> 8) & 0x0f);
-	return 1;
 }
 
 /* Looks like: "ipack:fNvNdN". */
-static int do_ipack_entry(struct module *mod,
-			  void *symval, char *alias)
+static void do_ipack_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
 	DEF_FIELD(symval, ipack_device_id, format);
 	DEF_FIELD(symval, ipack_device_id, vendor);
 	DEF_FIELD(symval, ipack_device_id, device);
-	strcpy(alias, "ipack:");
+
 	ADD(alias, "f", format != IPACK_ANY_FORMAT, format);
 	ADD(alias, "v", vendor != IPACK_ANY_ID, vendor);
 	ADD(alias, "d", device != IPACK_ANY_ID, device);
-	add_wildcard(alias);
-	return 1;
+
+	module_alias_printf(mod, true, "ipack:%s", alias);
 }
 
 /*
@@ -1176,9 +1129,9 @@ static void append_nibble_mask(char **outp,
  * N is exactly 8 digits, where each is an upper-case hex digit, or
  *	a ? or [] pattern matching exactly one digit.
  */
-static int do_amba_entry(struct module *mod,
-			 void *symval, char *alias)
+static void do_amba_entry(struct module *mod, void *symval)
 {
+	char alias[256];
 	unsigned int digit;
 	char *p = alias;
 	DEF_FIELD(symval, amba_id, id);
@@ -1188,13 +1141,12 @@ static int do_amba_entry(struct module *mod,
 		fatal("%s: Masked-off bit(s) of AMBA device ID are non-zero: id=0x%08X, mask=0x%08X.  Please fix this driver.\n",
 		      mod->name, id, mask);
 
-	p += sprintf(alias, "amba:d");
 	for (digit = 0; digit < 8; digit++)
 		append_nibble_mask(&p,
 				   (id >> (4 * (7 - digit))) & 0xf,
 				   (mask >> (4 * (7 - digit))) & 0xf);
 
-	return 1;
+	module_alias_printf(mod, false, "amba:d%s", alias);
 }
 
 /*
@@ -1203,13 +1155,11 @@ static int do_amba_entry(struct module *mod,
  * N is exactly 2 digits, where each is an upper-case hex digit, or
  *	a ? or [] pattern matching exactly one digit.
  */
-static int do_mips_cdmm_entry(struct module *mod,
-			      void *symval, char *alias)
+static void do_mips_cdmm_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, mips_cdmm_device_id, type);
 
-	sprintf(alias, "mipscdmm:t%02X*", type);
-	return 1;
+	module_alias_printf(mod, false, "mipscdmm:t%02X*", type);
 }
 
 /* LOOKS like cpu:type:x86,venVVVVfamFFFFmodMMMM:feature:*,FEAT,*
@@ -1218,137 +1168,130 @@ static int do_mips_cdmm_entry(struct module *mod,
  * complicated.
  */
 
-static int do_x86cpu_entry(struct module *mod, void *symval,
-			   char *alias)
+static void do_x86cpu_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, x86_cpu_id, feature);
 	DEF_FIELD(symval, x86_cpu_id, family);
 	DEF_FIELD(symval, x86_cpu_id, model);
 	DEF_FIELD(symval, x86_cpu_id, vendor);
 
-	strcpy(alias, "cpu:type:x86,");
 	ADD(alias, "ven", vendor != X86_VENDOR_ANY, vendor);
 	ADD(alias, "fam", family != X86_FAMILY_ANY, family);
 	ADD(alias, "mod", model  != X86_MODEL_ANY,  model);
 	strcat(alias, ":feature:*");
 	if (feature != X86_FEATURE_ANY)
 		sprintf(alias + strlen(alias), "%04X*", feature);
-	return 1;
+
+	module_alias_printf(mod, false, "cpu:type:x86,%s", alias);
 }
 
 /* LOOKS like cpu:type:*:feature:*FEAT* */
-static int do_cpu_entry(struct module *mod, void *symval, char *alias)
+static void do_cpu_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, cpu_feature, feature);
 
-	sprintf(alias, "cpu:type:*:feature:*%04X*", feature);
-	return 1;
+	module_alias_printf(mod, false, "cpu:type:*:feature:*%04X*", feature);
 }
 
 /* Looks like: mei:S:uuid:N:* */
-static int do_mei_entry(struct module *mod, void *symval,
-			char *alias)
+static void do_mei_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD_ADDR(symval, mei_cl_device_id, name);
 	DEF_FIELD_ADDR(symval, mei_cl_device_id, uuid);
 	DEF_FIELD(symval, mei_cl_device_id, version);
 
-	sprintf(alias, MEI_CL_MODULE_PREFIX);
-	sprintf(alias + strlen(alias), "%s:",  (*name)[0]  ? *name : "*");
 	add_uuid(alias, *uuid);
 	ADD(alias, ":", version != MEI_CL_VERSION_ANY, version);
 
-	strcat(alias, ":*");
-
-	return 1;
+	module_alias_printf(mod, false, MEI_CL_MODULE_PREFIX "%s:%s:*",
+			    (*name)[0] ? *name : "*", alias);
 }
 
 /* Looks like: rapidio:vNdNavNadN */
-static int do_rio_entry(struct module *mod,
-			void *symval, char *alias)
+static void do_rio_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, rio_device_id, did);
 	DEF_FIELD(symval, rio_device_id, vid);
 	DEF_FIELD(symval, rio_device_id, asm_did);
 	DEF_FIELD(symval, rio_device_id, asm_vid);
 
-	strcpy(alias, "rapidio:");
 	ADD(alias, "v", vid != RIO_ANY_ID, vid);
 	ADD(alias, "d", did != RIO_ANY_ID, did);
 	ADD(alias, "av", asm_vid != RIO_ANY_ID, asm_vid);
 	ADD(alias, "ad", asm_did != RIO_ANY_ID, asm_did);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "rapidio:%s", alias);
 }
 
 /* Looks like: ulpi:vNpN */
-static int do_ulpi_entry(struct module *mod, void *symval,
-			 char *alias)
+static void do_ulpi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, ulpi_device_id, vendor);
 	DEF_FIELD(symval, ulpi_device_id, product);
 
-	sprintf(alias, "ulpi:v%04xp%04x", vendor, product);
-
-	return 1;
+	module_alias_printf(mod, false, "ulpi:v%04xp%04x", vendor, product);
 }
 
 /* Looks like: hdaudio:vNrNaN */
-static int do_hda_entry(struct module *mod, void *symval, char *alias)
+static void do_hda_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, hda_device_id, vendor_id);
 	DEF_FIELD(symval, hda_device_id, rev_id);
 	DEF_FIELD(symval, hda_device_id, api_version);
 
-	strcpy(alias, "hdaudio:");
 	ADD(alias, "v", vendor_id != 0, vendor_id);
 	ADD(alias, "r", rev_id != 0, rev_id);
 	ADD(alias, "a", api_version != 0, api_version);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "hdaudio:%s", alias);
 }
 
 /* Looks like: sdw:mNpNvNcN */
-static int do_sdw_entry(struct module *mod, void *symval, char *alias)
+static void do_sdw_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, sdw_device_id, mfg_id);
 	DEF_FIELD(symval, sdw_device_id, part_id);
 	DEF_FIELD(symval, sdw_device_id, sdw_version);
 	DEF_FIELD(symval, sdw_device_id, class_id);
 
-	strcpy(alias, "sdw:");
 	ADD(alias, "m", mfg_id != 0, mfg_id);
 	ADD(alias, "p", part_id != 0, part_id);
 	ADD(alias, "v", sdw_version != 0, sdw_version);
 	ADD(alias, "c", class_id != 0, class_id);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "sdw:%s", alias);
 }
 
 /* Looks like: fsl-mc:vNdN */
-static int do_fsl_mc_entry(struct module *mod, void *symval,
-			   char *alias)
+static void do_fsl_mc_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, fsl_mc_device_id, vendor);
 	DEF_FIELD_ADDR(symval, fsl_mc_device_id, obj_type);
 
-	sprintf(alias, "fsl-mc:v%08Xd%s", vendor, *obj_type);
-	return 1;
+	module_alias_printf(mod, false, "fsl-mc:v%08Xd%s", vendor, *obj_type);
 }
 
 /* Looks like: tbsvc:kSpNvNrN */
-static int do_tbsvc_entry(struct module *mod, void *symval, char *alias)
+static void do_tbsvc_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, tb_service_id, match_flags);
 	DEF_FIELD_ADDR(symval, tb_service_id, protocol_key);
 	DEF_FIELD(symval, tb_service_id, protocol_id);
 	DEF_FIELD(symval, tb_service_id, protocol_version);
 	DEF_FIELD(symval, tb_service_id, protocol_revision);
 
-	strcpy(alias, "tbsvc:");
 	if (match_flags & TBSVC_MATCH_PROTOCOL_KEY)
 		sprintf(alias + strlen(alias), "k%s", *protocol_key);
 	else
@@ -1359,93 +1302,80 @@ static int do_tbsvc_entry(struct module *mod, void *symval, char *alias)
 	ADD(alias, "r", match_flags & TBSVC_MATCH_PROTOCOL_REVISION,
 	    protocol_revision);
 
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "tbsvc:%s", alias);
 }
 
 /* Looks like: typec:idNmN */
-static int do_typec_entry(struct module *mod, void *symval, char *alias)
+static void do_typec_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, typec_device_id, svid);
 	DEF_FIELD(symval, typec_device_id, mode);
 
-	sprintf(alias, "typec:id%04X", svid);
 	ADD(alias, "m", mode != TYPEC_ANY_MODE, mode);
 
-	return 1;
+	module_alias_printf(mod, false, "typec:id%04X%s", svid, alias);
 }
 
 /* Looks like: tee:uuid */
-static int do_tee_entry(struct module *mod, void *symval, char *alias)
+static void do_tee_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, tee_client_device_id, uuid);
 
-	sprintf(alias, "tee:%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
+	module_alias_printf(mod, true,
+			    "tee:%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",
 		uuid->b[0], uuid->b[1], uuid->b[2], uuid->b[3], uuid->b[4],
 		uuid->b[5], uuid->b[6], uuid->b[7], uuid->b[8], uuid->b[9],
 		uuid->b[10], uuid->b[11], uuid->b[12], uuid->b[13], uuid->b[14],
 		uuid->b[15]);
-
-	add_wildcard(alias);
-	return 1;
 }
 
 /* Looks like: wmi:guid */
-static int do_wmi_entry(struct module *mod, void *symval, char *alias)
+static void do_wmi_entry(struct module *mod, void *symval)
 {
-	int len;
 	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
 
 	if (strlen(*guid_string) != UUID_STRING_LEN) {
 		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
 				*guid_string, mod->name);
-		return 0;
+		return;
 	}
 
-	len = snprintf(alias, ALIAS_SIZE, WMI_MODULE_PREFIX "%s", *guid_string);
-	if (len < 0 || len >= ALIAS_SIZE) {
-		warn("Could not generate all MODULE_ALIAS's in '%s'\n",
-				mod->name);
-		return 0;
-	}
-	return 1;
+	module_alias_printf(mod, false, WMI_MODULE_PREFIX "%s", *guid_string);
 }
 
 /* Looks like: mhi:S */
-static int do_mhi_entry(struct module *mod, void *symval, char *alias)
+static void do_mhi_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
-	sprintf(alias, MHI_DEVICE_MODALIAS_FMT, *chan);
-	return 1;
+	module_alias_printf(mod, false, MHI_DEVICE_MODALIAS_FMT, *chan);
 }
 
 /* Looks like: mhi_ep:S */
-static int do_mhi_ep_entry(struct module *mod, void *symval, char *alias)
+static void do_mhi_ep_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
-	sprintf(alias, MHI_EP_DEVICE_MODALIAS_FMT, *chan);
 
-	return 1;
+	module_alias_printf(mod, false, MHI_EP_DEVICE_MODALIAS_FMT, *chan);
 }
 
 /* Looks like: ishtp:{guid} */
-static int do_ishtp_entry(struct module *mod, void *symval, char *alias)
+static void do_ishtp_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
 	DEF_FIELD_ADDR(symval, ishtp_device_id, guid);
 
-	strcpy(alias, ISHTP_MODULE_PREFIX "{");
 	add_guid(alias, *guid);
-	strcat(alias, "}");
 
-	return 1;
+	module_alias_printf(mod, false, ISHTP_MODULE_PREFIX "{%s}", alias);
 }
 
-static int do_auxiliary_entry(struct module *mod, void *symval, char *alias)
+static void do_auxiliary_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, auxiliary_device_id, name);
-	sprintf(alias, AUXILIARY_MODULE_PREFIX "%s", *name);
 
-	return 1;
+	module_alias_printf(mod, false, AUXILIARY_MODULE_PREFIX "%s", *name);
 }
 
 /*
@@ -1453,8 +1383,10 @@ static int do_auxiliary_entry(struct module *mod, void *symval, char *alias)
  *
  * N is exactly 2 digits, where each is an upper-case hex digit.
  */
-static int do_ssam_entry(struct module *mod, void *symval, char *alias)
+static void do_ssam_entry(struct module *mod, void *symval)
 {
+	char alias[256] = {};
+
 	DEF_FIELD(symval, ssam_device_id, match_flags);
 	DEF_FIELD(symval, ssam_device_id, domain);
 	DEF_FIELD(symval, ssam_device_id, category);
@@ -1462,30 +1394,28 @@ static int do_ssam_entry(struct module *mod, void *symval, char *alias)
 	DEF_FIELD(symval, ssam_device_id, instance);
 	DEF_FIELD(symval, ssam_device_id, function);
 
-	sprintf(alias, "ssam:d%02Xc%02X", domain, category);
 	ADD(alias, "t", match_flags & SSAM_MATCH_TARGET, target);
 	ADD(alias, "i", match_flags & SSAM_MATCH_INSTANCE, instance);
 	ADD(alias, "f", match_flags & SSAM_MATCH_FUNCTION, function);
 
-	return 1;
+	module_alias_printf(mod, false, "ssam:d%02Xc%02X%s",
+			    domain, category, alias);
 }
 
 /* Looks like: dfl:tNfN */
-static int do_dfl_entry(struct module *mod, void *symval, char *alias)
+static void do_dfl_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, dfl_device_id, type);
 	DEF_FIELD(symval, dfl_device_id, feature_id);
 
-	sprintf(alias, "dfl:t%04Xf%04X", type, feature_id);
-
-	add_wildcard(alias);
-	return 1;
+	module_alias_printf(mod, true, "dfl:t%04Xf%04X", type, feature_id);
 }
 
 /* Looks like: cdx:vNdN */
-static int do_cdx_entry(struct module *mod, void *symval,
-			char *alias)
+static void do_cdx_entry(struct module *mod, void *symval)
 {
+	char alias[256];
+
 	DEF_FIELD(symval, cdx_device_id, vendor);
 	DEF_FIELD(symval, cdx_device_id, device);
 	DEF_FIELD(symval, cdx_device_id, subvendor);
@@ -1504,7 +1434,7 @@ static int do_cdx_entry(struct module *mod, void *symval,
 	default:
 		warn("Unknown CDX driver_override alias %08X\n",
 		     override_only);
-		return 0;
+		return;
 	}
 
 	ADD(alias, "v", vendor != CDX_ANY_ID, vendor);
@@ -1513,24 +1443,22 @@ static int do_cdx_entry(struct module *mod, void *symval,
 	ADD(alias, "sd", subdevice != CDX_ANY_ID, subdevice);
 	ADD(alias, "c", class_mask == 0xFFFFFF, class);
 
-	return 1;
+	module_alias_printf(mod, false, "%s", alias);
 }
 
-static int do_vchiq_entry(struct module *mod, void *symval, char *alias)
+static void do_vchiq_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, vchiq_device_id, name);
-	sprintf(alias, "vchiq:%s", *name);
 
-	return 1;
+	module_alias_printf(mod, false, "vchiq:%s", *name);
 }
 
 /* Looks like: coreboot:tN */
-static int do_coreboot_entry(struct module *mod, void *symval, char *alias)
+static void do_coreboot_entry(struct module *mod, void *symval)
 {
 	DEF_FIELD(symval, coreboot_device_id, tag);
-	sprintf(alias, "coreboot:t%08X", tag);
 
-	return 1;
+	module_alias_printf(mod, false, "coreboot:t%08X", tag);
 }
 
 /* Does namelen bytes of name exactly match the symbol? */
@@ -1545,21 +1473,17 @@ static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 static void do_table(void *symval, unsigned long size,
 		     unsigned long id_size,
 		     const char *device_id,
-		     int (*do_entry)(struct module *mod, void *symval, char *alias),
+		     void (*do_entry)(struct module *mod, void *symval),
 		     struct module *mod)
 {
 	unsigned int i;
-	char alias[ALIAS_SIZE];
 
 	device_id_check(mod->name, device_id, size, id_size, symval);
 	/* Leave last one: it's the terminator. */
 	size -= id_size;
 
-	for (i = 0; i < size; i += id_size) {
-		if (do_entry(mod, symval+i, alias)) {
-			module_alias_printf(mod, false, "%s", alias);
-		}
-	}
+	for (i = 0; i < size; i += id_size)
+		do_entry(mod, symval + i);
 }
 
 static const struct devtable devtable[] = {
-- 
2.43.0


