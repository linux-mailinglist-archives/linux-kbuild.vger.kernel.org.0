Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 249D324FF39
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Aug 2020 15:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgHXNm2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 Aug 2020 09:42:28 -0400
Received: from mga14.intel.com ([192.55.52.115]:17372 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726672AbgHXNmJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Aug 2020 09:42:09 -0400
IronPort-SDR: zPUeZQ1ZncsOtysqL7HIfQsMymC7fwyyb/WfZ9Fuj1sgiH1kM27EYsYPWcXzl1P9/MjVAi/u0h
 wcsBg9NHpaQA==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="155156390"
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; 
   d="scan'208";a="155156390"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 06:42:08 -0700
IronPort-SDR: XYoz56cnWHEh/TtP8sFPmHAc57bNIEbmv02UhHOOlBUJeEwoXp2qYNW8TQl4daQYOfT2pkktxe
 E72b+EY769Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,348,1592895600"; 
   d="scan'208";a="328489122"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2020 06:42:04 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kACjZ-00B4Tx-Ln; Mon, 24 Aug 2020 16:42:01 +0300
Date:   Mon, 24 Aug 2020 16:42:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Steven Rostedt <rostedt@goodmis.org>
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
Message-ID: <20200824134201.GM1891694@smile.fi.intel.com>
References: <20200824105852.v5.1.I4feb11d34ce7a0dd5ee2c3327fb5a1a9a646be30@changeid>
 <3f84781f12424cbfa552981af42dfaf2@AcuMS.aculab.com>
 <20200824092828.4386bd25@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824092828.4386bd25@oasis.local.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 24, 2020 at 09:28:28AM -0400, Steven Rostedt wrote:
> On Mon, 24 Aug 2020 08:26:13 +0000
> David Laight <David.Laight@ACULAB.COM> wrote:
> 
> > Since the objective seems to be to ensure there are no
> > calls to trace_printk() in the git tree, but to allow
> > them in uncommitted sources. Why not use a config option
> > and rely on rand-config builds to detect any 'accidental'
> > commits?
> 
> Because we don't want distros to ship with disallowing trace_printk,
> where someone finds a bug, sends the config to a developer, who then
> adds trace_printk() just to find that they can't use it.
> 
> The point of avoiding a config was to keep the burden of having the
> developer needing it and having to then modify the config given to them.
> 
> Also, it would then prevent those developing modules from using
> trace_printk() in their module if they build against one of these
> kernels.
> 
> Finally, there's debug code in the kernel that legitimately uses
> trace_printk(), and those randconfigs will trigger on them.

How making it make's option prevent some "smart" distros to achieve the same?
AFAIU any compile-time knob will allow to build a kernel w/o a feature and you
are against of such kernel builds in distros. Catch-22?

-- 
With Best Regards,
Andy Shevchenko


