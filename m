Return-Path: <linux-kbuild+bounces-3830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA5C98969B
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2024 19:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 055EB2846C0
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2024 17:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9EA433C4;
	Sun, 29 Sep 2024 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1LZYHep"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E559042ABE;
	Sun, 29 Sep 2024 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727631191; cv=none; b=WzJ3WnhClMF9g+bwUM6u1otbEZOwmVDg3CklxlzMLgzZQmiVEXHsy+VuNR2FbOKcyV8/6vE029+KWC1OEBSBgXr1Bo0syKE9+AGeLW/TSikDt5uraZn1JjnUiTa3gsQ+uKqv+anPmVkcTMoJwCb5OWPfp6fd5edghqw0IcNWnNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727631191; c=relaxed/simple;
	bh=dpgEsZGae4ivMo/aeUVDr+TCQSBfCccOgJX3t1cmjD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nU8SLVFSpY5/w3521vN8bRyO4NjRFDIzyx0g5rwkizmxpFkgcDrJj73Wl8EzB5Ix1qlVd3gRP75mUW50RBSKlPtzgNNYO6bhnDXxSS9//ltx5aTNLzUmmsTFv8X8Up3FtuhMibRnd0tsKopFht5FXnmEGrJpkhWBXIRRAc1RKdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1LZYHep; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A7BC4CECD;
	Sun, 29 Sep 2024 17:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727631190;
	bh=dpgEsZGae4ivMo/aeUVDr+TCQSBfCccOgJX3t1cmjD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h1LZYHepd4OPUjfNGBOqwnF4Ccmb37weZ4QfQ1Odc35tYfPUtLxvZ99jmGRCwrHax
	 yb8JVY/yMH4P7y8KkGrNdczF/LUPe70MSz25r0zEyB/JlNAkkztT7LK0NnNYHQIEUM
	 neVEK3yZPI2GWJ4nNrRVbeHY2wp5+gGYh/5xKsgJ8qi05PNvQ6p2LgWM5UFj4hmqU6
	 F+4imWjEVLROGCdx3q96ObKZNhhGNC3+fWrUKRNo4okTNUZfVF1rg26aJ5yn1Kas6c
	 6OuBmpt76qQCB6kxON5H7B36yzJx1QE65LnEyOTmg+22EMOoRsPZtgvmDSSnkIs/cs
	 gK1v+BxOjV57A==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/3] kconfig: remove zconfprint()
Date: Mon, 30 Sep 2024 02:32:38 +0900
Message-ID: <20240929173302.203827-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929173302.203827-1-masahiroy@kernel.org>
References: <20240929173302.203827-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Turn all warnings during parsing into hard errors.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/parser.y | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/parser.y b/scripts/kconfig/parser.y
index 4b9eaee20eaf..aef1fad13671 100644
--- a/scripts/kconfig/parser.y
+++ b/scripts/kconfig/parser.y
@@ -24,7 +24,6 @@
 int cdebug = PRINTD;
 
 static void yyerror(const char *err);
-static void zconfprint(const char *err, ...);
 static void zconf_error(const char *err, ...);
 static bool zconf_endtoken(const char *tokenname,
 			   const char *expected_tokenname);
@@ -177,7 +176,7 @@ menuconfig_stmt: menuconfig_entry_start config_option_list
 	if (current_entry->prompt)
 		current_entry->prompt->type = P_MENU;
 	else
-		zconfprint("warning: menuconfig statement without prompt");
+		zconf_error("menuconfig statement without prompt");
 	printd(DEBUG_PARSE, "%s:%d:endconfig\n", cur_filename, cur_lineno);
 };
 
@@ -396,14 +395,14 @@ help: help_start T_HELPTEXT
 {
 	if (current_entry->help) {
 		free(current_entry->help);
-		zconfprint("warning: '%s' defined with more than one help text -- only the last one will be used",
-			   current_entry->sym->name ?: "<choice>");
+		zconf_error("'%s' defined with more than one help text",
+			    current_entry->sym->name ?: "<choice>");
 	}
 
 	/* Is the help text empty or all whitespace? */
 	if ($2[strspn($2, " \f\n\r\t\v")] == '\0')
-		zconfprint("warning: '%s' defined with blank help text",
-			   current_entry->sym->name ?: "<choice>");
+		zconf_error("'%s' defined with blank help text",
+			    current_entry->sym->name ?: "<choice>");
 
 	current_entry->help = $2;
 };
@@ -586,17 +585,6 @@ static bool zconf_endtoken(const char *tokenname,
 	return true;
 }
 
-static void zconfprint(const char *err, ...)
-{
-	va_list ap;
-
-	fprintf(stderr, "%s:%d: ", cur_filename, cur_lineno);
-	va_start(ap, err);
-	vfprintf(stderr, err, ap);
-	va_end(ap);
-	fprintf(stderr, "\n");
-}
-
 static void zconf_error(const char *err, ...)
 {
 	va_list ap;
-- 
2.43.0


