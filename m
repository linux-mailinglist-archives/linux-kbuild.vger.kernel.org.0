Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65BDD6E5D9
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Jul 2019 14:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbfGSMkg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jul 2019 08:40:36 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:46716 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbfGSMkg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jul 2019 08:40:36 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id B633620085;
        Fri, 19 Jul 2019 14:40:31 +0200 (CEST)
Date:   Fri, 19 Jul 2019 14:40:30 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Christoph Hellwig <hch@lst.de>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: disable compile-test of kernel headers for now
Message-ID: <20190719124030.GA5858@ravnborg.org>
References: <20190719100859.11227-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719100859.11227-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=UFIcWzdN8eMNOij5XVIA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro.

On Fri, Jul 19, 2019 at 07:08:59PM +0900, Masahiro Yamada wrote:
> This compile-test started from the strong belief that (almost) all
> headers should be able to be compiled as a standalone unit, but this
> requirement seems to be just annoying.
> 
> I believe compile-test of exported headers is good. On the other hand,
> in-kernel headers are not necessarily supposed to be always compilable.
> Actually, some headers are only included under a certain combination
> of CONFIG options, and that is definitely fine.
> 
> This test is still causing false positive errors in randconfig.
> Moreover, newly added headers are compile-tested by default, sometimes
> they catch (not fatal) bugs, but often raise false positive errors to
> end up with making people upset.
> 
> The merge window is closing shortly, so there is not much I can do.
> Disable it for now, and take a pause to re-think whether we should
> continue this or change the course.

The present status is that iomap.h fails - and Arnd promptly
made a fix for it:
https://lore.kernel.org/lkml/20190719113139.4005262-1-arnd@arndb.de/T/#u

You already fixed another issue.
So the fall-out so far is miniaml and already fixed (pending Arnd's
patch).

If headers are not self-contained then one needs to include them in a
specific order which can be quite hard to get right.
Especially if the requirements differ across different architectures.
So the whole concept seems sane.

I have thrown it after may array of cross builds:
=> alpha arm arm64 sparc64 i386 x86 powerpc s390 riscv sh

For each arch I try:
=> allmodconfig allyesconfig allnoconfig defconfig

No errros.
But that obviously only coveres a very minial set of configurations.
Arnd's result from his randconfig are also very promising.

I advise to keep it enabled and if there is a steady stream of
new errors after -rc1 and -rc2 then to disable the testing.
We will not get the coverage unless this is upstreamed.
And the testing is relevant.

	Sam
