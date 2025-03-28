Return-Path: <linux-kbuild+bounces-6368-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA60A74CBB
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 15:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C7281897A02
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Mar 2025 14:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C154211A0D;
	Fri, 28 Mar 2025 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFThrR8b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B131DE4C7;
	Fri, 28 Mar 2025 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172155; cv=none; b=UpF+rH+KP8GZu6AGYR9PF4vtgyUdgMRqHsc+rUJNhEk8HH/2hEEOz4xCsrcaL1vSbq35BROrX3HyWVM8hAI/1wMLpF8sSnPMJjOuh8UPfS3Dm8XgVAmzQtC3TU80V+Q8MyffIV5vnEewuANzla/KyL0IMyIzU/R+IHc1cjmjCPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172155; c=relaxed/simple;
	bh=guXFmN2lsyyKD0m8D7A/1C3bGEj7EzdLXiLfXZocE+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ICWU7aeNXzF7l3pRBowBuUdXWmTZwDAUO50Kiqt9QD2sLf635AWedluT1NS4sX2DI4tMN/4WoRYzbi9Vzaw1XM6m+XdnaZycQoUmUW3m4b5IH8w0sVdSpJkkkDOTJNYF5n/yaILa991XCNohM80Qmx0ctiu5w+Vcb2YaLtKFg8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFThrR8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F085DC4CEE4;
	Fri, 28 Mar 2025 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743172154;
	bh=guXFmN2lsyyKD0m8D7A/1C3bGEj7EzdLXiLfXZocE+Y=;
	h=From:Date:Subject:To:Cc:From;
	b=UFThrR8bPUs/a89kRhwKzIvU21ZzFj1Xc5T5ue1Ck9J8JOl8IsVcMulPmSgogdzlf
	 JRz9Om2SPefeM7/p0pxnkY+RZ1JENxtDtiqnzz0M25r0MBXglZpXsggykcv6XbT8Aa
	 JqoqO5f5vjSGZvDiP/g24SsT1RK4hdfN6XCf2eb6HiIBuPJLYgISkvQvZKtGySwKVf
	 6hOizrcIGfnZ9YJ3KTrpImMAMZjWtSnYicZciceoDIXvSHy4uoZWdcId31t+WTiwLe
	 uzruZ10FEee7w65NTDGwJY2SeQVKSuaPq3VMp2EIUN2dhd+qbgq++Kz5wXRo8gswu+
	 kkJJmiV0K1GEg==
From: Daniel Gomez <da.gomez@kernel.org>
Date: Fri, 28 Mar 2025 14:28:37 +0000
Subject: [PATCH] kconfig: merge_config: use an empty file as initfile
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250328-fix-merge-config-v1-1-ee78797d1302@samsung.com>
X-B4-Tracking: v=1; b=H4sIABSy5mcC/x2MQQqAIBBFryKzTlAj1K4SLcJGm0UaChFId29o+
 fjvvw4NK2GDWXSoeFOjkhn0ICAcW04oaWcGo8ykRuNkpEeeWHkIJUdK0tmIWnmlLXrg21WRnT+
 5rO/7ARVm6WxiAAAA
X-Change-ID: 20250328-fix-merge-config-87fe109017e9
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Daniel Gomez <da.gomez@kernel.org>, Daniel Gomez <da.gomez@samsung.com>
X-Mailer: b4 0.14.2

From: Daniel Gomez <da.gomez@samsung.com>

The scripts/kconfig/merge_config.sh script requires an existing
$INITFILE (or the $1 argument) as a base file for merging Kconfig
fragments. However, an empty $INITFILE can serve as an initial starting
point, later referenced by the KCONFIG_ALLCONFIG Makefile variable
if -m is not used. This variable can point to any configuration file
containing preset config symbols (the merged output) as stated in
Documentation/kbuild/kconfig.rst. When -m is used $INITFILE will
contain just the merge output requiring the user to run make (i.e.
KCONFIG_ALLCONFIG=<$INITFILE> make <allnoconfig/alldefconfig> or make
olddefconfig).

Instead of failing when `$INITFILE` is missing, create an empty file and
use it as the starting point for merges.

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
Commit b9fe99c5b994 ("kbuild: mergeconfig: move an error check
to merge_config.sh") moves the check for .config to exist from
scripts/kconfig/Makefile to the scripts/kconfig/merge_config.sh.
But this is no longer necessary.

This avoid having to run a make <target> to create a first .config file.
Workflow:

./scripts/kconfig/merge_config.sh \
-m .config \
<fragment list>

make olddefconfig

Here the logs with upstream scripts/kconfig/merge_config.sh (to show
.config is created with tinyconfig).

make tinyconfig V=1
{..}
make -f ./scripts/Makefile.build obj=scripts/kconfig tinyconfig
KCONFIG_ALLCONFIG=kernel/configs/tiny-base.config make -f ./Makefile allnoconfig
make -f ./scripts/Makefile.build obj=scripts/basic
make -f ./scripts/Makefile.build obj=scripts/kconfig allnoconfig
scripts/kconfig/conf  --allnoconfig Kconfig

configuration written to .config

make -f ./Makefile tiny.config
make -f ./scripts/Makefile.build obj=scripts/basic
make -f ./scripts/Makefile.build obj=scripts/kconfig tiny.config
cmd_merge_fragments tiny.config
  ./scripts/kconfig/merge_config.sh -m .config
./kernel/configs/tiny.config ./arch/x86/configs/tiny.config
Using .config as base
Merging ./kernel/configs/tiny.config
Value of CONFIG_CC_OPTIMIZE_FOR_SIZE is redefined by fragment
./kernel/configs/tiny.config:
Previous value: # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
New value: CONFIG_CC_OPTIMIZE_FOR_SIZE=y

Value of CONFIG_KERNEL_XZ is redefined by fragment
./kernel/configs/tiny.config:
Previous value: # CONFIG_KERNEL_XZ is not set
New value: CONFIG_KERNEL_XZ=y

Value of CONFIG_SLUB_TINY is redefined by fragment
./kernel/configs/tiny.config:
Previous value: # CONFIG_SLUB_TINY is not set
New value: CONFIG_SLUB_TINY=y

Merging ./arch/x86/configs/tiny.config
Value of CONFIG_UNWINDER_GUESS is redefined by fragment
./arch/x86/configs/tiny.config:
Previous value: # CONFIG_UNWINDER_GUESS is not set
New value: CONFIG_UNWINDER_GUESS=y

merged configuration written to .config (needs make)

make -f ./Makefile olddefconfig
make -f ./scripts/Makefile.build obj=scripts/basic
make -f ./scripts/Makefile.build obj=scripts/kconfig olddefconfig
scripts/kconfig/conf  --olddefconfig Kconfig

configuration written to .config
---
 scripts/kconfig/merge_config.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 0b7952471c18f6882b8978f839f3170bb41fb01f..ad35a60de350ae1c5b60d39bf752115d27276f52 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -112,8 +112,8 @@ INITFILE=$1
 shift;
 
 if [ ! -r "$INITFILE" ]; then
-	echo "The base file '$INITFILE' does not exist.  Exit." >&2
-	exit 1
+	echo "The base file '$INITFILE' does not exist. Creating one..." >&2
+	touch $INITFILE
 fi
 
 MERGE_LIST=$*

---
base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
change-id: 20250328-fix-merge-config-87fe109017e9

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>


