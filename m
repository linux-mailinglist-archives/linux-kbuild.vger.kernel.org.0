Return-Path: <linux-kbuild+bounces-6821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2FFAA578F
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 23:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D484174D60
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 21:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8122C032A;
	Wed, 30 Apr 2025 21:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0JkSnkMe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42850270EB8
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 21:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746049258; cv=none; b=cDimoeLAfHvCpykVQZlq5GV11Q5gf4BADwx3ojl4USH2yCuCAg1UZUW8nmCWJTejsz33zuOdpbA9cGTwaKW1vSA90ps0Rb4ElVzV5ju3B5SeqX3vhAkUIRc7xWS1eq0jECY67S2WfEXQ97r1mou0eOwjJ/H2byCN1jfTtpVs+NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746049258; c=relaxed/simple;
	bh=lVxGh1Tg5qZOItTVY+YP5B9couXEWcM6CbGBMFoCOD8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OcHi2zDSoGh5B3Cqazpxz4itemdA+WrNPUzMvlXpw6L+j306QjhgHqYbejCZVjKEQZwUZZH8/tsEvCBdNeX7WYpllH1H+7k2Af2UA3jfgIyENHsDa09vlbW1+ZUeCncsLjnAOFaK3xVGyTNCy4cslJNWFBbs3NgqGwJEIgo7VF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0JkSnkMe; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-739525d4d7bso247513b3a.2
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 14:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746049256; x=1746654056; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PwsYz8d681oyODeIoah8TShz0oIpsZYiEqpJ1PpWgd0=;
        b=0JkSnkMeKVfsPbCZ4Md7Oq3OCLB0zuXdbtNcq0enO2R3Bx732s/61uTCN1AkNJPVdY
         Y4F4BU90isrByXsTEASwBqY00JagGYW2sWMk1i3NxWJrCYN+nauc9Y1qSDR292R/tMoK
         ZWKUpv8RncTJjto6u4S967zqTdrY4Hi8XDH7nxlWC560mi5zGsPu28c7FS8W/N3+uwq+
         s96aYZzeZK5ohFd6R5SYKVnPAkCOgJLvx8y/0XVQO3m80B4/Z7JkG/8qnkQK1f12AsDX
         JNzHvKR2OKL0EjR3Nfy3tR4GzQD7rwU1MSH5ZB0pQWMERRH0EitMdDsFI2jVjHOfWskP
         LT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746049256; x=1746654056;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PwsYz8d681oyODeIoah8TShz0oIpsZYiEqpJ1PpWgd0=;
        b=WiGj1U1TfJYNlVwfnpLgC7d02X1ixPx4dtX6Fnx0zILVOLLrmh/BNZaAt32HIiakCL
         dY9njLjdYHsyHPHUhyj2IkqUUvals7B4Ghoqv9uOPP+t1uQKIpphmhC73/+127i6gtpr
         n/SzEeMyBb/u8vHAKBm4NvdE7TVOmyk+Jm8CbqNTqfIlJaOEcKT0XRaKGzBpVHzGJNST
         /BAv4qU5n/6TzkiDn73vStAF1D1thbMNflAjTnG+uPLtdk9lOmDV1wX0tWn/begFg6wM
         CE2UeSqYS/7iN/7Xq0t65OwXL1Z8VWK73Ut8HfTZbTMrQEy434RsyPp/yPprmG8F5K0r
         nZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj7GTtGlU1LiA9vauhaDXxLGGwiEDUsKK5dKvvUTymXV0ib4r/h5Os5NeCZfCyngxniJvTJdKCucb2hhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlofiIViBKkoDguqI6me+27yWT/dxLZuejHALKMLPGXiMgvieo
	hHA0F/pVTJC+XKN1ycjmcdBqRTc5bwv1HvpNRDvzaGJFwvDecAwlYvjRozZlp0lXXBuCkuKkrvd
	lJq29GmNhE4euN6IwSOGyyC+OwQ==
X-Google-Smtp-Source: AGHT+IH+89xWZb8Xbnsxtd0BCqDPM754+OwOdR/0Y0+acRvMkTR/2yTU2G9VVFNxNl9dFxKF9iUAE+KkoTKUo2oMBVo=
X-Received: from pfble21.prod.google.com ([2002:a05:6a00:4fd5:b0:732:858a:729f])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1149:b0:736:ab1e:7775 with SMTP id d2e1a72fcca58-7404764c42bmr691100b3a.0.1746049256424;
 Wed, 30 Apr 2025 14:40:56 -0700 (PDT)
Date: Wed, 30 Apr 2025 21:40:51 +0000
In-Reply-To: <20250430214049.2658716-6-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430214049.2658716-6-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=3880; i=samitolvanen@google.com;
 h=from:subject; bh=lVxGh1Tg5qZOItTVY+YP5B9couXEWcM6CbGBMFoCOD8=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDBlCMx5+MvrBfN+dmaH1iLOYWZyrTWFB5UzrsNXSCve+p
 87LtajqKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABPRbWVkuCeW/nvl6Yc7KoR/
 xWco3GzTaZJrXWW2OoAxyDng9/JfQYwMvTqsNYGn7s53atr9tD/ASnXltoSTJzN3X17LVZRvUX6 HBwA=
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430214049.2658716-7-samitolvanen@google.com>
Subject: [PATCH 1/4] gendwarfksyms: Clean up kABI rule look-ups
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
2.49.0.906.g1f30a19c02-goog


