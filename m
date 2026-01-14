Return-Path: <linux-kbuild+bounces-10581-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0CD1F3D8
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 14:57:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 13F62300EBBB
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 13:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48720280037;
	Wed, 14 Jan 2026 13:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/91mWpE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E3927E04C;
	Wed, 14 Jan 2026 13:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768399053; cv=none; b=g1VTRkxqWoK3zGtH9kciKrVyPo3A17LwFISXdxg5Kzmge0dQ7DN4Ni0WAdI7W2SQ4UEn4/cpq6JD12MeW6Lm3MJvSzG0kOaBfr3xzCSibYEEBtYJTTNgKjP8mVtFovlfyCx606XirPwBryL163UNxedoWHrINB2RuDcbfMxR6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768399053; c=relaxed/simple;
	bh=3NPWjgIFeC3ixFYQv9odPWjjjUGvpIy2yYLgVym9m6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Xbf6bT/9x7mtVs8MVwWYoH0Jv6cWsgMLLgHM5+vbkovY1XVwvWSnwTsvzNZLTRRBPzza62uEqT99wUbDPTwcq2hqhNtvDITQWCw4mrQHzWNXNsDD2Gy4XRFAxz/eoJMLlwlIv9KTlfw2dhmNw5PSDNv/tG2wYrmlJmFg0d88Q6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/91mWpE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70891C4CEF7;
	Wed, 14 Jan 2026 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768399052;
	bh=3NPWjgIFeC3ixFYQv9odPWjjjUGvpIy2yYLgVym9m6A=;
	h=From:Subject:Date:To:Cc:From;
	b=U/91mWpEHbp+Usz+siKT3npthvIf0V9TeX0zXWhhNn8otNI/8PTzt4W+rLHE/8ysm
	 HBh2JYhwp9FaSCrEI3+Yg8aQ3FNYPFxOGNgi0Y2E2RTTgbFudviJstsHyua5J2xi38
	 JxbqBpM1VVePkCt4ovmxc8E66BM5XFvPGjAn0vwVLTXNUREk6ZFHv5E4n55LZ787Ss
	 Dqdz3rCK2rZObJuKuCACMKKR8jr3P1QLT5w94Tdfs07Q0EXh6xlisxcL7mvlpnQf/v
	 S6PwHto4ZdYeZYWriemnGGx37AVm2HpqyFNw/W1PCvuBzu19wMLJwpppBZ3ZGLZWiZ
	 XEuWpsOsawuRg==
From: Nicolas Schier <nsc@kernel.org>
Subject: [PATCH v2 0/2] fortify: test_fortify.sh: Improve handling of
 tempfile
Date: Wed, 14 Jan 2026 14:57:13 +0100
Message-Id: <20260114-fortify-improve-handling-of-tempfile-v2-0-63b86c4dbd0e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALmgZ2kC/5WNSw6DMAwFr4KyritI6XfVe1QsTOKAVUiQg6Iix
 N2bcoMu5+lpZlWRhCmqR7EqocSRg8+gD4UyPfqOgG1mpUt9rip9AxdkZrcAj5OERJBPdmDfQXA
 w0zg5Hgi01WgudYs1osqqScjxZ8+8msw9xznIsldT9Vv/DKQKSsDr3Zb2hK1B83yTeBqOQTrVb
 Nv2BeEgx+bZAAAA
X-Change-ID: 20251128-fortify-improve-handling-of-tempfile-2d2ac64ba4aa
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>, 
 WangYuli <wangyuli@aosc.io>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768399036; l=1095;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=3NPWjgIFeC3ixFYQv9odPWjjjUGvpIy2yYLgVym9m6A=;
 b=eCqsmUA0L3BCmqQEQhLSowRycXWao9aLzZ+DkQO7nJNkUpa6S5Q1anL1idqijgNGE6rAIjuV2
 V599/SXbLjHCUK6fEPc1Ee42mSynahQeKg8LYTqfbw3LZmjshzI68Q2
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

WangYuli reported [1] that the temporary file created by test_fortify.sh
is recognised by git as untracked file, especially if it remains after
non-common exits of test_fortify.sh (e.g. killed by signal).

The following two patches handle that by renaming the temporary file and
by cleaning up the file in more situations.

Link: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/ # [1]
Signed-off-by: Nicolas Schier <nsc@kernel.org>
---
Changes in v2:
  * Fixed author/trailer inconsistency (Nathan)
  * Added review trailers
  * Link to v1: https://patch.msgid.link/20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org

---
Nicolas Schier (2):
      fortify: Rename temporary file to match ignore pattern
      fortify: Cleanup temp file also on non-successful exit

 lib/test_fortify/test_fortify.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251128-fortify-improve-handling-of-tempfile-2d2ac64ba4aa

Best regards,
-- 
Nicolas


