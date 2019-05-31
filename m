Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677133128E
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 May 2019 18:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfEaQjS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 May 2019 12:39:18 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:50880 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfEaQjR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 May 2019 12:39:17 -0400
Received: from svr-orw-mbx-01.mgc.mentorg.com ([147.34.90.201])
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hWkYi-0005oM-1T from George_Davis@mentor.com ; Fri, 31 May 2019 09:39:12 -0700
Received: from localhost (147.34.91.1) by svr-orw-mbx-01.mgc.mentorg.com
 (147.34.90.201) with Microsoft SMTP Server (TLS) id 15.0.1320.4; Fri, 31 May
 2019 09:39:09 -0700
Date:   Fri, 31 May 2019 12:39:08 -0400
From:   "George G. Davis" <george_davis@mentor.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
CC:     Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC][PATCH] Makefile: Fix checkstack.pl arm64 wrong or unknown
 architecture
Message-ID: <20190531163908.GB10644@mam-gdavis-lt>
References: <1559316388-19565-1-git-send-email-george_davis@mentor.com>
 <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAK7LNATXzLzttF_gLA4wdfE1ue+bLPhvDZVsTKbB5K3nrN3jng@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-ClientProxiedBy: SVR-ORW-MBX-07.mgc.mentorg.com (147.34.90.207) To
 svr-orw-mbx-01.mgc.mentorg.com (147.34.90.201)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Masahiro,

On Sat, Jun 01, 2019 at 01:02:37AM +0900, Masahiro Yamada wrote:
> On Sat, Jun 1, 2019 at 12:27 AM George G. Davis <george_davis@mentor.com> wrote:
> >
> > The following error occurs for the `make ARCH=arm64 checkstack` case:
> >
> > aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
> > perl ./scripts/checkstack.pl arm64
> > wrong or unknown architecture "arm64"
> >
> > Fix the above error by setting `CHECKSTACK_ARCH := aarch64` for the
> > ARCH=arm64 case.
> >
> > Signed-off-by: George G. Davis <george_davis@mentor.com>
> 
> 
> Why don't you fix scripts/checkstack.pl ?

Like so?:


diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index 122aef5e4e14..8502de57e2ef 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -41,6 +41,8 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
 	if ($arch eq "") {
 		$arch = `uname -m`;
 		chomp($arch);
+	} elsif ($arch eq 'arm64') {
+		$arch = "aarch64";
 	}
 
 	$x	= "[0-9a-f]";	# hex character


Thanks!

> > diff --git a/Makefile b/Makefile
> > index 11358153d8f2..3e615e8553c0 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1695,7 +1695,11 @@ PHONY += checkstack kernelrelease kernelversion image_name
> >  ifeq ($(ARCH), um)
> >  CHECKSTACK_ARCH := $(SUBARCH)
> >  else
> > -CHECKSTACK_ARCH := $(ARCH)
> > +       ifeq ($(ARCH), arm64)
> > +               CHECKSTACK_ARCH := aarch64
> > +       else
> > +               CHECKSTACK_ARCH := $(ARCH)
> > +       endif
> >  endif
> >  checkstack:
> >         $(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
> > --
> > 2.7.4
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

-- 
Regards,
George
