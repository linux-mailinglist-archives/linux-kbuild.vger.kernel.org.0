Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3BE71890DC
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 22:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727141AbgCQVze (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Mar 2020 17:55:34 -0400
Received: from mail-pg1-f202.google.com ([209.85.215.202]:42044 "EHLO
        mail-pg1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727140AbgCQVze (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Mar 2020 17:55:34 -0400
Received: by mail-pg1-f202.google.com with SMTP id m29so15533264pgd.9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2020 14:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=WT+AG0Sk/ZjsbVAj6df3wOLFgqAmNIj4Zm/1cV4P1Vo=;
        b=f/XQqAF7rikS+kq72JE96CoyURVBBkA9s+VD784GcFuscAQMEqT8BZsDvwgn2K72z+
         70QiXn9KQ4vrw+pm00jqwgc5PY2bzKMS79F7+Vr/r7QXpYNYlaQdXdu4MSn52eIlFuiv
         tAra9AVXCtfla+Q3fOoOE398G9fl6X9D6pBOrxoyVs2RpASinrNAPptpnFDU0yHqD8bX
         7hjwr5PQzajDODElLYdAxENT2Ei+qL0rYOQrBLqjLknkIyPVCIVCCCQ6jLK9ofrG5sdn
         DmcVPFHpRGVQwzUT6rFeW86Le6CHm32yNUjyl0/pxOzRhTV5wfsNJxCm8nY4IYhMX+O4
         GuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=WT+AG0Sk/ZjsbVAj6df3wOLFgqAmNIj4Zm/1cV4P1Vo=;
        b=hBcE3wdL+68OTmkLsexkA6O40eQY/0ayfjcS9aBNV7pCb1uUoovBkD5nLn9PdOI2lD
         qvp7D2ZHC9e4b2zxdcURzD1GjcYHSJf9mWdavFu3JzpZbk/siVRrXXUB/phnkQQTeE/L
         mNM21p+qWgozxV/bsJCLWBugGmaGpvoXUJYsIRmf4H0IOmdY2p07mYzzYiFUyC+9QdAh
         ZBJ2CT4tRd6KuSroHeeIIi4qlt4cCjScZZixPV2BFxpneAZOHnoeofGldUz1Y88QLclP
         VJOKOuviikNanIUtuSagLIKtmI+N47apx+eOYBk0YKb2J4YKCVtE1uMUvoOt2oBTmKL5
         PwBQ==
X-Gm-Message-State: ANhLgQ1OAcjwnMSfZliZVoqB81Pi5kaXEqOAHXoR3TQG7dSg/7Ds8BBo
        BZOFlYFeUv/yElG48vE9PHXFE7FHk43ysjMTS60=
X-Google-Smtp-Source: ADFU+vuS0xWonKi4Fp4I1Q3iMtryayPwyc0mg4labRC0loGqDWERH8FWGZK3rp+BQl1e2GOre8x2IEv+J54qqrZK0/A=
X-Received: by 2002:a17:90a:a511:: with SMTP id a17mr1330073pjq.178.1584482133186;
 Tue, 17 Mar 2020 14:55:33 -0700 (PDT)
Date:   Tue, 17 Mar 2020 14:55:15 -0700
In-Reply-To: <20200317202404.GA20746@ubuntu-m2-xlarge-x86>
Message-Id: <20200317215515.226917-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH v2] Makefile.llvm: simplify LLVM build
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     masahiroy@kernel.org, natechancellor@gmail.com
Cc:     clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Prior to this patch, building the Linux kernel with Clang
looked like:

$ make CC=clang

or when cross compiling:

$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang

which got very verbose and unwieldy when using all of LLVM's substitutes
for GNU binutils:

$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make CC=clang AS=clang \
  LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-objsize \
  READELF=llvm-readelf HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar \
  HOSTLD=ld.lld

This change adds a new Makefile under scripts/ which will be included in
the top level Makefile AFTER CC and friends are set, in order to make
the use of LLVM utilities when building a Linux kernel more ergonomic.

With this patch, the above now looks like:

$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=y

Then you can "opt out" of certain LLVM utilities explicitly:

$ ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- make LLVM=y AS=as

will instead invoke arm-linux-gnueabihf-as in place of clang for AS.

Or when not cross compiling:

$ make LLVM=y AS=as

This would make it more verbose to opt into just one tool from LLVM, but
this patch doesn't actually break the old style; just leave off LLVM=y.
Also, LLVM=y CC=clang would wind up prefixing clang with $CROSS_COMPILE.
In that case, it's recommended to just drop LLVM=y and use the old
style. So LLVM=y can be thought of as default to LLVM with explicit opt
ins for GNU, vs the current case of default to GNU and opt in for LLVM.

A key part of the design of this patch is to be minimally invasive to
the top level Makefile and not break existing workflows. We could get
more aggressive, but I'd prefer to save larger refactorings for another
day.

Finally, some linux distributions package specific versions of LLVM
utilities with naming conventions that use the version as a suffix, ie.
clang-11.  In that case, you can use LLVM=<number> and that number will
be used as a suffix. Example:

$ make LLVM=11

will invoke clang-11, ld.lld-11, llvm-objcopy-11, etc.

About the script:
The pattern used in the script is in the form:

ifeq "$(origin $(CC))" "file"
$(CC) := $(clang)
else
override $(CC) := $(CROSS_COMPILE)$(CC)
endif

"Metaprogramming" (eval) is used to template the above to make it more
concise for specifying all of the substitutions.

The "origin" of a variable tracks whether a variable was explicitly set
via "command line", "environment", was defined earlier via Makefile
"file", was provided by "default", or was "undefined".

Variable assignment in GNU Make has some special and complicated rules.

If the variable was set earlier explicitly in the Makefile, we can
simply reassign a new value to it. If a variable was unspecified, then
earlier assignments were executed and change the origin to file.
Otherwise, the variable was explicitly specified.

If a variable's "origin" was "command line" or "environment",
non-"override" assignments are not executed. The "override" directive
forces the assignment regardless of "origin".

Some tips I found useful for debugging for future travelers:

$(info $$origin of $$CC is $(origin CC))

at the start of the new script for all of the variables can help you
understand "default" vs "undefined" variable origins.

$(info $$CC is [${CC}])

in the top level Makefile after including the new script, for all of the
variables can help you check that they're being set as expected.

Link: https://www.gnu.org/software/make/manual/html_node/Eval-Function.html
Link: https://www.gnu.org/software/make/manual/html_node/Origin-Function.html
Link: https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
Link: https://www.gnu.org/software/make/manual/html_node/Override-Directive.html
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
Changes V1 -> V2:
* Rather than LLVM=1, use LLVM=y to enable all.
* LLVM=<anything other than y> becomes a suffix, LLVM_SUFFIX.
* strip has to be used on the LLVM_SUFFIX to avoid an extra whitespace.


 Makefile              |  4 ++++
 scripts/Makefile.llvm | 30 ++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 scripts/Makefile.llvm

diff --git a/Makefile b/Makefile
index 402f276da062..72ec9dfea15e 100644
--- a/Makefile
+++ b/Makefile
@@ -475,6 +475,10 @@ KBUILD_LDFLAGS :=
 GCC_PLUGINS_CFLAGS :=
 CLANG_FLAGS :=
 
+ifneq ($(LLVM),)
+include scripts/Makefile.llvm
+endif
+
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
diff --git a/scripts/Makefile.llvm b/scripts/Makefile.llvm
new file mode 100644
index 000000000000..0bab45a100a3
--- /dev/null
+++ b/scripts/Makefile.llvm
@@ -0,0 +1,30 @@
+LLVM_SUFFIX=
+
+ifneq ($(LLVM),y)
+LLVM_SUFFIX += -$(LLVM)
+endif
+
+define META_set =
+ifeq "$(origin $(1))" "file"
+$(1) := $(2)$(strip $(LLVM_SUFFIX))
+else
+override $(1) := $(CROSS_COMPILE)$($(1))
+endif
+endef
+
+$(eval $(call META_set,CC,clang))
+$(eval $(call META_set,AS,clang))
+$(eval $(call META_set,LD,ld.lld))
+$(eval $(call META_set,AR,llvm-ar))
+$(eval $(call META_set,NM,llvm-nm))
+$(eval $(call META_set,STRIP,llvm-strip))
+$(eval $(call META_set,OBJCOPY,llvm-objcopy))
+$(eval $(call META_set,OBJDUMP,llvm-objdump))
+$(eval $(call META_set,OBJSIZE,llvm-objsize))
+$(eval $(call META_set,READELF,llvm-readelf))
+$(eval $(call META_set,HOSTCC,clang))
+$(eval $(call META_set,HOSTCXX,clang++))
+$(eval $(call META_set,HOSTAR,llvm-ar))
+$(eval $(call META_set,HOSTLD,ld.lld))
+
+## TODO: HOSTAR, HOSTLD in tools/objtool/Makefile
-- 
2.25.1.481.gfbce0eb801-goog

