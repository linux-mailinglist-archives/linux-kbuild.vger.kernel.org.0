Return-Path: <linux-kbuild+bounces-3751-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E94A39862BC
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 17:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1817F1C20D6A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 15:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4840418E778;
	Wed, 25 Sep 2024 15:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="btIfw3b8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128A918E76E
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276545; cv=none; b=nEDpt/Cu00Gs7fr3qRqe9ZGobMRdb9ptIXkYwY4RgDMjxVYP2t9YUa1OLRwafAXUW8qGU+MGXhlHgYTGIBvEe51xAbPXz53tAAFnZfXDeDBz5310Ud7QesggfqxvkTFAJperv9U8/kp649qw9wQT79f4PnE6pUUyR5Fy0Nv9MVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276545; c=relaxed/simple;
	bh=5QDZ8e6v38oe4vdIzJiUkWBfZtQ8UHIt+vUykdg9FgY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KOglT7U2oEA9tDGtfFZlxvXvO0mij2bH9gaiJfB3sCV1WtPr7LmiOXYBbl5f337Y1GnoRcprFFewGWv9m2bkGf3msjM4JSLksHfxD8CQFfIgyut4wgmQQRjD9RU/q2/tHgzXSIpVQst+DBwmBZgyVnkVqAl2XpbD6HYXeQUM1JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=btIfw3b8; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-a870f3a65a0so523819666b.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276540; x=1727881340; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLI1adUSxUIp8UXfDcqdD38QxXI+e+F/+Ag4yCxL7E=;
        b=btIfw3b8uzUX3qs7RbZNOIodIRQS3kYxnKbB07MkGpXPYtKc+y45geOrWIRE35o0GJ
         5YzfMc8m/wwUmK922QVfZyXI+B9wuA11T+flD5UOxahZBXEtemDkGE3W7/J4g0rup0hY
         RyswEcm3adw5fvIh3eha8RaOBvemjfbbMcjxK6TO86cFNcWaluqJU/uHawwpriFuKlzC
         b5Ay07lm9xUJ9+hbAhwj5blziH/yfFSGqOTaAfwczL1nqILOKB83UYvc+v0ZoNMQWtNe
         zpF1gMq1hKxaI61gGVFhZCZNMi0lZFV8gGArhbSqFgJ/PphdZxS/hEKLUNBePwgIibqI
         GGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276540; x=1727881340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMLI1adUSxUIp8UXfDcqdD38QxXI+e+F/+Ag4yCxL7E=;
        b=sbfBtWXOXxnhwbeWceqTuoBbJbfkFu4q522bdll5x8ugka0yQY8CjwPgDnc8HGpR0r
         p1DQ41ViqgGyDQCRMExo3HwhKUlgGvCC+O+CyYDbBhIdvIaE/n8QHrFLe83YlQQX6pSA
         SzlWQfGVb6kLs/HN/TrTjFuYoM1JQChym4OKEjlZlhaNER/Ly2v2CPxxlYeLFSzhGSeS
         u/PuX0suTAFGverlaPxSr3yRMIExVOikhEwDvXsIhayBebjsu/G0ltmDlNUeMZ+406jz
         nJkdn9x6QD5lRdzUNEAC/j26HUdSXRDw6uQw3B9RBNYV5K5uX+ojP2ZTSRR3rQOsttOo
         UQlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmlW5S29x1/6OSOrIsVDecqtuFGJfYBn1+QeWx8uRH1fK0Kb6M4X9L+EvtQi3THbSY/IrNJzWi7YDjN9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiB6DbnFVY7znmP88KXkblpRnidPwgLcSzQVq6JYfuG55s0xM0
	VPdDzv3cL6RIu6bHaeWzU90T7y2Ivmomj75DwXgQp0uGr7Ftpe83SHIHErkOPpUv+pmIEg==
X-Google-Smtp-Source: AGHT+IHqdrbnTURYSpf/5afh17e1i3rk5opqYbKAlLurQBauppiTWqSh5+YV6ICpl369+Ha35/G5jy3r
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a17:906:6d8:b0:a8a:76fd:ae67 with SMTP id
 a640c23a62f3a-a93a061ba72mr129666b.10.1727276539991; Wed, 25 Sep 2024
 08:02:19 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:12 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2056; i=ardb@kernel.org;
 h=from:subject; bh=VKZKKQxE7f774DDxhaNjhf6gM8y+4CHtkhz4ITFKHVU=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6l6HjphM91K+tMbfPlum+q87xXbcaBq/plqB6J0rH
 Clz7dQ6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESez2L4w3XU9mNkQveSSXqf
 bkfpTfktlPbu753X3m4//t4RvX456gUjw9ItwQrWWxY9aPiwtX3xVeeW5YpKNdGO1l4qU7KmnF4 VzwoA
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-42-ardb+git@google.com>
Subject: [RFC PATCH 12/28] x86/pm-trace: Use RIP-relative accesses for .tracedata
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

Use RIP-relative accesses and 32-bit offsets for .tracedata, to avoid
the need for relocation fixups at boot time.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/include/asm/pm-trace.h | 4 ++--
 drivers/base/power/trace.c      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/pm-trace.h b/arch/x86/include/asm/pm-trace.h
index bfa32aa428e5..123faf978473 100644
--- a/arch/x86/include/asm/pm-trace.h
+++ b/arch/x86/include/asm/pm-trace.h
@@ -8,10 +8,10 @@
 do {								\
 	if (pm_trace_enabled) {					\
 		const void *tracedata;				\
-		asm volatile(_ASM_MOV " $1f,%0\n"		\
+		asm volatile("lea " _ASM_RIP(1f) ", %0\n"	\
 			     ".section .tracedata,\"a\"\n"	\
 			     "1:\t.word %c1\n\t"		\
-			     _ASM_PTR " %c2\n"			\
+			     ".long %c2 - .\n"			\
 			     ".previous"			\
 			     :"=r" (tracedata)			\
 			     : "i" (__LINE__), "i" (__FILE__));	\
diff --git a/drivers/base/power/trace.c b/drivers/base/power/trace.c
index cd6e559648b2..686a0276ccfc 100644
--- a/drivers/base/power/trace.c
+++ b/drivers/base/power/trace.c
@@ -167,7 +167,7 @@ EXPORT_SYMBOL(set_trace_device);
 void generate_pm_trace(const void *tracedata, unsigned int user)
 {
 	unsigned short lineno = *(unsigned short *)tracedata;
-	const char *file = *(const char **)(tracedata + 2);
+	const char *file = offset_to_ptr((int *)(tracedata + 2));
 	unsigned int user_hash_value, file_hash_value;
 
 	if (!x86_platform.legacy.rtc)
@@ -187,9 +187,9 @@ static int show_file_hash(unsigned int value)
 
 	match = 0;
 	for (tracedata = __tracedata_start ; tracedata < __tracedata_end ;
-			tracedata += 2 + sizeof(unsigned long)) {
+			tracedata += 2 + sizeof(int)) {
 		unsigned short lineno = *(unsigned short *)tracedata;
-		const char *file = *(const char **)(tracedata + 2);
+		const char *file = offset_to_ptr((int *)(tracedata + 2));
 		unsigned int hash = hash_string(lineno, file, FILEHASH);
 		if (hash != value)
 			continue;
-- 
2.46.0.792.g87dc391469-goog


