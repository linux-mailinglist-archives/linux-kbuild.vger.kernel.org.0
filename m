Return-Path: <linux-kbuild+bounces-9243-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A06D7BF97FC
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 02:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 417833533B2
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Oct 2025 00:44:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D001DD889;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pSvoMgPX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8041D63C7;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761093870; cv=none; b=gn1cTR9FYfADlKBMI+1LxbZw9z/qWLVkvQYMpa2ABJyVRkZdYn3p1Nwh4C0sccLSSP9Jc1SsW6YyoZyjEbvVNzLDl6invHPv1VQW2avBHzGUWz6gp0PhwPGZelmJeX0sR2rYnU1cfHDRw5B8sY0Kj0OC+XnUo56pbrsvuNK5eEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761093870; c=relaxed/simple;
	bh=fGIjFdvPXVsEO6+PsZ0BgAWB+sF+jUbnODCcsfGmNEw=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=HCdoHvSW0kogp9xTLU+nbvbTe5i2E3kJ15vqbsl95n66quaJM0XC7NhJ6mA1zTmQdEckNWWSIdII7kkRj5eU8MFvWGJcyKwt3c3c+s1bfuUsfr5Lnzl7Qs4xWiJroHkJ0/X54AVDKSTiJeMiVRbsritiLu6uyl0md/PybaDlahA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pSvoMgPX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37839C116B1;
	Wed, 22 Oct 2025 00:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761093870;
	bh=fGIjFdvPXVsEO6+PsZ0BgAWB+sF+jUbnODCcsfGmNEw=;
	h=Date:From:To:Cc:Subject:References:From;
	b=pSvoMgPXlZx4THkfdcIw3PePPEkbyioGEI/U+XnGxm5f10qLVHi5wIa5YzIay7xjv
	 tMR2qFp2Y/dfONDd/DdgMU1TJMsIGJhU+YLjs4H7+S9vTLfM6bPOXzwjKwKz7uVsY4
	 h2CkPjFNqU0vqTGf6PHSahP8OrjrfaFr/nKCcC6BQH7F42NEnpDemRHMx8VymVwAST
	 I6yrGn/FlNw4qN2IfLTMH6zR/PZ6+C4gmlG6zceOxEeiu6oLNdI9Ov3cH4L37JJYfP
	 3V3rpmLklUqoXWHBM8Fg4nMvJa02asNiAQeabk8LXqWpyCnwnV5l8Brriw1J0ienmV
	 rsOGyYChR+/2g==
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@kernel.org>)
	id 1vBMyD-00000002M9e-1gch;
	Tue, 21 Oct 2025 20:44:53 -0400
Message-ID: <20251022004453.255696445@kernel.org>
User-Agent: quilt/0.68
Date: Tue, 21 Oct 2025 20:43:42 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v10 4/5] tracing: Allow tracepoint-update.c to work with modules
References: <20251022004338.731044739@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: Steven Rostedt <rostedt@goodmis.org>

In order for tracepoint-update.c to work with modules, it cannot error out
if both "__tracepoint_check" and "__tracepoints_strings" are not found.
When enabled, the vmlinux.o may be required to have both, but modules only
have these sections if they have tracepoints. Modules without tracepoints
will not have either. They should not fail to build because of that.

If one section exists the other one should too. Note, if a module defines
a tracepoint but doesn't use any, it can cause this to fail.

Add a new "--module" parameter to tracepoint-update to be used when
running on module code. It will not error out if this is set and both
sections are missing. If this is set, and only the "__tracepoint_check"
section is missing, it means the module has defined tracepoints but none
of them are used. In that case, it prints a warning that the module has
only unused tracepoints and exits normally to not fail the build.

If the "__tracepoint_check" section exists but not the
"__tracepoint_strings", then that is an error and should fail the build.

Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 scripts/tracepoint-update.c | 45 ++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/scripts/tracepoint-update.c b/scripts/tracepoint-update.c
index 6ec30f39d0ad..7f7d90df14ce 100644
--- a/scripts/tracepoint-update.c
+++ b/scripts/tracepoint-update.c
@@ -112,7 +112,7 @@ static int find_event(const char *str, void *array, size_t size)
 	return bsearch(&str, array, size, sizeof(char *), compare_strings) != NULL;
 }
 
-static void check_tracepoints(struct elf_tracepoint *etrace)
+static void check_tracepoints(struct elf_tracepoint *etrace, const char *fname)
 {
 	Elf_Ehdr *ehdr = etrace->ehdr;
 	int len;
@@ -129,22 +129,26 @@ static void check_tracepoints(struct elf_tracepoint *etrace)
 		if (!len)
 			continue;
 		if (!find_event(str, etrace->array, etrace->count)) {
-			fprintf(stderr, "warning: tracepoint '%s' is unused.\n", str);
+			fprintf(stderr, "warning: tracepoint '%s' is unused", str);
+			if (fname)
+				fprintf(stderr, " in module %s\n", fname);
+			else
+				fprintf(stderr, "\n");
 		}
 	}
 
 	free(etrace->array);
 }
 
-static void *tracepoint_check(struct elf_tracepoint *etrace)
+static void *tracepoint_check(struct elf_tracepoint *etrace, const char *fname)
 {
 	make_trace_array(etrace);
-	check_tracepoints(etrace);
+	check_tracepoints(etrace, fname);
 
 	return NULL;
 }
 
-static int process_tracepoints(void *addr, char const *const fname)
+static int process_tracepoints(bool mod, void *addr, const char *fname)
 {
 	struct elf_tracepoint etrace = {0};
 	Elf_Ehdr *ehdr = addr;
@@ -188,7 +192,19 @@ static int process_tracepoints(void *addr, char const *const fname)
 		}
 	}
 
+	/*
+	 * Modules may not have either section. But if it has one section,
+	 * it should have both of them.
+	 */
+	if (mod && !check_data_sec && !tracepoint_data_sec)
+		return 0;
+
 	if (!check_data_sec) {
+		if (mod) {
+			fprintf(stderr, "warning: Module %s has only unused tracepoints\n", fname);
+			/* Do not fail build */
+			return 0;
+		}
 		fprintf(stderr,	"no __tracepoint_check in file: %s\n", fname);
 		return -1;
 	}
@@ -198,8 +214,11 @@ static int process_tracepoints(void *addr, char const *const fname)
 		return -1;
 	}
 
+	if (!mod)
+		fname = NULL;
+
 	etrace.ehdr = ehdr;
-	tracepoint_check(&etrace);
+	tracepoint_check(&etrace, fname);
 	return 0;
 }
 
@@ -208,9 +227,19 @@ int main(int argc, char *argv[])
 	int n_error = 0;
 	size_t size = 0;
 	void *addr = NULL;
+	bool mod = false;
+
+	if (argc > 1 && strcmp(argv[1], "--module") == 0) {
+		mod = true;
+		argc--;
+		argv++;
+	}
 
 	if (argc < 2) {
-		fprintf(stderr, "usage: tracepoint-update vmlinux...\n");
+		if (mod)
+			fprintf(stderr, "usage: tracepoint-update --module module...\n");
+		else
+			fprintf(stderr, "usage: tracepoint-update vmlinux...\n");
 		return 0;
 	}
 
@@ -222,7 +251,7 @@ int main(int argc, char *argv[])
 			continue;
 		}
 
-		if (process_tracepoints(addr, argv[i]))
+		if (process_tracepoints(mod, addr, argv[i]))
 			++n_error;
 
 		elf_unmap(addr, size);
-- 
2.51.0



