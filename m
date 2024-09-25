Return-Path: <linux-kbuild+bounces-3761-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 802DA986315
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 17:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CC9D1F25269
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 15:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03A0A199E9C;
	Wed, 25 Sep 2024 15:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xpdc7b0r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79171198A20
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 15:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276570; cv=none; b=paJ/VPTkhPIw3+hmxsk1lvMviGDdjgyg+x4R0l93qdei7m84o9HlPV9z56kjmssG2E+gJEpactm4GYWkVrJS6m3i6Xc/AkMcNY4hNbtayTmUIgzTLlcVhK4u4ytUsvczoXRfOALx6QehlkvvfT7Q5NJCfGMl9mjg0U4mFSHzoSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276570; c=relaxed/simple;
	bh=4t4Zd7d88HUB4IQR7hyWqg3RF4QpMaNzLYFQ0q/SbWM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mIpNHAmtVM5Oc8fvslU2ycXm1OwNjqrY2dZpS17tfSpmpcaOkDD1jqeYnttcfsI0Ay9Pg7dZIUdOzsGROSyCbZ+f+PnFQ9Wa3P9UiRMqpADy8z+A8eYIWgmTGdgIgSv8XDXfdBUlCzNhUbj9789OD87RCM+dgNkwGtVQbYssNmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xpdc7b0r; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-374c44e58a9so3281745f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 08:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276567; x=1727881367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pNx8CgL2JjB1FACn8gZOCDgH3XlG/cZ7BMhQN82yM0M=;
        b=xpdc7b0reBbwnnjkdvySuBhqxCUup4ROen4arCBet5tBUn/jAPZrevZ0XydaQWVEdR
         NptfvC2h5L3r3+buanOYePlkab/2vDQbYR/I2i9wuWm4TvkCnKkf9vNjvdgt80uJ8+SW
         iLr4Wbpv+HxRref707wqaz2SoYCW0MfU9uJo8GCadxjy+7NiRAnESsNrx2pnflAkCsms
         o7NuB+N+ESfhIaXEtIqiTN+f95AS/6k7Spad2NqYoV//cdCFL0JwjorjV7Fhr1bPSoQ6
         6GKDsf/GGwmOOxvTmd0CsCY8/y/kVK0718CGugnH/HehdzmKjcWznuNpm26kPgWMkSJ9
         d2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276567; x=1727881367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNx8CgL2JjB1FACn8gZOCDgH3XlG/cZ7BMhQN82yM0M=;
        b=VDqnD5Lf/Ta+7K8o+afkEW+OUvio11fFNHwkA2prWNyZxDI4WOvn69qkKrC9LuICCv
         waHUvu2v+5wzHm7kBj+d/LOAjhxeyU78JrsrQcGGtVGgV6dbbQJ0dixDUSQAUYT4LPwD
         VxpzrkavpoqKMybun+erHblDrdGNR3zdhHIPmPf2FSwAq+/NvyClpFIBpVIlzWKJe/za
         sbL1T2gDEvJX9fJ/cpytdDUA8uBU1uU1oBNY1FnD9FM2SC27zr6QPlQQIxlppQ07jt8+
         DoKtwytMqNpd/nRkQfxM0tmGd5ZqbmotNTj/lmkaEVLMj3BZfBh+DxuK+Av7Ymu0JajS
         CmHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWYW1yKS1NA8kWhP2bYUhPEc1wkN2k+nAOct8Mrmxs4XMzIGQrLIkTMtjGHjeqlCrh8lK4uvTcEM4663I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7YdW5gCRUjAKsNlGOLnJALUdcJv+2jqL6G2GfYAQ/OBkF7guL
	mujKD5Hkd9lr3xbHA/o6QSB0dRP2eBUhuNJstGR0R9yLdijKJMNhrJ7kPTJIKD2uvACYcQ==
X-Google-Smtp-Source: AGHT+IHtZA65C9eNefhgBWqmYh0kGm6u7UMHidCQ+DZrqbEOemMqvMt90MEtVjIphkQcIFg1qUNObHvF
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5d:5e04:0:b0:37c:c51b:d07f with SMTP id
 ffacd0b85a97d-37cc51bd43bmr945f8f.9.1727276566478; Wed, 25 Sep 2024 08:02:46
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:22 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4300; i=ardb@kernel.org;
 h=from:subject; bh=LZda20wnQiwQiTXt6tiHm30A1wODb0KBnxm/teE+Lu4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6unSO+7/NsayfzpQ7uW+6/sf035bm8SjMXouItt6v
 vsqNLN3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlUFzIyLClfembn6Wlfb79Z
 nLiyrmmade3VvmNH2xq0FwTP8FnOwsHwmyXhPONLDfu9MQfFQ+MyCsJWuy/VFOpa8t9x77FzLsv /8AAA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-52-ardb+git@google.com>
Subject: [RFC PATCH 22/28] asm-generic: Treat PIC .data.rel.ro sections as .rodata
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

When running the compiler in PIC/PIE mode, it will emit data objects
that are 'const' in the context of the program into the .data.rel.ro
section if they contain absolute addresses of statically allocated
global objects. This helps the dynamic loader distinguish between
objects that are truly const from objects that will need to be fixed up
by the loader before starting the program.

This is not a concern for the kernel, but it does mean those
.data.rel.ro input sections need to be handled. So treat them as
.rodata.

It also means some explicit uses of .rodata for global structures
containing absolute addresses need to be changed to .data.rel.ro to
prevent the linker from warning about incompatible section flags.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 include/asm-generic/vmlinux.lds.h       |  2 +-
 include/linux/compiler.h                |  2 +-
 scripts/kallsyms.c                      |  2 +-
 tools/objtool/check.c                   | 11 ++++++-----
 tools/objtool/include/objtool/special.h |  2 +-
 5 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index cc14d780c70d..2b079f73820f 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -456,7 +456,7 @@
 	. = ALIGN((align));						\
 	.rodata           : AT(ADDR(.rodata) - LOAD_OFFSET) {		\
 		__start_rodata = .;					\
-		*(.rodata) *(.rodata.*)					\
+		*(.rodata .rodata.* .data.rel.ro*)			\
 		SCHED_DATA						\
 		RO_AFTER_INIT_DATA	/* Read only after init */	\
 		. = ALIGN(8);						\
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index ec55bcce4146..f7c48b7c0a6b 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -133,7 +133,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #define annotate_unreachable() __annotate_unreachable(__COUNTER__)
 
 /* Annotate a C jump table to allow objtool to follow the code flow */
-#define __annotate_jump_table __section(".rodata..c_jump_table")
+#define __annotate_jump_table __section(".data.rel.ro.c_jump_table")
 
 #else /* !CONFIG_OBJTOOL */
 #define annotate_reachable()
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 9c34b9397872..1700e97400aa 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -357,7 +357,7 @@ static void write_src(void)
 	printf("#define ALGN .balign 4\n");
 	printf("#endif\n");
 
-	printf("\t.section .rodata, \"a\"\n");
+	printf("\t.section .data.rel.ro, \"a\"\n");
 
 	output_label("kallsyms_num_syms");
 	printf("\t.long\t%u\n", table_cnt);
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 01237d167223..04725bd83232 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -2575,15 +2575,16 @@ static void mark_rodata(struct objtool_file *file)
 	 * Search for the following rodata sections, each of which can
 	 * potentially contain jump tables:
 	 *
-	 * - .rodata: can contain GCC switch tables
-	 * - .rodata.<func>: same, if -fdata-sections is being used
-	 * - .rodata..c_jump_table: contains C annotated jump tables
+	 * - .rodata .data.rel.ro		: can contain GCC switch tables
+	 * - .rodata.<func> .data.rel.ro.<func>	: same, if -fdata-sections is being used
+	 * - .data.rel.ro.c_jump_table		: contains C annotated jump tables
 	 *
 	 * .rodata.str1.* sections are ignored; they don't contain jump tables.
 	 */
 	for_each_sec(file, sec) {
-		if (!strncmp(sec->name, ".rodata", 7) &&
-		    !strstr(sec->name, ".str1.")) {
+		if ((!strncmp(sec->name, ".rodata", 7) &&
+		     !strstr(sec->name, ".str1.")) ||
+		    !strncmp(sec->name, ".data.rel.ro", 12)) {
 			sec->rodata = true;
 			found = true;
 		}
diff --git a/tools/objtool/include/objtool/special.h b/tools/objtool/include/objtool/special.h
index 86d4af9c5aa9..89ee12b1a138 100644
--- a/tools/objtool/include/objtool/special.h
+++ b/tools/objtool/include/objtool/special.h
@@ -10,7 +10,7 @@
 #include <objtool/check.h>
 #include <objtool/elf.h>
 
-#define C_JUMP_TABLE_SECTION ".rodata..c_jump_table"
+#define C_JUMP_TABLE_SECTION ".data.rel.ro.c_jump_table"
 
 struct special_alt {
 	struct list_head list;
-- 
2.46.0.792.g87dc391469-goog


