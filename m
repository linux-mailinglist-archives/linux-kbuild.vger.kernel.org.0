Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A1D93824F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 09:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235059AbhEQHFO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 May 2021 03:05:14 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:58558 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233807AbhEQHFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 May 2021 03:05:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14H73Glu004781;
        Mon, 17 May 2021 16:03:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14H73Glu004781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621234998;
        bh=KkBtZ2ThpHxQa1Zo4oQSeExXwHeyQJ25PzlkNb0k0J8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ai6eux/8otYqnJYHE1UIGsCRn06QiBgxXdzrlC0HQtfQgkym0BFbBc4z/c0hni1dE
         eI6unsuG31R5uwdz6eLw/S/3iH7mCZU5l96FpEjiaJ8g+yZt5NYSZwDLUHrzsHmqqc
         J/+jpHe6ERL8UJdK891yhQtmSZRAo2e1IHZWNo7RbHh53EM3lRfupnwoVVwpQvgSi+
         LQuvwOgyhOJvYkHB5NRUMwkLJf16NZ+tSYj7f0wNTIe3/1Ztx2KAt3Ibm0ToSL3qJr
         JfIEYVt2O6A6ngMvLBm0XwAEY2x0+/8+j8HNdmN6RgbjESydpGJCbWoRU6NBgtep/2
         2nK4TzeHE7i5g==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] kbuild: sink stdout from cmd for silent build
Date:   Mon, 17 May 2021 16:03:13 +0900
Message-Id: <20210517070314.1428091-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210517070314.1428091-1-masahiroy@kernel.org>
References: <20210517070314.1428091-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building with 'make -s', no output to stdout should be printed.

As Arnd Bergmann reported [1], mkimage shows the detailed information
of the generated images.

I think this should be done by the 'cmd' macro instead of by individual
scripts.

Insert 'exec >/dev/null;' in order to redirect stdout to /dev/null for
silent builds.

[Note about this implementation]

'exec >/dev/null;' may look somewhat tricky, but this has a reason.

At first, I tried this:

  cmd = @set -e; $(echo-cmd) $(cmd_$(1)) >/dev/null

Appending '>/dev/null' is a commonly used way for redirection, but it
would not work if $(cmd_$(1)) itself contains a redirection.

For example, cmd_wrap in scripts/Makefile.asm-generic redirects the
output from the 'echo' command into the target file.

'$(cmd_$(1)) >/dev/null' would be expanded into:

  echo "#include <asm-generic/$*.h>" > $@ >/dev/null

Then, the target file gets empty because the string will go to /dev/null
instead of $@.

Next, I tried this:

  cmd = @set -e; $(echo-cmd) { $(cmd_$(1)); } >/dev/null

The form above would be expanded into:

  { echo "#include <asm-generic/$*.h>" > $@; } >/dev/null

This works as expected. However, it would be a syntax error if
$(cmd_$(1)) is empty.

When CONFIG_TRIM_UNUSED_KSYMS is disabled, $(call cmd,gen_ksymdeps) in
scripts/Makefile.build would be expanded into:

  set -e;  { ; } >/dev/null

..., which causes an syntax error.

The following does not work for the same reason.

  cmd = @set -e; $(echo-cmd) ( $(cmd_$(1)) ) >/dev/null

So, finally I adopted:

  cmd = @set -e; $(echo-cmd) exec >/dev/null; $(cmd_$(1))

[1]: https://lore.kernel.org/lkml/20210514135752.2910387-1-arnd@kernel.org/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kbuild.include | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 82dd1b65b7a8..f247e691562d 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -90,8 +90,13 @@ clean := -f $(srctree)/scripts/Makefile.clean obj
 echo-cmd = $(if $($(quiet)cmd_$(1)),\
 	echo '  $(call escsq,$($(quiet)cmd_$(1)))$(echo-why)';)
 
+# sink stdout for 'make -s'
+       redirect :=
+ quiet_redirect :=
+silent_redirect := exec >/dev/null;
+
 # printing commands
-cmd = @set -e; $(echo-cmd) $(cmd_$(1))
+cmd = @set -e; $(echo-cmd) $($(quiet)redirect) $(cmd_$(1))
 
 ###
 # if_changed      - execute command if any prerequisite is newer than
-- 
2.27.0

