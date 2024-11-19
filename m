Return-Path: <linux-kbuild+bounces-4747-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9D99D313A
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 01:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D85EB283F83
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849E31DDC15;
	Tue, 19 Nov 2024 23:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZR0B+oC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA6F1DDC0F;
	Tue, 19 Nov 2024 23:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060654; cv=none; b=RDbmoXKcwkVT1+AZ5C3Z6NTxoppZCyFhuOCUpFxERU7BTRFeq1Nxl9RAbk0o8qRVfc5gyzaoP7dD4SVs66zO4GvwlpjPyKUtbsINCCXI3AA9BpCHY6uXxIwB5DQiCjphnRnSlC/D5bju+j8I7k2e9Ec24ox0lcCF9gxXVY/czRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060654; c=relaxed/simple;
	bh=EszSPBhYxlZliQVx+9TJGuHxLGHpQKAZpg0WVjWXT0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCzTvUGw2LTc/dPGjyFyPeaOFawJUzu5gop7BTR2Zx6Ff8pvyY81RJQ+qi5ZxGm6DfE/JPt/fqpF5cmc7W3X8KY0gTeGGDBM02ZwB2lAfBY+8wOxBefitCGh6zGlxIi9Z79bIaX+dkAsRdmVAWGNF5RqhkFG1i/s0pnK2U1jhQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZR0B+oC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37041C4CED1;
	Tue, 19 Nov 2024 23:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060654;
	bh=EszSPBhYxlZliQVx+9TJGuHxLGHpQKAZpg0WVjWXT0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OZR0B+oC66tQUs6a5Ae4AH0PolmktvxIpkaFmvnJNnJFcdFdw4JhvJFO5bb+Yf5vl
	 scPsNAB8w35ntAXWFL5KS7G39w1qtloVDoQzf3n+4bhKrp0Tm1AabqVUP6nJ7TZTwZ
	 r3g4lpJNvG+2/d5PzGIJmVK/D6VX+UG3GM3EKhb+Je7fi2RMrMeRiFLaEvBHhgAmIq
	 eInQzL4MQ+6a2bc7dmW3yPExvwZCOQEf+o9sKLONr8323XZuW9AMNDB86APlF4y3uj
	 63XAGgopzsryT1AORZ3psUfoF/+0QQJH3yyScbCLHlEHMmW+BPh5ncAMsDN16yv1fq
	 drpKjyG2ftS4A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/15] modpost: improve error messages in device_id_check()
Date: Wed, 20 Nov 2024 08:56:53 +0900
Message-ID: <20241119235705.1576946-15-masahiroy@kernel.org>
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

The first error message in device_id_check() is obscure and can be
misleading because the cause of the error is unlikely to be found in
the struct definition in mod_devicetable.h.

This type of error occurs when an array is passed to an incorrect type
of MODULE_DEVICE_TABLE().

[Example 1]

    static const struct acpi_device_id foo_ids[] = {
            { "FOO" },
            { /* sentinel */ },
    };
    MODULE_DEVICE_TABLE(of, foo_ids);

Currently, modpost outputs a meaningless suggestion:

    ERROR: modpost: ...: sizeof(struct of_device_id)=200 is not a modulo of the size of section __mod_device_table__of__<identifier>=64.
    Fix definition of struct of_device_id in mod_devicetable.h

The root cause here is that MODULE_DEVICE_TABLE(of, ...) is used instead
of the correct MODULE_DEVICE_TABLE(acpi, ...).

This commit provides a more intuitive error message:

    ERROR: modpost: ...: type mismatch between foo_ids[] and MODULE_DEVICE_TABLE(of, ...)

The second error message, related to a missing terminator, is too
verbose.

[Example 2]

    static const struct acpi_device_id foo_ids[] = {
            { "FOO" },
    };
    MODULE_DEVICE_TABLE(acpi, foo_ids);

The current error message is overly long, and does not pinpoint the
incorrect array:

    ...: struct acpi_device_id is 32 bytes.  The last of 1 is:
    0x46 0x4f 0x4f 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
    ERROR: modpost: ...: struct acpi_device_id is not terminated with a NULL entry!

This commit changes it to a more concise error message, sufficient to
identify the incorrect array:

    ERROR: modpost: ...: foo_ids[] is not terminated with a NULL entry

Lastly, this commit squashes device_id_check() into do_table() and
changes fatal() into error(), allowing modpost to continue processing
other modules.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 55 +++++++++++++---------------------------
 1 file changed, 18 insertions(+), 37 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index b1291cc7bd80..3b46c2fdec50 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -174,40 +174,6 @@ static inline void add_guid(char *str, guid_t guid)
 		guid.b[12], guid.b[13], guid.b[14], guid.b[15]);
 }
 
-/**
- * Check that sizeof(device_id type) are consistent with size of section
- * in .o file. If in-consistent then userspace and kernel does not agree
- * on actual size which is a bug.
- * Also verify that the final entry in the table is all zeros.
- * Ignore both checks if build host differ from target host and size differs.
- **/
-static void device_id_check(const char *modname, const char *device_id,
-			    unsigned long size, unsigned long id_size,
-			    void *symval)
-{
-	int i;
-
-	if (size % id_size || size < id_size) {
-		fatal("%s: sizeof(struct %s_device_id)=%lu is not a modulo of the size of section __mod_device_table__%s__<identifier>=%lu.\n"
-		      "Fix definition of struct %s_device_id in mod_devicetable.h\n",
-		      modname, device_id, id_size, device_id, size, device_id);
-	}
-	/* Verify last one is a terminator */
-	for (i = 0; i < id_size; i++ ) {
-		if (*(uint8_t*)(symval+size-id_size+i)) {
-			fprintf(stderr,
-				"%s: struct %s_device_id is %lu bytes.  The last of %lu is:\n",
-				modname, device_id, id_size, size / id_size);
-			for (i = 0; i < id_size; i++ )
-				fprintf(stderr,"0x%02x ",
-					*(uint8_t*)(symval+size-id_size+i) );
-			fprintf(stderr,"\n");
-			fatal("%s: struct %s_device_id is not terminated with a NULL entry!\n",
-			      modname, device_id);
-		}
-	}
-}
-
 /* USB is special because the bcdDevice can be matched against a numeric range */
 /* Looks like "usb:vNpNdNdcNdscNdpNicNiscNipNinN" */
 static void do_usb_entry(void *symval,
@@ -1418,7 +1384,7 @@ static bool sym_is(const char *name, unsigned namelen, const char *symbol)
 	return memcmp(name, symbol, namelen) == 0;
 }
 
-static void do_table(void *symval, unsigned long size,
+static void do_table(const char *name, void *symval, unsigned long size,
 		     unsigned long id_size,
 		     const char *device_id,
 		     void (*do_entry)(struct module *mod, void *symval),
@@ -1426,7 +1392,21 @@ static void do_table(void *symval, unsigned long size,
 {
 	unsigned int i;
 
-	device_id_check(mod->name, device_id, size, id_size, symval);
+	if (size % id_size || size < id_size) {
+		error("%s: type mismatch between %s[] and MODULE_DEVICE_TABLE(%s, ...)\n",
+		      mod->name, name, device_id);
+		return;
+	}
+
+	/* Verify the last entry is a terminator */
+	for (i = size - id_size; i < size; i++) {
+		if (*(uint8_t *)(symval + i)) {
+			error("%s: %s[] is not terminated with a NULL entry\n",
+			      mod->name, name);
+			return;
+		}
+	}
+
 	/* Leave last one: it's the terminator. */
 	size -= id_size;
 
@@ -1522,6 +1502,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	if (!name)
 		return;
 	typelen = name - type;
+	name += strlen("__");
 
 	/* Handle all-NULL symbols allocated into .bss */
 	if (info->sechdrs[get_secindex(info, sym)].sh_type & SHT_NOBITS) {
@@ -1535,7 +1516,7 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 		const struct devtable *p = &devtable[i];
 
 		if (sym_is(type, typelen, p->device_id)) {
-			do_table(symval, sym->st_size, p->id_size,
+			do_table(name, symval, sym->st_size, p->id_size,
 				 p->device_id, p->do_entry, mod);
 			break;
 		}
-- 
2.43.0


