Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE4BB63B28
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 20:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbfGISdd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 14:33:33 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56922 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727028AbfGISdc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 14:33:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=qL1PUIutTCWm1ivCAA3q0FMmE40tG1yB/zEsCGGUJ90=; b=miMziCpf006nbr+EWTsLqTpUu0
        AhOcle6IWEJa3N6PXIrIQ7/iK67+wEP1LEAjg9ym9h6GTDl/Rj58fJlh96wMwNseVJi65JWYuKeuK
        KkpnYQu6fcwmFxzJKdXTNwqtsc0V0Eal2kL5nG2xuhoVZwi2gIpnmWzkWmaJ531FGEvwoJpKFM83B
        NDAwC0h0JQFdjHHe0KlAInr0ySqcPys4bQrQcY18sRbSZF94rZJDU81YtYI6wP3FUmBaI84+8OFkN
        quv6Qo7h1fpgyZMPzc85MMkWyEp2Je21RCXK17t1JXCkXE98wZLNO3shMHZdOw4Oh6CCQtRlQ14qZ
        p1/jNMfw==;
Received: from 177.43.30.58.dynamic.adsl.gvt.net.br ([177.43.30.58] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hkuvf-0007Aw-CB; Tue, 09 Jul 2019 18:33:27 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hkuvd-0005Px-6v; Tue, 09 Jul 2019 15:33:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 4/5] docs: kbuild: fix build with pdf and fix some minor issues
Date:   Tue,  9 Jul 2019 15:33:22 -0300
Message-Id: <d6225df255db3bb0c61ddac8d098f151604b3c63.1562696797.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1562696797.git.mchehab+samsung@kernel.org>
References: <cover.1562696797.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The tag ".. include" should be replaced by ".. literalinclude" at
issues.rst, otherwise it causes TeX to crash due to excessive usage
of stack with Sphinx 2.0.

While here, solve a few minor issues at the kbuild book output by
adding extra blank lines.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/kbuild/issues.rst           | 20 ++++++++++++--------
 Documentation/kbuild/kbuild.rst           |  3 ++-
 Documentation/kbuild/kconfig-language.rst | 12 ++++++++++++
 Documentation/kbuild/kconfig.rst          |  8 ++++++--
 Documentation/kbuild/makefiles.rst        |  1 +
 5 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/Documentation/kbuild/issues.rst b/Documentation/kbuild/issues.rst
index 9fdded4b681c..bdab01f733f6 100644
--- a/Documentation/kbuild/issues.rst
+++ b/Documentation/kbuild/issues.rst
@@ -1,11 +1,15 @@
-Recursion issue #1
-------------------
+================
+Recursion issues
+================
 
- .. include:: Kconfig.recursion-issue-01
-    :literal:
+issue #1
+--------
 
-Recursion issue #2
-------------------
+.. literalinclude:: Kconfig.recursion-issue-01
+   :language: kconfig
 
- .. include:: Kconfig.recursion-issue-02
-    :literal:
+issue #2
+--------
+
+.. literalinclude:: Kconfig.recursion-issue-02
+   :language: kconfig
diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index e774e760522d..bc3915ca38d1 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -18,7 +18,7 @@ This file lists all modules that are built into the kernel. This is used
 by modprobe to not fail when trying to load something builtin.
 
 modules.builtin.modinfo
---------------------------------------------------
+-----------------------
 This file contains modinfo from all modules that are built into the kernel.
 Unlike modinfo of a separate module, all fields are prefixed with module name.
 
@@ -153,6 +153,7 @@ Install script called when using "make install".
 The default name is "installkernel".
 
 The script will be called with the following arguments:
+
    - $1 - kernel version
    - $2 - kernel image file
    - $3 - kernel map file
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 2bc8a7803365..74bef19f69f0 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -53,6 +53,7 @@ A menu entry can have a number of attributes. Not all of them are
 applicable everywhere (see syntax).
 
 - type definition: "bool"/"tristate"/"string"/"hex"/"int"
+
   Every config option must have a type. There are only two basic types:
   tristate and string; the other types are based on these two. The type
   definition optionally accepts an input prompt, so these two examples
@@ -66,11 +67,13 @@ applicable everywhere (see syntax).
 	prompt "Networking support"
 
 - input prompt: "prompt" <prompt> ["if" <expr>]
+
   Every menu entry can have at most one prompt, which is used to display
   to the user. Optionally dependencies only for this prompt can be added
   with "if".
 
 - default value: "default" <expr> ["if" <expr>]
+
   A config option can have any number of default values. If multiple
   default values are visible, only the first defined one is active.
   Default values are not limited to the menu entry where they are
@@ -112,6 +115,7 @@ applicable everywhere (see syntax).
   Optionally dependencies for this default value can be added with "if".
 
 - dependencies: "depends on" <expr>
+
   This defines a dependency for this menu entry. If multiple
   dependencies are defined, they are connected with '&&'. Dependencies
   are applied to all other options within this menu entry (which also
@@ -127,6 +131,7 @@ applicable everywhere (see syntax).
 	default y
 
 - reverse dependencies: "select" <symbol> ["if" <expr>]
+
   While normal dependencies reduce the upper limit of a symbol (see
   below), reverse dependencies can be used to force a lower limit of
   another symbol. The value of the current menu symbol is used as the
@@ -146,6 +151,7 @@ applicable everywhere (see syntax).
 	the illegal configurations all over.
 
 - weak reverse dependencies: "imply" <symbol> ["if" <expr>]
+
   This is similar to "select" as it enforces a lower limit on another
   symbol except that the "implied" symbol's value may still be set to n
   from a direct dependency or with a visible prompt.
@@ -176,6 +182,7 @@ applicable everywhere (see syntax).
   configure that subsystem out without also having to unset these drivers.
 
 - limiting menu display: "visible if" <expr>
+
   This attribute is only applicable to menu blocks, if the condition is
   false, the menu block is not displayed to the user (the symbols
   contained there can still be selected by other symbols, though). It is
@@ -183,12 +190,14 @@ applicable everywhere (see syntax).
   entries. Default value of "visible" is true.
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
+
   This allows to limit the range of possible input values for int
   and hex symbols. The user can only input a value which is larger than
   or equal to the first symbol and smaller than or equal to the second
   symbol.
 
 - help text: "help" or "---help---"
+
   This defines a help text. The end of the help text is determined by
   the indentation level, this means it ends at the first line which has
   a smaller indentation than the first line of the help text.
@@ -197,6 +206,7 @@ applicable everywhere (see syntax).
   the file as an aid to developers.
 
 - misc options: "option" <symbol>[=<value>]
+
   Various less common options can be defined via this option syntax,
   which can modify the behaviour of the menu entry and its config
   symbol. These options are currently possible:
@@ -325,6 +335,7 @@ end a menu entry:
 The first five also start the definition of a menu entry.
 
 config::
+
 	"config" <symbol>
 	<config options>
 
@@ -332,6 +343,7 @@ This defines a config symbol <symbol> and accepts any of above
 attributes as options.
 
 menuconfig::
+
 	"menuconfig" <symbol>
 	<config options>
 
diff --git a/Documentation/kbuild/kconfig.rst b/Documentation/kbuild/kconfig.rst
index 88129af7e539..a9a855f894b3 100644
--- a/Documentation/kbuild/kconfig.rst
+++ b/Documentation/kbuild/kconfig.rst
@@ -264,6 +264,7 @@ NCONFIG_MODE
 This mode shows all sub-menus in one large tree.
 
 Example::
+
 	make NCONFIG_MODE=single_menu nconfig
 
 ----------------------------------------------------------------------
@@ -277,9 +278,12 @@ Searching in xconfig:
 	names, so you have to know something close to what you are
 	looking for.
 
-	Example:
+	Example::
+
 		Ctrl-F hotplug
-	or
+
+	or::
+
 		Menu: File, Search, hotplug
 
 	lists all config symbol entries that contain "hotplug" in
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 093f2d79ab95..f31158457753 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -384,6 +384,7 @@ more details, with real examples.
 -----------------------
 
 	Kbuild tracks dependencies on the following:
+
 	1) All prerequisite files (both `*.c` and `*.h`)
 	2) `CONFIG_` options used in all prerequisite files
 	3) Command-line used to compile target
-- 
2.21.0

