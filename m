Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC7B398E52
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 17:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232141AbhFBPUZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 11:20:25 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:59750 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbhFBPUO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 11:20:14 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9C68F22CE9;
        Wed,  2 Jun 2021 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622647108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVCY3kReO4aYtRrCdthZIKAAdWvyFm8FGABuqcsqSSo=;
        b=ha7u5ub6Q+29Xo8msEqsH3ITn86/03gesPm4HUhbK0E8sMtaSiHedtDdzfU9BR4N7AP3/T
        g15Z1om/+4MsmDCP7i6kLIgbjtMqNytjM2SCbwnHuASDq5eGB1ScFqbTjnXm3TELxI98rF
        svB0igQtk3lScqcUc8yGIX3f7pWw67c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622647108;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVCY3kReO4aYtRrCdthZIKAAdWvyFm8FGABuqcsqSSo=;
        b=D6AlQlqfvEm8M80qGRROcE9GeiHFPH47lierC2gAkoJYPyD0fDxJalxAJAvj6OXHxjp/mO
        gIcvo+NGUMI+CfDQ==
Received: by imap.suse.de (Postfix, from userid 51)
        id 921C3118DD; Wed,  2 Jun 2021 16:20:03 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 3771F11D64;
        Wed,  2 Jun 2021 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622628197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVCY3kReO4aYtRrCdthZIKAAdWvyFm8FGABuqcsqSSo=;
        b=U64lAHj1uQBmhw0kd9i9udpIwprErn68zQMfwnVc1hwuQxnjfmpUcuzRM8rRWicXmM34y+
        B6w27WeWjPvNxD/Q9IoiV+lYTumuwHIgbzo4wO+n0d/VJLA+IL0P1vxy8FyOZPqjLU93ab
        cwVQuZaT/992+L7HoS7tSsPyePVk/dY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622628197;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TVCY3kReO4aYtRrCdthZIKAAdWvyFm8FGABuqcsqSSo=;
        b=pGgAcE4KnTbmqOE+hujpUum3zL/WKKjAZkhN3OXvVyZbfpzK1niSe/OXgAOh0kPT1NqzG6
        fReRrtfkPrtM3KCg==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id PvwVDWVXt2CxPAAALh3uQQ
        (envelope-from <msuchanek@suse.de>); Wed, 02 Jun 2021 10:03:17 +0000
Date:   Wed, 2 Jun 2021 12:03:16 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "kbuild: merge scripts/mkmakefile to top Makefile"
Message-ID: <20210602100315.GL8544@kitsune.suse.cz>
References: <20210526173855.5963-1-msuchanek@suse.de>
 <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz>
 <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
 <20210529053512.GT8544@kitsune.suse.cz>
 <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 02, 2021 at 06:45:58PM +0900, Masahiro Yamada wrote:
> On Sat, May 29, 2021 at 2:35 PM Michal Suchánek <msuchanek@suse.de> wrote:
> >
> > On Sat, May 29, 2021 at 02:15:55AM +0900, Masahiro Yamada wrote:
> > > On Thu, May 27, 2021 at 5:28 AM Michal Suchánek <msuchanek@suse.de> wrote:
> > > >
> > > > On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> > > > > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse.de> wrote:
> > > > > >
> > > > > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> > > > > >
> > > > > > When packaging the kernel it is built in different place from the one in
> > > > > > which it will be installed. After build the makefile needs to be
> > > > > > regenerated with the target location but with mkmakefile merged into
> > > > > > Makefile tehre is no way to do that.
> > > > > >
> > > > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > > >
> > > > > My patch was not working as expected
> > > > > regardless of packaging.
> > > > >
> > > > > Does the following fix-up work for you?
> > > >
> > > > For the packaging I need some way to regenerate the Makefile and fake
> > > > the directory where the Makefile will be on the user system (ie DESTDIR)
> > > >
> > > > Without the mkmakefile I do not see any way to do it.
> > > >
> > > > If the kernel makefile is no longer location dependent there is no need
> > > > any more, of course.
> > > >
> > > > Thanks
> > > >
> > > > Michal
> > >
> > > Sorry, I do not understand this.
> > >
> > > IIUC, this patch does not change any functionality.
> > > The generated Makefile is still the same.
> > > Why is it a problem?
> >
> > It cannot be regenerated.
> 
> This is an issue regardless of your packaging.
> That is why I suggested a patch in my previous reply.
> 
> https://lore.kernel.org/linux-kbuild/CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com/
> 
> 
> Anyway, please try next-20210602
> and see if you still have a problem.

Yes, I still have a problem.

My packaging script calls mkmakefile which no longer exists.

Regardless of whther the new code works correctly or not in the usual
case it removes the ability to regenearte the makefile for a specific
target location.

Thanks

Michal

> >
> > During package build you have four directories
> >
> >  - the source directory
> >  - the build directory
> >  - the staging directory where files are installed to be included in the
> >    package
> >  - the target directory where files will be installed on the target
> >    system once the package is installed by the user
> >
> > The makefile is generated for the build directory, not the target
> > directory. What is needed is a way to generate a makefile in the staging
> > directory that will work when installed in the target directory.
> > When mkmakefile is folded into makefile the makefile can no longer be
> > regenerated because it is up-to-date, and it can no longer be specified
> > that it should be generated for the target directory, not the staging
> > directory.
> >
> > Thanks
> >
> > Michal
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
