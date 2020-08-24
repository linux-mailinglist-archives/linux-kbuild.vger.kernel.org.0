Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EEF24FEDF
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 15:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbgHXNaY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Aug 2020 09:30:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:54752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXNaX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 09:30:23 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACAAB206B5;
        Mon, 24 Aug 2020 13:30:21 +0000 (UTC)
Date:   Mon, 24 Aug 2020 09:30:20 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     dianders@chromium.org, groeck@chromium.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Will Deacon <will@kernel.org>, Yue Hu <huyue2@yulong.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Message-ID: <20200824093020.073ae8d8@oasis.local.home>
In-Reply-To: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
References: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 24 Aug 2020 10:59:13 +0800
Nicolas Boichat <drinkcat@chromium.org> wrote:

> ---
> 
> Changes since v4:
>  - Turns this into a make option, instead of a config
>    option, as suggested by Steven Rostedt <rostedt@goodmis.org>.
> 
> Changes since v2/v3:
>  - Rebase only, v3 didn't exist as I just split out the other
>    necessary patches.
>  - Added patch 3/3 to fix atomisp_compat_css20.c
> 
> Changes since v1:
>  - Use static_assert instead of __static_assert (Jason Gunthorpe)
>  - Fix issues that can be detected by this patch (running some
>    randconfig in a loop, kernel test robot, or manual inspection),
>    by:
>    - Making some debug config options that use trace_printk depend
>      on the new config option.
>    - Adding 3 patches before this one.
> 
>  Makefile               | 14 ++++++++++++++
>  include/linux/kernel.h | 17 ++++++++++++++++-
>  2 files changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c4470a4e131f2ce..fb8b0d7fb4b2df7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -100,6 +100,16 @@ endif
>  
>  export quiet Q KBUILD_VERBOSE
>  
> +# Disallow use of trace_printk. Can be used by production kernels.
> +ifeq ("$(origin DISALLOW_TRACE_PRINTK)", "command line")
> +  KBUILD_DISALLOW_TRACE_PRINTK = $(DISALLOW_TRACE_PRINTK)
> +endif
> +ifndef KBUILD_DISALLOW_TRACE_PRINTK
> +  KBUILD_DISALLOW_TRACE_PRINTK = 0
> +endif
> +
> +export KBUILD_DISALLOW_TRACE_PRINTK
> +
>  # Kbuild will save output files in the current working directory.
>  # This does not need to match to the root of the kernel source tree.
>  #
> @@ -838,6 +848,10 @@ KBUILD_AFLAGS	+= -gz=zlib
>  KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
>  endif
>  
> +ifeq ($(KBUILD_DISALLOW_TRACE_PRINTK),1)
> +KBUILD_CFLAGS += -DDISALLOW_TRACE_PRINTK
> +endif
> +
>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
>  export DEBUG_CFLAGS
>  


There's one more thing we need to do, is if you build without this option
then build with it, you should trigger a full kernel rebuild.
Otherwise, if you build without the option, then build with it, and it
doesn't rebuild the tree, it wont catch anything.

-- Steve
