Return-Path: <linux-kbuild+bounces-5551-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3FA1A29B
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2025 12:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2462188E93E
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jan 2025 11:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A2C620C46B;
	Thu, 23 Jan 2025 11:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rJY1xle3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099D20DD52
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Jan 2025 11:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630605; cv=none; b=F9LIbiBOAHJdVPGH1d0KaW6G61MVvVc0VoWqtmTE/DGQDFU3MLu0hFs/R3GglQPCjuCLAfC0UuiODIHEkrtMoALNnLxxvVzPx6eykM2CCjcd6KfmOquu87SJ4P2akQQ4giYE11TmlGPv68M3lh2vIPIb3d9FwZabwZITeMQjb00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630605; c=relaxed/simple;
	bh=vuRUbBlUDPri4DpySjDYOcSra5lIoNwmk2KxQjD9MsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gp2fpKnEGtEivFly5hsxt+7o7Q9xhp/MQMr6maFA2k4e8f7PNsF2W9UOpX8gSH9wDcnBC3Y35dujQgmNKaCPW7Bl5MN6INs9LHt7WtZMYojwhlOl+qoM/tk9PH6f6FGFveVhZVQiVUOWpV90CKoi2A/pkRcq7vWEUG58c7X4PG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rJY1xle3; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aaec111762bso174665466b.2
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Jan 2025 03:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737630600; x=1738235400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UxqBLG8LGibPKbj9Roz/BQCtja21Er1cU/eKGZZx/nk=;
        b=rJY1xle3S5VZagbtTQDvMrjlBL/LiI9k0zIF6PssbCQFbO9nxTnj60Yn5mBqQ8ry+P
         6OBw1Rq+4vyOM/MepPSmtQPQjuUJme/rbOLsh+EHWquGRkQFuI4qqfkgxnhiuF+D1u9n
         W1K3u2Wr3nO/D9B9wyFKs8UgFZxE7/QWo6p+H65p20oVviaxEEAMasypKCtNUPwVofqx
         zlsJE72gRr/s2gH02oO/wfO08D6Ewha7cGmS4bC1Quu9Tdv7a1b7s6448yuUNcUymiV6
         U+ybhE0AoazT2xY90f6Tr9qVLTS80Z4S7Nh6E2tNeGsg/QvXI0GB49TI5IVNJFSx4H7z
         LAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737630600; x=1738235400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxqBLG8LGibPKbj9Roz/BQCtja21Er1cU/eKGZZx/nk=;
        b=KqtMzddmyQsxE/USTrzkVz7JZlYuqjbHWEKgHa3k6nL5eLn12AXHzbyEWGvMaho+z3
         Ch8LM3gYM/YMXHHVqaFLoMVG5rgzphKjvh7aoctd0YVsjF4x8LzoyBAdww8WoNOriEL/
         pTtEWMlsoV6SLk7rmcvaCDJhsOuD7saKs7TkwnJAa2vK77H04wWmKHYOCLLMOhDtQtuZ
         zG9lDFxnhuUcCFynhc/7lZoeTJhW1GncygY7Nx/0QyRPsW1pw8vG+zAl8wvgosog0Eyk
         bpz7Rrp3D6j6iSOoC/lRrqC160J6WB8p3NgADlur4j9xmd6oX8WwoIbMT+lgvIwyoCqu
         YO1A==
X-Forwarded-Encrypted: i=1; AJvYcCUn6LZX4L5e5xddE5xBzbOlyxbnFBzbhg+f6MKaPIaosYKj/BmwZaC+wvbSImykHSQaYSOFT6DwS+atWrY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjQ8XANyZme73bfUUloMYCtkL9JU5VAoeqM27lcginiMQlfr5
	4GWhsEM5lafz+rSzrHtm8GkVQ/cKkYRwC3evElzPchk181WMR0gNxRNyyaqBp4PqplU2PMF0Yn4
	WUzk=
X-Gm-Gg: ASbGncsrXeOlg0V8YmvjzmpULPZGZr4ZBOurU+SRHAWFjQR1rSlf9i/eBcP544qFLGM
	9SB7zKMhr7yU00jKn/m5WUSRG/Wofvmb3lfzothNqjRVUb8p2PZ5x0AY///XTAErXiIFb2Tn2g0
	jvaqPYLmbdGl4655vP3H2XKqs0+L9XopgN3WEZdwcvjFEdqc/4c31Aw+dqhTbWrQYrosaFBB2sy
	h248pnccqtwlv0SPaK4KbSKWmG8QxHaFipIxzouuoK2rhJT3ebSXCbSXRMsy1fULzsw5rxhO3KM
	jTKEtaFaLOZraB1ipB5jBeRAGWq8hRlGdLscdafXB6JjjEY=
X-Google-Smtp-Source: AGHT+IGnQMaKnotWk/6oMnIwuDwD7D+dqY8HYv14NhG71lrrBLsbk0K4zgUFh6Q7O6988EndqMycKg==
X-Received: by 2002:a17:907:94c7:b0:aab:daf0:3198 with SMTP id a640c23a62f3a-ab38b36bed2mr2447106666b.40.1737630600405;
        Thu, 23 Jan 2025 03:10:00 -0800 (PST)
Received: from localhost (p200300f65f018b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f01:8b04::1b9])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73670e9fsm9975114a12.17.2025.01.23.03.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:10:00 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] modpost: Warn about unused module namespace imports
Date: Thu, 23 Jan 2025 12:09:50 +0100
Message-ID: <20250123110951.370759-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5100; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=vuRUbBlUDPri4DpySjDYOcSra5lIoNwmk2KxQjD9MsQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnkiN/pS4DQSTchbSlwTBVAVZURjbTC5pvKlee0 NUEJFjTa6CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ5IjfwAKCRCPgPtYfRL+ TliSCACzJi6zKul/mnuDIseubD0fArGqvC0zqTA4VwTbi+VSPt4aotmf/16+0PKtsXms1Z7ezO/ 0/X2O1YB8xV/+PeqpFE3Oz06FdWwZUhXGR2ZTBmolAsAtPWtGf4yV4rugJdcwnO9eXYRLAAI8pM D8r/Z3KfTK4lG59xmi6qeGS9tRlebFkvz6ixVISbewyAnFzWH9FitKvDdWPjG1iY4fg/0NlxkAa ZoyDsVnkYo8sTd5Heu2KrAT3wRd9U7z3OD53hdYe/9AoK3tTI4FB01SlUFdQTmyAV+ggyO0hLpD rClplO5H6my+xCFlGbgy/4ivZe0lWZrThZY6pxdmZHfeb/IW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Symbols can be exported in namespaces and to make use of such symbols,
the namespace has to be explicitly imported. Importing a namespace
without actually using one of its symbols is likely a mistake.

There are a few offenders for an x86_64 allmodconfig build, so the
warning is (for now) only enabled for W=1 builds.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

one of the offenders is drivers/pwm/pwm-raspberrypi-poe.c (

	WARNING: modpost: module pwm-raspberrypi-poe imports namespace PWM, but doesn't use it.

). The issue there is that on x86_64 CONFIG_RASPBERRYPI_FIRMWARE is
always disabled and so devm_rpi_firmware_get() returns always NULL which
makes raspberrypi_pwm_probe return an error before the pwm functions are
used. So the compiler optimizes out all references to pwm functions and
the warning triggers. I didn't look into the other problems to check if
these are similar half-false positives.

Still I think this is a useful check?

Best regards
Uwe

 scripts/mod/modpost.c | 60 +++++++++++++++++++++++++++++++------------
 1 file changed, 44 insertions(+), 16 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e18ae7dc8140..ef5a5e9718f3 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -268,13 +268,28 @@ static struct symbol *find_symbol(const char *name)
 
 struct namespace_list {
 	struct list_head list;
+	bool used;
 	char namespace[];
 };
 
+static struct namespace_list *find_namespace_entry(struct list_head *head,
+						   const char *namespace)
+{
+	struct namespace_list *ns_entry;
+
+	if (!namespace[0])
+		return NULL;
+
+	list_for_each_entry(ns_entry, head, list) {
+		if (!strcmp(ns_entry->namespace, namespace))
+			return ns_entry;
+	}
+
+	return NULL;
+}
+
 static bool contains_namespace(struct list_head *head, const char *namespace)
 {
-	struct namespace_list *list;
-
 	/*
 	 * The default namespace is null string "", which is always implicitly
 	 * contained.
@@ -282,21 +297,20 @@ static bool contains_namespace(struct list_head *head, const char *namespace)
 	if (!namespace[0])
 		return true;
 
-	list_for_each_entry(list, head, list) {
-		if (!strcmp(list->namespace, namespace))
-			return true;
-	}
+	if (find_namespace_entry(head, namespace))
+		return true;
 
 	return false;
 }
 
-static void add_namespace(struct list_head *head, const char *namespace)
+static void add_namespace(struct list_head *head, const char *namespace, bool used)
 {
 	struct namespace_list *ns_entry;
 
 	if (!contains_namespace(head, namespace)) {
 		ns_entry = xmalloc(sizeof(*ns_entry) + strlen(namespace) + 1);
 		strcpy(ns_entry->namespace, namespace);
+		ns_entry->used = used;
 		list_add_tail(&ns_entry->list, head);
 	}
 }
@@ -1580,7 +1594,7 @@ static void read_symbols(const char *modname)
 
 		namespace = get_modinfo(&info, "import_ns");
 		while (namespace) {
-			add_namespace(&mod->imported_namespaces, namespace);
+			add_namespace(&mod->imported_namespaces, namespace, false);
 			namespace = get_next_modinfo(&info, "import_ns",
 						     namespace);
 		}
@@ -1670,9 +1684,16 @@ void buf_write(struct buffer *buf, const char *s, int len)
 static void check_exports(struct module *mod)
 {
 	struct symbol *s, *exp;
+	struct namespace_list *ns_entry;
+	const char *basename;
+
+	basename = strrchr(mod->name, '/');
+	if (basename)
+		basename++;
+	else
+		basename = mod->name;
 
 	list_for_each_entry(s, &mod->unresolved_symbols, list) {
-		const char *basename;
 		exp = find_symbol(s->name);
 		if (!exp) {
 			if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
@@ -1692,23 +1713,30 @@ static void check_exports(struct module *mod)
 		s->crc_valid = exp->crc_valid;
 		s->crc = exp->crc;
 
-		basename = strrchr(mod->name, '/');
-		if (basename)
-			basename++;
-		else
-			basename = mod->name;
+		ns_entry = find_namespace_entry(&mod->imported_namespaces, exp->namespace);
 
-		if (!contains_namespace(&mod->imported_namespaces, exp->namespace)) {
+		if (exp->namespace[0] && !ns_entry) {
 			modpost_log(!allow_missing_ns_imports,
 				    "module %s uses symbol %s from namespace %s, but does not import it.\n",
 				    basename, exp->name, exp->namespace);
-			add_namespace(&mod->missing_namespaces, exp->namespace);
+			add_namespace(&mod->missing_namespaces, exp->namespace, true);
+		} else if (ns_entry) {
+			ns_entry->used = true;
 		}
 
 		if (!mod->is_gpl_compatible && exp->is_gpl_only)
 			error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
 			      basename, exp->name);
 	}
+
+	if (extra_warn) {
+		list_for_each_entry(ns_entry, &mod->imported_namespaces, list) {
+			if (!ns_entry->used)
+				modpost_log(false,
+					    "module %s imports namespace %s, but doesn't use it.\n",
+					    basename, ns_entry->namespace);
+		}
+	}
 }
 
 static void handle_white_list_exports(const char *white_list)

base-commit: 232f121837ad8b1c21cc80f2c8842a4090c5a2a0
-- 
2.47.1


