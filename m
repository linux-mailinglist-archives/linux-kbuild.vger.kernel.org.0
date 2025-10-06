Return-Path: <linux-kbuild+bounces-9020-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF88BBFCD1
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 01:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F03C73A2E6F
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 23:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96E335972;
	Mon,  6 Oct 2025 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otE9iVgX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4034C9D;
	Mon,  6 Oct 2025 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759794919; cv=none; b=soXkmjIlbRWJoXMPuQFoWmMfuuCzJY0Cfs9fcK/jhWUcLkUbRZol5KcCv/r+W6za7TXQjEDW02LgDe6IKPjzAhZNSwYaOe/dUOABZHqkHPSV82/WXRoJKHd9m14oSQeXjs3WP7ravvktT4YGG+mVW/uAeMn737yqSvIvgQ/qA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759794919; c=relaxed/simple;
	bh=UE3HJepWaZiO781N0ENPL/OItkVbiJ9zTOOiuCs1kw4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qDNYIjSJjBTep0hvakapRpHG2UfQU770LOZmp509CECHOfhsX4kkf7X7wJGJN9+xKMfP/xPsoUuhD5yaGRQHOADPC1sJV/lo4h1RBZS9LcPJIWuZmQs3Q8tZq0JWzFd1sgPBMwqgE1NfwAfzW6MLgAKiZ7ua4l1Gchg6zI0R+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otE9iVgX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A36BC4CEF5;
	Mon,  6 Oct 2025 23:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759794919;
	bh=UE3HJepWaZiO781N0ENPL/OItkVbiJ9zTOOiuCs1kw4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=otE9iVgX0cIj2NcnYUyxbvUMttpYeEfoDT0LsrqFIvzsMuU1fpz8YvrFHERgiLkvv
	 R3Ni26W+OhBWF2v5JKcLeIiFGKB0bgneTkgK+LD+Gbe2LZuBDPOSS/SMS2BIqx9Lbd
	 Lnsh9KzoPPkkEQWOGCp+slAeo0erszjWqE0fLDoozBhw2fvYci/YilTqPpH4/XszLL
	 zw7NfWe3/OukrE/nA7AdmE+AoDSAF7qCfSvP9lIoDgVA34VbAxpnYfx0VS9EH2ldAc
	 BoPPCAHfhdtQJpkBI4KIwCLq8SFEiYP3Z1UICNCMV+9YXMpV9yDSJnTrlTsRztmWpw
	 Qbg1YgG9+vTGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0679FCAC5B8;
	Mon,  6 Oct 2025 23:55:19 +0000 (UTC)
From: Dmitry Safonov via B4 Relay <devnull+dima.arista.com@kernel.org>
Date: Tue, 07 Oct 2025 00:55:03 +0100
Subject: [PATCH RFC] gen_init_cpio: Do fsync() only on regular files
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-gen_init_cpio-pipe-v1-1-d782674d4926@arista.com>
X-B4-Tracking: v=1; b=H4sIANZW5GgC/x2MQQrCMBAAv1L2bDAtthWvgg/wKlK2ybZd0CTsh
 iKU/t3ocQZmNlASJoVLtYHQysoxFKgPFbgFw0yGfWFobNPW1vZmpjBw4Dy4xNEkTmRa9Od+6uo
 OTxZKmIQm/vynD7jfrvAsckQlMwoGt/x+OcqKL6/HN2omgX3/AvKrGOqLAAAA
X-Change-ID: 20251007-gen_init_cpio-pipe-5ad87f616a40
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Disseldorp <ddiss@suse.de>, Nicolas Schier <nsc@kernel.org>, 
 Dmitry Safonov <dima@arista.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759794918; l=2046;
 i=dima@arista.com; s=20250521; h=from:subject:message-id;
 bh=NnRRrg2oTnEc3cpkMddM+o06vZ45lyz3lI5ZtwOioE0=;
 b=7CUFMg8F4JYq/oh73XYptU6UhBaoMFT2saK+WgptF9bn89/p2Jz73kAcWmLlqtLDWFWSp+86n
 8IbocTtKPRfASAcG9f1dQSa2/W8H563HPQG9RF55RUqUP7GGkE1+tDn
X-Developer-Key: i=dima@arista.com; a=ed25519;
 pk=/z94x2T59rICwjRqYvDsBe0MkpbkkdYrSW2J1G2gIcU=
X-Endpoint-Received: by B4 Relay for dima@arista.com/20250521 with
 auth_id=405
X-Original-From: Dmitry Safonov <dima@arista.com>
Reply-To: dima@arista.com

From: Dmitry Safonov <dima@arista.com>

Here at Arista gen_init_cpio is used in testing in order to create
an initramfs for specific tests. Most notably, there is a test that does
essentially a fork-bomb in kdump/panic kernel, replacing build-time
generated init script: instead of doing makedumpfile, it does call
shell tests.

In comparison to usr/Makefile, which creates an intermediate .cpio file,
the Makefile that generates initrd for tests is a one-liner:
> file lib/kdump ${src_dir}/oom-crashkernel 0644 0 0 | usr/gen_init_cpio /dev/stdin | xz -z -c -e -Ccrc32 > ${target_dir}/oom-crashkernel.initrd

As fsync() on a pipe fd returns -EINVAL, that stopped working.
Check that outfd is a regular file descriptor before calling fsync().

Sending this as RFC as these are local tests, rather than upstream ones,
unfortunately. Yet, the fix is trivial and increases correctness of
gen_init_cpio (and maybe saves some time for another person debugging
it). A workaround to use temporary cpio file is also trivial, so not
insisting on merging.

Fixes: ae18b94099b0 ("gen_init_cpio: support -o <output_file> parameter")
Cc: David Disseldorp <ddiss@suse.de>
Cc: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 usr/gen_init_cpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/usr/gen_init_cpio.c b/usr/gen_init_cpio.c
index 75e9561ba31392e12536e76a918245a8ea07f9b8..845e2d92f0e56b02ba5fc12ecd243ce99c53f552 100644
--- a/usr/gen_init_cpio.c
+++ b/usr/gen_init_cpio.c
@@ -6,6 +6,7 @@
 #include <stdbool.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <sys/socket.h>
 #include <string.h>
 #include <unistd.h>
 #include <time.h>
@@ -112,6 +113,9 @@ static int cpio_trailer(void)
 	    push_pad(padlen(offset, 512)) < 0)
 		return -1;
 
+	if (!isfdtype(outfd, S_IFREG))
+		return 0;
+
 	return fsync(outfd);
 }
 

---
base-commit: c746c3b5169831d7fb032a1051d8b45592ae8d78
change-id: 20251007-gen_init_cpio-pipe-5ad87f616a40

Best regards,
-- 
Dmitry Safonov <dima@arista.com>



