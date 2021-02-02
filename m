Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060C730CCF5
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 21:23:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhBBUWj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 15:22:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232532AbhBBUUJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 15:20:09 -0500
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A56C061788;
        Tue,  2 Feb 2021 12:19:29 -0800 (PST)
Received: from zn.tnic (p200300ec2f0e1f00063087fcaf821809.dip0.t-ipconnect.de [IPv6:2003:ec:2f0e:1f00:630:87fc:af82:1809])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E5A101EC04D6;
        Tue,  2 Feb 2021 21:19:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1612297165;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
        bh=Ee3tYDfp3QeWVA1ZBYRXshE4otzH4zb09kl47xr1pHE=;
        b=SDRCfxlXmSk5o5zrc2gZpWTT4s8Dc+LpNzMhgAzU+Qw8wLmLMcElN1KwJwFQ364IIFRdFw
        rl8olf75MSZYAIBVJ4JLoHuaGI4xz62anXU1RRuW31+nQ8Skw2Den0ZgHajsIOGIvxFWBJ
        sFgKhRoJmI2Al0F1rYGRLvs/qD651a8=
Date:   Tue, 2 Feb 2021 21:19:20 +0100
From:   Borislav Petkov <bp@alien8.de>
To:     Amy Parker <enbyamy@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gcc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Willy Tarreau <w@1wt.eu>
Subject: Re: Alternative compilers to GCC/Clang
Message-ID: <20210202201920.GA18106@zn.tnic>
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
 <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
 <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 02, 2021 at 11:11:32AM -0800, Amy Parker wrote:
> On Tue, Feb 2, 2021 at 8:26 AM Amy Parker <enbyamy@gmail.com> wrote:
> > > It compiles extremely fast, implements some subsets of gcc (a few
> > > attributes for example), but is far from being able to compile a kernel
> >
> > Well, we'll see what I can do with that. :)
> 
> Well, just installed it and tried building the kernel. Fails every file. :)
> 
> It's definitely something to work towards - but I don't know if kernel
> advancements requiring newer GCC versions will go slow enough to allow
> TCC improvements to arise. This isn't just something like with Clang
> where a few tweaks to files and to Clang itself did the trick.

Maybe this'll help you find something to do:

https://www.youtube.com/watch?v=iU0Z0vBKrtQ

Yes, it would be lovely to be able to compile the kernel with tcc but it
is not going to be trivial.

Good luck.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
