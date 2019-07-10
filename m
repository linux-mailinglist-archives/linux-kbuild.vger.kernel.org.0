Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B45264CE0
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2019 21:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727644AbfGJTj3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Jul 2019 15:39:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37942 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727330AbfGJTj3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jul 2019 15:39:29 -0400
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ADBCD31C;
        Wed, 10 Jul 2019 21:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562787566;
        bh=N3ZIgybu1x5UsQxQ0Z8T8jD7iZ87711YRfKM5+jtGkY=;
        h=From:To:Cc:Subject:Date:From;
        b=cxBIEUrAeffKjKtsRidEyVKZ7dM5fFJEVsPlJpNqkftYlq+skGFd96aXmzOxpQuyd
         xfHFFPqGY0jB5nuPDSHNcLDXiOTI7pX5rAyrJLkY98W474EabxeIcVCS+Ku0GrdwIY
         D7EzuHpsfRUUgQ0C6qnYCQas8JwqvnNYRO6k2OeU=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org (open list)
Cc:     linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH RFC] modpost: Support I2C Aliases from OF tables
Date:   Wed, 10 Jul 2019 20:39:06 +0100
Message-Id: <20190710193918.31135-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I2C drivers match against an I2C ID table, an OF table, and an ACPI
table. It is now also possible to match against an OF table entry
without the vendor prefix to support backwards compatibility, and allow
simplification of the i2c probe functions.

As part of this matching, the probe function is being converted to
remove the need to specify the i2c_device_id table, but to support
module aliasing, we still require to have the MODULE_DEVICE_TABLE entry.

Facilitate generating the I2C aliases directly from the of_device_id
tables, by stripping the vendor prefix prefix from the compatible string
and using that as an alias just as the i2c-core supports.

Drivers which remove the i2c_device_id table can then register against
the of_device_id table by adding an extra MODULE_DEVICE_TABLE
registration as shown by the following example:

 /* si4713_i2c_driver - i2c driver interface */
-static const struct i2c_device_id si4713_id[] = {
-       { "si4713" , 0 },
-       { },
-};
-MODULE_DEVICE_TABLE(i2c, si4713_id);

 static const struct of_device_id si4713_of_match[] = {
        { .compatible = "silabs,si4713" },
        { },
 };
 MODULE_DEVICE_TABLE(of, si4713_of_match);
+MODULE_DEVICE_TABLE(i2c_of, si4713_of_match);

Several drivers have had their i2c_device_id tables removed entirely
which will lead to their module aliases being limited, during the
following patches:

0f21700ac40c ("rtc: pcf85063: switch to probe_new")
3a4f4f2963f4 ("ASoC: rt5677: Convert I2C driver to ->probe_new()")
511cb17448d9 ("mfd: tps65217: Introduce dependency on CONFIG_OF")
8597c0920d6f ("NFC: fdp: Convert I2C driver to ->probe_new()")
b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new() call-back type")

The following patches might require I2C aliases to be generated from
their ACPI tables:

e19c92059a70 ("media: staging: atomisp: Switch i2c drivers to use ->probe_new()")
f758eb2363ec ("media: dw9714: Remove ACPI match tables, convert to use probe_new")

Cc: Lee Jones <lee.jones@linaro.org>
Cc: Wolfram Sang <wsa@the-dreams.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 scripts/mod/file2alias.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index e17a29ae2e97..16776f624d3a 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -379,6 +379,35 @@ static void do_of_table(void *symval, unsigned long size,
 		do_of_entry_multi(symval + i, mod);
 }
 
+static int do_i2c_of_entry(void *symval, struct module *mod)
+{
+	const char *alias;
+	DEF_FIELD_ADDR(symval, of_device_id, compatible);
+
+	alias = strrchr(*compatible, ',');
+
+	buf_printf(&mod->dev_table_buf, "MODULE_ALIAS(\"%s%s\");\n",
+		   I2C_MODULE_PREFIX, alias ? alias + 1 : *compatible);
+
+	return 1;
+}
+
+/* Reuse OF tables to generate I2C aliases */
+static void do_i2c_of_table(void *symval, unsigned long size,
+			    struct module *mod)
+{
+	unsigned int i;
+	const unsigned long id_size = SIZE_of_device_id;
+
+	device_id_check(mod->name, "i2c_of", size, id_size, symval);
+
+	/* Leave last one: it's the terminator. */
+	size -= id_size;
+
+	for (i = 0; i < size; i += id_size)
+		do_i2c_of_entry(symval + i, mod);
+}
+
 /* Looks like: hid:bNvNpN */
 static int do_hid_entry(const char *filename,
 			     void *symval, char *alias)
@@ -1452,6 +1481,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		do_usb_table(symval, sym->st_size, mod);
 	if (sym_is(name, namelen, "of"))
 		do_of_table(symval, sym->st_size, mod);
+	else if (sym_is(name, namelen, "i2c_of"))
+		do_i2c_of_table(symval, sym->st_size, mod);
 	else if (sym_is(name, namelen, "pnp"))
 		do_pnp_device_entry(symval, sym->st_size, mod);
 	else if (sym_is(name, namelen, "pnp_card"))
-- 
2.20.1

