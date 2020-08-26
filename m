Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8551225250A
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Aug 2020 03:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726611AbgHZBjf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Aug 2020 21:39:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:54196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726599AbgHZBjf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Aug 2020 21:39:35 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1D04A2072D;
        Wed, 26 Aug 2020 01:39:33 +0000 (UTC)
Date:   Tue, 25 Aug 2020 21:39:31 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Nicolas Boichat <drinkcat@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
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
        linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Message-ID: <20200825213931.04ec7f22@oasis.local.home>
In-Reply-To: <CANMq1KCQjX1632qyo5+8kv8TXNu_Onh4gz7oMx3rx79XQX2fqg@mail.gmail.com>
References: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
        <20200824093020.073ae8d8@oasis.local.home>
        <CANMq1KCQjX1632qyo5+8kv8TXNu_Onh4gz7oMx3rx79XQX2fqg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 25 Aug 2020 08:38:27 +0800
Nicolas Boichat <drinkcat@chromium.org> wrote:

> This already works. I'll be honest, I'm not 100% sure why (and if
> fully intentional)...
> 
> The CFLAGS end up in 3 generated assembly files:
> # grep -R DISALLOW_TRACE_PRINTK * | grep -v ".cmd:"
> arch/x86/kernel/asm-offsets.s:# -imultiarch x86_64-linux-gnu -D
> __KERNEL__ -D DISALLOW_TRACE_PRINTK
> kernel/bounds.s:# -imultiarch x86_64-linux-gnu -D __KERNEL__ -D
> DISALLOW_TRACE_PRINTK
> scripts/mod/devicetable-offsets.s:# -D DISALLOW_TRACE_PRINTK
> (along with all *.cmd files)
> 
> and I suspect some/all of those force a complete kernel rebuild.

Yeah, I believe that the modification of CFLAGS causes a recompile of
the entire kernel.

Thanks!

-- Steve
