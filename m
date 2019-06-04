Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3516834429
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfFDKPv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:15:51 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39514 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727139AbfFDKPu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:50 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC77032511;
        Tue, 4 Jun 2019 19:14:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC77032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643255;
        bh=pUquGiN6xNeDHSibS2E6fCO5H4gfpfVcs2A9RbnL/14=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AblFESWR5OlGEncv08R8Lc2lsYWxIVUQcbeaUgKG0cPSzPHOn0qLs/Ti1OaBxUsqu
         VdmsFA5lxplHPlDHqHnCSWqMPGmItXfMZfK17mHav7GDD0pUwOt0sTRC/I4gAmFYdP
         dDtT+DbuklcVZff3lNDn8os+44DqasROkKb/XGxtdy0LLiGqJLGPEgmBzOoGnq9tkF
         Md4Aqfd92wCJ+zvQzTPiEY3Yk0Au9tRE5z/aqLw8/NkbZ0RtTYbzdvc5Ks95hvl08q
         zTXIYtrtS+6+M5A/pB97Zgnpxd6uO1wEGOyUWut5M5kCjIIdiUKvUBMhiD4ItfkUP9
         K50zQWy9tn69A==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 01/15] kbuild: remove headers_{install,check}_all
Date:   Tue,  4 Jun 2019 19:13:55 +0900
Message-Id: <20190604101409.2078-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

headers_install_all does not make much sense any more because different
architectures export different set of uapi/linux/ headers. As you see
in include/uapi/linux/Kbuild, the installation of a.out.h, kvm.h, and
kvm_para.h is arch-dependent. So, headers_install_all repeats the
installation/removal of them.

If somebody really thinks it is useful to do headers_install for all
architectures, it would be possible by small shell-scripting, but the
top Makefile do not have to provide entry targets just for that purpose.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/headers_install.txt |  7 ------
 Documentation/kbuild/makefiles.txt       |  6 +----
 Makefile                                 | 15 ++----------
 scripts/headers.sh                       | 29 ------------------------
 4 files changed, 3 insertions(+), 54 deletions(-)
 delete mode 100755 scripts/headers.sh

diff --git a/Documentation/kbuild/headers_install.txt b/Documentation/kbuild/headers_install.txt
index f0153adb95e2..f07e34eab70b 100644
--- a/Documentation/kbuild/headers_install.txt
+++ b/Documentation/kbuild/headers_install.txt
@@ -39,12 +39,5 @@ INSTALL_HDR_PATH indicates where to install the headers. It defaults to
 An 'include' directory is automatically created inside INSTALL_HDR_PATH and
 headers are installed in 'INSTALL_HDR_PATH/include'.
 
-The command "make headers_install_all" exports headers for all architectures
-simultaneously.  (This is mostly of interest to distribution maintainers,
-who create an architecture-independent tarball from the resulting include
-directory.)  You also can use HDR_ARCH_LIST to specify list of architectures.
-Remember to provide the appropriate linux/asm directory via "mv" or "ln -s"
-before building a C library with headers exported this way.
-
 The kernel header export infrastructure is maintained by David Woodhouse
 <dwmw2@infradead.org>.
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index d65ad5746f94..bac301a73a86 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -897,11 +897,7 @@ When kbuild executes, the following steps are followed (roughly):
 --- 6.2 Add prerequisites to archheaders:
 
 	The archheaders: rule is used to generate header files that
-	may be installed into user space by "make header_install" or
-	"make headers_install_all".  In order to support
-	"make headers_install_all", this target has to be able to run
-	on an unconfigured tree, or a tree configured for another
-	architecture.
+	may be installed into user space by "make header_install".
 
 	It is run before "make archprepare" when run on the
 	architecture itself.
diff --git a/Makefile b/Makefile
index 004d67a4405f..7745bdd84861 100644
--- a/Makefile
+++ b/Makefile
@@ -1181,34 +1181,23 @@ headerdep:
 #Default location for installed headers
 export INSTALL_HDR_PATH = $(objtree)/usr
 
-# If we do an all arch process set dst to include/arch-$(SRCARCH)
-hdr-dst = $(if $(KBUILD_HEADERS), dst=include/arch-$(SRCARCH), dst=include)
-
 PHONY += archheaders archscripts
 
 PHONY += __headers
 __headers: $(version_h) scripts_basic uapi-asm-generic archheaders archscripts
 	$(Q)$(MAKE) $(build)=scripts build_unifdef
 
-PHONY += headers_install_all
-headers_install_all:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/headers.sh install
-
 PHONY += headers_install
 headers_install: __headers
 	$(if $(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/Kbuild),, \
 	  $(error Headers not exportable for the $(SRCARCH) architecture))
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi $(hdr-dst)
-
-PHONY += headers_check_all
-headers_check_all: headers_install_all
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/headers.sh check
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi dst=include
 
 PHONY += headers_check
 headers_check: headers_install
 	$(Q)$(MAKE) $(hdr-inst)=include/uapi dst=include HDRCHECK=1
-	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi $(hdr-dst) HDRCHECK=1
+	$(Q)$(MAKE) $(hdr-inst)=arch/$(SRCARCH)/include/uapi dst=include HDRCHECK=1
 
 ifdef CONFIG_HEADERS_CHECK
 all: headers_check
diff --git a/scripts/headers.sh b/scripts/headers.sh
deleted file mode 100755
index e0f883eb39a2..000000000000
--- a/scripts/headers.sh
+++ /dev/null
@@ -1,29 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-# Run headers_$1 command for all suitable architectures
-
-# Stop on error
-set -e
-
-do_command()
-{
-	if [ -f ${srctree}/arch/$2/include/asm/Kbuild ]; then
-		make ARCH=$2 KBUILD_HEADERS=$1 headers_$1
-	else
-		printf "Ignoring arch: %s\n" ${arch}
-	fi
-}
-
-archs=${HDR_ARCH_LIST:-$(ls ${srctree}/arch)}
-
-for arch in ${archs}; do
-	case ${arch} in
-	um)        # no userspace export
-		;;
-	*)
-		if [ -d ${srctree}/arch/${arch} ]; then
-			do_command $1 ${arch}
-		fi
-		;;
-	esac
-done
-- 
2.17.1

