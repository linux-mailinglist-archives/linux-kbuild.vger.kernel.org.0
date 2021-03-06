Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4A332F780
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Mar 2021 02:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhCFB26 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 20:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35901 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229576AbhCFB23 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 20:28:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614994108;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gGrmW3qBYljGIHORMy0R3bDiZuJrAvp+VicZLWP+YBc=;
        b=fkSdOmvRmtW3Mc1HdAxYLECHyn8ObKyt2Lmm9/6Z1nFHNPp3EVa0cvYQfTr/1laOwwv7vx
        Aqn/VY4txtBCzDVX9bIMK4b7AiTl0tj8oKeg5/V0ZvWf4LO4bGZ5nS71I5VUqspChVkLG4
        FeEeSnGKpSdpBvrWPB59W/Zv2waZIDI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-9iJbQ8mVN06l5E2BQ72lFw-1; Fri, 05 Mar 2021 20:28:26 -0500
X-MC-Unique: 9iJbQ8mVN06l5E2BQ72lFw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFF65107465E;
        Sat,  6 Mar 2021 01:28:24 +0000 (UTC)
Received: from treble (ovpn-112-85.rdu2.redhat.com [10.10.112.85])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A59D21412A;
        Sat,  6 Mar 2021 01:28:18 +0000 (UTC)
Date:   Fri, 5 Mar 2021 19:28:15 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Eigler <fche@redhat.com>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH] kbuild: rebuild GCC plugins when the compiler is upgraded
Message-ID: <20210306012815.nfmquoln65vq6yq7@treble>
References: <20210304113708.215121-1-masahiroy@kernel.org>
 <202103041518.22EB819E@keescook>
 <CAHk-=wj6t2i1BgmWP1Zb2WVF3zZzkHvsxsALJk7VpfKm6UgLcw@mail.gmail.com>
 <20210305022500.cyi3cfwgt2t6mona@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210305022500.cyi3cfwgt2t6mona@treble>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 04, 2021 at 08:25:00PM -0600, Josh Poimboeuf wrote:
> On Thu, Mar 04, 2021 at 03:37:14PM -0800, Linus Torvalds wrote:
> > On Thu, Mar 4, 2021 at 3:20 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > This seems fine to me, but I want to make sure Josh has somewhere to
> > > actually go with this. Josh, does this get you any closer?
> 
> No, this doesn't seem to help me at all.
> 
> > > It sounds like the plugins need to move to another location for
> > > packaged kernels?
> > 
> > Well, it might be worth extending the stuff that gets installed with
> > /lib/modules/<kernel-version>/ with enough information and
> > infrastruvcture to then build any external modules.
> 
> The gcc plugins live in scripts/, which get installed by "make
> modules_install" already.  So the plugins' source and makefiles are in
> /lib/modules/<kernel-version>/build/scripts/gcc-plugins.
> 
> So everything needed for building the plugins is already there.  We just
> need the kernel makefiles to rebuild the plugins locally, when building
> an external module.

This seems to work with very limited testing...  Based on top of
Masahiro's recent patch:

  https://lkml.kernel.org/r/CAK7LNARHoTnZ3gAvHgnYB4n-wYuboxC10A6zURh1ODGhxWd2yA@mail.gmail.com

From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [PATCH] gcc-plugins: Rebuild plugins in external module directory

When building external kernel modules, the build system doesn't require
the GCC version to match the version used to build the original kernel.

In fact, most distros release the compiler and the kernel in separate
packages, with separate release cadences.  So it's not uncommon for
mismatches to occur.

But with GCC plugins enabled, that's no longer allowed:

  cc1: error: incompatible gcc/plugin versions
  cc1: error: failed to initialize plugin ./scripts/gcc-plugins/structleak_plugin.so

That error comes from the plugin's call to
plugin_default_version_check(), which strictly enforces the GCC version.
The strict check makes sense, because there's nothing to prevent the GCC
plugin ABI from changing, and it often does.

Since plugins are tightly tied to the compiler version, just rebuild
them locally in the external module directory, and then use the local
version in the external module build.

Reported-by: Ondrej Mosnacek <omosnace@redhat.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
 Makefile                     | 1 +
 scripts/Makefile.gcc-plugins | 2 +-
 scripts/gcc-plugins/Makefile | 8 ++++++--
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index bc208886fcce..90c6656de224 100644
--- a/Makefile
+++ b/Makefile
@@ -1784,6 +1784,7 @@ prepare:
 		echo "  The kernel was built by: "$(CONFIG_CC_VERSION_TEXT); \
 		echo "  You are using:           $(CC_VERSION_TEXT)"; \
 	fi
+	$(Q)$(MAKE) $(build)=scripts/gcc-plugins
 
 PHONY += help
 help:
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 952e46876329..be4303678942 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -48,7 +48,7 @@ export DISABLE_ARM_SSP_PER_TASK_PLUGIN
 
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
-GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
+GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD),$(objtree))/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
 # The sancov_plugin.so is included via CFLAGS_KCOV, so it is removed here.
 GCC_PLUGINS_CFLAGS := $(filter-out %/sancov_plugin.so, $(GCC_PLUGINS_CFLAGS))
 export GCC_PLUGINS_CFLAGS
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index b5487cce69e8..9f8e2ef3ab56 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -1,10 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
-$(obj)/randomize_layout_plugin.so: $(objtree)/$(obj)/randomize_layout_seed.h
+ifneq ($(KBUILD_EXTMOD),)
+override obj := $(KBUILD_EXTMOD)/$(obj)
+endif
+
+$(obj)/randomize_layout_plugin.so: $(objtree)/$(src)/randomize_layout_seed.h
 quiet_cmd_create_randomize_layout_seed = GENSEED $@
 cmd_create_randomize_layout_seed = \
   $(CONFIG_SHELL) $(srctree)/$(src)/gen-random-seed.sh $@ $(objtree)/include/generated/randomize_layout_hash.h
-$(objtree)/$(obj)/randomize_layout_seed.h: FORCE
+$(objtree)/$(src)/randomize_layout_seed.h: FORCE
 	$(call if_changed,create_randomize_layout_seed)
 targets += randomize_layout_seed.h randomize_layout_hash.h
 
-- 
2.29.2

