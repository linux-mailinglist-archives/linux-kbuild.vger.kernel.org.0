Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCB327BC89
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Sep 2020 07:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725779AbgI2Fre (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Sep 2020 01:47:34 -0400
Received: from mga01.intel.com ([192.55.52.88]:60861 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbgI2Fre (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Sep 2020 01:47:34 -0400
IronPort-SDR: 3v8muNuQhBzRgP7Z727fG/5jbMKQw7fBD5adQ9nJIowOmvGnGap4VVSeQRaSO/WqDDw55RioWN
 F6wmJJhn116w==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="180276912"
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="180276912"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 22:47:34 -0700
IronPort-SDR: yA9bknnmiiJFYDDhqGuspLkIHXkdBNiDoNL3xAFuJaGoS/YB/zgKYKCpFUymJ4GtwR9XUk/RWq
 5O/eDToNi6iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; 
   d="scan'208";a="350091948"
Received: from shbuild999.sh.intel.com (HELO localhost) ([10.239.146.107])
  by FMSMGA003.fm.intel.com with ESMTP; 28 Sep 2020 22:47:31 -0700
Date:   Tue, 29 Sep 2020 13:47:30 +0800
From:   Feng Tang <feng.tang@intel.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "rong.a.chen@intel.com" <rong.a.chen@intel.com>,
        "philip.li@intel.com" <philip.li@intel.com>,
        Petr Malat <oss@malat.biz>
Subject: Re: PROBLEM: zstd bzImage decompression fails for some x86_32 config
 on 5.9-rc1
Message-ID: <20200929054730.GA55377@shbuild999.sh.intel.com>
References: <20200928085505.GA22244@shbuild999.sh.intel.com>
 <74757C2A-7C09-4C2E-9828-E8D12EE4706B@fb.com>
 <996F1C01-3607-4643-817E-8318DFCE59A9@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <996F1C01-3607-4643-817E-8318DFCE59A9@fb.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 29, 2020 at 05:15:38AM +0000, Nick Terrell wrote:
> 
> 
> > On Sep 28, 2020, at 11:02 AM, Nick Terrell <terrelln@fb.com> wrote:
> > 
> > 
> > 
> >> On Sep 28, 2020, at 1:55 AM, Feng Tang <feng.tang@intel.com> wrote:
> >> 
> >> Hi Nick,
> >> 
> >> 0day has found some kernel decomprssion failure case since 5.9-rc1 (X86_32
> >> build), and it could be related with ZSTD code, though initially we bisected
> >> to some other commits.
> >> 
> >> The error messages are: 
> >> 	Decompressing Linux...
> >> 	
> >> 	ZSTD-compressed data is corrupt
> >> 
> >> This could be reproduced by compiling the kernel with attached config,
> >> and use QEMU to boot it.
> >> 
> >> We suspect it could be related with the kernel size, as we only see
> >> it on big kernel, and some more info are:
> >> 
> >> * If we remove a lot of kernel config to build a much smaller kernel,
> >> it will boot fine
> >> 
> >> * If we change the zstd algorithm from zstd22 to zstd19, the kernel will
> >> boot fine with below patch
> >> 
> >> Please let me know if you need more info, and sorry for the late report
> >> as we just tracked down to this point.
> > 
> > Thanks for the report, I will look into it today.
> 
> CC: Petr Malat
> 
> I’ve successfully reproduced, and found the issue. It turns out that this
> patch [0] from Petr Malat fixes the issue. As I mentioned in that thread, his
> fix corresponds to this upstream commit [1].

Glad to know there is already a fix.

> Can we get Petr's patch merged into v5.9?
> 
> This bug only happens when the window size is > 8 MB. A non-kernel workaround
> would be to compress the kernel level 19 instead of level 22, which uses an
> 8 MB window size, instead of a 128 MB window size.
> 
> The reason it only shows up for large kernels, is that the code is only buggy
> when an offset > 8 MB is used, so a kernel <= 8 MB can't trigger the bug.
> 
> Best,
> Nick
> 
> [0] https://lkml.org/lkml/2020/9/14/94

With this patch, all the failed cases on my side could boot fine.

Tested-by: Feng Tang <feng.tang@intel.com>

Thanks,
Feng

> [1] https://github.com/facebook/zstd/commit/8a5c0c98ae5a7884694589d7a69bc99011add94d


