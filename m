Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D10C41E72C
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 07:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352075AbhJAFfQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Oct 2021 01:35:16 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:25309 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351909AbhJAFfH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Oct 2021 01:35:07 -0400
Received: from grover.. (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 1915WwVX000646;
        Fri, 1 Oct 2021 14:33:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 1915WwVX000646
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633066381;
        bh=2y8u/ekcAKLI09NYZKb5pwSiSRmEUEdUJSeBwntIAss=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eovQZa+Rux+ScrU718yYDencgw2tqT31bTV6V5ca3owxQxg3yixhuMLeyr/G7RWtu
         hOdRbhGdOadeWJJjayXeApWi7oqjWtskxr3fwEwbKhhwQBGGqdX+tntS1/1j468TGE
         CrFMXMpwW1gSKilJNVzy4HUZzJ8y8cwb/svI+/Gx5VtwKag9MY/8rW9JXRbYuEKRrc
         57A/D9zYrCGPg+gvesS8npefUsnooo3JjLzCbv9YvvkyhyqMkffbIxXn/s0CBwtCB0
         SyqsRu7+cZ3yrsYV4QKpYH8JfLlYUuQAusbdsvr9j3Z8QptXaA2n3gGXnC5xSP+WuZ
         VVmgRQrNtVlzQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] kconfig: move sym_escape_string_value() to confdata.c
Date:   Fri,  1 Oct 2021 14:32:48 +0900
Message-Id: <20211001053253.1223316-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001053253.1223316-1-masahiroy@kernel.org>
References: <20211001053253.1223316-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that sym_escape_string_value() is only used in confdata.c
it can be a 'static' function.

Rename it escape_string_value() because it is agnostic about
(struct sym *).

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c  | 47 +++++++++++++++++++++++++++++++++++--
 scripts/kconfig/lkc_proto.h |  1 -
 scripts/kconfig/symbol.c    | 44 ----------------------------------
 3 files changed, 45 insertions(+), 47 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index adbb9a955c43..78af1dd68894 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -620,6 +620,49 @@ static void conf_write_heading(FILE *fp, const struct comment_style *cs)
 	fprintf(fp, "%s\n", cs->comment_block_end);
 }
 
+/* The returned pointer must be freed on the caller side */
+static char *escape_string_value(const char *in)
+{
+	const char *p;
+	char *out;
+	size_t len;
+
+	len = strlen(in) + strlen("\"\"") + 1;
+
+	p = in;
+	while (1) {
+		p += strcspn(p, "\"\\");
+
+		if (p[0] == '\0')
+			break;
+
+		len++;
+		p++;
+	}
+
+	out = xmalloc(len);
+	out[0] = '\0';
+
+	strcat(out, "\"");
+
+	p = in;
+	while (1) {
+		len = strcspn(p, "\"\\");
+		strncat(out, p, len);
+		p += len;
+
+		if (p[0] == '\0')
+			break;
+
+		strcat(out, "\\");
+		strncat(out, p++, 1);
+	}
+
+	strcat(out, "\"");
+
+	return out;
+}
+
 /*
  * Kconfig configuration printer
  *
@@ -648,7 +691,7 @@ static void __print_symbol(FILE *fp, struct symbol *sym, enum output_n output_n,
 	}
 
 	if (sym->type == S_STRING && escape_string) {
-		escaped = sym_escape_string_value(val);
+		escaped = escape_string_value(val);
 		val = escaped;
 	}
 
@@ -702,7 +745,7 @@ static void print_symbol_for_c(FILE *fp, struct symbol *sym)
 			val_prefix = "0x";
 		break;
 	case S_STRING:
-		escaped = sym_escape_string_value(val);
+		escaped = escape_string_value(val);
 		val = escaped;
 	default:
 		break;
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index ec4a01bb60ce..edd1e617b25c 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -18,7 +18,6 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
 
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
-char *sym_escape_string_value(const char *in);
 void print_symbol_for_listconfig(struct symbol *sym);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 6bf8665a6a0f..0572330bf8a7 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -871,50 +871,6 @@ struct symbol *sym_find(const char *name)
 	return symbol;
 }
 
-/* The returned pointer must be freed on the caller side */
-char *sym_escape_string_value(const char *in)
-{
-	const char *p;
-	size_t reslen;
-	char *res;
-	size_t l;
-
-	reslen = strlen(in) + strlen("\"\"") + 1;
-
-	p = in;
-	for (;;) {
-		l = strcspn(p, "\"\\");
-		p += l;
-
-		if (p[0] == '\0')
-			break;
-
-		reslen++;
-		p++;
-	}
-
-	res = xmalloc(reslen);
-	res[0] = '\0';
-
-	strcat(res, "\"");
-
-	p = in;
-	for (;;) {
-		l = strcspn(p, "\"\\");
-		strncat(res, p, l);
-		p += l;
-
-		if (p[0] == '\0')
-			break;
-
-		strcat(res, "\\");
-		strncat(res, p++, 1);
-	}
-
-	strcat(res, "\"");
-	return res;
-}
-
 struct sym_match {
 	struct symbol	*sym;
 	off_t		so, eo;
-- 
2.30.2

