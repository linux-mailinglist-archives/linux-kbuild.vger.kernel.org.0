Return-Path: <linux-kbuild+bounces-11440-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8N5DM6Jyn2llcAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11440-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 23:07:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4573C19E263
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 23:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F15CE30309A4
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 22:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E722231984E;
	Wed, 25 Feb 2026 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtIMGz/r"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E493191BB;
	Wed, 25 Feb 2026 22:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772057246; cv=none; b=h86SxET8qZBVot+xCoKKmm3J78mmmfk1UzpQHnyg+ULYAPpGLn6cwgAGbv/Z5Q9/BU+biFIPfL77o9v8W7KfZQGDzD+E/en9OnNtBDEAnCg1P6PbVyrmiqYY148etgRzP+GvBs3Xshvn8v4VKDStXJPhv2nMZGOH0CzBEHshig8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772057246; c=relaxed/simple;
	bh=ZVwDhq7sE+uH86Xby6Jav0733rfjRoZgwhfDqk+hdpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jnkXrCKuZHiZw+x8ZLnCocByFLsXKXUoiYM/4VFkf0mg92ALiip+JXybq04DICnITzmEXS+AH/z5N/jyEtXkORETBc52zMKowC1gb8cXzHG1utvFP8oqKzybgLNVfqwD/pT/Olc86N2nppdepHlilJMdaSNg8YRD9QGwffKdMEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtIMGz/r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 401BEC116D0;
	Wed, 25 Feb 2026 22:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772057246;
	bh=ZVwDhq7sE+uH86Xby6Jav0733rfjRoZgwhfDqk+hdpY=;
	h=From:Date:Subject:To:Cc:From;
	b=DtIMGz/rjbh2EwrTBRlKgfiqmFUw4LbG+mETGxnrGWbk9P+QTxldgQAx8NzBaxyUw
	 360Mwglc4EoTf3MREGMLO6SaTB5jKXYt0xS7fCOgzuJBxzWHvdHmXQAUpAKF59b3eL
	 Agam1q1z3vupxEESAP3IxzDjjiNtiJE91wwDcSei/coWZVBqv8k18g8XcDLkOduzw+
	 5/dcaZ5P6XEgQpqbvXiguUbIkq79vlNCMsPfX96epD2bO8UcKwGkAtYC8Wkdu8D2Ap
	 psyWJaRGgKzeQY7q/pvp/pJxYOwMWQKAsuApx85Mtci7zdxWkh+bTtabJA50ahn82n
	 Z5rK8N6tDJUGQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 25 Feb 2026 15:07:17 -0700
Subject: [PATCH] genksyms: Fix parsing a declarator with a preceding
 attribute
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-genksyms-fix-attribute-declarator-v1-1-1b21478663fb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNywrCQAyF4VcpWRuoUy3oq4iLzEys8TKVJBWl9
 N0ddfnB4T8zGKuwwb6ZQfkpJmOpWK8aSGcqA6Pkaght6NsQNjhwudr7bniSF5K7SpycMXO6kZK
 PirvY5b6LtE1EUDsP5br9fRyOf9sUL5z8G4Zl+QDQjt9zhQAAAA==
X-Change-ID: 20260224-genksyms-fix-attribute-declarator-9b3d63ba5caa
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sun Jian <sun.jian.kdev@gmail.com>, Florian Westphal <fw@strlen.de>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2642; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ZVwDhq7sE+uH86Xby6Jav0733rfjRoZgwhfDqk+hdpY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJnzi2aXZ74NvvbH6R7fKn2VEPt1e5UWMs5lW1pr6iIk1
 7pbbL1eRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZgIz0tGhmWu+212JYY27fro
 zXD7eWrT/xXXTc9v+PT7csjDfKe4AitGhulP3q0xD0g2vbbtttbOe0x/ioK0QqRFzlnkuAZzP6v
 aww8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,strlen.de,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-11440-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4573C19E263
X-Rspamd-Action: no action

After commit 07919126ecfc ("netfilter: annotate NAT helper hook pointers
with __rcu"), genksyms fails to parse the __rcu annotation when building
with CONFIG_DEBUG_INFO_BTF=y, CONFIG_PAHOLE_HAS_BTF_TAG=y, and a version
of clang that supports btf_type_tag.

  $ clang --version | head -1
  ClangBuiltLinux clang version 22.1.0 (https://github.com/llvm/llvm-project.git 4434dabb69916856b824f68a64b029c67175e532)

  $ cat kernel/configs/repro.config
  CONFIG_BPF_SYSCALL=y
  CONFIG_MODVERSIONS=y
  # CONFIG_DEBUG_INFO_NONE is not set
  CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
  CONFIG_DEBUG_INFO_BTF=y

  $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig repro.config all
  WARNING: modpost: EXPORT symbol "nf_nat_ftp_hook" [vmlinux] version generation failed, symbol will not be versioned.
  ...
  WARNING: modpost: EXPORT symbol "nf_nat_irc_hook" [vmlinux] version generation failed, symbol will not be versioned.
  ...

genksyms falls over parsing the __rcu attribute in the declarator:

  # Kernel reproducer
  $ make -skj"$(nproc)" ARCH=x86_64 KCFLAGS=-D__GENKSYMS__ LLVM=1 net/netfilter/nf_conntrack_ftp.i

  $ scripts/genksyms/genksyms -w <net/netfilter/nf_conntrack_ftp.i &| rg 'syntax error'
  include/linux/netfilter/nf_conntrack_ftp.h:29: syntax error
  net/netfilter/nf_conntrack_ftp.c:46: syntax error

  # Trivial reproducer
  $ cat test.c
  int (*func)(void *foo, int bar);
  int (__attribute__((btf_type_tag("rcu"))) *func_with_attr)(void *foo, int bar);

  $ scripts/genksyms/genksyms -w <test.c
  <stdin>:2: syntax error

Optionally allow an attribute to precede a declarator to resolve this
error and properly generate symbol versions.

Fixes: 07919126ecfc ("netfilter: annotate NAT helper hook pointers with __rcu")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I plan to take this via the Kbuild tree for 7.0.
---
 scripts/genksyms/parse.y | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index efdcf07c4eb6..cabcd146f3aa 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -325,8 +325,8 @@ direct_declarator:
 		{ $$ = $4; }
 	| direct_declarator BRACKET_PHRASE
 		{ $$ = $2; }
-	| '(' declarator ')'
-		{ $$ = $3; }
+	| '(' attribute_opt declarator ')'
+		{ $$ = $4; }
 	;
 
 /* Nested declarators differ from regular declarators in that they do

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-genksyms-fix-attribute-declarator-9b3d63ba5caa

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


