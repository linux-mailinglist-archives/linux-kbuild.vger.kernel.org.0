Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784C4250776
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 20:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgHXS0j (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Aug 2020 14:26:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:33564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgHXS0j (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 14:26:39 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6BDC4206BE;
        Mon, 24 Aug 2020 18:26:36 +0000 (UTC)
Date:   Mon, 24 Aug 2020 14:26:34 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     David Laight <David.Laight@aculab.com>,
        'Nicolas Boichat' <drinkcat@chromium.org>,
        "dianders@chromium.org" <dianders@chromium.org>,
        "groeck@chromium.org" <groeck@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20200824142634.235acc7d@oasis.local.home>
In-Reply-To: <20200824134201.GM1891694@smile.fi.intel.com>
References: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
        <3f84781f12424cbfa552981af42dfaf2@AcuMS.aculab.com>
        <20200824092828.4386bd25@oasis.local.home>
        <20200824134201.GM1891694@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, 24 Aug 2020 16:42:01 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> How making it make's option prevent some "smart" distros to achieve the same?
> AFAIU any compile-time knob will allow to build a kernel w/o a feature and you
> are against of such kernel builds in distros. Catch-22?

Because it will fail the build if it finds a trace_printk() in the
compiled code, but doesn't touch the config that is shipped, nor does
it affect modules being built against this kernel.

This patch series is for those that do not want a trace_printk()
accidentally left behind in their own work and trigger that big warning
and scare their users. But it still gives an option for developers to
add a trace_printk.

That is, the decision to have trace_printk in a particular output
(vmlinux) is done at the compile time, and all it does is to make sure
one isn't present at that moment. This series is not about keeping them
out completely (test modules, etc), which a config option will.

-- Steve
