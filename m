Return-Path: <linux-kbuild+bounces-9026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A609DBC01C5
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 05:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 948824E254A
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Oct 2025 03:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D584C1E1E12;
	Tue,  7 Oct 2025 03:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HC9vTyjc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85001A267;
	Tue,  7 Oct 2025 03:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759808821; cv=none; b=PVdl7HFazjY+QURMleVzV/yOEtXYrn599u1T0x+KxSTQX37akWTEVgSUU8CFiNV3OYFqCrq1e9lrl6Oik/SpDALzu6FeCOIhf83o9RS3SRIhovDN9+hAqQBj730O/Y3mCGEafxSa2D/mVh4bCyxNGuL4+zOWpJJqNF6bSmQ4PP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759808821; c=relaxed/simple;
	bh=jHWYuOq5rYdachqCH402zOZjxpCtATwDtliRdFtl7Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bkMJt0F+EXe9aoF+UWoq/+tGzB7HUlLDlrGrg/0KqqrFjAONVljO3UmtMaqVuy7G7RtwElkbLKt/dBEn7UbGlial2pZYhJ5UoYct3UMWa1nuIuRfC45p6A5CquRPnPf8F3DM8P0RzONXm0gcBEt2trailtgQ+bydAxKP53CVClk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HC9vTyjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09C15C4CEF1;
	Tue,  7 Oct 2025 03:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759808820;
	bh=jHWYuOq5rYdachqCH402zOZjxpCtATwDtliRdFtl7Mg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=HC9vTyjcxFjp4SgxBcXlIVvVvwOKkXK6cnw7hZQQGk/APSJlxy87hQzMJJ0RWVpES
	 sw+PRgEoPEhah9TqNfEdEC9J7qNDLpDkJmgCq0oJkCVn79NPikTTIEafqfVzsd4H8J
	 v1iE0SL+tqzUotEIKS4SB0mHYYqHuY1nRVR/5G3zgW1cvus7g7VhsWlqN+YgX7upia
	 2xT2hoZwpdr32Lv0xwXXolRw6dovAT0jYzSw7rFfHtpcxMBPOFmbHP678vO3ZCIRYk
	 nCO4ndFJQVzj5ehMtaT8QwnARFpUomt4RRUIEqcD/YQZSpoIs7aw4XhGsFJZtRgi06
	 MBvbLZ6XeXz6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9417CCA470;
	Tue,  7 Oct 2025 03:46:59 +0000 (UTC)
From: Dmitry Safonov via B4 Relay <devnull+dima.arista.com@kernel.org>
Date: Tue, 07 Oct 2025 04:46:47 +0100
Subject: [PATCH v2] gen_init_cpio: Ignore fsync() returning EINVAL on pipes
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-gen_init_cpio-pipe-v2-1-b098ab94b58a@arista.com>
X-B4-Tracking: v=1; b=H4sIACaN5GgC/32OQQqDMBBFryJZN60Jmtiueo8iMppRB2oSEgkt4
 t0bPUCXb+C9PxuLGAgjexQbC5gokrMZ5KVgwwx2Qk4mM5OlrEVZaj6h7cjS2g2eHPfkkddgGj0
 qoaAqWRZ9wJE+Z/TVZu4hIu8D2GE+UqsLCd4m3haIK4bDmCnm6/f8IonD+zuYBBfc6EYqXZnqL
 tUTQi7AdXALa/d9/wGYg9IN1wAAAA==
X-Change-ID: 20251007-gen_init_cpio-pipe-5ad87f616a40
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, David Disseldorp <ddiss@suse.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicolas Schier <nsc@kernel.org>, Dmitry Safonov <dima@arista.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759808819; l=1432;
 i=dima@arista.com; s=20250521; h=from:subject:message-id;
 bh=pi6nAKJ620AnZApjddteEQX/ECee5WVBVllxGZBH+N8=;
 b=YzLgLfDoTx79sz7zGwGkOOFxyKp5dQ37Mq0qJ7q4IcdONwpPsrJ3tDd6zfJiEY37oA6O77kqI
 IuyCcC/DpAvBcyUYl18XUycPJas2PA6hmWCfh1F3i2+wZ8fUsHwSLgj
X-Developer-Key: i=dima@arista.com; a=ed25519;
 pk=/z94x2T59rICwjRqYvDsBe0MkpbkkdYrSW2J1G2gIcU=
X-Endpoint-Received: by B4 Relay for dima@arista.com/20250521 with
 auth_id=405
X-Original-From: Dmitry Safonov <dima@arista.com>
Reply-To: dima@arista.com

From: Dmitry Safonov <dima@arista.com>

The reproducer:
echo | ./usr/gen_init_cpio /dev/stdin > /dev/null

fsync() on a pipe fd returns -EINVAL, which makes gen_init_cpio fail.
Ignore -EINVAL from fsync().

Fixes: ae18b94099b0 ("gen_init_cpio: support -o <output_file> parameter")
Cc: David Disseldorp <ddiss@suse.de>
Cc: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Dmitry Safonov <dima@arista.com>
Reviewed-by: David Disseldorp <ddiss@suse.de>
---
Changes in v2:
- Instead of isfdtype() just ignore -EINVAL from fsync() (Suggested by David)
- Add minimal reproducer and shrink the patch description (David)
- Link to v1: https://lore.kernel.org/r/20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com
---
 usr/gen_init_cpio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 75e9561ba31392e12536e76a918245a8ea07f9b8..b7296edc6626fb0cf7c709082797d1e6a7376d6e 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -112,7 +112,10 @@ static int cpio_trailer(void)
 	    push_pad(padlen(offset, 512)) < 0)
 		return -1;
 
-	return fsync(outfd);
+	if (fsync(outfd) < 0 && errno != EINVAL)
+		return -1;
+
+	return 0;
 }
 
 static int cpio_mkslink(const char *name, const char *target,

---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20251007-gen_init_cpio-pipe-5ad87f616a40

Best regards,
-- 
Dmitry Safonov <dima@arista.com>



