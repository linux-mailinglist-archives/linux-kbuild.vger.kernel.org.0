Return-Path: <linux-kbuild+bounces-13752-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oY9XD7l6MGpVTgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13752-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 00:20:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A228868A575
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2026 00:20:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="j4/AsPEx";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13752-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13752-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A6E83051D4B
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jun 2026 22:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3979B3B7754;
	Mon, 15 Jun 2026 22:20:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f74.google.com (mail-dl1-f74.google.com [74.125.82.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005673B6C00
	for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2026 22:20:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562024; cv=none; b=tE8VkOtI/xZqYV+uKdaJsYIB+BbIihslEyfkFTQGjtZ1IAYnuS3dXauZss5NUpqW7JlfqEQ9PIzohGSc3QLaLb6y5VeeNHScv4Nt+4u4KyKEz+tSW3ske6tm6ALX5KV4R8E3eWjmMnknlx2Ee8FMTm3x3lmsAb1FLu/VrMmPLVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562024; c=relaxed/simple;
	bh=KrhiVausKjt5TBkDgvvvPd795uJwDDGoWiE2DqgTcLU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FrYS16LSJDWZEFseJaIO5Fe+2mzDa3PAFvJMXecAoDNYeRmE7+XwGX6JNtVs1Af/nl/ZDv34xjjXaCAUaUwapViyVanzXUBawEk9AxhmsI6g5G8xsU9bB9xxYxwLtPv14zjYbNF3+UkK0nVfKpospp3sNCJ4+bcYMo6j7YJjwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j4/AsPEx; arc=none smtp.client-ip=74.125.82.74
Received: by mail-dl1-f74.google.com with SMTP id a92af1059eb24-1383723dfddso4751058c88.0
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Jun 2026 15:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781562022; x=1782166822; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W+ABCIJwM6jXaXHGqQ5K2krBBX3YNbsJMKFYiJWY3mU=;
        b=j4/AsPExOjv3mG5D8ND9OJWmteYX1zZDpivjB0nqpDP0EiF8QPT75UnY0w3jLn7h1P
         XMhbCueC6I2/i9PM/p+UC4Gx/MjDY5N5d4OTn6YRsfybBUxiD7bMZVlMID4qf4r8FRdm
         SU7v9545oW64/Oe0alrz8RnH/hGFxEGS7wQhCkjgJDGFPT3U7A6NxSwNrnL1hlaoH+Ej
         xK00TLhjU5yM4XozdRVzi/oSJkW/A+QU9dZO6dKZG9iEYNP8Dx0RKixao1VwuDAG+dVI
         pO1/78rY3gv+4CfmtGipj2eecwVCUDu2zWxYbodYk7DNYDhjBI5YkI7Bi3aYXWqucCN9
         HArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562022; x=1782166822;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W+ABCIJwM6jXaXHGqQ5K2krBBX3YNbsJMKFYiJWY3mU=;
        b=CuuxVbmmg+3pLTGouDF9fpMYRpxh53ByFHWfDHskqyAMDy+rJM7gl3g4nZC5Q6JFp7
         7tbl+B4wiM0kk4/oEy6kJp3gPDoqefcaYWoYHO31sE4fKk3GlgC8f77tfaDTubUE9nq5
         9J1cvB1fwA8bKW97+KD5yEfpZkSuUB5PViNsi7ZqAaCKF7mfeCKFXaUaqkVefNabzfuX
         gtwraqF5wKHGwkNcod+d/K9d0iIaGQCzVJYaVThS5LVZD249MA32ZU5QJv5l006eI9pU
         tF2GXXEGpVKZ0nRkNTIkGnff6WK/AHdwVPPEdR4aKqClgVhtsR1JgiRIqPpeIbJ3rdNB
         KTKw==
X-Forwarded-Encrypted: i=1; AFNElJ/EtvaGmx1xvLTYkXBN/0m28jma1gutht/qODrf+qGADd0lE2UT1KoID+q7CuDFI8ywN5JBLEi9043VorY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKIDycUy5yVtNATRXZYGITo+w78x6is/v/1AhTN89cCB3rnPZd
	UTbZdYR8un4iao/C+vsXAewUM4vW16SJeanqlNbsP/lITr6HvawBFQzvtvUAoaHHYNGFlw==
X-Received: from dlak8.prod.google.com ([2002:a05:701b:2908:b0:139:f78:7af6])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b82:b0:12d:d972:b969
 with SMTP id a92af1059eb24-13985f20551mr538083c88.24.1781562021761; Mon, 15
 Jun 2026 15:20:21 -0700 (PDT)
Date: Mon, 15 Jun 2026 15:20:19 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260615222019.4116687-1-xur@google.com>
Subject: [PATCH] modpost: Ignore Clang LTO suffixes in symbol matching
From: xur@google.com
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	"=?UTF-8?q?Ren=C3=A9=20Rebe?=" <rene@exactco.de>, Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:samitolvanen@google.com,m:sidnayyar@google.com,m:petr.pavlu@suse.com,m:jpoimboe@kernel.org,m:xur@google.com,m:edumazet@google.com,m:rene@exactco.de,m:legion@kernel.org,m:johan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,suse.com,exactco.de,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13752-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A228868A575

From: Rong Xu <xur@google.com>

When building the kernel with Clang ThinLTO enabled, the compiler
can mangle static variable names by appending suffixes such as
".llvm.<hash>" to prevent naming collisions across translation units.

This name mangling breaks the section mismatch whitelisting in modpost.
modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
safe references between permanent data and initialization code. Because
the LTO suffix modifies the end of the symbol name, legitimately
whitelisted structures fail the match, resulting in false positive
warnings.

For example, a static pernet_operations struct triggers the following:

  WARNING: modpost: vmlinux: section mismatch in reference: \
  ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
  ping_v4_proc_init_net (section: .init.text)

Fix this by stripping ".llvm." suffixes from the symbol name in match().

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@intel.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/mod/modpost.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index abbcd3fc1394..1f5a64eeb048 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -727,6 +727,18 @@ static const char *sym_name(struct elf_info *elf, Elf_Sym *sym)
 static bool match(const char *string, const char *const patterns[])
 {
 	const char *pattern;
+	char string_stripped[512];
+	const char *ext = strstr(string, ".llvm.");
+
+	/*
+	 * Clang LTO can append .llvm.<hash> to a variable. Safely strip
+	 * the suffix so glob whitelists (like *_ops) work.
+	 */
+	if (ext && (ext - string) < sizeof(string_stripped)) {
+		strncpy(string_stripped, string, ext - string);
+		string_stripped[ext - string] = '\0';
+		string = string_stripped;
+	}
 
 	while ((pattern = *patterns++)) {
 		if (!fnmatch(pattern, string, 0))

base-commit: 2b414a95b8f7307d42173ba9e580d6d3e2bcbfce
-- 
2.54.0.1136.gdb2ca164c4-goog


