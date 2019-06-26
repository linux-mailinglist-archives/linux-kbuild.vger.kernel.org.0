Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4089956BF7
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2019 16:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727139AbfFZOaw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Jun 2019 10:30:52 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:39708 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfFZOav (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Jun 2019 10:30:51 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id A684C2003C;
        Wed, 26 Jun 2019 16:30:47 +0200 (CEST)
Date:   Wed, 26 Jun 2019 16:30:46 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Xi Wang <wangxi11@huawei.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: add more hints about SUBDIRS replacement
Message-ID: <20190626143046.GA12510@ravnborg.org>
References: <20190625085127.9446-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625085127.9446-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=D19gQVrFAAAA:8
        a=c-n4J4-pAAAA:8 a=7gkXJVJtAAAA:8 a=Sq-7mj1JxeWlg5ll3zAA:9
        a=CjuIK1q_8ugA:10 a=W4TVW4IDbPiebHqcZpNg:22 a=L0NDqeB7ZLmQzAogN4cw:22
        a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 25, 2019 at 05:51:27PM +0900, Masahiro Yamada wrote:
> Commit 0126be38d988 ("kbuild: announce removal of SUBDIRS if used")
> added a hint about the 'SUBDIRS' replacement, but it was not clear
> enough.
> 
> Multiple people sent me similar questions, patches.
> 
>   https://lkml.org/lkml/2019/1/17/456
> 
> I did not mean to suggest M= for building a subdirectory in the kernel
> tree.
> 
> >From the commit 669efc76b317 ("net: hns3: fix compile error"), people
> already (ab)use M=... to do that because it seems to work to some extent.
> 
> Documentation/kbuild/kbuild.txt says M= and KBUILD_EXTMOD are used for
> building external modules.
> 
> In fact, Kbuild supports the single target '%/' for this purpose, but
> this may not be noticed much.
> 
> Kindly add more hints.
> 
> Makefile:213: ================= WARNING ================
> Makefile:214: 'SUBDIRS' will be removed after Linux 5.3
> Makefile:215:
> Makefile:216: If you are building an individual subdirectory
> Makefile:217: in the kernel tree, you can do like this:
> Makefile:218: $ make path/to/dir/you/want/to/build/
> Makefile:219: (Do not forget the trailing slash)
> Makefile:220:
> Makefile:221: If you are building an external module,
> Makefile:222: Please use 'M=' or 'KBUILD_EXTMOD' instead
> Makefile:223: ==========================================
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Nice!

Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam
