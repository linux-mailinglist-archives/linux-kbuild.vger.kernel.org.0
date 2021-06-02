Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C389F39920A
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 19:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhFBSBQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 14:01:16 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:48322 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSBO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 14:01:14 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 9ECD2219CA;
        Wed,  2 Jun 2021 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622656770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lv2W2BbaouY2kvTCEbr3zmxmLYXOPicvRruaH//3Ko8=;
        b=NeI0ovzG2VGhhiTewnb/Y+DtJODuw4+4HiktT+2DUC5v81CATuayOTcQLHezcLH2G0+LZF
        MrUF/28Qr7OXU5jZ+nmgyRQGjXnfxKyMKoamUIcVcpCZ0zEZEQcToqirdXVnk3ZnWMHjA1
        rY++3FEJVD3NJ9prKWeALkzxjbs/UcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622656770;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lv2W2BbaouY2kvTCEbr3zmxmLYXOPicvRruaH//3Ko8=;
        b=f90bObkv7j4RSdgmb56wlKL2mejczyMdNJP+gNbiSK3n1Q6jkfYppU8I/8U//Evtc90kqb
        aj44/+0o6vYqvNAQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 7F81D118DD;
        Wed,  2 Jun 2021 17:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622656770; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lv2W2BbaouY2kvTCEbr3zmxmLYXOPicvRruaH//3Ko8=;
        b=NeI0ovzG2VGhhiTewnb/Y+DtJODuw4+4HiktT+2DUC5v81CATuayOTcQLHezcLH2G0+LZF
        MrUF/28Qr7OXU5jZ+nmgyRQGjXnfxKyMKoamUIcVcpCZ0zEZEQcToqirdXVnk3ZnWMHjA1
        rY++3FEJVD3NJ9prKWeALkzxjbs/UcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622656770;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Lv2W2BbaouY2kvTCEbr3zmxmLYXOPicvRruaH//3Ko8=;
        b=f90bObkv7j4RSdgmb56wlKL2mejczyMdNJP+gNbiSK3n1Q6jkfYppU8I/8U//Evtc90kqb
        aj44/+0o6vYqvNAQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id dNgfHgLHt2D4WgAALh3uQQ
        (envelope-from <msuchanek@suse.de>); Wed, 02 Jun 2021 17:59:30 +0000
Date:   Wed, 2 Jun 2021 19:59:29 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "kbuild: merge scripts/mkmakefile to top Makefile"
Message-ID: <20210602175929.GN8544@kitsune.suse.cz>
References: <20210526173855.5963-1-msuchanek@suse.de>
 <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz>
 <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
 <20210529053512.GT8544@kitsune.suse.cz>
 <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
 <20210602100315.GL8544@kitsune.suse.cz>
 <CAK7LNAT0AfTb=SVp+iO0rGkLm8__=O+uW-20_iuPvvNkxkbpuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAT0AfTb=SVp+iO0rGkLm8__=O+uW-20_iuPvvNkxkbpuA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 03, 2021 at 12:44:48AM +0900, Masahiro Yamada wrote:
> On Thu, Jun 3, 2021 at 12:18 AM Michal Suchánek <msuchanek@suse.de> wrote:
> >
> > On Wed, Jun 02, 2021 at 06:45:58PM +0900, Masahiro Yamada wrote:
> > > On Sat, May 29, 2021 at 2:35 PM Michal Suchánek <msuchanek@suse.de> wrote:
> > > >
> > > > On Sat, May 29, 2021 at 02:15:55AM +0900, Masahiro Yamada wrote:
> > > > > On Thu, May 27, 2021 at 5:28 AM Michal Suchánek <msuchanek@suse.de> wrote:
> > > > > >
> > > > > > On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> > > > > > > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse.de> wrote:
> > > > > > > >
> > > > > > > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> > > > > > > >
> > > > > > > > When packaging the kernel it is built in different place from the one in
> > > > > > > > which it will be installed. After build the makefile needs to be
> > > > > > > > regenerated with the target location but with mkmakefile merged into
> > > > > > > > Makefile tehre is no way to do that.
> > > > > > > >
> > > > > > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > > > > >
> > > > > > > My patch was not working as expected
> > > > > > > regardless of packaging.
> > > > > > >
> > > > > > > Does the following fix-up work for you?
> > > > > >
> > > > > > For the packaging I need some way to regenerate the Makefile and fake
> > > > > > the directory where the Makefile will be on the user system (ie DESTDIR)
> > > > > >
> > > > > > Without the mkmakefile I do not see any way to do it.
> > > > > >
> > > > > > If the kernel makefile is no longer location dependent there is no need
> > > > > > any more, of course.
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > Michal
> > > > >
> > > > > Sorry, I do not understand this.
> > > > >
> > > > > IIUC, this patch does not change any functionality.
> > > > > The generated Makefile is still the same.
> > > > > Why is it a problem?
> > > >
> > > > It cannot be regenerated.
> > >
> > > This is an issue regardless of your packaging.
> > > That is why I suggested a patch in my previous reply.
> > >
> > > https://lore.kernel.org/linux-kbuild/CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com/
> > >
> > >
> > > Anyway, please try next-20210602
> > > and see if you still have a problem.
> >
> > Yes, I still have a problem.
> >
> > My packaging script calls mkmakefile which no longer exists.
> 
> 
> So, we are not talking about the functionality any more.
> 
> What is important for you is, you have a separate file.
> 
> You overwrite scripts/mkmakefile for doing
> whatever hacks you like.
> 
> If the code is moved into the Makefile,
> it will be more difficult to insert hacks.
> 
> This is what I understood from your statement.

I did not insert hacks. I called the script that your patch removes.

That's functionality that is lost.

Now without the script separate from the makefile inserting hacks will
be required.

I would like to avoid that.

Thanks

Michal

> > Regardless of whther the new code works correctly or not in the usual
> > case it removes the ability to regenearte the makefile for a specific
> > target location.
> >
> > Thanks
> >
> > Michal
> >
> > > >
> > > > During package build you have four directories
> > > >
> > > >  - the source directory
> > > >  - the build directory
> > > >  - the staging directory where files are installed to be included in the
> > > >    package
> > > >  - the target directory where files will be installed on the target
> > > >    system once the package is installed by the user
> > > >
> > > > The makefile is generated for the build directory, not the target
> > > > directory. What is needed is a way to generate a makefile in the staging
> > > > directory that will work when installed in the target directory.
> > > > When mkmakefile is folded into makefile the makefile can no longer be
> > > > regenerated because it is up-to-date, and it can no longer be specified
> > > > that it should be generated for the target directory, not the staging
> > > > directory.
> > > >
> > > > Thanks
> > > >
> > > > Michal
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
