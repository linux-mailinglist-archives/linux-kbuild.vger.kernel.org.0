Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECE6222C754
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 16:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgGXOIk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 10:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOIk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 10:08:40 -0400
X-Greylist: delayed 1320 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Jul 2020 07:08:40 PDT
Received: from tartarus.angband.pl (tartarus.angband.pl [IPv6:2001:41d0:602:dbe::8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0420DC0619D3;
        Fri, 24 Jul 2020 07:08:40 -0700 (PDT)
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.92)
        (envelope-from <kilobyte@angband.pl>)
        id 1jyy1p-00046j-W4; Fri, 24 Jul 2020 15:46:25 +0200
Date:   Fri, 24 Jul 2020 15:46:25 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Nick Terrell <nickrterrell@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: Re: [PATCH v8 6/7] x86: Add support for ZSTD compressed kernel
Message-ID: <20200724134625.GA4100@angband.pl>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
 <20200723192801.351114-7-nickrterrell@gmail.com>
 <20200724122640.GC632343@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200724122640.GC632343@gmail.com>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 24, 2020 at 02:26:40PM +0200, Ingo Molnar wrote:
> > -#ifdef CONFIG_KERNEL_BZIP2
> > +#if defined(CONFIG_KERNEL_BZIP2)
> >  # define BOOT_HEAP_SIZE		0x400000
> > -#else /* !CONFIG_KERNEL_BZIP2 */
> > +#elif defined(CONFIG_KERNEL_ZSTD)
> > +# define BOOT_HEAP_SIZE		 0x30000
> > +#else
> >  # define BOOT_HEAP_SIZE		 0x10000
> >  #endif
> 
> So the other patches explain why the decompression buffer extra space 
> was increased from 64k to 128k, but is there a similar 
> calculation/estimate for bumping BOOT_HEAD_SIZE from 64k to 192k?
> 
> Admittedly the BZ2 exception doesn't set a good example, but maybe we 
> can do this for ZSTD?

By the way, I have a patchset on top of this, to drop BZ2 and LZMA(1)
support, that should clean up this code somewhat.  And bring a lot of
lines of Linus happiness, as both bzip2 and lzma code are not used by
anything else in the kernel, unlike lzma2 (xz).

If you draw a speed-vs-size graph, at no point bzip2 or lzma are a good
choice, while zstd wins by a large margin for most of the range.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁
⢿⡄⠘⠷⠚⠋⠀ It's time to migrate your Imaginary Protocol from version 4i to 6i.
⠈⠳⣄⠀⠀⠀⠀
