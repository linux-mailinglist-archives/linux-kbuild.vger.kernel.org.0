Return-Path: <linux-kbuild+bounces-6946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 80418AA9E0B
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 23:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF445A2D7D
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 May 2025 21:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515E92741C0;
	Mon,  5 May 2025 21:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qttSoB1Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5422701C2
	for <linux-kbuild@vger.kernel.org>; Mon,  5 May 2025 21:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746480250; cv=none; b=gSpD6tYcQpjteXi2Da16K4GdsjXEnE76bbxfeYN4spD7uK7ajOESjLfqELK3Rw+Co0bKGsmOcavn0ZtrEKznqu0Sf7XG+TzegTvbDSB1XkgS1qJLa7rEGSfdwKpukZT6MLiNNfzbI/54tdE7gRvrNbgWPmfODEQIuZLVHbb10f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746480250; c=relaxed/simple;
	bh=h0UfvaGWNgOmqj6pRMaE3gGYsMYVBXy/lS+rZ7Qhtes=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jcM09ySSAcRqOq8PGlGB+CvSrKZ0adzi0gCLzk45vJFhITTC+JYuIwZdTd+wDAornwuan9g7H//5fyVR/FV3WOoNvr6BmDJoSO3eakoLj4OmxsBBvX4srD1yxlbyce8/7REz0Z8r9fKW4Yhw1yGLS0rt//xDMeMuSpIdQgzINtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qttSoB1Q; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so5008949a12.3
        for <linux-kbuild@vger.kernel.org>; Mon, 05 May 2025 14:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746480248; x=1747085048; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aanpIqBEjEkle09/pdhUe09l89jk7xvzFrXGr1sJVPM=;
        b=qttSoB1QmZXY74s5m1BEmsXpV2IqVx1HV4XRB5H8YM+rIGDWoBCJbt5Rz23QrIxLlw
         k9sigAwM87n+eoPL0rDB8q4gLhjxYQHEv8zBZ0SzY9Y6QJRoBMgr8TUDPeJjJLzLEjDP
         88ONe9YS+4oieVuW7zN2A3p9Ff8wLBHxj176jcAsx8QQhk1T4QhfZGEss/4uF77N83fe
         nt3gcoUTp6bYm5JCW3AxJIKcdCowSlsoxr9aed24uJZEBk2Mjdt3MHJyKzelCJPpz78L
         uytF+/n3QYFqLczteapUaAMg6PY8nmtM6mV0P176Bio9VydPPkc1/z3RtgF/RnQe6GBd
         5ewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746480248; x=1747085048;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aanpIqBEjEkle09/pdhUe09l89jk7xvzFrXGr1sJVPM=;
        b=M8NlzznavU3tazdxi3OTZU7IIjzFUai6SSa4bnxzSfZIAOV0lsppj55SbtCVvEbT3+
         7AFr+dfvTOKt4uVq30cLVQuUsCX63zsfW4Ew8HgwTD1ViAuzT2S4mPaWbRJwbonHeDgD
         CpnTtIhYqlOxDHzcvlZwk0uud+xO0i+8VbtlTfDUb20eT81EZVgPtk0mcoxMvEfxsFyj
         oUsqkDF7ELpbKMLvZweEIWKfiOWdV5fWNZDYeW3d7b8kiqz3SRh4qMgLvlxrxdel1wZT
         bhe3Bjug6dKPoec4SQggWhjYJ7oQvreC5BIPRlAhtL3AdTpK9Lf/YKRgvxPwRECmGtmu
         FvIw==
X-Forwarded-Encrypted: i=1; AJvYcCUStYRI8e9xLejbz3eUxXXUOoUdq5X4NzzFYtBby+TIHyYpKoAG23qvwqtm1aAQ97fsp3BcWVnrrmVFxGA=@vger.kernel.org
X-Gm-Message-State: AOJu0YywBcPC9lAzIWmLHuUw4oOzVIk3NWU+mre/BmDkQcg1x3DDvs/U
	0q/V/KWWyJV7KF6bFPAKF3AtcPR6MjyY2sBSyoCIjaDDyzccPw0KhrPDfh3xX+CL2kqh8TT8ZQz
	PG/vfsM36zeM5U3AoAGmwXZF+6Q==
X-Google-Smtp-Source: AGHT+IGvmIS+oO7hr+WzfoRtTIOqh+Ojdok5QsBrhXjWwQ72p2VVAbulBQaGNKjInA0WtF3dkw1he45K1kbrVt+M2Gw=
X-Received: from pglr16.prod.google.com ([2002:a63:5150:0:b0:b01:fc1:931e])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9106:b0:20d:df67:4830 with SMTP id adf61e73a8af0-2117df07787mr1275008637.0.1746480247824;
 Mon, 05 May 2025 14:24:07 -0700 (PDT)
Date: Mon,  5 May 2025 21:24:03 +0000
In-Reply-To: <20250505212401.3379699-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505212401.3379699-6-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3927; i=samitolvanen@google.com;
 h=from:subject; bh=h0UfvaGWNgOmqj6pRMaE3gGYsMYVBXy/lS+rZ7Qhtes=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBmSOoUP98yQCa35V5zy02nT8vj/1/sCLgenitl0L/4+e
 6r1kkq3jlIWBjEOBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjCR3hqG/xkdXk9EBWavq1mS
 q/vuS5Vkf8Tal7X5xb4vQlQ3P3JROcvI0Gd+TqZ79qR+cYlNi8t2MZxfrM1/iTky+eqZA1He/XN m8gMA
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505212401.3379699-7-samitolvanen@google.com>
Subject: [PATCH v2 1/4] gendwarfksyms: Clean up kABI rule look-ups
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, linux-modules@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Reduce code duplication by moving kABI rule look-ups to separate
functions.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/gendwarfksyms/kabi.c | 101 +++++++++++++++--------------------
 1 file changed, 44 insertions(+), 57 deletions(-)

diff --git a/scripts/gendwarfksyms/kabi.c b/scripts/gendwarfksyms/kabi.c
index 66f01fcd1607..badf8d46b154 100644
--- a/scripts/gendwarfksyms/kabi.c
+++ b/scripts/gendwarfksyms/kabi.c
@@ -222,33 +222,55 @@ void kabi_read_rules(int fd)
 	check(elf_end(elf));
 }
 
-bool kabi_is_declonly(const char *fqn)
+static char *get_enumerator_target(const char *fqn, const char *field)
+{
+	char *target = NULL;
+
+	if (asprintf(&target, "%s %s", fqn, field) < 0)
+		error("asprintf failed for '%s %s'", fqn, field);
+
+	return target;
+}
+
+static struct rule *find_rule(enum kabi_rule_type type, const char *target)
 {
 	struct rule *rule;
 
 	if (!stable)
-		return false;
-	if (!fqn || !*fqn)
-		return false;
+		return NULL;
+	if (!target || !*target)
+		return NULL;
 
 	hash_for_each_possible(rules, rule, hash,
-			       rule_values_hash(KABI_RULE_TYPE_DECLONLY, fqn)) {
-		if (rule->type == KABI_RULE_TYPE_DECLONLY &&
-		    !strcmp(fqn, rule->target))
-			return true;
+			       rule_values_hash(type, target)) {
+		if (rule->type == type && !strcmp(target, rule->target))
+			return rule;
 	}
 
-	return false;
+	return NULL;
 }
 
-static char *get_enumerator_target(const char *fqn, const char *field)
+static struct rule *find_enumerator_rule(enum kabi_rule_type type,
+					 const char *fqn, const char *field)
 {
-	char *target = NULL;
+	struct rule *rule;
+	char *target;
 
-	if (asprintf(&target, "%s %s", fqn, field) < 0)
-		error("asprintf failed for '%s %s'", fqn, field);
+	if (!stable)
+		return NULL;
+	if (!fqn || !*fqn || !field || !*field)
+		return NULL;
 
-	return target;
+	target = get_enumerator_target(fqn, field);
+	rule = find_rule(type, target);
+
+	free(target);
+	return rule;
+}
+
+bool kabi_is_declonly(const char *fqn)
+{
+	return !!find_rule(KABI_RULE_TYPE_DECLONLY, fqn);
 }
 
 static unsigned long get_ulong_value(const char *value)
@@ -267,58 +289,23 @@ static unsigned long get_ulong_value(const char *value)
 
 bool kabi_is_enumerator_ignored(const char *fqn, const char *field)
 {
-	bool match = false;
-	struct rule *rule;
-	char *target;
-
-	if (!stable)
-		return false;
-	if (!fqn || !*fqn || !field || !*field)
-		return false;
-
-	target = get_enumerator_target(fqn, field);
-
-	hash_for_each_possible(
-		rules, rule, hash,
-		rule_values_hash(KABI_RULE_TYPE_ENUMERATOR_IGNORE, target)) {
-		if (rule->type == KABI_RULE_TYPE_ENUMERATOR_IGNORE &&
-		    !strcmp(target, rule->target)) {
-			match = true;
-			break;
-		}
-	}
-
-	free(target);
-	return match;
+	return !!find_enumerator_rule(KABI_RULE_TYPE_ENUMERATOR_IGNORE, fqn,
+				      field);
 }
 
 bool kabi_get_enumerator_value(const char *fqn, const char *field,
 			       unsigned long *value)
 {
-	bool match = false;
 	struct rule *rule;
-	char *target;
 
-	if (!stable)
-		return false;
-	if (!fqn || !*fqn || !field || !*field)
-		return false;
-
-	target = get_enumerator_target(fqn, field);
-
-	hash_for_each_possible(rules, rule, hash,
-			       rule_values_hash(KABI_RULE_TYPE_ENUMERATOR_VALUE,
-						target)) {
-		if (rule->type == KABI_RULE_TYPE_ENUMERATOR_VALUE &&
-		    !strcmp(target, rule->target)) {
-			*value = get_ulong_value(rule->value);
-			match = true;
-			break;
-		}
+	rule = find_enumerator_rule(KABI_RULE_TYPE_ENUMERATOR_VALUE, fqn,
+				    field);
+	if (rule) {
+		*value = get_ulong_value(rule->value);
+		return true;
 	}
 
-	free(target);
-	return match;
+	return false;
 }
 
 void kabi_free(void)
-- 
2.49.0.967.g6a0df3ecc3-goog


