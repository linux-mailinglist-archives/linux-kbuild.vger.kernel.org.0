Return-Path: <linux-kbuild+bounces-9910-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D2041C9304A
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 20:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E90B34D24E
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 19:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F53334371;
	Fri, 28 Nov 2025 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XojeJRqJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A93334364;
	Fri, 28 Nov 2025 19:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358083; cv=none; b=YVvgnE8BEzdzoVN2oqYmKWDLAjvomKTvFFvE6iRHxr4nIQKaKtghO5eLquA0de1GKVYE0RV0cjQEeB1+htbj60xdvP0H1oRxGspwlNmbRGZGNDKH30x40rGw7KgsLk44Q9nRaTvGcOtWCBSCj3meBc9JPDGIZgQua4jg94r8K0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358083; c=relaxed/simple;
	bh=u7mv+L8Hil1fEqjKj3rPX5h+p4VHEGd5CboTCyaF/Vo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pb0IE4JSfQC5AZwb94Ye3cviJQT36iZwZKXMoBsy82+HwcL8RudJ0GVISyrppedAs1yQX+gGSkT46ts1HsKJkjziYPBVzNhwCRX/C2p7bY66AQ0D7hZT47a4+En0djQDaL6aYHRO8/9Khrdi3MfnOqhSzVXQSzz3VnfllYSfDec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XojeJRqJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B75B7C4CEFB;
	Fri, 28 Nov 2025 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764358081;
	bh=u7mv+L8Hil1fEqjKj3rPX5h+p4VHEGd5CboTCyaF/Vo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XojeJRqJNCcqvgCT7Ip0yQdDJFXEXDyU9GlimN0vqFNR6wxh5nQyVZXjmr/xyQFTu
	 Lksh4LEBAvXbJqtzrsAxaoHhD5+GGMQSKbGq0+5zUAzH4aEZgDzIXf4a0tdZNv+0EI
	 87qc8t0kE+6INwr5o2x5Q50h7hiIzqnKgdBu/zk5DqV08HmZigU4IEXKUynDqEXKGr
	 C9tH7PPeq09SzVR51ZJ57kvEidPSYSjF95vdB2Wy0cR1ZAtjJU5De96m1HPDdVkZKr
	 IHWEnoffR0PwxWKc+pGLYWcDjgf9hbTNdSvM6Y82ZR8orqX2H7GbMTjqp3XXNt2QF6
	 QWjoQeq32ZUkg==
From: Nicolas Schier <nsc@kernel.org>
Date: Fri, 28 Nov 2025 20:27:57 +0100
Subject: [PATCH 1/2] fortify: Rename temporary file to match ignore pattern
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-fortify-improve-handling-of-tempfile-v1-1-a79d0d3abcac@kernel.org>
References: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
In-Reply-To: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: WangYuli <wangyuli@aosc.io>, WangYuli <wangyl5933@chinaunicom.cn>, 
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Nicolas Schier <nicolas.schier@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764358080; l=862;
 i=nsc@kernel.org; s=20250924; h=from:subject:message-id;
 bh=O+zdSlEPApddaYsckN+liTk0XEWHJglUvDhVkj3Oedk=;
 b=obPKT23D9y9fCOmoSYqYL/nqYhnH00d9ophz6W1NNbpI3Yz0tLNj6KwPZ/k32OGzqw0AJu0YA
 95XYT7xZL/SAeU2pH5B8mxt27CCkRRQt50vjSU3B9qfI+Em9U7ImzJ3
X-Developer-Key: i=nsc@kernel.org; a=ed25519;
 pk=+0ar7sBdSzOoVoXxW8B+48yZbV4azT4joSEm8UyP7z4=

From: Nicolas Schier <nicolas.schier@linux.dev>

test_fortify.sh uses a temporary file that might appear as untracked
file in some rare sitations.  Rename it to match one of top-level's
gitignore patterns.

Reported-by: WangYuli <wangyuli@aosc.io>
Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
Signed-off-by: Nicolas Schier <n.schier@avm.de>
---
 lib/test_fortify/test_fortify.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
index c2688ab8281d..368d07d9acbf 100644
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
2.51.0


