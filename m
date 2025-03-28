Return-Path: <linux-kbuild+bounces-6367-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86284A74923
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 12:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2741F17C222
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 11:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9EF1E833C;
	Fri, 28 Mar 2025 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vQMobnX/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FCA145B27;
	Fri, 28 Mar 2025 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160922; cv=none; b=o6CBLUD0nJGh1tslPjrKM4mhkVKcYrk6s3iG8DvpXjTR9ZVVmNAVaVkBqgpJwIXII81VuIg/cD9+KO5+OUMKUCvXEi3SYY3zDQGWoRaegpvo+2W0RIMvv3QUOTlSdhfTCuzy9NebaRaPPGbMHKJInFFKyDm/2ABdm1MbP9QonsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160922; c=relaxed/simple;
	bh=tI0s+XqMzbOXtR3wees2SBwNPieMqGD2JPuPiVKR4GU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mmPtV9m+1e4XdJ0RfC3cf+9I+UEnE+cQjOpwtwAMGivC/sFv61HmZFZkeJfCmRNU1MCw9S7n+e8Z+1tZzCthPCosixWvl802cNfvgtXCib6JJkHGL3DBJP7GvTQea3dWAf1Rd351e5+TjLJQzkUMI6UpP2tihMKAcGkPAC7v/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vQMobnX/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC286C4CEE4;
	Fri, 28 Mar 2025 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743160922;
	bh=tI0s+XqMzbOXtR3wees2SBwNPieMqGD2JPuPiVKR4GU=;
	h=From:To:Cc:Subject:Date:From;
	b=vQMobnX/+/6dk+eG47Ovx4iDisf2Hc+i3S7huL2zhwwwWdHyW1Uv8JWjiuL/kM5nP
	 bGzMWth1uXlbImw2paJsFWt0QyfrWhRgowWc85iCfW+EFDG5fk/MobHGaipP6Dih3n
	 xxvIrx0CWYQ4KlRp50WbUdGchulmkP9BKFJNF7AWv0YChAgw//jpx1jVMaIOubPded
	 7TLGRpfVW1iIkyMM20KbcyYalMhhbIOUHxAlkw66Gr9r8uI9LeHUEdFbibqooBePCo
	 urhK7nUYVAQnSntFwHqkulxeMAbAfyyWRUS8lgYHg0/6XkBA6idI1iS5nm06lJpd5+
	 N685At++kdGEA==
From: Arnd Bergmann <arnd@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Rae Moar <rmoar@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	=?UTF-8?q?Sergio=20Gonz=C3=A1lez=20Collado?= <sergio.collado@gmail.com>,
	David Gow <davidgow@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Mostafa Saleh <smostafa@google.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Date: Fri, 28 Mar 2025 11:48:19 +0100
Message-Id: <20250328112156.2614513-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The recently added testcase for overly long symbols triggers when
CONFIG_FUNCTION_PADDING_CFI is set:

Symbol __pfx_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n too long for kallsyms (517 >= 512).
Please increase KSYM_NAME_LEN both in kernel and kallsyms.c

Change the mksymtab table so the prefixed symbols are not included
in kallsyms.

Fixes: c104c16073b7 ("Kunit to check the longest symbol length")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 scripts/mksysmap | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index 3accbdb269ac..33df38ede1e0 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -59,6 +59,9 @@
 # EXPORT_SYMBOL (namespace)
 / __kstrtabns_/d
 
+# prefixed symbols from objtool
+/ __pfx_/d
+
 # ---------------------------------------------------------------------------
 # Ignored suffixes
 #  (do not forget '$' after each pattern)
-- 
2.39.5


