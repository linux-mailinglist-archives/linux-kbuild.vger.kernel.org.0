Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D591F27B0E7
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 17:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgI1P0w (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 11:26:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:55582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726551AbgI1P0w (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 11:26:52 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0A682100A;
        Mon, 28 Sep 2020 15:26:48 +0000 (UTC)
Date:   Mon, 28 Sep 2020 11:26:46 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nicolas Boichat <drinkcat@chromium.org>, groeck@chromium.org,
        dianders@chromium.org, Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Rafael Aquini <aquini@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Message-ID: <20200928112646.4968999c@oasis.local.home>
In-Reply-To: <20200928152840.v6.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
References: <20200928152840.v6.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 28 Sep 2020 15:29:29 +0800
Nicolas Boichat <drinkcat@chromium.org> wrote:

> trace_printk is meant as a debugging tool, and should not be
> compiled into production code without specific debug Kconfig
> options enabled, or source code changes, as indicated by the
> warning that shows up on boot if any trace_printk is called:
>  **   NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE   **
>  **                                                      **
>  ** trace_printk() being used. Allocating extra memory.  **
>  **                                                      **
>  ** This means that this is a DEBUG kernel and it is     **
>  ** unsafe for production use.                           **
> 
> If DISALLOW_TRACE_PRINTK=1 is passed on the make command
> line, the kernel will generate a build-time error if
> trace_printk is used. We expect distributors to set this
> option for their production kernels.
> 
> Note that the code to handle trace_printk is still present,
> so this does not prevent people from compiling out-of-tree
> kernel modules, or BPF programs.
> 
> Also, we are not making this a kernel config option as we
> want the developer convenience of being able to reuse a
> production kernel config, add trace_printk for debugging,
> and rebuild, without any config changes.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

Masahiro,

Are you OK with this change? If so can I have your Ack?

-- Steve

