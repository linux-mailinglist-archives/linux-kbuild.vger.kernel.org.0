Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92C64328EC
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 23:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhJRVRN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 17:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbhJRVRM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 17:17:12 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33982C06161C;
        Mon, 18 Oct 2021 14:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=3dv8mkMWsgCVE8kAOdL+ki0THnK3KShualtOVVGyBhA=; b=xv3c+rLvuXJ93/BRgWH/bdzgZe
        AxoPWZE60XMt4MnHp995KEieE603qV72iNC6tGJrHWymj5Enmx+zmwuS58Z3SfEesvcjLA9ztJZAc
        5GpbM0UDGtJBv8GMtHxfQ0jDtGQSP/iLhs55pkiLoi9OJma7mZ5U2YTNgNwwcp3KIb+S5bUF8yQFe
        YQ7lBDDS+uNEyGV/ILw2g23CZOAXZ/1s12uEkR/2kV72PcYzcWmTyRzU4SDPLcIHCJFZ2zf19lDQR
        gBVK7XMs/uOnMo8paq/msFK7KmMxSIVDAKS/ZKD4q2lNLeoA/eg7gM2Bjv6aLDb98XbUzXBuRjjPC
        fzfyUdsg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mcZyG-00HJ10-Ij; Mon, 18 Oct 2021 21:15:00 +0000
Subject: Re: linux-next: Tree for Oct 18 ('make' error on ARCH=um)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>
References: <20211018203023.036d8362@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a1b2bdda-d1cf-807b-6a84-73a3e347639c@infradead.org>
Date:   Mon, 18 Oct 2021 14:14:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018203023.036d8362@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/18/21 2:30 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20211015:
> 

UML (arch=um) with SUBARCH of i386 or x86_64,
using gcc, not clang:

make[1]: Entering directory '/work/lnx/next/linux-next-20211018/UM64'
../scripts/Makefile.clang:19: *** Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang.  Stop.
make[1]: Leaving directory '/work/lnx/next/linux-next-20211018/UM64'
make: *** [Makefile:226: __sub-make] Error 2


Just use a make target of defconfig:

make ARCH=um SUBARCH=x86_64 O=UM64 defconfig

-- 
~Randy
