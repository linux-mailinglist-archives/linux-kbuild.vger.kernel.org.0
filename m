Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 511EC51D37
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2019 23:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727540AbfFXVke (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Jun 2019 17:40:34 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:42240 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728303AbfFXVkd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Jun 2019 17:40:33 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 2D19D803EB;
        Mon, 24 Jun 2019 23:40:28 +0200 (CEST)
Date:   Mon, 24 Jun 2019 23:40:27 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] kbuild: compile-test global headers to ensure they are
 self-contained
Message-ID: <20190624214027.GA14740@ravnborg.org>
References: <20190621163931.19397-1-yamada.masahiro@socionext.com>
 <20190621175134.GB16409@ravnborg.org>
 <CAK7LNATz1iuG0Moab60gMSbVU8PJAmrLn27K8HK_1zQ0qeh26w@mail.gmail.com>
 <20190622130635.GA24262@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190622130635.GA24262@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=3u5kl7jyWrYC5LYJQXIA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro
> > ...
> On this level it would be better to do:
> header-test-y += $(call find_all_header_files)
> 
> # drm files that are not self-contained
> header-test-n += drm_legacy.h

I made a quick hack on top of your patch to demonstrate
the ideas.
See patch below.

When all header files below include/drm are self-contained it will be a
single line:

    header-test-y += $(all_headers_with_subdir)

But for now I skipped the subdirs as they was not in too good shape.

My gmake foo escapted me tonight, so $(call all_headers_with_subdir)
did not really do what I wanted. Which is why I use the macro direct.
The main part is that we have support in the generic part to find the
header files and to filter out header files we do not want to check.

Later we may extend the checking to something more than that they
can build. We could check for CONFIG_ symbols in uapi/ and more.

Another note. Maybe we should name the files Kbuild, as this is what we
usually do in include/*

But I also sometimes regret that I introduced this second name.
Back then the idea was to globally rename Makefile => Kbuild.
But I never advocated this, as the pain was much bigger than the gain.
Another thing to be cleaned up one day maybe...

	Sam


diff --git a/include/Makefile b/include/Makefile
index 68a76ac732c3..09e854d504f6 100644
--- a/include/Makefile
+++ b/include/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
+subdir-y += drm
+
 # extend the test coverage when existing errors are fixed
 
 header-test += linux/w*.h
diff --git a/include/drm/Makefile b/include/drm/Makefile
new file mode 100644
index 000000000000..61a762964ef0
--- /dev/null
+++ b/include/drm/Makefile
@@ -0,0 +1,21 @@
+# Verify all header files
+
+header-test-y += $(all_headers)
+
+# Blacklist header files that do not yet pass the test
+# Keep list sorted
+header-test-n += ati_pcigart.h
+header-test-n += drm_audio_component.h
+header-test-n += drm_auth.h
+header-test-n += drm_debugfs.h
+header-test-n += drm_debugfs_crc.h
+header-test-n += drm_displayid.h
+header-test-n += drm_fb_cma_helper.h
+header-test-n += drm_fixed.h
+header-test-n += drm_format_helper.h
+header-test-n += drm_lease.h
+header-test-n += drm_legacy.h
+header-test-n += drm_plane_helper.h
+header-test-n += drm_rect.h
+header-test-n += i915_component.h
+header-test-n += intel-gtt.h
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0ae07e83d393..df29c65c6490 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -66,6 +66,20 @@ define filechk
 	fi
 endef
 
+######
+# Support functions for header-test
+define all_headers
+	$(patsubst $(srctree)/$(src)/%,%,	\
+	$(wildcard $(srctree)/$(src)/*.h))
+endef
+
+define all_headers_with_subdir
+	$(patsubst $(srctree)/$(src)/%,%,	\
+	$(shell find $(srctree)/$(src)/ '*.h'))
+endef
+
+
+
 ######
 # gcc support functions
 # See documentation in Documentation/kbuild/makefiles.txt
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 3e630fcaffd1..e2f765e9d1e1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -67,6 +67,7 @@ extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
 endif
 
 # Test self-contained headers
+header-test-y := $(filter-out $(header-test-n), $(header-test-y))
 extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.hdrtest.o,$(header-test-y))
 
 # Add subdir path
