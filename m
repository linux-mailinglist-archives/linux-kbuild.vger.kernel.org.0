Return-Path: <linux-kbuild+bounces-5329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A5FA004F6
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 08:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6CC1883DE8
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 07:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC021CACF7;
	Fri,  3 Jan 2025 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TFYMxrea"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5041C6F55;
	Fri,  3 Jan 2025 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889458; cv=none; b=GQ12V9bBsuT9BdI/JRmIJJy/cSfbRj14nN+AWlTYRmJb47qN9SzTst++T7nbzAI7x08IUa7utqi6Zgu585eCMD4WECpkjAcgpfPQ7gOqpXvP/UlQFbTqTXZ58ArIGgJlQ145JhEeTJ8XMy8HTduuO9XoNMxj+OuHrl3P1r0XflI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889458; c=relaxed/simple;
	bh=ceAgZPjdW52rBKW/g8fE/outcPlNZN+bCyUt0Ua2z74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aocDC6IRqxFLZTM7sTeTvzeZg3N4QXy6QOLgfx/JVfDKDD1TMRn5QaR+Ty41BnvYcc/Y5tPz1ntbffPrXRhRYE/qoOy8oK6cJRGO3nwGPqVHPX+JEWbVE4BQkbtNXuzrh14COgSZKP+mniXEDRtn5/yM9hlDKn/O87YPCXrrcQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TFYMxrea; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8498BC4CEDC;
	Fri,  3 Jan 2025 07:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735889458;
	bh=ceAgZPjdW52rBKW/g8fE/outcPlNZN+bCyUt0Ua2z74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TFYMxrea5qNCatvvNALjRczIoRsI0v2RUAXDgKjNZQbCdLGbLn3bov0Jgbbc2Q5Z9
	 H+JZ7tU2Z741MQiPvbD7TFHDF9v3y0cp7/Od3JMpmef4pkRcnoVqM4vx7MFMzDSuMC
	 gEVA/h3wOMkq/CTWWFkjfnzrPCWT319lvOe1y0Vp7aTPh7+rLbmM704mdZSeebMRJK
	 9D3ghTxmudur4KL5VJMpk84FGCTbUtHu3Of5VsftLYqtHi2DIUc+9V1+NKwFpWT+fa
	 v4/jgaytkOakOkEJwPPzYfqdpFxqie9AopqSJHKVE4eqjYClw03OPu8vJizAsZHx3b
	 A/8ZETNkRerUg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/6] genksyms: reduce the indentation in the for-loop in __add_symbol()
Date: Fri,  3 Jan 2025 16:30:40 +0900
Message-ID: <20250103073046.2609911-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250103073046.2609911-1-masahiroy@kernel.org>
References: <20250103073046.2609911-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To improve readability, reduce the indentation as follows:

  - Use 'continue' earlier when the symbol does not match

  - flip !sym->is_declared to flatten the if-else chain

No functional changes are intended.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/genksyms.c | 63 ++++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index c5e8e0e0f949..5a90acd693f4 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -226,41 +226,38 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 
 	h = crc32(name) % HASH_BUCKETS;
 	for (sym = symtab[h]; sym; sym = sym->hash_next) {
-		if (map_to_ns(sym->type) == map_to_ns(type) &&
-		    strcmp(name, sym->name) == 0) {
-			if (is_reference)
-				/* fall through */ ;
-			else if (sym->type == type &&
-				 equal_list(sym->defn, defn)) {
-				if (!sym->is_declared && sym->is_override) {
-					print_location();
-					print_type_name(type, name);
-					fprintf(stderr, " modversion is "
-						"unchanged\n");
-				}
-				sym->is_declared = 1;
-				free_list(defn, NULL);
-				return sym;
-			} else if (!sym->is_declared) {
-				if (sym->is_override && flag_preserve) {
-					print_location();
-					fprintf(stderr, "ignoring ");
-					print_type_name(type, name);
-					fprintf(stderr, " modversion change\n");
-					sym->is_declared = 1;
-					free_list(defn, NULL);
-					return sym;
-				} else {
-					status = is_unknown_symbol(sym) ?
-						STATUS_DEFINED : STATUS_MODIFIED;
-				}
-			} else {
-				error_with_pos("redefinition of %s", name);
-				free_list(defn, NULL);
-				return sym;
+		if (map_to_ns(sym->type) != map_to_ns(type) ||
+		    strcmp(name, sym->name))
+			continue;
+
+		if (is_reference) {
+			/* fall through */ ;
+		} else if (sym->type == type && equal_list(sym->defn, defn)) {
+			if (!sym->is_declared && sym->is_override) {
+				print_location();
+				print_type_name(type, name);
+				fprintf(stderr, " modversion is unchanged\n");
 			}
-			break;
+			sym->is_declared = 1;
+			free_list(defn, NULL);
+			return sym;
+		} else if (sym->is_declared) {
+			error_with_pos("redefinition of %s", name);
+			free_list(defn, NULL);
+			return sym;
+		} else if (sym->is_override && flag_preserve) {
+			print_location();
+			fprintf(stderr, "ignoring ");
+			print_type_name(type, name);
+			fprintf(stderr, " modversion change\n");
+			sym->is_declared = 1;
+			free_list(defn, NULL);
+			return sym;
+		} else {
+			status = is_unknown_symbol(sym) ?
+					STATUS_DEFINED : STATUS_MODIFIED;
 		}
+		break;
 	}
 
 	if (sym) {
-- 
2.43.0


