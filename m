Return-Path: <linux-kbuild+bounces-7362-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C8ACC73D
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Jun 2025 15:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDB3418937C2
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Jun 2025 13:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84FD22D9F3;
	Tue,  3 Jun 2025 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DtNCXBCr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A7D22A1D5
	for <linux-kbuild@vger.kernel.org>; Tue,  3 Jun 2025 13:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955752; cv=none; b=pFhO1je1qiFMpznaq9vwXUUbrrC+Vj8us7cxzGTBZspzWOnxkr2D1hhsqtW/yqIUQGE5hCBwJ+NvF4P5jw2/KQq/UjTtvPBeBRgsji7bJaWhVCSxZa5kF+Qf1Ngt9EzVnSyaiJA+LfLCsaeQx29mCsL7Kx1aYrZNxebyoKL0zCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955752; c=relaxed/simple;
	bh=a3Bth044JkzqN+I5E9h2Xqk3MI2Efz0GhU3HzldcUTA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n4c1/Dol4LPIlWwnq+c4T9z1ufVuRiFJet/SCpf3XsIhtMQ0HxaZOeYroII/5P9lOhjs6jOi2RoXRO7wX34ioSlwXUdcDj1wFcikBIIvd/nSv2B4zUMWXEYrENj2LfjnI5YnqYy9ZARREneW4I9diiIbANDU8jHzZ7DHTn0+Vbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DtNCXBCr; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so64847315e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Jun 2025 06:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748955749; x=1749560549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FgV8WmPpyYwIlY3KXqCGoTrUxLSUVlDIjanFlbv2iSQ=;
        b=DtNCXBCrHfH+PifPJAfuY4/xz4TS1AH3JMkfEjUwLxfa+GWVRbq0VPpePlqOhymPVl
         pD4TQQ5y1d9Jli2irl0wfF7vmaYO7ArBc+lXR+WoJQU1T6bjW0uYFdrt8+/A4aW6omRe
         nMuXjNItCndUx8H3Ocf0gFh3t61DL6q0dAt55UsPHv+MyGO6mMjxM3M+uRtJXcR+AXS9
         yWWgZ7a3W+fnVWb2u1bUWI2rjFzPHQhmMd6ZLSTgZe6UWh0v9pYpXniADyw0ZEXRxR5v
         YZYE11253/VED3yMTWZPleJFJ9hriBfVi1NlFNoMLaKdk90RclrtGxibwPI1ew7TmDgG
         Q67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748955749; x=1749560549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgV8WmPpyYwIlY3KXqCGoTrUxLSUVlDIjanFlbv2iSQ=;
        b=xNsiKH/qg4hyoHowf3dkCNDgPTcxw4oeQohhyOcyIog7Hml5T3cm8yfr53Rm3XaMhR
         5096cNZ75FiI25FzQxt9Av76wp6VHnsyX6gin33V654RB8apjiuaWhs2O4N33mJIM7xG
         LfSPPtfYw1/1R9Izk4IgCU+fllZ3fdZ33JCGh9K8ZDTFvNgfhY/fIf1y+46fMdOosTyr
         oVgnSTDwB4gs/7l7x9St4sRXSnqCn5+mb4gRX2eiEvkMhI0wsJk6RvsK5rnPW8IND+dp
         smB32LKhk/pyCLDUgNgPWN4o8tEgItujA6QjCAnz+1OSeeuApO7p0iO66FG5BWUtCmQH
         Yxmg==
X-Forwarded-Encrypted: i=1; AJvYcCXgTAqswxcYIkhh3JaAmS83VJsYPSOdHroLymqthUEIUQhNy8JduUPREZ8p5vyE+Jb0iJdsekseWsDgcMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4Hd1LAxePvCUsYOrF0Wxn2yfLP+ZVIkR77yW1NYZIM6tTsBiC
	ST0iiMlkTs4Dn3dqhKnCO2s5j3BqQ7o39ZiErKyKylsOmcrDX33na3TCHw36rsrzJTk=
X-Gm-Gg: ASbGncu+/o4jZPw31JDXE6P2DWlMUoBb8JtzMUZd6BiF91VDESzsirF1Fl9CwBdvvk+
	w95keNrMBOHJ/Khz6eyLYTFF6b0tsipPcJDMAOpV8t7KF0nhHxkXj1CwkVz6jUuvw7+yZVa1CpZ
	8A1M5azqTuWEtbRQo/rCFLlBC90pQgcOB1O7F7mdJw2UPBoGfH5UeQwgnBf391FcpWB5i3aVv4r
	wzbP0DghTsu3RILI0inIXi4sXa+iGJLhteldMgpTbrLQUF441yUzKAKAXY31cnbZxW4JbjdObgo
	o2uB7sYp48DSspmd3gYb1KEWA07KXZhETULrfWmI4ZbVHakijBc=
X-Google-Smtp-Source: AGHT+IFWiSmBVfdSIw0x/8GQR722JBV1AamyNmhPw9KmRDkbnQ7doRl6M042da4l9DkvncHLB16wTA==
X-Received: by 2002:a05:600c:8b0f:b0:43c:f63c:babb with SMTP id 5b1f17b1804b1-4511ecbbdc4mr99459095e9.1.1748955748613;
        Tue, 03 Jun 2025 06:02:28 -0700 (PDT)
Received: from zovi.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8eed4sm158634485e9.4.2025.06.03.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:02:27 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH v2] genksyms: Fix enum consts from a reference affecting new values
Date: Tue,  3 Jun 2025 15:02:09 +0200
Message-ID: <20250603130213.338518-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.49.0
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

Changes since v1 [1]:
- Remove the unnecessary condition 'type == SYM_ENUM' in process_enum().

[1] https://lore.kernel.org/linux-kbuild/20250527142318.14175-1-petr.pavlu@suse.com/

 scripts/genksyms/genksyms.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/scripts/genksyms/genksyms.c b/scripts/genksyms/genksyms.c
index 8b0d7ac73dbb..83e48670c2fc 100644
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
@@ -216,7 +212,7 @@ static struct symbol *__add_symbol(const char *name, enum symbol_type type,
 				defn = mk_node(buf);
 			}
 		}
-	} else if (type == SYM_ENUM) {
+	} else {
 		free_list(last_enum_expr, NULL);
 		last_enum_expr = NULL;
 		enum_counter = 0;
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

base-commit: 546b1c9e93c2bb8cf5ed24e0be1c86bb089b3253
-- 
2.49.0


