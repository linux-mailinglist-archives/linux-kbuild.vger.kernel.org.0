Return-Path: <linux-kbuild+bounces-7295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C871AC50C7
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 16:23:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB49E1BA0B58
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 May 2025 14:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175B0278768;
	Tue, 27 May 2025 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bI9fyVba"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3C527144A
	for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355826; cv=none; b=G9KmUrte0Zh9RG5bk8wSvs/NGgTz4HKzksk+gC0dlx6mmli40Tuz8RTbD4sevKJOsO/8awZA0rdH7q5EbY3mgldVV/yUdYko/449gIk3Uf7RpuJ8IS/FR4lA2MZ2cDMlTtA2PmKd1rmxlP5jUixf3mhHjCIK8Uw+RfKMTpZrrFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355826; c=relaxed/simple;
	bh=1b2v/c0DKM/AjXvU+XYHFgHzNKVCeFNe8WzHm7DLXTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S9c3ri9uMMLBMl2+mdteUGlGlp63x41I6hxGZTIPfiPf+beOu6Qzs8NpCLDzU8shyNfNBkx7dSwfdl0ObBNjP0ZeQmg6d9tFQPy+bpnIML7Qr/8nA6Pn+kj+rSasda371g9TDjfPSL85u0Jhe/mJev9+gQUYzJiy40Nyfnr71EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bI9fyVba; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so32002445e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 May 2025 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748355821; x=1748960621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6n1uaYpmB1kOr6JIFMyXy+K3N7piDSdguvD1FRtdHTo=;
        b=bI9fyVbaB8ZfsKj2gRTdDuSX7t/6BLWjPsHS8ScCaBJn0sGxVWN0tR5Bu+2Vbfh3py
         Domz8EA7qqN4PmVHQ7QD9T9Ibb1/cm/Wy4hYI18zgfNoSX2uDtkmKDslv0km33QKwU53
         sAPhyktjvtroSOcS2oklRdNfsfDTVHVHSo8BVix4QDYQQXCzOG5pcTJ+46qXlxxXSGx4
         1b/D6nI9q39iyzoAFG5fGb9HFbqWUs2Zs63X3l2kSDXxFoSDLb6xISpGfvFDvSY6Jczq
         9LIaSqqNHVRV7p/3LWToot+jEU8QlWnV9M+PkqYPMqYZw8gcUpryxPCPegw5ujcZkowd
         qajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355821; x=1748960621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6n1uaYpmB1kOr6JIFMyXy+K3N7piDSdguvD1FRtdHTo=;
        b=SATsY+d0EQfYxO0PT1TaXVuoC5ZpK0bLum+XjrVa1V18WknXnGYtNXjy/2zw4ov+12
         WNehJ93aHe59e57TPinBaQOmSJ1g7WpOgiv1SPxdXLWuYtBN/IRTvJx6+6sHKCt3Hmak
         R2/WLmResH4dIb4uNEo66CSpUT1KQs33LaWE0tTV3guDDwTe3tnAjRp1Zh8ie7Lz9/p3
         XuCG/g/lF0DoDx3jCkg+4glfx4iO59brlHD3Yrx7LuNnZCGl6wfWc0TIrL8BGBvyoYJ4
         TOp0+YtW6cRaR0iyViBBBeDCr8waFM9e+UPdqr8oVoQFmhIBaQyLH2uVexTfrW4+aGkL
         nfpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq9ctzjIMhw0RzKHgHicIc113IcSzmj6SCvqfJs9Pmc5sZh5aIiLAZwZcH8trjHAZjhX4pW/bo4xw4RdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5F+rrBtstIQGkKFvk6RmfLH1KJngU1HO7FTASfGBHbqkPBwyX
	Cgvqd4eg8NbVknA6F2B+RsJrkyOQmU+LSiFciujXn0GUdBa0jE/TZsyv45Vk7Xp8Tss=
X-Gm-Gg: ASbGnctRrWvM0860eQdikQxf0EDfyrgWxksewAXNUs5nfaC2IZLQaO18hGvocdBrn2N
	MeAMes1BZfS0avXUQaSGhlYHaZ4TqrezaMEjUBynYS0YB3OydkI91yTYZMyNRLRRiL/X1jf3F1R
	gFok2O1dbKAZFbfOKSQFLteVANzDikZpDb52PxtbIrtBq6TRXfdD3fvLCxw91qFPLamToxpcUzM
	DBsEeCp5ObWGY2WX6tZ/kmMakjnYIWe0RSG5HhExO6sP+ENjJkL99gifArqFBjWL4VGWvdmmUhD
	myymcZdqIDh6J0aLlF0V6iAOElWwNg7Ky2ZAonVR6B0SbQBBYxuiFw==
X-Google-Smtp-Source: AGHT+IELC1IttHHKpQxPobF04n1BxV0zFn5416xOB8lAZHST6vgiJpJWp1f8e/ECPlHN8aFnCXiRFw==
X-Received: by 2002:a05:6000:250f:b0:3a4:cfbf:51c3 with SMTP id ffacd0b85a97d-3a4cfbf5539mr11042240f8f.10.1748355820879;
        Tue, 27 May 2025 07:23:40 -0700 (PDT)
Received: from dhcp48.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4c73a4284sm12100719f8f.85.2025.05.27.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:23:40 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH] genksyms: Fix enum consts from a reference affecting new values
Date: Tue, 27 May 2025 16:22:11 +0200
Message-ID: <20250527142318.14175-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enumeration constants read from a symbol reference file can incorrectly
affect new enumeration constants parsed from an actual input file.

Example:

 $ cat test.c
 enum { E_A, E_B, E_MAX };
 struct bar { int mem[E_MAX]; };
 int foo(struct bar *a) {}
 __GENKSYMS_EXPORT_SYMBOL(foo);

 $ cat test.c | ./scripts/genksyms/genksyms -T test.0.symtypes
 #SYMVER foo 0x070d854d

 $ cat test.0.symtypes
 E#E_MAX 2
 s#bar struct bar { int mem [ E#E_MAX ] ; }
 foo int foo ( s#bar * )

 $ cat test.c | ./scripts/genksyms/genksyms -T test.1.symtypes -r test.0.symtypes
 <stdin>:4: warning: foo: modversion changed because of changes in enum constant E_MAX
 #SYMVER foo 0x9c9dfd81

 $ cat test.1.symtypes
 E#E_MAX ( 2 ) + 3
 s#bar struct bar { int mem [ E#E_MAX ] ; }
 foo int foo ( s#bar * )

The __add_symbol() function includes logic to handle the incrementation of
enumeration values, but this code is also invoked when reading a reference
file. As a result, the variables last_enum_expr and enum_counter might be
incorrectly set after reading the reference file, which later affects
parsing of the actual input.

Fix the problem by splitting the logic for the incrementation of
enumeration values into a separate function process_enum() and call it from
__add_symbol() only when processing non-reference data.

Fixes: e37ddb825003 ("genksyms: Track changes to enum constants")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 scripts/genksyms/genksyms.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 8b0d7ac73dbb..d05c01eb721b 100644
--- a/scripts/genksyms/genksyms.c
+++ b/scripts/genksyms/genksyms.c
@@ -181,13 +181,9 @@ static int is_unknown_symbol(struct symbol *sym)
 			strcmp(defn->string, "{") == 0);
 }
 
-static struct symbol *__add_symbol(const char *name, enum symbol_type type,
-			    struct string_list *defn, int is_extern,
-			    int is_reference)
+static struct string_list *process_enum(const char *name, enum symbol_type type,
+					struct string_list *defn)
 {
-	unsigned long h;
-	struct symbol *sym;
-	enum symbol_status status = STATUS_UNCHANGED;
 	/* The parser adds symbols in the order their declaration completes,
 	 * so it is safe to store the value of the previous enum constant in
 	 * a static variable.
@@ -225,6 +221,23 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 			return NULL;
 	}
 
+	return defn;
+}
+
+static struct symbol *__add_symbol(const char *name, enum symbol_type type,
+			    struct string_list *defn, int is_extern,
+			    int is_reference)
+{
+	unsigned long h;
+	struct symbol *sym;
+	enum symbol_status status = STATUS_UNCHANGED;
+
+	if ((type == SYM_ENUM_CONST || type == SYM_ENUM) && !is_reference) {
+		defn = process_enum(name, type, defn);
+		if (defn == NULL)
+			return NULL;
+	}
+
 	h = crc32(name);
 	hash_for_each_possible(symbol_hashtable, sym, hnode, h) {
 		if (map_to_ns(sym->type) != map_to_ns(type) ||

base-commit: 914873bc7df913db988284876c16257e6ab772c6
-- 
2.43.0


