Return-Path: <linux-kbuild+bounces-1946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4F98D21A8
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 18:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5760CB21604
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2024 16:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFCD1DA4D;
	Tue, 28 May 2024 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMaKISZW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594241DA4C;
	Tue, 28 May 2024 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716913930; cv=none; b=ErL1ZCiC3Oo4e0914YQ0BsYTiZms19DWLS7HWVDkKfFY9a8txiQ3g8ZEDd4yGz44AP1n5oMa/fMqBmhw1PluC3oBwjlODMJMVkynUPSYAUumvCNfByNu0P24AybxPY0NczWenEWeec3BsS1u4eL39kDZ7GvVSkcjX8aaIv1oYHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716913930; c=relaxed/simple;
	bh=1o50xjb05Lg9GH8f5gPzgNxU6RvrcdP6/JkkfWVE8vY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RJ/cqHjUrz97amK5Sdp4WKgEfsshL8L2q/+AWUL3zqIugerlFJqxWS0d9bD7jXWtoYuKvuGS40s7ukc19zv7d0ZUUzo62LqtMo/RFYqa8h8A0RlbxZwfojyxA23beWSQhIxLjpiZL7oijKbgkmVNpdft0ydM3R0DkJt8vtDcNwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMaKISZW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CA2C3277B;
	Tue, 28 May 2024 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716913928;
	bh=1o50xjb05Lg9GH8f5gPzgNxU6RvrcdP6/JkkfWVE8vY=;
	h=From:To:Cc:Subject:Date:From;
	b=aMaKISZW9uXUDe4p1BPzBzP/ScskTBC8kXYmMTlIjFPrpSSVdSZqUJeTizFbjiVJ+
	 rg5FC08yiUQYiVGDx+bn60AiweejkNBDxGpRDDE3zw27CVwVYjX2NNbSf0KVOTbrmk
	 ffWuDXhMOv3vrEKnidwFstJCNE2ig1/lYGY2l3pfPSFDYzRhTnbEcE3MqGxlatK+58
	 O0cd6Aab/tjH6bkBn5g6eCfIRL+jQ+q6d8BtL4Cm/ENydqwQGQifS8X3xdO75Mj1gh
	 C5Bp3VBD1KlbORDap9wHAPtZyjXOv1YyoYK3Mw3zwDczlsX+mbI49wXMieUFVPZz7P
	 pqiuKawB1ZXYg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [PATCH] kheaders: use `command -v` to test for existence of `cpio`
Date: Tue, 28 May 2024 18:31:50 +0200
Message-ID: <20240528163150.410706-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 13e1df09284d ("kheaders: explicitly validate existence of cpio
command") added an explicit check for `cpio` using `type`.

However, `type` in `dash` (which is used in some popular distributions
and base images as the shell script runner) prints the missing message
to standard output, and thus no error is printed:

    $ bash -c 'type missing >/dev/null'
    bash: line 1: type: missing: not found
    $ dash -c 'type missing >/dev/null'
    $

For instance, this issue may be seen by loongarch builders, given its
defconfig enables CONFIG_IKHEADERS since commit 9cc1df421f00 ("LoongArch:
Update Loongson-3 default config file").

Therefore, use `command -v` instead to have consistent behavior, and
take the chance to provide a more explicit error.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 kernel/gen_kheaders.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 6d443ea22bb7..4ba5fd3d73ae 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -14,7 +14,12 @@ include/
 arch/$SRCARCH/include/
 "
 
-type cpio > /dev/null
+if ! command -v cpio >/dev/null; then
+	echo >&2 "***"
+	echo >&2 "*** 'cpio' could not be found."
+	echo >&2 "***"
+	exit 1
+fi
 
 # Support incremental builds by skipping archive generation
 # if timestamps of files being archived are not changed.

base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
-- 
2.45.1


