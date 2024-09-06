Return-Path: <linux-kbuild+bounces-3452-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B2396F9EE
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 19:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32B44B2357D
	for <lists+linux-kbuild@lfdr.de>; Fri,  6 Sep 2024 17:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5D71D79A1;
	Fri,  6 Sep 2024 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ir2sDJkj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86B11D7985;
	Fri,  6 Sep 2024 17:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725643785; cv=none; b=EvG6NjmXZe3cICw/SLI1l7rQQrzlqn4OzgSzwUhg4oTe4wcV6eQykN3hdO2ebhIjoihHtvZrKzhGEltnwX4la5tqFbyY50DU1Dn1oWs3dPlbGXq0dLNELK0u0tqnuAFXDHDSTRUrnCk62eMrl3yjYsS8BpEaiCHcfnIPStG+mPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725643785; c=relaxed/simple;
	bh=bqxbf2UbdchPA3++K/VLWumlvgK77qHdYxBCz+Szp1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1sQPoQva6HjIGZMS8dYIUhBW0fITy2exJ3X+VZTn7478xN+CJcbI7lqWY064NfVqw3BKFplZfwca1x2n8UeM+cN1cb15+BgM89s/Zm1QV66ECYmqw+xzfhpwzeQY/VeNq2R+G2K9Ny90XrFLn0jVJhT5raC8v1gTJoi8bF61xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ir2sDJkj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDE06C4CEC8;
	Fri,  6 Sep 2024 17:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725643784;
	bh=bqxbf2UbdchPA3++K/VLWumlvgK77qHdYxBCz+Szp1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ir2sDJkjTsFWXT9O7My2H5Ux2kNduLI/YKJSh41g2NyNFn2e+SLXDUgOuENf7QN6b
	 Lc3AcvdLiqN7rui8pD5hl9dGPO25kAExe+Uc2b0KGIqI5sksRSMX+vc78T0CGReCNd
	 Zbpd2YiqBCD6rOwqi6w3D5XrAAmGChxvo4U+oNUXK4YYm8ZLzKYxYMJtNWjyNsJseh
	 9t5RO7amFA5Za6LIi90cnpvaQ5uSbffHXHy1svqtOm4y4Lrgrhs8ZqhA5HSP4EiFvC
	 ryqkxobgoc2J76tAv//p1Mpi6uVkDiepe9qJNxJzsxafC9Tpc2iM52a0fU7DcArWit
	 hq6ocAR79LGSw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	selinux@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 2/2] selinux: move genheaders to security/selinux/
Date: Sat,  7 Sep 2024 02:29:14 +0900
Message-ID: <20240906172934.1317830-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240906172934.1317830-1-masahiroy@kernel.org>
References: <20240906172934.1317830-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This tool is only used in security/selinux/Makefile.

Move it to security/selinux/ so that 'make clean' can clean it up.

Please note 'make clean' does not clean scripts/ because tools under
scripts/ are often used for external module builds. Obviously, genheaders
is not the case here.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Add more reason to move genheaders to security/selinux/

 scripts/remove-stale-files                                 | 3 +++
 scripts/selinux/Makefile                                   | 2 +-
 scripts/selinux/genheaders/.gitignore                      | 2 --
 scripts/selinux/genheaders/Makefile                        | 3 ---
 security/selinux/.gitignore                                | 1 +
 security/selinux/Makefile                                  | 7 +++++--
 .../selinux/genheaders => security/selinux}/genheaders.c   | 0
 7 files changed, 10 insertions(+), 8 deletions(-)
 delete mode 100644 scripts/selinux/genheaders/.gitignore
 delete mode 100644 scripts/selinux/genheaders/Makefile
 rename {scripts/selinux/genheaders => security/selinux}/genheaders.c (100%)

diff --git a/scripts/remove-stale-files b/scripts/remove-stale-files
index f38d26b78c2a..4e7d25668a98 100755
--- a/scripts/remove-stale-files
+++ b/scripts/remove-stale-files
@@ -20,4 +20,7 @@ set -e
 # yard. Stale files stay in this file for a while (for some release cycles?),
 # then will be really dead and removed from the code base entirely.
 
+# moved to security/selinux/genheaders
+rm -f scripts/selinux/genheaders/genheaders
+
 rm -f *.spec
diff --git a/scripts/selinux/Makefile b/scripts/selinux/Makefile
index 59494e14989b..4b1308fa5732 100644
--- a/scripts/selinux/Makefile
+++ b/scripts/selinux/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-subdir-y := mdp genheaders
+subdir-y := mdp
diff --git a/scripts/selinux/genheaders/.gitignore b/scripts/selinux/genheaders/.gitignore
deleted file mode 100644
index 5fcadd307908..000000000000
--- a/scripts/selinux/genheaders/.gitignore
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-genheaders
diff --git a/scripts/selinux/genheaders/Makefile b/scripts/selinux/genheaders/Makefile
deleted file mode 100644
index 866f60e78882..000000000000
--- a/scripts/selinux/genheaders/Makefile
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-hostprogs-always-y += genheaders
-HOST_EXTRACFLAGS += -I$(srctree)/security/selinux/include
diff --git a/security/selinux/.gitignore b/security/selinux/.gitignore
index 168fae13ca5a..01c0df8ab009 100644
--- a/security/selinux/.gitignore
+++ b/security/selinux/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 av_permissions.h
 flask.h
+/genheaders
diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index c47519ed8156..86f0575f670d 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -36,7 +36,10 @@ quiet_cmd_genhdrs = GEN     $(addprefix $(obj)/,$(genhdrs))
 # see the note above, replace the $targets and 'flask.h' rule with the lines
 # below:
 #  targets += $(genhdrs)
-#  $(addprefix $(obj)/,$(genhdrs)) &: scripts/selinux/...
+#  $(addprefix $(obj)/,$(genhdrs)) &: $(obj)/genheaders FORCE
 targets += flask.h
-$(obj)/flask.h: scripts/selinux/genheaders/genheaders FORCE
+$(obj)/flask.h: $(obj)/genheaders FORCE
 	$(call if_changed,genhdrs)
+
+hostprogs := genheaders
+HOST_EXTRACFLAGS += -I$(srctree)/security/selinux/include
diff --git a/scripts/selinux/genheaders/genheaders.c b/security/selinux/genheaders.c
similarity index 100%
rename from scripts/selinux/genheaders/genheaders.c
rename to security/selinux/genheaders.c
-- 
2.43.0


