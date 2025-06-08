Return-Path: <linux-kbuild+bounces-7400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FC1AD1380
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 19:08:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D87AF3A83C4
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Jun 2025 17:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B111A3179;
	Sun,  8 Jun 2025 17:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRaPc1cY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510CA19ADBA;
	Sun,  8 Jun 2025 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749402474; cv=none; b=YqZGadFQLquq3Nzs17aX8yB/YFOYvW2DonAYWs2MZ4nK6lWxjAHBTTKfbyulTK4I8Tx32hQvndhXJ2HevBNVhvzSl/W3cfyhDYFFlfM2VKkRWLY+f/u3Wytcxi1H+fJCjR1cn3HBBzMISq3Cfe18ivpHwiCqRHAAjjULs1mPGZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749402474; c=relaxed/simple;
	bh=r5ynRUqLbZ103SNBOYdkg9yGZaIGTMHY5xr3rcJifN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+N7G4DyhTcb3LAln6UHZPlR7BYR3JUa8bvKarJuV033be+uwIJBqrkDvZeFQ830DXvbvTTod3bTRwZyNC6bJ1nyucZFqQpd+s1R1yIoOr+GEcttI6w/jJA5dNkPl367ZO8FIiePjN85WJ47PhzwoT5veqKpb2iiXecE2ljxn0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRaPc1cY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B00C4CEF0;
	Sun,  8 Jun 2025 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749402473;
	bh=r5ynRUqLbZ103SNBOYdkg9yGZaIGTMHY5xr3rcJifN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CRaPc1cYLQsbyDO+wbZZwzZ8DJPzjE036vkPo75fxycLmOYGR5Fc0ZjHbfVyw+oWf
	 EauEqu4xj4wVBKze9o5WmIA+tcXdu8N4lUOL+nA0a6bcVisaAhL53UD1VwKcrlrEeo
	 j4JpqwmsxslEePkj2SZ6O1f6OieZTAt3eVfiQQAeQ9/S2vj3Sn65rxqDfzUfkJUo3z
	 muRFct6S3tdi8TNnvbt/ktSGjaDLdHH8r8bL7ZY5UyqmfE4c4JDSfkfTeGQ7pOYgIs
	 7vnI4BZdUOtjKlSw4u2JYFiXXk3WjrlveZ/a+JBXN7ek1WIQQ8nWcFiRisIblSJUnW
	 NySdrArA0xovw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kheaders: rebuild kheaders_data.tar.xz when KBUILD_BUILD_TIMESTAMP is changed
Date: Mon,  9 Jun 2025 01:59:56 +0900
Message-ID: <20250608170746.3480391-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250608170746.3480391-1-masahiroy@kernel.org>
References: <20250608170746.3480391-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This problem is similar to commit 7f8256ae0efb ("initramfs: Encode
dependency on KBUILD_BUILD_TIMESTAMP"): kernel/gen_kheaders.sh has an
internal dependency on KBUILD_BUILD_TIMESTAMP that is not exposed to
make, so changing KBUILD_BUILD_TIMESTAMP will not trigger a rebuild
of the archive.

Move $(KBUILD_BUILD_TIMESTAMP) to the Makefile so that is is recorded
in the *.cmd file.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 kernel/Makefile        | 2 +-
 kernel/gen_kheaders.sh | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/kernel/Makefile b/kernel/Makefile
index 9a9ff405ea89..c486f17e669a 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -162,7 +162,7 @@ $(obj)/config_data: $(KCONFIG_CONFIG) FORCE
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
 quiet_cmd_kheaders_data = GEN     $@
-      cmd_kheaders_data = "$<" "$@" "$(obj)/kheaders-srclist" "$(obj)/kheaders-objlist"
+      cmd_kheaders_data = "$<" "$@" "$(obj)/kheaders-srclist" "$(obj)/kheaders-objlist" "$(KBUILD_BUILD_TIMESTAMP)"
       cmd_kheaders_data_dep = cat $(depfile) >> $(dot-target).cmd; rm -f $(depfile)
 
 define rule_kheaders_data
diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
index 0ff7beabb21a..919bdcf989f4 100755
--- a/kernel/gen_kheaders.sh
+++ b/kernel/gen_kheaders.sh
@@ -7,6 +7,7 @@ set -e
 tarfile=$1
 srclist=$2
 objlist=$3
+timestamp=$4
 
 dir=$(dirname "${tarfile}")
 tmpdir=${dir}/.tmp_dir
@@ -42,7 +43,7 @@ xargs -0 -P8 -n1 \
 rm -f "${tmpdir}.contents.txt"
 
 # Create archive and try to normalize metadata for reproducibility.
-tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
+tar "${timestamp:+--mtime=$timestamp}" \
     --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X \
     -I $XZ -cf $tarfile -C "${tmpdir}/" . > /dev/null
 
-- 
2.43.0


