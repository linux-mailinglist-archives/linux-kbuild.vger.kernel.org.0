Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61F2187785
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 02:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgCQBlZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 21:41:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:45922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726478AbgCQBlY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 21:41:24 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49DD02051A;
        Tue, 17 Mar 2020 01:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584409284;
        bh=FI9x9WC8KMWdC8ffuXM9W0eZbs6AIMk+34K4Ee1IW/o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=eq8W4enIx3ZOcmc4IGtBEC/IgpS72WHEHHeGoKx+vPm+dxrzc4rNXbirfeGeTqNIL
         EFybwvhF9F8u2a8kVLVYiXPhQ/q0+JGDIxY5Osr+gX1khDSACPkpT7u/ppygqxV5X8
         xQLHRqBQYsWLIXJov3tObStP75LkcxBz8P21chj4=
Date:   Tue, 17 Mar 2020 02:41:21 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Sergei Trofimovich <slyfox@gentoo.org>
cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] Makefile: disallow data races on gcc-10 as well
In-Reply-To: <nycvar.YFH.7.76.2003170154580.19500@cbobk.fhfr.pm>
Message-ID: <nycvar.YFH.7.76.2003170240410.19500@cbobk.fhfr.pm>
References: <20200317000718.177637-1-slyfox@gentoo.org> <nycvar.YFH.7.76.2003170154580.19500@cbobk.fhfr.pm>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 17 Mar 2020, Jiri Kosina wrote:

> > The flag change happened at https://gcc.gnu.org/PR92046.
> > 
> > CC: Jiri Kosina <jkosina@suse.cz>
> > CC: Masahiro Yamada <masahiroy@kernel.org>
> > CC: Michal Marek <michal.lkml@markovi.net>
> > CC: linux-kbuild@vger.kernel.org
> > Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
> > ---
> >  Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Makefile b/Makefile
> > index 171f2b004c8a..9696eb2cd5a1 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -714,6 +714,7 @@ endif
> >  
> >  # Tell gcc to never replace conditional load with a non-conditional one
> >  KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
> > +KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
> 
> I have to say I can't really read gcc sources without major cerebral pain, 
> so let me me dense here: what happens to gcc<10 if you pass 
> -fno-allow-store-data-races to it?

Sorry, brainfart on my side, your patch is good :)

	Acked-by: Jiri Kosina <jkosina@suse.cz>

Thanks,

-- 
Jiri Kosina
SUSE Labs

