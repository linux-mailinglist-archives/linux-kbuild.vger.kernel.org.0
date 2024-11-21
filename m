Return-Path: <linux-kbuild+bounces-4791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7189D5624
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Nov 2024 00:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 988EE1F22918
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 23:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAAC1DE3AB;
	Thu, 21 Nov 2024 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oHRhYm7l"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5336B1DDC24;
	Thu, 21 Nov 2024 23:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732231381; cv=none; b=pKFxRBC7TKPbzmKilWwrhnb3CUsmHggGt+LFvrwXEFY02jp7p1XM+aIAQGF8SJ8Rs6q+F2Ksjp/fLOoOc7thTSOKnDgIgevBStYW9jXdEW3M3aWLfSwYA2cYgbgI+g04ecmX2A2QhfYTPL6W0aZrRFxSE9Vdd4rovY1bm3pqtBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732231381; c=relaxed/simple;
	bh=WRqDd+Blc/Hf0M6hwBoUgKmUol3+tqdzFL1Pr/87Jps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OzrOTkozrN1Vyh82/TyRRpdFQEBDLIBbZ0rE0XOCLCspbqC8QHjA87yKEyjR8Pnb7hJYw0G9bQq+eiFYyE4n6+V4J2M3MYSPJBlufAqoMPH3eYwj5nKnKmHKkrKzTGL1vFUUDsfXY3Zhu9uk2WVfAzHbSIv8Q0DkOL3JOFelIZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oHRhYm7l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26207C4CECC;
	Thu, 21 Nov 2024 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732231380;
	bh=WRqDd+Blc/Hf0M6hwBoUgKmUol3+tqdzFL1Pr/87Jps=;
	h=From:To:Cc:Subject:Date:From;
	b=oHRhYm7llWuVHyOMW9fRrILI7OPDLpMX5hMg1iWCEdjk2Rt1oEPCMNeec/2EE8RT3
	 AEUs7cxQmYE/esiZMSAJxWOWv+Rc9vW2CVLJ3DDkM9UiBRPx+76SuGWgEbu38tEa/A
	 x2oFO12U5VT+kylMI3laSGS95Tqp1JyaW+WFTli7Sd8Nb4vNQG752ZBRuI4ME7AwxQ
	 a/6R5WD9OXiCz9bsOuRbqVuybFfNcKWRcWLGDUAe43O6k2nGOUlOHYquKghb4UsLSS
	 CCJdfABXA2f+HDJFPVm0MfU36rts8HoAwdON3BdgzEOxvBGXtbl1Vi+5YKgH1pXz6+
	 iG+vPefkhhOfw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] genksyms: reduce indentation in export_symbol()
Date: Fri, 22 Nov 2024 08:22:55 +0900
Message-ID: <20241121232257.1992219-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modify this function to return earlier when find_symbol() returns NULL,
reducing the level of improve readability.

No functional changes are intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/genksyms.c | 89 +++++++++++++++++++------------------
 1 file changed, 45 insertions(+), 44 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index f3901c55df23..07f9b8cfb233 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -632,54 +632,55 @@ static unsigned long expand_and_crc_sym(struct symbol *sym, unsigned long crc)
 void export_symbol(const char *name)
 {
 	struct symbol *sym;
+	unsigned long crc;
+	int has_changed = 0;
 
 	sym = find_symbol(name, SYM_NORMAL, 0);
-	if (!sym)
+	if (!sym) {
 		error_with_pos("export undefined symbol %s", name);
-	else {
-		unsigned long crc;
-		int has_changed = 0;
-
-		if (flag_dump_defs)
-			fprintf(debugfile, "Export %s == <", name);
-
-		expansion_trail = (struct symbol *)-1L;
-
-		sym->expansion_trail = expansion_trail;
-		expansion_trail = sym;
-		crc = expand_and_crc_sym(sym, 0xffffffff) ^ 0xffffffff;
-
-		sym = expansion_trail;
-		while (sym != (struct symbol *)-1L) {
-			struct symbol *n = sym->expansion_trail;
-
-			if (sym->status != STATUS_UNCHANGED) {
-				if (!has_changed) {
-					print_location();
-					fprintf(stderr, "%s: %s: modversion "
-						"changed because of changes "
-						"in ", flag_preserve ? "error" :
-						       "warning", name);
-				} else
-					fprintf(stderr, ", ");
-				print_type_name(sym->type, sym->name);
-				if (sym->status == STATUS_DEFINED)
-					fprintf(stderr, " (became defined)");
-				has_changed = 1;
-				if (flag_preserve)
-					errors++;
-			}
-			sym->expansion_trail = 0;
-			sym = n;
-		}
-		if (has_changed)
-			fprintf(stderr, "\n");
-
-		if (flag_dump_defs)
-			fputs(">\n", debugfile);
-
-		printf("#SYMVER %s 0x%08lx\n", name, crc);
+		return;
 	}
+
+	if (flag_dump_defs)
+		fprintf(debugfile, "Export %s == <", name);
+
+	expansion_trail = (struct symbol *)-1L;
+
+	sym->expansion_trail = expansion_trail;
+	expansion_trail = sym;
+	crc = expand_and_crc_sym(sym, 0xffffffff) ^ 0xffffffff;
+
+	sym = expansion_trail;
+	while (sym != (struct symbol *)-1L) {
+		struct symbol *n = sym->expansion_trail;
+
+		if (sym->status != STATUS_UNCHANGED) {
+			if (!has_changed) {
+				print_location();
+				fprintf(stderr,
+					"%s: %s: modversion changed because of changes in ",
+					flag_preserve ? "error" : "warning",
+					name);
+			} else {
+				fprintf(stderr, ", ");
+			}
+			print_type_name(sym->type, sym->name);
+			if (sym->status == STATUS_DEFINED)
+				fprintf(stderr, " (became defined)");
+			has_changed = 1;
+			if (flag_preserve)
+				errors++;
+		}
+		sym->expansion_trail = 0;
+		sym = n;
+	}
+	if (has_changed)
+		fprintf(stderr, "\n");
+
+	if (flag_dump_defs)
+		fputs(">\n", debugfile);
+
+	printf("#SYMVER %s 0x%08lx\n", name, crc);
 }
 
 /*----------------------------------------------------------------------*/
-- 
2.43.0


