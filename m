Return-Path: <linux-kbuild+bounces-6780-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B985AA0C07
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 14:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 90CAF16B2EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 12:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96F9C27A90A;
	Tue, 29 Apr 2025 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtczWTO1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA4D2C2593;
	Tue, 29 Apr 2025 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745930966; cv=none; b=gmLAqUZ44abPIsPYt52FPp87afXIMCkr2O5jVW90oM7NN6p06eB7ON2459vg/WAE17SHf9xJhqmbxw6uaQdIFcQf0qHFzRYz6bya/uEvvrHws003VdhW5a1qjaaedtoGkc5WNWPrso2jPsuVACpA4U7aMRj0c/g2Z/vlXurnyvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745930966; c=relaxed/simple;
	bh=HPSFu6tUOm6zr5iB/JxZyEnedJD0+8WjnyHjE+FLqzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0Fgu5j7NojZEBhI+dWkKCykC2H+GrxgALzGj6yI+u5+iatjiKQXo0imvncB90glOvSBzkugjO6V3e3I5KpvRp6iCdqeelWhhR17o5G2G+ZYjh3UiXg8OrVIhANVuu/tFagvyekt99MIWQFEYPAGKamTIVmBISNmtvd3ByAg5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtczWTO1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8A8C4CEE3;
	Tue, 29 Apr 2025 12:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745930965;
	bh=HPSFu6tUOm6zr5iB/JxZyEnedJD0+8WjnyHjE+FLqzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtczWTO1Yn5qjYzrMBPegFyjaIZ/3Ez0OkB2QiWOCYxlH+0DU80KB037cSmrbYGM7
	 8Nqska5nU7MHvgyBobAs57ysuvQKYGjNQVKXzrmnw5gU2KfWuDeh2SmvvW9n7OKmNz
	 JhC3hxMUJwNnyoQN2UvlMXnJsjSWipKQWQVNqplrO6QgqCJEns2NepPSqSCB3pJh2A
	 Q45WdGPEEXDlyFbUFbh0B/r1DAx8oTwWpTfhZ7FI1akIwaCZxQ6+kCR15n6Mxd4Adi
	 LyRDtboSpaQHRh7dKJsEf/9sohJfIYxGB4Ijuf88nzcM5qO9inBFsK186gXek9QhfZ
	 Qy9ndSCixlN1w==
Date: Tue, 29 Apr 2025 14:49:20 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1 5/7] modpost: Create modalias for builtin modules
Message-ID: <aBDK0G6OUUcEmzvZ@example.org>
References: <cover.1745591072.git.legion@kernel.org>
 <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
 <cf3ff619-6177-42e1-8f64-74cf4cbb8672@suse.com>
 <aBCkNh0Q2hwpMchj@example.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBCkNh0Q2hwpMchj@example.org>

On Tue, Apr 29, 2025 at 12:04:44PM +0200, Alexey Gladkov wrote:
> > I'm not sure it's best to overload this data in this way. I think mixing
> > actual files and "logical" modules in the modules list is somewhat
> > confusing.
> > 
> > An alternative would be to keep a single module struct for vmlinux and
> > record the discovered aliases under it?
> 
> It is possible to extend struct module_alias and add the module name. The
> problem is that alias is added by module_alias_printf() and we will have
> to add the module name to the arguments to each do_entry handler in
> addition to struct module where there is already a name (but in our case
> it is vmlinux).
> 
> I can do that if you think it's a better way.

If I don't add separate entries for each builtin module, the patch will
look like this:

diff --git a/include/linux/module.h b/include/linux/module.h
index 7250b4a527ec..6225793ddcd4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -257,14 +257,10 @@ extern void cleanup_module(void);
 	__PASTE(type,			\
 	__PASTE(__, name)))))))
 
-#ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
 #define MODULE_DEVICE_TABLE(type, name)			\
 extern typeof(name) __mod_device_table(type, name)	\
   __attribute__ ((unused, alias(__stringify(name))))
-#else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
-#endif
 
 /* Version of form [<epoch>:]<version>[-<extra-version>].
  * Or for CVS/RCS ID version, everything but the number is stripped.
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index dff1799a4c79..efb5e1e3fa1f 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -37,6 +37,21 @@ typedef Elf64_Addr	kernel_ulong_t;
 #include <ctype.h>
 #include <stdbool.h>
 
+struct module_info {
+	struct module *module;
+	const char *modname;
+	size_t modnamelen;
+};
+
+/* Does modnamelen bytes of modname exactly match the module name? */
+static bool modname_is(const char *modname, size_t modnamelen, const char *name)
+{
+	if (modnamelen != strlen(name))
+		return false;
+
+	return memcmp(modname, name, modnamelen) == 0;
+}
+
 /**
  * module_alias_printf - add auto-generated MODULE_ALIAS()
  *
@@ -45,10 +60,11 @@ typedef Elf64_Addr	kernel_ulong_t;
  * @fmt: printf(3)-like format
  */
 static void __attribute__((format (printf, 3, 4)))
-module_alias_printf(struct module *mod, bool append_wildcard,
+module_alias_printf(struct module_info *modi, bool append_wildcard,
 		    const char *fmt, ...)
 {
 	struct module_alias *new, *als;
+	char *modname;
 	size_t len;
 	int n;
 	va_list ap;
@@ -68,7 +84,7 @@ module_alias_printf(struct module *mod, bool append_wildcard,
 	if (append_wildcard)
 		len++;	/* extra byte for '*' */
 
-	new = xmalloc(sizeof(*new) + len);
+	new = xmalloc(sizeof(*new) + len + modi->modnamelen + 1);
 
 	/* Now, really print it to the allocated buffer */
 	va_start(ap, fmt);
@@ -87,14 +103,31 @@ module_alias_printf(struct module *mod, bool append_wildcard,
 	}
 
 	/* avoid duplication */
-	list_for_each_entry(als, &mod->aliases, node) {
-		if (!strcmp(als->str, new->str)) {
+	list_for_each_entry(als, &modi->module->aliases, node) {
+		if (modi->module->is_vmlinux &&
+		    !modname_is(modi->modname, modi->modnamelen, als->modname))
+			continue;
+		if (!strcmp(als->alias, new->str)) {
 			free(new);
 			return;
 		}
 	}
 
-	list_add_tail(&new->node, &mod->aliases);
+	modname = new->str + n + 1;
+	len = modi->modnamelen + 1;	/* extra byte for '\0' */
+
+	n = snprintf(modname, len, "%s", modi->modname);
+
+	if (n < len) {
+		error("snprintf failed\n");
+		free(new);
+		return;
+	}
+
+	new->alias = new->str;
+	new->modname = modname;
+
+	list_add_tail(&new->node, &modi->module->aliases);
 }
 
 typedef uint32_t	__u32;
@@ -125,7 +158,7 @@ typedef struct {
 struct devtable {
 	const char *device_id;
 	unsigned long id_size;
-	void (*do_entry)(struct module *mod, void *symval);
+	void (*do_entry)(struct module_info *mod, void *symval);
 };
 
 /* Define a variable f that holds the value of field f of struct devid
@@ -182,7 +215,7 @@ static inline void add_guid(char *str, guid_t guid)
 static void do_usb_entry(void *symval,
 			 unsigned int bcdDevice_initial, int bcdDevice_initial_digits,
 			 unsigned char range_lo, unsigned char range_hi,
-			 unsigned char max, struct module *mod)
+			 unsigned char max, struct module_info *mod)
 {
 	char alias[500];
 	DEF_FIELD(symval, usb_device_id, match_flags);
@@ -284,7 +317,7 @@ static unsigned int incbcd(unsigned int *bcd,
 	return init;
 }
 
-static void do_usb_entry_multi(struct module *mod, void *symval)
+static void do_usb_entry_multi(struct module_info *mod, void *symval)
 {
 	unsigned int devlo, devhi;
 	unsigned char chi, clo, max;
@@ -349,7 +382,7 @@ static void do_usb_entry_multi(struct module *mod, void *symval)
 	}
 }
 
-static void do_of_entry(struct module *mod, void *symval)
+static void do_of_entry(struct module_info *mod, void *symval)
 {
 	char alias[500];
 	int len;
@@ -376,7 +409,7 @@ static void do_of_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: hid:bNvNpN */
-static void do_hid_entry(struct module *mod, void *symval)
+static void do_hid_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -394,7 +427,7 @@ static void do_hid_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: ieee1394:venNmoNspNverN */
-static void do_ieee1394_entry(struct module *mod, void *symval)
+static void do_ieee1394_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -417,7 +450,7 @@ static void do_ieee1394_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: pci:vNdNsvNsdNbcNscNiN or <prefix>_pci:vNdNsvNsdNbcNscNiN. */
-static void do_pci_entry(struct module *mod, void *symval)
+static void do_pci_entry(struct module_info *mod, void *symval)
 {
 	char alias[256];
 	/* Class field can be divided into these three. */
@@ -460,7 +493,7 @@ static void do_pci_entry(struct module *mod, void *symval)
 	    || (subclass_mask != 0 && subclass_mask != 0xFF)
 	    || (interface_mask != 0 && interface_mask != 0xFF)) {
 		warn("Can't handle masks in %s:%04X\n",
-		     mod->name, class_mask);
+		     mod->module->name, class_mask);
 		return;
 	}
 
@@ -472,7 +505,7 @@ static void do_pci_entry(struct module *mod, void *symval)
 }
 
 /* looks like: "ccw:tNmNdtNdmN" */
-static void do_ccw_entry(struct module *mod, void *symval)
+static void do_ccw_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -495,7 +528,7 @@ static void do_ccw_entry(struct module *mod, void *symval)
 }
 
 /* looks like: "ap:tN" */
-static void do_ap_entry(struct module *mod, void *symval)
+static void do_ap_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, ap_device_id, dev_type);
 
@@ -503,7 +536,7 @@ static void do_ap_entry(struct module *mod, void *symval)
 }
 
 /* looks like: "css:tN" */
-static void do_css_entry(struct module *mod, void *symval)
+static void do_css_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, css_device_id, type);
 
@@ -511,7 +544,7 @@ static void do_css_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: "serio:tyNprNidNexN" */
-static void do_serio_entry(struct module *mod, void *symval)
+static void do_serio_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -535,7 +568,7 @@ static void do_serio_entry(struct module *mod, void *symval)
  *       or _CLS. Also, bb, ss, and pp can be substituted with ??
  *       as don't care byte.
  */
-static void do_acpi_entry(struct module *mod, void *symval)
+static void do_acpi_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, acpi_device_id, id);
 	DEF_FIELD(symval, acpi_device_id, cls);
@@ -563,7 +596,7 @@ static void do_acpi_entry(struct module *mod, void *symval)
 }
 
 /* looks like: "pnp:dD" */
-static void do_pnp_device_entry(struct module *mod, void *symval)
+static void do_pnp_device_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, pnp_device_id, id);
 	char acpi_id[sizeof(*id)];
@@ -576,7 +609,7 @@ static void do_pnp_device_entry(struct module *mod, void *symval)
 }
 
 /* looks like: "pnp:dD" for every device of the card */
-static void do_pnp_card_entry(struct module *mod, void *symval)
+static void do_pnp_card_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, pnp_card_device_id, devs);
 
@@ -598,7 +631,7 @@ static void do_pnp_card_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: pcmcia:mNcNfNfnNpfnNvaNvbNvcNvdN. */
-static void do_pcmcia_entry(struct module *mod, void *symval)
+static void do_pcmcia_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -632,7 +665,7 @@ static void do_pcmcia_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, true, "pcmcia:%s", alias);
 }
 
-static void do_vio_entry(struct module *mod, void *symval)
+static void do_vio_entry(struct module_info *mod, void *symval)
 {
 	char alias[256];
 	char *tmp;
@@ -662,7 +695,7 @@ static void do_input(char *alias,
 }
 
 /* input:b0v0p0e0-eXkXrXaXmXlXsXfXwX where X is comma-separated %02X. */
-static void do_input_entry(struct module *mod, void *symval)
+static void do_input_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -719,14 +752,14 @@ static void do_input_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, "input:%s", alias);
 }
 
-static void do_eisa_entry(struct module *mod, void *symval)
+static void do_eisa_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, eisa_device_id, sig);
 	module_alias_printf(mod, false, EISA_DEVICE_MODALIAS_FMT "*", *sig);
 }
 
 /* Looks like: parisc:tNhvNrevNsvN */
-static void do_parisc_entry(struct module *mod, void *symval)
+static void do_parisc_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -744,7 +777,7 @@ static void do_parisc_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: sdio:cNvNdN. */
-static void do_sdio_entry(struct module *mod, void *symval)
+static void do_sdio_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -760,7 +793,7 @@ static void do_sdio_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: ssb:vNidNrevN. */
-static void do_ssb_entry(struct module *mod, void *symval)
+static void do_ssb_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -776,7 +809,7 @@ static void do_ssb_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: bcma:mNidNrevNclN. */
-static void do_bcma_entry(struct module *mod, void *symval)
+static void do_bcma_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -794,7 +827,7 @@ static void do_bcma_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: virtio:dNvN */
-static void do_virtio_entry(struct module *mod, void *symval)
+static void do_virtio_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -812,7 +845,7 @@ static void do_virtio_entry(struct module *mod, void *symval)
  * Each byte of the guid will be represented by two hex characters
  * in the name.
  */
-static void do_vmbus_entry(struct module *mod, void *symval)
+static void do_vmbus_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, hv_vmbus_device_id, guid);
 	char guid_name[sizeof(*guid) * 2 + 1];
@@ -824,7 +857,7 @@ static void do_vmbus_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: rpmsg:S */
-static void do_rpmsg_entry(struct module *mod, void *symval)
+static void do_rpmsg_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, rpmsg_device_id, name);
 
@@ -832,14 +865,14 @@ static void do_rpmsg_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: i2c:S */
-static void do_i2c_entry(struct module *mod, void *symval)
+static void do_i2c_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, i2c_device_id, name);
 
 	module_alias_printf(mod, false, I2C_MODULE_PREFIX "%s", *name);
 }
 
-static void do_i3c_entry(struct module *mod, void *symval)
+static void do_i3c_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -857,7 +890,7 @@ static void do_i3c_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, "i3c:%s", alias);
 }
 
-static void do_slim_entry(struct module *mod, void *symval)
+static void do_slim_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, slim_device_id, manf_id);
 	DEF_FIELD(symval, slim_device_id, prod_code);
@@ -866,7 +899,7 @@ static void do_slim_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: spi:S */
-static void do_spi_entry(struct module *mod, void *symval)
+static void do_spi_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, spi_device_id, name);
 
@@ -905,7 +938,7 @@ static void dmi_ascii_filter(char *d, const char *s)
 }
 
 
-static void do_dmi_entry(struct module *mod, void *symval)
+static void do_dmi_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 	int i, j;
@@ -927,14 +960,14 @@ static void do_dmi_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, "dmi*%s:", alias);
 }
 
-static void do_platform_entry(struct module *mod, void *symval)
+static void do_platform_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, platform_device_id, name);
 
 	module_alias_printf(mod, false, PLATFORM_MODULE_PREFIX "%s", *name);
 }
 
-static void do_mdio_entry(struct module *mod, void *symval)
+static void do_mdio_entry(struct module_info *mod, void *symval)
 {
 	char id[33];
 	int i;
@@ -957,7 +990,7 @@ static void do_mdio_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: zorro:iN. */
-static void do_zorro_entry(struct module *mod, void *symval)
+static void do_zorro_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 	DEF_FIELD(symval, zorro_device_id, id);
@@ -968,7 +1001,7 @@ static void do_zorro_entry(struct module *mod, void *symval)
 }
 
 /* looks like: "pnp:dD" */
-static void do_isapnp_entry(struct module *mod, void *symval)
+static void do_isapnp_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, isapnp_device_id, vendor);
 	DEF_FIELD(symval, isapnp_device_id, function);
@@ -981,7 +1014,7 @@ static void do_isapnp_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: "ipack:fNvNdN". */
-static void do_ipack_entry(struct module *mod, void *symval)
+static void do_ipack_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 	DEF_FIELD(symval, ipack_device_id, format);
@@ -1043,7 +1076,7 @@ static void append_nibble_mask(char **outp,
  * N is exactly 8 digits, where each is an upper-case hex digit, or
  *	a ? or [] pattern matching exactly one digit.
  */
-static void do_amba_entry(struct module *mod, void *symval)
+static void do_amba_entry(struct module_info *mod, void *symval)
 {
 	char alias[256];
 	unsigned int digit;
@@ -1053,7 +1086,7 @@ static void do_amba_entry(struct module *mod, void *symval)
 
 	if ((id & mask) != id)
 		fatal("%s: Masked-off bit(s) of AMBA device ID are non-zero: id=0x%08X, mask=0x%08X.  Please fix this driver.\n",
-		      mod->name, id, mask);
+		      mod->module->name, id, mask);
 
 	for (digit = 0; digit < 8; digit++)
 		append_nibble_mask(&p,
@@ -1069,7 +1102,7 @@ static void do_amba_entry(struct module *mod, void *symval)
  * N is exactly 2 digits, where each is an upper-case hex digit, or
  *	a ? or [] pattern matching exactly one digit.
  */
-static void do_mips_cdmm_entry(struct module *mod, void *symval)
+static void do_mips_cdmm_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, mips_cdmm_device_id, type);
 
@@ -1082,7 +1115,7 @@ static void do_mips_cdmm_entry(struct module *mod, void *symval)
  * complicated.
  */
 
-static void do_x86cpu_entry(struct module *mod, void *symval)
+static void do_x86cpu_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -1102,7 +1135,7 @@ static void do_x86cpu_entry(struct module *mod, void *symval)
 }
 
 /* LOOKS like cpu:type:*:feature:*FEAT* */
-static void do_cpu_entry(struct module *mod, void *symval)
+static void do_cpu_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, cpu_feature, feature);
 
@@ -1110,7 +1143,7 @@ static void do_cpu_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: mei:S:uuid:N:* */
-static void do_mei_entry(struct module *mod, void *symval)
+static void do_mei_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -1126,7 +1159,7 @@ static void do_mei_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: rapidio:vNdNavNadN */
-static void do_rio_entry(struct module *mod, void *symval)
+static void do_rio_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -1144,7 +1177,7 @@ static void do_rio_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: ulpi:vNpN */
-static void do_ulpi_entry(struct module *mod, void *symval)
+static void do_ulpi_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, ulpi_device_id, vendor);
 	DEF_FIELD(symval, ulpi_device_id, product);
@@ -1153,7 +1186,7 @@ static void do_ulpi_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: hdaudio:vNrNaN */
-static void do_hda_entry(struct module *mod, void *symval)
+static void do_hda_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -1169,7 +1202,7 @@ static void do_hda_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: sdw:mNpNvNcN */
-static void do_sdw_entry(struct module *mod, void *symval)
+static void do_sdw_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -1187,7 +1220,7 @@ static void do_sdw_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: fsl-mc:vNdN */
-static void do_fsl_mc_entry(struct module *mod, void *symval)
+static void do_fsl_mc_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, fsl_mc_device_id, vendor);
 	DEF_FIELD_ADDR(symval, fsl_mc_device_id, obj_type);
@@ -1196,7 +1229,7 @@ static void do_fsl_mc_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: tbsvc:kSpNvNrN */
-static void do_tbsvc_entry(struct module *mod, void *symval)
+static void do_tbsvc_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -1220,7 +1253,7 @@ static void do_tbsvc_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: typec:idN */
-static void do_typec_entry(struct module *mod, void *symval)
+static void do_typec_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, typec_device_id, svid);
 
@@ -1228,7 +1261,7 @@ static void do_typec_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: tee:uuid */
-static void do_tee_entry(struct module *mod, void *symval)
+static void do_tee_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, tee_client_device_id, uuid);
 
@@ -1241,13 +1274,13 @@ static void do_tee_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: wmi:guid */
-static void do_wmi_entry(struct module *mod, void *symval)
+static void do_wmi_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, wmi_device_id, guid_string);
 
 	if (strlen(*guid_string) != UUID_STRING_LEN) {
 		warn("Invalid WMI device id 'wmi:%s' in '%s'\n",
-				*guid_string, mod->name);
+				*guid_string, mod->module->name);
 		return;
 	}
 
@@ -1255,14 +1288,14 @@ static void do_wmi_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: mhi:S */
-static void do_mhi_entry(struct module *mod, void *symval)
+static void do_mhi_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
 	module_alias_printf(mod, false, MHI_DEVICE_MODALIAS_FMT, *chan);
 }
 
 /* Looks like: mhi_ep:S */
-static void do_mhi_ep_entry(struct module *mod, void *symval)
+static void do_mhi_ep_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, mhi_device_id, chan);
 
@@ -1270,7 +1303,7 @@ static void do_mhi_ep_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: ishtp:{guid} */
-static void do_ishtp_entry(struct module *mod, void *symval)
+static void do_ishtp_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 	DEF_FIELD_ADDR(symval, ishtp_device_id, guid);
@@ -1280,7 +1313,7 @@ static void do_ishtp_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, ISHTP_MODULE_PREFIX "{%s}", alias);
 }
 
-static void do_auxiliary_entry(struct module *mod, void *symval)
+static void do_auxiliary_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, auxiliary_device_id, name);
 
@@ -1292,7 +1325,7 @@ static void do_auxiliary_entry(struct module *mod, void *symval)
  *
  * N is exactly 2 digits, where each is an upper-case hex digit.
  */
-static void do_ssam_entry(struct module *mod, void *symval)
+static void do_ssam_entry(struct module_info *mod, void *symval)
 {
 	char alias[256] = {};
 
@@ -1312,7 +1345,7 @@ static void do_ssam_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: dfl:tNfN */
-static void do_dfl_entry(struct module *mod, void *symval)
+static void do_dfl_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, dfl_device_id, type);
 	DEF_FIELD(symval, dfl_device_id, feature_id);
@@ -1321,7 +1354,7 @@ static void do_dfl_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: cdx:vNdN */
-static void do_cdx_entry(struct module *mod, void *symval)
+static void do_cdx_entry(struct module_info *mod, void *symval)
 {
 	char alias[256];
 
@@ -1355,7 +1388,7 @@ static void do_cdx_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, false, "%s", alias);
 }
 
-static void do_vchiq_entry(struct module *mod, void *symval)
+static void do_vchiq_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD_ADDR(symval, vchiq_device_id, name);
 
@@ -1363,7 +1396,7 @@ static void do_vchiq_entry(struct module *mod, void *symval)
 }
 
 /* Looks like: coreboot:tN */
-static void do_coreboot_entry(struct module *mod, void *symval)
+static void do_coreboot_entry(struct module_info *mod, void *symval)
 {
 	DEF_FIELD(symval, coreboot_device_id, tag);
 
@@ -1382,14 +1415,14 @@ static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 static void do_table(const char *name, void *symval, unsigned long size,
 		     unsigned long id_size,
 		     const char *device_id,
-		     void (*do_entry)(struct module *mod, void *symval),
-		     struct module *mod)
+		     void (*do_entry)(struct module_info *mod, void *symval),
+		     struct module_info *mod)
 {
 	unsigned int i;
 
 	if (size % id_size || size < id_size) {
 		error("%s: type mismatch between %s[] and MODULE_DEVICE_TABLE(%s, ...)\n",
-		      mod->name, name, device_id);
+		      mod->module->name, name, device_id);
 		return;
 	}
 
@@ -1397,7 +1430,7 @@ static void do_table(const char *name, void *symval, unsigned long size,
 	for (i = size - id_size; i < size; i++) {
 		if (*(uint8_t *)(symval + i)) {
 			error("%s: %s[] is not terminated with a NULL entry\n",
-			      mod->name, name);
+			      mod->module->name, name);
 			return;
 		}
 	}
@@ -1478,6 +1511,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	char *zeros = NULL;
 	const char *type, *name, *modname;
 	size_t typelen, modnamelen;
+	struct module_info modi;
 	static const char *prefix = "__mod_device_table__";
 
 	/* We're looking for a section relative symbol */
@@ -1509,6 +1543,10 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	typelen = name - type;
 	name += strlen("__");
 
+	modi.module = mod;
+	modi.modname = modname;
+	modi.modnamelen = modnamelen;
+
 	/* Handle all-NULL symbols allocated into .bss */
 	if (info->sechdrs[get_secindex(info, sym)].sh_type & SHT_NOBITS) {
 		zeros = calloc(1, sym->st_size);
@@ -1522,7 +1560,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 
 		if (sym_is(type, typelen, p->device_id)) {
 			do_table(name, symval, sym->st_size, p->id_size,
-				 p->device_id, p->do_entry, mod);
+				 p->device_id, p->do_entry, &modi);
 			break;
 		}
 	}
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index be89921d60b6..f97f2565c1e2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2021,11 +2021,21 @@ static void write_if_changed(struct buffer *b, const char *fname)
 static void write_vmlinux_export_c_file(struct module *mod)
 {
 	struct buffer buf = { };
+	struct module_alias *alias, *next;
 
 	buf_printf(&buf,
-		   "#include <linux/export-internal.h>\n");
+		   "#include <linux/export-internal.h>\n"
+		   "#include <linux/module.h>\n");
 
 	add_exported_symbols(&buf, mod);
+
+	list_for_each_entry_safe(alias, next, &mod->aliases, node) {
+		buf_printf(&buf, "MODULE_ALIAS_MODNAME(\"%s\", \"%s\");\n",
+				alias->modname, alias->alias);
+		list_del(&alias->node);
+		free(alias);
+	}
+
 	write_if_changed(&buf, ".vmlinux.export.c");
 	free(buf.p);
 }
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 9133e4c3803f..e08646632e19 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -103,6 +103,8 @@ buf_write(struct buffer *buf, const char *s, int len);
  */
 struct module_alias {
 	struct list_head node;
+	const char *modname;
+	const char *alias;
 	char str[];
 };
 
-- 
Rgrds, legion


