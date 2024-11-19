Return-Path: <linux-kbuild+bounces-4736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321DA9D3123
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC207283F17
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F00E1D63F9;
	Tue, 19 Nov 2024 23:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j4CTNl0F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3814E1D63DC;
	Tue, 19 Nov 2024 23:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060636; cv=none; b=caqhqER5zfnscF2WG/wvJu1kJVAgKl9YnvAYr7/eHj9gvPBWimKuSTaCgF6yq3H2oFue+baAPKj4fHasRzIHr+1m6GO/N5hgC6ldzAn3066x6GOKxCXd+vq2k5Srv8Z7B6jUr1qWybYdiYh5YsX6KwehygUJgFa/X9rP1qNI4e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060636; c=relaxed/simple;
	bh=u4fS+Yv9JFSpTJA04EkNljxO4hQ1JH5HbXri/53dB5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExULH0zQhc9jjyGkbMB0Qn9fhEATpIUqf0IxF3YcJbiRbfOw8uh9NTmOsG+5r4R0fUuYrKxcs6CyV7dYdIVRgC/XLu3L+xAgSYfnhjVvFsoMqOc95cEcgW7vHcv9OwS7Q2mSnSGGV9PivJAOJU4w9LhUulO7dxk+3HS0OM2QuyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j4CTNl0F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9868AC4CECF;
	Tue, 19 Nov 2024 23:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060635;
	bh=u4fS+Yv9JFSpTJA04EkNljxO4hQ1JH5HbXri/53dB5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j4CTNl0FfMl5CTH1m8bkHPCuwDwv2PXVuq4ncY0hz9V0sVpj07OLwVXYYM9SWebXJ
	 BFkOK8NytWcakbeFxnrquNT/xS+K5F+7Vje6VIlFIg3gtdnZea30RYiuOl7oFZAh51
	 vN2o8Y6rxmTgpeuhVOvSkXSwJfHvfwHdoZPGyx9y37AziKlaZYek3CjDjybSwvYDt6
	 o9MWoMaCfj+Sir35ygtyYWe78KM0RCXrHa+rMwCxwcIPoijOdA9JDsgkOfrd5+kP0T
	 bFB1w3HmycXGv+ZwexEfjdV5tK77h+VaUwRHrR5HVrFYbgfzzArGd2+8HdM1GFT3DG
	 sodWTyFRH/Eng==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/15] modpost: deduplicate MODULE_ALIAS() for all drivers
Date: Wed, 20 Nov 2024 08:56:42 +0900
Message-ID: <20241119235705.1576946-4-masahiroy@kernel.org>
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

MODULE_DEVICE_TABLE(pnp_card, ...) may have duplicated IDs. For
instance, snd_ad1816a_pnpids[] in sound/isa/ad1816a/ad1816a.c includes
multiple occurrences of the "ADS7180" string within its .devs fields.

Currently, do_pnp_card_entries() handles deduplication on its own, but
this logic should be moved to a common helper function, as drivers in
other subsystems might also have similar duplication issues.

For example, drivers/media/i2c/s5c73m3/s5c73m3.mod.c contains duplicated
MODULE_ALIAS() entries because both s5c73m3-core.c and s5c73m3-spi.c
define the same compatible string.

This commit eliminates redundant MODULE_ALIAS() entries across all
drivers.

[Before]

  $ grep MODULE_ALIAS drivers/media/i2c/s5c73m3/s5c73m3.mod.c
  MODULE_ALIAS("i2c:S5C73M3");
  MODULE_ALIAS("of:N*T*Csamsung,s5c73m3");
  MODULE_ALIAS("of:N*T*Csamsung,s5c73m3C*");
  MODULE_ALIAS("of:N*T*Csamsung,s5c73m3");
  MODULE_ALIAS("of:N*T*Csamsung,s5c73m3C*");

[After]

  $ grep MODULE_ALIAS drivers/media/i2c/s5c73m3/s5c73m3.mod.c
  MODULE_ALIAS("i2c:S5C73M3");
  MODULE_ALIAS("of:N*T*Csamsung,s5c73m3");
  MODULE_ALIAS("of:N*T*Csamsung,s5c73m3C*");

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 48 +++++++++++++---------------------------
 1 file changed, 15 insertions(+), 33 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index e31619cee05e..57bd4e8da8d5 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -48,7 +48,7 @@ static void __attribute__((format (printf, 3, 4)))
 module_alias_printf(struct module *mod, bool append_wildcard,
 		    const char *fmt, ...)
 {
-	struct module_alias *new;
+	struct module_alias *new, *als;
 	size_t len, n;
 	va_list ap;
 
@@ -84,6 +84,14 @@ module_alias_printf(struct module *mod, bool append_wildcard,
 		new->str[n + 1] = '\0';
 	}
 
+	/* avoid duplication */
+	list_for_each_entry(als, &mod->aliases, node) {
+		if (!strcmp(als->str, new->str)) {
+			free(new);
+			return;
+		}
+	}
+
 	list_add_tail(&new->node, &mod->aliases);
 }
 
@@ -685,44 +693,18 @@ static void do_pnp_card_entries(void *symval, unsigned long size,
 
 		for (j = 0; j < PNP_MAX_DEVICES; j++) {
 			const char *id = (char *)(*devs)[j].id;
-			int i2, j2;
-			int dup = 0;
+			char acpi_id[PNP_ID_LEN];
 
 			if (!id[0])
 				break;
 
-			/* find duplicate, already added value */
-			for (i2 = 0; i2 < i && !dup; i2++) {
-				DEF_FIELD_ADDR_VAR(symval + i2 * id_size,
-						   pnp_card_device_id,
-						   devs, devs_dup);
-
-				for (j2 = 0; j2 < PNP_MAX_DEVICES; j2++) {
-					const char *id2 =
-						(char *)(*devs_dup)[j2].id;
-
-					if (!id2[0])
-						break;
-
-					if (!strcmp(id, id2)) {
-						dup = 1;
-						break;
-					}
-				}
-			}
-
 			/* add an individual alias for every device entry */
-			if (!dup) {
-				char acpi_id[PNP_ID_LEN];
-				int k;
+			module_alias_printf(mod, false, "pnp:d%s*", id);
 
-				module_alias_printf(mod, false, "pnp:d%s*", id);
-
-				/* fix broken pnp bus lowercasing */
-				for (k = 0; k < sizeof(acpi_id); k++)
-					acpi_id[k] = toupper(id[k]);
-				module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
-			}
+			/* fix broken pnp bus lowercasing */
+			for (int k = 0; k < sizeof(acpi_id); k++)
+				acpi_id[k] = toupper(id[k]);
+			module_alias_printf(mod, false, "acpi*:%s:*", acpi_id);
 		}
 	}
 }
-- 
2.43.0


