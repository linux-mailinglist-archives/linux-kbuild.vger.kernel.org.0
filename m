Return-Path: <linux-kbuild+bounces-10579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5BD1F441
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 15:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2ACF3126F4B
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 13:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96E927B359;
	Wed, 14 Jan 2026 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkOPVN7d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE726D4E5;
	Wed, 14 Jan 2026 13:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399047; cv=none; b=bf4u2Ro6/myoh6Olipdp7gujTh4D+wP6qUqYS5dE78ALBjDCAsj1/Gd/AYnu61CKsPjOwVxBokoHl8Id5QOTE9nG/pumxe3ND/IDFQ22l2cYD3z/tgugOa25dP3HAW7xCM038CMXVgk2JLBih49PXgbAm6611KMgPLvluZ3shaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399047; c=relaxed/simple;
	bh=A7ygFWHnIONEhJhocd8AvjOJ78ZJEEV+LBZvV8xV114=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ml7OC/rwq9tlK43+70EXI+quB5LulfrIud395J4XGqPqsfEe+ZVxHWof4fcHMiHTgx1gEilzRlA3q22hdVkMP7ykpW/ldxtNQanUVY2MrQPcfUcs3SidWlVg3HmF3hrYl/FQMeuGwOImPd1k74RBXdvVhKRMI3WYhCdkjpMQ/lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkOPVN7d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2972AC4CEF7;
	Wed, 14 Jan 2026 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399047;
	bh=A7ygFWHnIONEhJhocd8AvjOJ78ZJEEV+LBZvV8xV114=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WkOPVN7dE/j2JMVMAHAhX4r9aXtO6y25t/CL1P/WKLeFkyoOXdUHf6AlC26rRU1Ki
	 85M9Wm9heNuw3+UgSjuSzitf8rxAU+PbsHz+AofUhGGmewUcguXRF2s+n4PUJvYuZI
	 pw2qjYTzUYw9ffTa/x25PnsYL8EkyWUPpgjUtzD+Ol5mylP3MOvQr64gGFDmUOCDgn
	 Z6bFsx3YG1gzFDr7J9X6QqRXskZ/PkyyjCOcK8qKAcrcQc4OG8lUAYUW6aMNxIZcSR
	 OA7aKkMTOVClC00FFRXoJT1Pbc1Qi7BNIWdsTFkM7Gdycqyh83A+sA33VVz2+4mlOR
	 th6GjJmHBMb7Q==
From: Nicolas Schier <nsc@kernel.org>
Date: Wed, 14 Jan 2026 14:57:14 +0100
Subject: [PATCH v2 1/2] fortify: Rename temporary file to match ignore
 pattern
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-fortify-improve-handling-of-tempfile-v2-1-63b86c4dbd0e@kernel.org>
References: <20260114-fortify-improve-handling-of-tempfile-v2-0-63b86c4dbd0e@kernel.org>
In-Reply-To: <20260114-fortify-improve-handling-of-tempfile-v2-0-63b86c4dbd0e@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, 
 WangYuli <wangyuli@aosc.io>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768399036; l=1011;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=A7ygFWHnIONEhJhocd8AvjOJ78ZJEEV+LBZvV8xV114=;
 b=H1yMYBKniPqfpoD6hD4nj51OF7lH/u889QvUnzjAKf4PXy3AEkOEJuDffsV2szcos9859lLop
 eUeVydBJU7XAV7JbLiAYPvv6EwuIRe0ZBJ1iJVwUEO4HHYUJysJBM5A
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

test_fortify.sh uses a temporary file that might appear as untracked
file in some rare sitations.  Rename it to match one of top-level's
gitignore patterns.

Reported-by: WangYuli <wangyuli@aosc.io>
Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: WangYuli <wangyuli@aosc.io>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
 lib/test_fortify/test_fortify.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
index c2688ab8281d025ad80168b783d293950c4e726c..368d07d9acbf737be376756b39def87f12f4e9bf 100644
--- a/lib/test_fortify/test_fortify.sh
+++ b/lib/test_fortify/test_fortify.sh
@@ -17,7 +17,7 @@ WANT="__${FILE%%-*}"
 # Argument 2: Where to write the build log.
 OUT="$1"
 shift
-TMP="${OUT}.tmp"
+TMP="${OUT%/*}/.${OUT##*/}.tmp"
 
 # Argument 3: Path to "nm" tool.
 NM="$1"

-- 
2.47.3


