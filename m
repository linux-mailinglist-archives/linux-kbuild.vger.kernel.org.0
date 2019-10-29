Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1BEE8860
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Oct 2019 13:39:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732895AbfJ2MjJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 08:39:09 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:34529 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731583AbfJ2MjI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 08:39:08 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x9TCcFU8026616;
        Tue, 29 Oct 2019 21:38:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x9TCcFU8026616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572352701;
        bh=z/tV1UVFmLOh9LhEg5n7pGMfQ61W9oGUm9h6rNaYBKY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IF6A2H6/659VDSshC51rM8eOxVwdf2Vq7bpkxUuGg9sky0oSfaGheBOHrJBCiZqId
         sQfatTY7oXNjFOfk89m6ybFLdM2RpDSMQYBTUgBGuCClMWfxPe+66QCy4KfaRDd0/C
         yMtdbMRElyCd8BFEh1WVLHsJQtV3xaWYeMItKGLRxIl375jvusaLN+YQsqfi7kBsvV
         Ppc9xa/KFVl4ygOm+N9/RiKzv+ChJR+z3g1+N5bVO4vKrOY6ws9IPRCpADS9W0jdiK
         al/EGogQTKc83NqQIZqarz5piWxLU87ATvRPpGYVer/EnHYncReYibZ0QLPgcl+T/I
         rPi+YR6Tx+IDg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jessica Yu <jeyu@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthias Maennich <maennich@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] scripts/nsdeps: support nsdeps for external module builds
Date:   Tue, 29 Oct 2019 21:38:08 +0900
Message-Id: <20191029123809.29301-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029123809.29301-1-yamada.masahiro@socionext.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Apparently, scripts/nsdeps is written to take care of only in-tree
modules. Perhaps, this is not a bug, but just a design. At least,
Documentation/core-api/symbol-namespaces.rst focuses on in-tree modules:

  Again, `make nsdeps` will eventually add the missing namespace imports for
  in-tree modules::
  ^^^^^^^

Having said that, I already saw at least two people trying nsdeps for
external module builds. So, it would be nice to support it.

Reported-by: Steve French <smfrench@gmail.com>
Reported-by: Jessica Yu <jeyu@kernel.org>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/core-api/symbol-namespaces.rst |  3 +++
 Makefile                                     |  1 +
 scripts/Makefile.modpost                     |  2 +-
 scripts/nsdeps                               | 10 ++++++++--
 4 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 982ed7b568ac..9b76337f6756 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -152,3 +152,6 @@ in-tree modules::
 	- notice the warning of modpost telling about a missing import
 	- run `make nsdeps` to add the import to the correct code location
 
+You can also run nsdeps for external module builds. A typical usage is::
+
+	$ make -C <path_to_kernel_src> M=$PWD nsdeps
diff --git a/Makefile b/Makefile
index 1e3f307bd49b..780a65493866 100644
--- a/Makefile
+++ b/Makefile
@@ -1007,6 +1007,7 @@ endif
 PHONY += prepare0
 
 export MODORDER := $(extmod-prefix)modules.order
+export MODULES_NSDEPS := $(extmod-prefix)modules.nsdeps
 
 ifeq ($(KBUILD_EXTMOD),)
 core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index da37128c3f9f..8359f8af5ee6 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -66,7 +66,7 @@ __modpost:
 else
 
 MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - \
-	$(if $(KBUILD_NSDEPS),-d modules.nsdeps)
+	$(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))
 
 ifeq ($(KBUILD_EXTMOD),)
 MODPOST += $(wildcard vmlinux)
diff --git a/scripts/nsdeps b/scripts/nsdeps
index 08db427a7fe5..3b8a9e173ebf 100644
--- a/scripts/nsdeps
+++ b/scripts/nsdeps
@@ -21,6 +21,12 @@ if [ "$SPATCH_VERSION_NUM" -lt "$SPATCH_REQ_VERSION_NUM" ] ; then
 	exit 1
 fi
 
+if [ "$KBUILD_EXTMOD" ]; then
+	src_prefix=
+else
+	src_prefix=$srctree/
+fi
+
 generate_deps_for_ns() {
 	$SPATCH --very-quiet --in-place --sp-file \
 		$srctree/scripts/coccinelle/misc/add_namespace.cocci -D ns=$1 $2
@@ -32,7 +38,7 @@ generate_deps() {
 	local namespaces="$*"
 	local mod_source_files=`cat $mod.mod | sed -n 1p                      \
 					      | sed -e 's/\.o/\.c/g'           \
-					      | sed "s|[^ ]* *|${srctree}/&|g"`
+					     | sed "s|[^ ]* *|${src_prefix}&|g"`
 	for ns in $namespaces; do
 		echo "Adding namespace $ns to module $mod.ko."
 		generate_deps_for_ns $ns $mod_source_files
@@ -54,4 +60,4 @@ generate_deps() {
 while read line
 do
 	generate_deps $line
-done < modules.nsdeps
+done < $MODULES_NSDEPS
-- 
2.17.1

