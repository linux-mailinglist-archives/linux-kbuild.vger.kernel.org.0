Return-Path: <linux-kbuild+bounces-12914-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AtGArJ08WkChAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12914-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:02:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CADD48E810
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 05:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C3AC30CACF9
	for <lists+linux-kbuild@lfdr.de>; Wed, 29 Apr 2026 03:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A31E372B2A;
	Wed, 29 Apr 2026 03:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DaeMfYvH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746F5340A6B;
	Wed, 29 Apr 2026 03:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777431620; cv=none; b=HYy97HapIEO3KRtuC2p4iaY5fWt/BJGj7Bqz6bvkTWzU/uHc6NXMSIehZ5AerNezu+V/NBB4+YJdi4hQqhMMYtkfePzUoIFagl0YWB/guTx8XsQrfvwKiZ1S/vRPS1fYuS/TejJ+uFHrVRwLFvrK48pAVdYFna4QOAuUQIl5k6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777431620; c=relaxed/simple;
	bh=9T93uB95pVrsxHtr9II06T4tYAb0HlcivHrApuK+RBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I8z6c57gxdVRevaOqnvet+jugdZ+TqWkD/bzv+fdukLEWEBSYPGiju+qIPyO6vmGnrHgWHR8DSyJWQzCUMdb4kZ5pO+7GokCYy5MVwmdl6JyPjWt116Px1oWv7Uro+/HJczL/6BSZC8APoyQMCXhBtHYCnJUEHtqQUCmrihZlnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DaeMfYvH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BDB1C2BCB9;
	Wed, 29 Apr 2026 03:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431620;
	bh=9T93uB95pVrsxHtr9II06T4tYAb0HlcivHrApuK+RBk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DaeMfYvHy79ys9CE5ZZsNEFLBLfXTp5oSAY6RqMzom+sFc0tAMJrCGclgzBsVKAjI
	 2Bs4O2Lgp3UY79RAdseBL4hJXKiwJOxprphR9s5i/1P4G7zcOHrDXAR4qheHdG99oF
	 +CHnq4ApYv/Zrm2pEW63W1KkdOcjKyLWyiFBudy0niS+0ing+e/qkGXx4p66h81UYr
	 J0HjAquCa9P/3LTUxR+sgxnxBqQryJ7nyC6DaHEnz+ISRNRDehzV9ywKC5NBf5vhql
	 a/KweTzEUkBhS7YdFLUqYxqwzYCo7w42kkMaKJX50z9DMwH9ZsONRF5MjQ2IZpK/f0
	 SPTmYgSHfDAPQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:10 -0400
Subject: [PATCH 04/14] security/Kconfig.hardening: Remove tautological
 condition from CC_HAS_RANDSTRUCT
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-4-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-hardening@vger.kernel.org, linux-security-module@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1097; i=nathan@kernel.org;
 h=from:subject:message-id; bh=9T93uB95pVrsxHtr9II06T4tYAb0HlcivHrApuK+RBk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4yMNcRmXbpw5LuJ4vQbGgW7SizeT7s+6eRhpbTT3
 9eFdX7a1lHKwiDGxSArpshS/Vj1uKHhnLOMN05NgpnDygQyhIGLUwAmEm7N8D+ulKGp9c6B8rxc
 Rg7mi663j39b76d6qUJzw4XKif7vt99l+J/dcVuq5/TPP919zloifkppW10zEvgDz1xpt847HZT
 OzQkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Queue-Id: 5CADD48E810
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12914-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Now that the minimum supported version of LLVM for building the kernel
has been raised to 17.0.1, the '!Clang || Clang >= 16' dependency for
CONFIG_CC_HAS_RANDSTRUCT is always true, so it can be removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Kees Cook <kees@kernel.org>
Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
---
 security/Kconfig.hardening | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index e4f23c08a17a..b90cf9ed4642 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -274,9 +274,6 @@ endmenu
 
 config CC_HAS_RANDSTRUCT
 	def_bool $(cc-option,-frandomize-layout-seed-file=/dev/null)
-	# Randstruct was first added in Clang 15, but it isn't safe to use until
-	# Clang 16 due to https://github.com/llvm/llvm-project/issues/60349
-	depends on !CC_IS_CLANG || CLANG_VERSION >= 160000
 
 choice
 	prompt "Randomize layout of sensitive kernel structures"

-- 
2.54.0


