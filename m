Return-Path: <linux-kbuild+bounces-11405-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QbugOcOWnWnwQgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11405-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 13:17:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78D186CE4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 13:17:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E071C30498F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 12:17:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58111396B77;
	Tue, 24 Feb 2026 12:17:02 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7845B396B61;
	Tue, 24 Feb 2026 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935421; cv=none; b=Tv8QAucwSkVPR3eDs5kdTgFc2byfRjI3WAsazqaWBpDXNDcRjnEvJDBEYea2DMw3rbOmNRgac7QTBm5RFVphq3vHrkHqjaFNLYEDbE19WZpiObgNeDNzLbEn9+MPW6ZJ6lGse8lHy0RYDAwfBTLxz4K0dJWvp2yo0KktKSe4rKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935421; c=relaxed/simple;
	bh=caccyDgZzv1w4El8pn0YhoNYBUIx3pO4j7z5UQOikIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tiHoEigatLK9Q+hLlPc864BN1LJ3HAH+SCkOP/gq07gE4o2jgri5y786QlzWODb7MvEeKIZupHze2rgFL27awKxEkJ3PIWx4xXRXJ6UVYsOHrJXqCyxCvt6vqQ5Pj3CsS8AE1RuiQlfXmM3c93T8Cf6sPDfnQeCEH9FnZ6tsD4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27CC9339;
	Tue, 24 Feb 2026 04:16:50 -0800 (PST)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4324F3F62B;
	Tue, 24 Feb 2026 04:16:54 -0800 (PST)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 24 Feb 2026 12:16:40 +0000
Subject: [PATCH RESEND v2] tools build: Use -fzero-init-padding-bits=all
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-tools_build_fix_zero_init-v2-1-b1acc817a01e@arm.com>
X-B4-Tracking: v=1; b=H4sIAKeWnWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDIyMT3ZL8/Jzi+KTSzJyU+LTMiviq1KL8+My8zBLdlGRTIzPDpBSLJIs
 kJaD+gqJUoAKw2dFKQa7Brn4uSrG1tQDpqYLKcwAAAA==
X-Change-ID: 20260224-tools_build_fix_zero_init-dc5261bd8b8b
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Clark <james.clark@linaro.org>, 
 Kees Cook <kees@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771935414; l=2715;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=caccyDgZzv1w4El8pn0YhoNYBUIx3pO4j7z5UQOikIg=;
 b=4fYDTyk7PtjjCIr6sZ/vkVs7JduCYgsk+telUWd/TylDbDG2HnFgYMbWW5dXSi2xIgGsuDADJ
 sCznsvv4f0ZB3QD9h8d1H7/+CKrf9QrIivXRbzzuGHgNE1DO62hZGhP
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-11405-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.yan@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gnu.org:url]
X-Rspamd-Queue-Id: 4C78D186CE4
X-Rspamd-Action: no action

GCC-15 release claims [1]:

  {0} initializer in C or C++ for unions no longer guarantees clearing
  of the whole union (except for static storage duration initialization),
  it just initializes the first union member to zero. If initialization
  of the whole union including padding bits is desirable, use {} (valid
  in C23 or C++) or use -fzero-init-padding-bits=unions option to
  restore old GCC behavior.

As a result, this new behaviour might cause unexpected data when we
initialize a union with using the '{ 0 }' initializer.

Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=all"),
the kernel has enabled -fzero-init-padding-bits=all to zero padding bits
in unions and structures.  This commit applies the same option for tools
building.

The option is not supported neither by any version older than GCC 15 and
is also not supported by LLVM, this patch adds the cc-option function to
dynamically detect the compiler option.

[1] https://gcc.gnu.org/gcc-15/changes.html

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Resent to linux-kbuild mailing list.
---
 tools/scripts/Makefile.include | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.include
index b5ecf137febcae59f506e107a7f2e2ad72f4bef4..73f6aef4f3fda0cda7ee8f4b9a3b7ff7d956070d 100644
--- a/tools/scripts/Makefile.include
+++ b/tools/scripts/Makefile.include
@@ -40,6 +40,30 @@ EXTRA_WARNINGS += -Wwrite-strings
 EXTRA_WARNINGS += -Wformat
 EXTRA_WARNINGS += -Wno-type-limits
 
+# output directory for tests below
+TMPOUT = .tmp_$$$$
+
+# try-run
+# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
+# Exit code chooses option. "$$TMP" serves as a temporary file and is
+# automatically cleaned up.
+try-run = $(shell set -e;		\
+	TMP=$(TMPOUT)/tmp;		\
+	trap "rm -rf $(TMPOUT)" EXIT;	\
+	mkdir -p $(TMPOUT);		\
+	if ($(1)) >/dev/null 2>&1;	\
+	then echo "$(2)";		\
+	else echo "$(3)";		\
+	fi)
+
+# cc-option
+# Usage: CFLAGS += $(call cc-option,-march=winchip-c6,-march=i586)
+cc-option = $(call try-run, \
+	$(CC) -Werror $(1) -c -x c /dev/null -o "$$TMP",$(1),$(2))
+
+# Explicitly clear padding bits with the initializer '{ 0 }'
+CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
+
 # Makefiles suck: This macro sets a default value of $(2) for the
 # variable named by $(1), unless the variable has been set by
 # environment or command line. This is necessary for CC and AR

---
base-commit: 7dff99b354601dd01829e1511711846e04340a69
change-id: 20260224-tools_build_fix_zero_init-dc5261bd8b8b

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


