Return-Path: <linux-kbuild+bounces-191-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2667FCDBC
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 05:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F27261C20CF7
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Nov 2023 04:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FD763C5;
	Wed, 29 Nov 2023 04:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f8XRb8nT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207FF19A
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 20:13:13 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cfbda041f3so30604705ad.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2023 20:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701231192; x=1701835992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8j4EYBU493LEz8Zh+tBELxNXmpbmkFEmew+FDxkJD34=;
        b=f8XRb8nT3cOKs/muag7BMWdHdf/L6fSqJ0m80Vjz0MQHAFn5JjZw6j5YpKvm+EeDRG
         0qKtkXX8tWftyWPV1N92Xu1g5sqSWtFaKDiDFLtFsxi1XZtfEEnxGcmDAngTDHZpQ6Fd
         BXlDAJk7/17fFC1OXHgRIFlF5mJXKCVpfxGXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701231192; x=1701835992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8j4EYBU493LEz8Zh+tBELxNXmpbmkFEmew+FDxkJD34=;
        b=kZns9K1nuzZwGNBSz8qUxTBqT2dJE9J3j0REeCvvmYAAtWh20bzW5EYLZd+YHFJl5M
         vaemqlzZbN7v4bpEVZqEKPkWdhKJU/4oyiAHGtVbr9HR+rGJ7xluI1bSZcAkMf0TGjSg
         denROg59ysVuGXyE5PcfdXLjWADTUJFKzZRCsMOUZjSi+wfSCqGLJiM6rD/Pi9awHiRV
         lg+4P9IXdpNg1vFswB1CTTE9R9X0itmS0z5aT3ynCMv4BWFtzxcxOrKkwYSp7CrLdJ04
         V7FWvpCd6dfL0XR2Lp4hry4Qpk6EX2EJtoijc9k5YqMQN3KsP65NULPaSB+hUbwwzqF/
         TOxg==
X-Gm-Message-State: AOJu0Yytlv/v3hH4IMNwbkhd9QILK/AXRdX1FeqGbg2OFNJ8BCyxoWaa
	6P/eBZHkyxfQ1fkC5nuP1s1B/w==
X-Google-Smtp-Source: AGHT+IHILBtN2a2WsTtZvFxUUrflJxAdcdnD0krcYu0qCRcCl171VU82Qlhcma9Lq5IXFYKaaHEGtw==
X-Received: by 2002:a17:902:d303:b0:1cf:876e:aa41 with SMTP id b3-20020a170902d30300b001cf876eaa41mr19256468plc.30.1701231192562;
        Tue, 28 Nov 2023 20:13:12 -0800 (PST)
Received: from google.com (KD124209171220.ppp-bb.dion.ne.jp. [124.209.171.220])
        by smtp.gmail.com with ESMTPSA id ju12-20020a170903428c00b001bbb8d5166bsm11146965plb.123.2023.11.28.20.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 20:13:11 -0800 (PST)
Date: Wed, 29 Nov 2023 13:13:07 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Patrick Georgi <pgeorgi@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Stefan Reinauer <reinauer@google.com>
Subject: Re: [PATCH] kconfig: WERROR unmet symbol dependency
Message-ID: <20231129041307.GB6525@google.com>
References: <20231122034753.1446513-1-senozhatsky@chromium.org>
 <20231128053443.GA6525@google.com>
 <CAK7LNAT_Z4TeNzngMskEoNdSTWUH5gGzYm5MfO6C_H8rFcF6ng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAT_Z4TeNzngMskEoNdSTWUH5gGzYm5MfO6C_H8rFcF6ng@mail.gmail.com>

On (23/11/28 23:19), Masahiro Yamada wrote:

[..]

> KCONFIG_WERROR is meant to turn all warnings
> to errors.
> I do not see getenv("KCONFIG_WERROR")
> sprinkled everywhere in Kconfig.
> One more thing, you cannot directly exit(1)
> from sym_calc_value().

We do exit(1) for KCONFIG_WARN_UNKNOWN_SYMBOLS in conf_read().

I can introduce two new helpers that will tell if confdata.c and symbol.c
triggered any warnings and if KCONFIG_WERROR is set. And then different
code paths can call them and handle exit gracefully, depending on the
context (ncurses, menu, etc.).

Something like this

---
 scripts/kconfig/conf.c      |  6 ++++++
 scripts/kconfig/confdata.c  | 13 ++++++++-----
 scripts/kconfig/lkc_proto.h |  2 ++
 scripts/kconfig/symbol.c    |  9 +++++++++
 4 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 33d19e419908..662a5e7c37c2 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -827,6 +827,9 @@ int main(int ac, char **av)
 		break;
 	}
 
+	if (conf_errors())
+		exit(1);
+
 	if (sync_kconfig) {
 		name = getenv("KCONFIG_NOSILENTUPDATE");
 		if (name && *name) {
@@ -890,6 +893,9 @@ int main(int ac, char **av)
 		break;
 	}
 
+	if (sym_dep_errors())
+		exit(1);
+
 	if (input_mode == savedefconfig) {
 		if (conf_write_defconfig(defconfig_file)) {
 			fprintf(stderr, "n*** Error while saving defconfig to: %s\n\n",
diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index bd14aae1db58..9c8bee10c952 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -155,6 +155,13 @@ static void conf_message(const char *fmt, ...)
 static const char *conf_filename;
 static int conf_lineno, conf_warnings;
 
+bool conf_errors(void)
+{
+	if (conf_warnings)
+		return getenv("KCONFIG_WERROR");
+	return false;
+}
+
 static void conf_warning(const char *fmt, ...)
 {
 	va_list ap;
@@ -365,10 +372,9 @@ int conf_read_simple(const char *name, int def)
 	char *p, *val;
 	struct symbol *sym;
 	int i, def_flags;
-	const char *warn_unknown, *werror, *sym_name;
+	const char *warn_unknown, *sym_name;
 
 	warn_unknown = getenv("KCONFIG_WARN_UNKNOWN_SYMBOLS");
-	werror = getenv("KCONFIG_WERROR");
 	if (name) {
 		in = zconf_fopen(name);
 	} else {
@@ -526,9 +532,6 @@ int conf_read_simple(const char *name, int def)
 	free(line);
 	fclose(in);
 
-	if (conf_warnings && werror)
-		exit(1);
-
 	return 0;
 }
 
diff --git a/scripts/kconfig/lkc_proto.h b/scripts/kconfig/lkc_proto.h
index edd1e617b25c..e4931bde7ca7 100644
--- a/scripts/kconfig/lkc_proto.h
+++ b/scripts/kconfig/lkc_proto.h
@@ -12,6 +12,7 @@ void conf_set_changed(bool val);
 bool conf_get_changed(void);
 void conf_set_changed_callback(void (*fn)(void));
 void conf_set_message_callback(void (*fn)(const char *s));
+bool conf_errors(void);
 
 /* symbol.c */
 extern struct symbol * symbol_hash[SYMBOL_HASHSIZE];
@@ -22,6 +23,7 @@ void print_symbol_for_listconfig(struct symbol *sym);
 struct symbol ** sym_re_search(const char *pattern);
 const char * sym_type_name(enum symbol_type type);
 void sym_calc_value(struct symbol *sym);
+bool sym_dep_errors(void);
 enum symbol_type sym_get_type(struct symbol *sym);
 bool sym_tristate_within_range(struct symbol *sym,tristate tri);
 bool sym_set_tristate_value(struct symbol *sym,tristate tri);
diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index a76925b46ce6..4eb352bba710 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -37,6 +37,7 @@ static struct symbol symbol_empty = {
 
 struct symbol *modules_sym;
 static tristate modules_val;
+static int sym_warnings;
 
 enum symbol_type sym_get_type(struct symbol *sym)
 {
@@ -317,6 +318,14 @@ static void sym_warn_unmet_dep(struct symbol *sym)
 			       "  Selected by [m]:\n");
 
 	fputs(str_get(&gs), stderr);
+	sym_warnings++;
+}
+
+bool sym_dep_errors(void)
+{
+	if (sym_warnings)
+		return getenv("KCONFIG_WERROR");
+	return false;
 }
 
 void sym_calc_value(struct symbol *sym)
-- 
2.43.0.rc1.413.gea7ed67945-goog

