Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9426412872
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Sep 2021 23:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbhITVwk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Sep 2021 17:52:40 -0400
Received: from lithops.sigma-star.at ([195.201.40.130]:35474 "EHLO
        lithops.sigma-star.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233719AbhITVuk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Sep 2021 17:50:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 5A3546169BC6;
        Mon, 20 Sep 2021 23:40:11 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id cQQp0LvWxRIc; Mon, 20 Sep 2021 23:40:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by lithops.sigma-star.at (Postfix) with ESMTP id 927886169BCC;
        Mon, 20 Sep 2021 23:40:10 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
        by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id FmJOGlMy-qjY; Mon, 20 Sep 2021 23:40:10 +0200 (CEST)
Received: from blindfold.corp.sigma-star.at (213-47-184-186.cable.dynamic.surfer.at [213.47.184.186])
        by lithops.sigma-star.at (Postfix) with ESMTPSA id ACB746108471;
        Mon, 20 Sep 2021 23:40:09 +0200 (CEST)
From:   Richard Weinberger <richard@nod.at>
To:     masahiroy@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/2] kconfig: Refactor sym_escape_string_value
Date:   Mon, 20 Sep 2021 23:39:56 +0200
Message-Id: <20210920213957.1064-1-richard@nod.at>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

sym_escape_string_value() can take a struct symbol directly
and use sym_get_string_value() itself to obtain the string value.
We will need struct symbol later for error reporting.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 scripts/kconfig/conf.c      | 3 +--
 scripts/kconfig/confdata.c  | 3 +--
 scripts/kconfig/lkc_proto.h | 2 +-
 scripts/kconfig/symbol.c    | 6 ++++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 5d84b44a2a2a..a6dad4a2e7a2 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -650,8 +650,7 @@ static void check_conf(struct menu *menu)
 				const char *str;
=20
 				if (sym->type =3D=3D S_STRING) {
-					str =3D sym_get_string_value(sym);
-					str =3D sym_escape_string_value(str);
+					str =3D sym_escape_string(sym);
 					printf("%s%s=3D%s\n", CONFIG_, sym->name, str);
 					free((void *)str);
 				} else {
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index cf72680cd769..4e053f2477f9 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -734,8 +734,7 @@ static void conf_write_symbol(FILE *fp, struct symbol=
 *sym,
 	case S_UNKNOWN:
 		break;
 	case S_STRING:
-		str =3D sym_get_string_value(sym);
-		str =3D sym_escape_string_value(str);
+		str =3D sym_escape_string(sym);
 		printer->print_symbol(fp, sym, str, printer_arg);
 		free((void *)str);
 		break;
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index a11626bdc421..035cc522808b 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -18,7 +18,7 @@ extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
=20
 struct symbol * sym_lookup(const char *name, int flags);
 struct symbol * sym_find(const char *name);
-const char * sym_escape_string_value(const char *in);
+const char * sym_escape_string(struct symbol *sym);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index 5844d636d38f..4a31bb943f79 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -871,13 +871,15 @@ struct symbol *sym_find(const char *name)
 	return symbol;
 }
=20
-const char *sym_escape_string_value(const char *in)
+const char *sym_escape_string(struct symbol *sym)
 {
-	const char *p;
+	const char *in, *p;
 	size_t reslen;
 	char *res;
 	size_t l;
=20
+	in =3D sym_get_string_value(sym);
+
 	reslen =3D strlen(in) + strlen("\"\"") + 1;
=20
 	p =3D in;
--=20
2.26.2

