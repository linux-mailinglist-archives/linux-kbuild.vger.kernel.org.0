Return-Path: <linux-kbuild+bounces-365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F141813265
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Dec 2023 15:03:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 915B31C20E7E
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Dec 2023 14:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122C757866;
	Thu, 14 Dec 2023 14:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSGR75HF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9455579A
	for <linux-kbuild@vger.kernel.org>; Thu, 14 Dec 2023 14:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48648C433C8;
	Thu, 14 Dec 2023 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702562597;
	bh=TmBlvdhMtwd+CkVq89ydLq0CdC3DZHSb/94YMt+8cx8=;
	h=From:To:Cc:Subject:Date:From;
	b=FSGR75HF8Uib5Aw6ixmy6n88N7GAR4E0yWRjocRCwxIpVzJaSaIQUU24OgU7gXugw
	 DYdvOUH8LXwIfLoBZTvuj8yTMzr1M3jaLmRBDv3L79Znt910VQSZKYxMOaFvde9ztA
	 MFRAUbzY2VQNgIOjQqe/jAoSuu9JR+Ls4tNhQihAUcZDxFjgp50X7bAjObi+HpbpF+
	 PHDPksngqGzcZj/Qkd7Zd0+9NKqSqvsXuyLA0Pwmr5Ch9zHdRt8PAcPhh+F4um32eZ
	 wq1TNJHTpfOOpCpQsSWDH2bWg+l7x4Hl7O6Ws6kjjC0E4zCRRraKkWYNlDMl95r3g4
	 DwAjT8rMNmKJg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: resolve symlinks for O= properly
Date: Thu, 14 Dec 2023 23:03:05 +0900
Message-Id: <20231214140305.531963-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Kbuild follows the logical chain of directories for the O=
option, just like 'cd' (or 'realpath --logical') does.

Example:

    $ mkdir -p /tmp/a /tmp/x/y
    $ ln -s /tmp/x/y /tmp/a/b
    $ realpath /tmp/a/b/..
    /tmp/x
    $ realpath --logical /tmp/a/b/..
    /tmp/a
    $ make O=/tmp/a/b/.. defconfig
    make[1]: Entering directory '/tmp/a'
      [snip]
    make[1]: Leaving directory '/tmp/a'

'make O=/tmp/a/b/.. defconfig' creates the kernel configuration in
/tmp/a instead of /tmp/x despite the directory path /tmp/a/b/..
resolves to the physical directory path /tmp/x.

This is because Kbuild internally uses the 'cd ... && pwd' for the
path resolution, but this behavior is not predictable for users.
Additionally, it is not consistent with how the Kbuild handles the
M= option or GNU Make works with 'make -C /tmp/a/b/..'.

Using the physical directory structure for the O= option seems more
reasonable.

The comment says "expand a shell special character '~'", but it has
already been expanded to the home directory in the command line.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 24fac1889997..a05f0f7c99e0 100644
--- a/Makefile
+++ b/Makefile
@@ -190,14 +190,11 @@ ifeq ("$(origin O)", "command line")
 endif
 
 ifneq ($(KBUILD_OUTPUT),)
-# Make's built-in functions such as $(abspath ...), $(realpath ...) cannot
-# expand a shell special character '~'. We use a somewhat tedious way here.
-abs_objtree := $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTPUT) && pwd)
-$(if $(abs_objtree),, \
-     $(error failed to create output directory "$(KBUILD_OUTPUT)"))
-
+# $(realpath ...) gets empty if the path does not exist. Run 'mkdir -p' first.
+$(shell mkdir -p $(KBUILD_OUTPUT))
 # $(realpath ...) resolves symlinks
-abs_objtree := $(realpath $(abs_objtree))
+abs_objtree := $(realpath $(KBUILD_OUTPUT))
+$(if $(abs_objtree),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
 endif # ifneq ($(KBUILD_OUTPUT),)
 
 ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
-- 
2.40.1


