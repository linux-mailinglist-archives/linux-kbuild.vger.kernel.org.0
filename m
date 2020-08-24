Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F45A24FECD
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 15:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbgHXN2e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Aug 2020 09:28:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:52384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXN2e (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 09:28:34 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EE44220838;
        Mon, 24 Aug 2020 13:28:30 +0000 (UTC)
Date:   Mon, 24 Aug 2020 09:28:28 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     'Nicolas Boichat' <drinkcat@chromium.org>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "groeck@chromium.org" <groeck@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Kars Mulder <kerneldev@karsmulder.nl>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Will Deacon <will@kernel.org>, Yue Hu <huyue2@yulong.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] kernel/trace: Add DISALLOW_TRACE_PRINTK make option
Message-ID: <20200824092828.4386bd25@oasis.local.home>
In-Reply-To: <3f84781f12424cbfa552981af42dfaf2@AcuMS.aculab.com>
References: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
        <3f84781f12424cbfa552981af42dfaf2@AcuMS.aculab.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 24 Aug 2020 08:26:13 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> Since the objective seems to be to ensure there are no
> calls to trace_printk() in the git tree, but to allow
> them in uncommitted sources. Why not use a config option
> and rely on rand-config builds to detect any 'accidental'
> commits?

Because we don't want distros to ship with disallowing trace_printk,
where someone finds a bug, sends the config to a developer, who then
adds trace_printk() just to find that they can't use it.

The point of avoiding a config was to keep the burden of having the
developer needing it and having to then modify the config given to them.

Also, it would then prevent those developing modules from using
trace_printk() in their module if they build against one of these
kernels.

Finally, there's debug code in the kernel that legitimately uses
trace_printk(), and those randconfigs will trigger on them.

-- Steve
