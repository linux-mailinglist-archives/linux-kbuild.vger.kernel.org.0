Return-Path: <linux-kbuild+bounces-5940-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF56FA4B381
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 17:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5603A1891A97
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Mar 2025 16:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5593C1EB19E;
	Sun,  2 Mar 2025 16:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h55b3OvM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FB7111AD;
	Sun,  2 Mar 2025 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740933909; cv=none; b=n3rKkWKX+pgfd8vCGHnCINpaomFbA0c9y4aHrkHuXUGcHTPVvXNWZ5SQ7HkP0L7SWDp5za8OIvW1st1Zd9zEAdgHO3bw0lMhPmpxFokIbppqtENuZfl5e1z/9V/DjfRgRwyo6NuuYXKxGXTvOdVgNHfF6821Js19DCbZFZnpgp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740933909; c=relaxed/simple;
	bh=fyvk8brOtPy7mtmxHExxgWFpdiLm50+TwUU678uaZAs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B8lFbQhNAtRgSSvdfQEt4Rr23ILunjaobNX2AnkQPcP78FVFM+26lDn2cOK5oMA7oRHgvoYL28Gtv1CSCc4hpseCbq3+x4jl/H+J2QSr1tFtSZnaNw1nQ8uMm/hGe90wX5rv9Dg6Hb68ZVKahavKHGJaA4gw2U3XVwxOUq1W4Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h55b3OvM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC58CC4CED6;
	Sun,  2 Mar 2025 16:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740933908;
	bh=fyvk8brOtPy7mtmxHExxgWFpdiLm50+TwUU678uaZAs=;
	h=From:To:Cc:Subject:Date:From;
	b=h55b3OvMjVkeBm/UBIRTQdYXYksfsLWIge0I3UkwCMGaI6x2JIlCTj7otBUkwKSbY
	 SB1vLm+/5iztyFnglDJUZCzood6ELlrUB+EQfDiheL/Ar7v24rJJ/LiIMQkOw1W2B8
	 JoBvQu+9c7LNvEQZwinpPI8t9LIDDVRucdBL0p1NOCRYKlrD6JDECuVVZSasEtwn2w
	 lEl1BOVdL4oad2lKK9o3dM0ZAfg8vwr0WQUwBVRNQBvR91p6mLmFEI3odW8Ir/UBYE
	 kl6jHwiI8GIax+t71tHWsUUNa9kqKGd0p2bLMDqzEkXW7fSwj6Nq2L8AOUwAXzVXbE
	 UJDVzITGERvgA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	HONG Yifan <elsk@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] Revert "kheaders: Ignore silly-rename files"
Date: Mon,  3 Mar 2025 01:42:54 +0900
Message-ID: <20250302164459.100265-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 973b710b8821c3401ad7a25360c89e94b26884ac.

As I mentioned in the review [1], I do not believe this was the correct
fix.

Commit 41a00051283e ("kheaders: prevent `find` from seeing perl temp
files") addressed the root cause of the issue. I asked David to test
it but received no response.

Commit 973b710b8821 ("kheaders: Ignore silly-rename files") merely
worked around the issue by excluding such files, rather than preventing
their creation.

[1]: https://lore.kernel.org/lkml/CAK7LNAQndCMudAtVRAbfSfnV+XhSMDcnP-s1_GAQh8UiEdLBSg@mail.gmail.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/gen_kheaders.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 00529c81cc40..c9e5dc068e85 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -89,7 +89,6 @@ rm -f "${tmpdir}.contents.txt"
 
 # Create archive and try to normalize metadata for reproducibility.
 tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
-    --exclude=".__afs*" --exclude=".nfs*" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
     -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
 
-- 
2.43.0


