Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2665C888E3
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 08:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbfHJGqR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 02:46:17 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:37694 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfHJGqR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 02:46:17 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 6BDB1803D0;
        Sat, 10 Aug 2019 08:46:12 +0200 (CEST)
Date:   Sat, 10 Aug 2019 08:46:11 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        dri-devel@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] kbuild: allow big modules to sub-divide Makefiles
Message-ID: <20190810064611.GC13020@ravnborg.org>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=CjF8g_Sx3RpHsihlKJQA:9 a=CjuIK1q_8ugA:10
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro

On Tue, Aug 06, 2019 at 03:39:18PM +0900, Masahiro Yamada wrote:
> 
> Recently, Jani Nikula requests a better build system support
> for drivers spanning multiple directories.
> (better kbuild support for drivers spanning multiple directories?)
> 
> I implemented it, so please take a look at it.
> 
> Note:
> The single targets do not work correctly.
> 
> The single targets have never worked correctly:

It works in most cases, but now always.
I dunno how much it is used.
Myself I almost always do make /drivers/foo/bar/
> 
> [1] For instance, "make drivers/foo/bar/baz.o" will descend into
>     drivers/foo/bar/Makefile, which may not necessarily specify
>     the build rule of baz.o
> 
>     It is possible for drivers/foo/Makefile having
>         obj-$(CONFIG_BAZ) += bar/baz.o
> 
> [2] subdir-ccflags-y does not work.
> 
>     The single targets directly descend into the directory of
>     that file resides.
> 
>     It missed subdir-ccflags-y if it is specifies in parent
>     Makefiles.
> 
> Perhaps, I will have to manage correct implementation of single targets.
The day that kbuild has a separate step to read all Makefiles
and then without using recursive make can build the kernel we can have
this fixed.
Until then we can accpet it as is - as fixing this may not be simple.

	Sam
