Return-Path: <linux-kbuild+bounces-12264-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHMdBA2KxGn50AQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12264-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 02:21:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A457332DCDF
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 02:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B8B430427FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2026 01:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C33F37649C;
	Thu, 26 Mar 2026 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrQwrNyH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C11372ED5;
	Thu, 26 Mar 2026 01:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488039; cv=none; b=d5MHscjt4Z2bkvhQRcSoKXUz0kSvz3RlwsETxEfo96SDVFZVzvw1kv/2qqcthq1dO4JOMR/rVcW0Z1zDs+MDr9r6I7XBT3T2zx7S2BAvhvwW5djL8NliSmXf9Om22swwCeDPXNYlPURgOit5w1vSWqN9CZ4tPx5BsK3opQ9IxOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488039; c=relaxed/simple;
	bh=jCpZBWHBZGO+JFAuGtNCyOvnRm1CZWZVWKYWP+EJaTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KTjjJfDYND0fd/K4WEBeZRSKD43UEzhvi5+4NjV7LPiE0rJ5nTm4waVyomVuZukr4jEQokbNTTRlLEVqG0bJ8EbCEOrEcekdcK24sikk8XEp6GHajIFuLKeo/YKV4hrCe1l7r9hyrUu5M5aOc46iaohnj7VzKNkl7uH2rTYyCGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrQwrNyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6B7C4CEF7;
	Thu, 26 Mar 2026 01:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774488039;
	bh=jCpZBWHBZGO+JFAuGtNCyOvnRm1CZWZVWKYWP+EJaTw=;
	h=From:Date:Subject:To:Cc:From;
	b=JrQwrNyHL4MarhqXoKw+V0ExUGbq+Q0B41MaFvk3hZnAMP2nEQr3H9/+3WwLjJj0W
	 XfL+2UPhuIJlc0CGtReyBFk+Myx0KryMJDbLvmsAb4T0zes5zcGh13xvT8ZBfjb/Y2
	 Xd8SG11EuypIrkPGHt3M7y633jxeEYnJU8p6kO2D1969OwusPtge8fZHliRE7NYiip
	 /BCXBRzcQudKS1tjRz4iWFb3s++tBPCCNnuH3CIulKxzyU0KaWQxRLoOKAQjxeExcp
	 B/g1X1G4K6x2L9Mjkq0UgosN+553B6j/b4E6b1NpGCU9VD1N1igozmQ6Pl0BA63lXT
	 D91gGg7K7TkQg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 25 Mar 2026 18:20:30 -0700
Subject: [PATCH] modpost: Declare extra_warn with unused attribute
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-modpost-extra_warn-unused-but-set-global-v1-1-2e84003b7e81@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBBA0auUWTsQI43gVURkkkxrpCYlk9RC6
 d2Nunyb/zcQzoEFLt0GmZcgIcWG46ED96A4MgbfDFppo066x1fyc5KCvJZM9zfliDVWYY+2FhQ
 uOE7J0oTKDGScN+deeWi5OfMQ1t/qevtbqn2yK98+7PsHdXzepowAAAA=
X-Change-ID: 20260325-modpost-extra_warn-unused-but-set-global-06fa6cd6750d
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550; i=nathan@kernel.org;
 h=from:subject:message-id; bh=jCpZBWHBZGO+JFAuGtNCyOvnRm1CZWZVWKYWP+EJaTw=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlHOp/oXNIv4EmQ2HNMqVhJ/tCO1hfP7E3lTl9pZI4NX
 PQ4Truyo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExEhpXhf/3FYzIt3uv2OVnV
 VrXm30kzEXGzir/+T0xj9oeZSz6cX8nIMDdBtelD3glf20m10k9l3mlOZP71ILHredECJbmbVT0
 rGQA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,google.com,oss.qualcomm.com,kernel.org,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-12264-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A457332DCDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A recent strengthening of -Wunused-but-set-variable (enabled with -Wall)
in clang under a new subwarning, -Wunused-but-set-global, points out an
unused static global variable in scripts/mod/modpost.c:

  scripts/mod/modpost.c:59:13: error: variable 'extra_warn' set but not used [-Werror,-Wunused-but-set-global]
     59 | static bool extra_warn;
        |             ^

This variable has been unused since commit 6c6c1fc09de3 ("modpost:
require a MODULE_DESCRIPTION()") but that is expected, as there are
currently no extra warnings at W=1 right now. Declare the variable with
the unused attribute to make it clear to the compiler that this variable
may be unused.

Cc: stable@vger.kernel.org
Fixes: 6c6c1fc09de3 ("modpost: require a MODULE_DESCRIPTION()")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
I will apply this to kbuild-fixes for 7.0.
---
 scripts/mod/modpost.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0c25b5ad497b..c3bc801d8b2d 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -56,7 +56,7 @@ static bool allow_missing_ns_imports;
 
 static bool error_occurred;
 
-static bool extra_warn;
+static bool extra_warn __attribute__((unused));
 
 bool target_is_big_endian;
 bool host_is_big_endian;

---
base-commit: d2a43e7f89da55d6f0f96aaadaa243f35557291e
change-id: 20260325-modpost-extra_warn-unused-but-set-global-06fa6cd6750d

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


