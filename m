Return-Path: <linux-kbuild+bounces-2683-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2CB93DDB6
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 09:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FB821F22480
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2024 07:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28EA3487BF;
	Sat, 27 Jul 2024 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dek7aBA/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02FA4433C4;
	Sat, 27 Jul 2024 07:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722066341; cv=none; b=p/DElrUXqDBJlQDIJoP80+R1fp2YfsoW9Zq4an2gVAVY5tpa55twVOIxvqf6uwZKthf+prjAG4Y9weXZK9lpb2IOwZZMCUnXvfy8L6bXPzunfEW+uJ+UDjIKX+Ry4xqltjB/4R1RbVo41+MST2F4MeSiFU1rcJrwDp8QLVlfu2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722066341; c=relaxed/simple;
	bh=oKuHdUJvEMs8s+bKVfaeIF94aWnkZ0wZAGFLL/dcK1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8CN7/WyxOjCbv/frPHGsNG+43iR20BWD0ksRtbHDrqpkbc9n7b8TgyqM6Owuqn9gasAzOGLp/QrjTXmK66Bk5BO2Y8DyEqkSTBG45r9Q7rZFPTIYPIxp8VmxVW5lOA3kZ2iOBwksVKIsY+I8kyNo2aC6XYV4IEdfi4ZQvFPM3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dek7aBA/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC587C4AF07;
	Sat, 27 Jul 2024 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722066340;
	bh=oKuHdUJvEMs8s+bKVfaeIF94aWnkZ0wZAGFLL/dcK1k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dek7aBA/DG2+3sggGYpvUapEHPiERDv/vxnmydnCfYH86OGWfWjI9yYqAObAbGKg/
	 PTDkekoQf2HLfJGUHZ9/tsgAaxlsDWjjO8jm39pO9Y07BkldNbcb7Q1sd3PwLEfRji
	 tlRT1FwHJtF3RbHVHDjoEg2t+nbXH7QGFy6M6U/hWtTWwSmkAzVkVZ5T9Zc0tPEb3E
	 feP2WFZ+8l9q4C0V9qhJQQCb6jePr9caHSE9c8TSZ7dx0jgn3vpaOMUZfjY+6TILdp
	 kr9T0PkNK8k+p3Vy81Frz4fILqqwvKl67/oSKPuBKh0Z7RuM0rc4P4/s9bMLoOdk6t
	 qWw9eoTCROlzQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ben Hutchings <ben@decadent.org.uk>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 3/4] kbuild: slim down package for building external modules
Date: Sat, 27 Jul 2024 16:42:03 +0900
Message-ID: <20240727074526.1771247-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240727074526.1771247-1-masahiroy@kernel.org>
References: <20240727074526.1771247-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exclude directories and files unnecessary for building external modules:

 - include/config/  (except include/config/auto.conf)
 - scripts/atomic/
 - scripts/dtc/
 - scripts/kconfig/
 - scripts/mod/mk_elfconfig
 - scripts/package/
 - scripts/unifdef
 - .config
 - *.o
 - .*.cmd

Avoid copying files twice for the following directories:

 - include/generated/
 - arch/*/include/generated/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/package/install-extmod-build | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
index 8cc9e13403ae..cc335945dfbc 100755
--- a/scripts/package/install-extmod-build
+++ b/scripts/package/install-extmod-build
@@ -9,15 +9,22 @@ is_enabled() {
 	grep -q "^$1=y" include/config/auto.conf
 }
 
+find_in_scripts() {
+	find scripts \
+		\( -name atomic -o -name dtc -o -name kconfig -o -name package \) -prune -o \
+		! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o -type l \) -print
+}
+
 mkdir -p "${destdir}"
 
 (
 	cd "${srctree}"
 	echo Makefile
 	find "arch/${SRCARCH}" -maxdepth 1 -name 'Makefile*'
-	find include scripts -type f -o -type l
+	find "arch/${SRCARCH}" -name generated -prune -o -name include -type d -print
 	find "arch/${SRCARCH}" -name Kbuild.platforms -o -name Platform
-	find "arch/${SRCARCH}" -name include -type d
+	find include \( -name config -o -name generated \) -prune -o \( -type f -o -type l \) -print
+	find_in_scripts
 ) | tar -c -f - -C "${srctree}" -T - | tar -xf - -C "${destdir}"
 
 {
@@ -25,12 +32,15 @@ mkdir -p "${destdir}"
 		echo tools/objtool/objtool
 	fi
 
-	find "arch/${SRCARCH}/include" Module.symvers include scripts -type f
+	echo Module.symvers
+	echo "arch/${SRCARCH}/include/generated"
+	echo include/config/auto.conf
+	echo include/generated
+	find_in_scripts
 
 	if is_enabled CONFIG_GCC_PLUGINS; then
 		find scripts/gcc-plugins -name '*.so'
 	fi
 } | tar -c -f - -T - | tar -xf - -C "${destdir}"
 
-# copy .config manually to be where it's expected to be
-cp "${KCONFIG_CONFIG}" "${destdir}/.config"
+find "${destdir}" \( -name '.*.cmd' -o -name '*.o' \) -delete
-- 
2.43.0


