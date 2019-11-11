Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6F9DF6C54
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Nov 2019 02:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbfKKBcH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Nov 2019 20:32:07 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:48012 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726730AbfKKBcH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Nov 2019 20:32:07 -0500
Received: from localhost (unknown [IPv6:2601:601:9f00:1e2::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 4E1E5154245B8;
        Sun, 10 Nov 2019 17:32:06 -0800 (PST)
Date:   Sun, 10 Nov 2019 17:32:03 -0800 (PST)
Message-Id: <20191110.173203.1243596361382467520.davem@davemloft.net>
To:     linux@roeck-us.net
Cc:     sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, yamada.masahiro@socionext.com,
        maz@kernel.org
Subject: Re: [PATCH] sparc: vdso: Fix build failure seen due to kbuild
 changes
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20191111011106.18427-1-linux@roeck-us.net>
References: <20191111011106.18427-1-linux@roeck-us.net>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Sun, 10 Nov 2019 17:32:06 -0800 (PST)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Guenter Roeck <linux@roeck-us.net>
Date: Sun, 10 Nov 2019 17:11:06 -0800

> sparc64:allmodconfig fails to build with the following error.
> 
> unrecognized e_machine 18 arch/sparc/vdso/vdso32/vclock_gettime.o
> arch/sparc/vdso/vdso32/vclock_gettime.o: failed
> make[2]: *** [arch/sparc/vdso/vdso32/vclock_gettime.o] Error 1
> make[2]: *** Deleting file 'arch/sparc/vdso/vdso32/vclock_gettime.o'
> make[2]: *** Waiting for unfinished jobs....
> 
> The problem bisects to commit a3de7a72c517 ("kbuild: change
> *FLAGS_<basetarget>.o to take the path relative to $(obj)").
> Duplicate the x86 specific defines from this commit to the sparc
> vdso Makefile to fix the problem.
> 
> Fixes: a3de7a72c517 ("kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)")
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: David S. Miller <davem@davemloft.net>
