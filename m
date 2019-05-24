Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 834B929D53
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 May 2019 19:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390910AbfEXRkS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 May 2019 13:40:18 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:45463 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726381AbfEXRkR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 May 2019 13:40:17 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id C440720023;
        Fri, 24 May 2019 19:40:12 +0200 (CEST)
Date:   Fri, 24 May 2019 19:40:11 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        Chris Wilson <chris@chris-wilson.co.uk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are
 self-contained
Message-ID: <20190524174011.GA23737@ravnborg.org>
References: <20190516194818.29230-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190516194818.29230-1-jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=taGs_qngAAAA:8
        a=c-n4J4-pAAAA:8 a=NZ-89VFvAAAA:8 a=QyXUC8HyAAAA:8 a=p_TaepwW8ewYzqXrKMIA:9
        a=CjuIK1q_8ugA:10 a=DM_PlaNYpjARcMQr2apF:22 a=L0NDqeB7ZLmQzAogN4cw:22
        a=pm31WBKQz9GEXVZSZ1ft:22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Jani

> Sometimes it's useful to be able to explicitly ensure certain headers
> remain self-contained, i.e. that they are compilable as standalone
> units, by including and/or forward declaring everything they depend on.
> 
> Add special target header-test-y where individual Makefiles can add
> headers to be tested if CONFIG_HEADER_TEST is enabled. This will
> generate a dummy C file per header that gets built as part of extra-y.

Very useful, thanks.
I have cooked up something ad-hoc a couple of times but having it as a
standard feature in the build system is much better.
The we can let some of our infrastructure pick up an issues
automatically.

> 
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  Documentation/kbuild/makefiles.txt |  7 +++++++
>  init/Kconfig                       |  9 +++++++++
>  scripts/Makefile.build             | 10 ++++++++++
>  scripts/Makefile.lib               |  3 +++
>  4 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
> index 03c065855eaf..73df58e5ea0c 100644
> --- a/Documentation/kbuild/makefiles.txt
> +++ b/Documentation/kbuild/makefiles.txt
> @@ -1036,6 +1036,13 @@ When kbuild executes, the following steps are followed (roughly):
>  	In this example, extra-y is used to list object files that
>  	shall be built, but shall not be linked as part of built-in.a.
>  
> +    header-test-y
> +
> +	header-test-y specifies headers (*.h) in the current directory that
> +	should be compile tested to ensure they are self-contained,
> +	i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
> +	this autogenerates dummy sources to include the headers, and builds them
> +	as part of extra-y.
Do we want to restrict this to current directory only?
Sometimes we could use this for headers in include/ but let it
trigger for the relevant subsystem.
So for example drivers/gpu/drm/Makefile will include the rules
for all headers in include/drm/*

The alternative would be Makefiles (of Kbuild files)
scattered in the directories with headers and then some
infrastructure to visit those.

Follow patch extend the header-test feature to work with
headers in include/

Example:
# Header files from this directory
header-test-y += drm_crtc_helper_internal.h
header-test-y += drm_crtc_internal.h
..
.
# Header files from include/drm
header-test-y += drm/amd_asic_type.h
header-test-y += drm/ati_pcigart.h
...


In the patch $* is used to get the "stem" from the pattern.
This is the filname of the header file without extension.


	Sam


diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 4d4bf698467a..ca132ab3a551 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -295,11 +295,10 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # ---------------------------------------------------------------------------
 
 quiet_cmd_header_test = HDRTEST $@
-      cmd_header_test = echo "\#include \"$(<F)\"" > $@
+      cmd_header_test = echo "\#include <$(2).h>" > $@
 
-# FIXME: would be nice to be able to limit this implicit rule to header-test-y
-$(obj)/%.header_test.c: $(src)/%.h FORCE
-	$(call if_changed,header_test)
+$(obj)/%.header_test.c:
+	$(call cmd,header_test,$*)
 
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------

