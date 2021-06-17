Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDEA3AAE3A
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 09:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhFQIAC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Jun 2021 04:00:02 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60414 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230286AbhFQIAB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Jun 2021 04:00:01 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id ECD651FDC3;
        Thu, 17 Jun 2021 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623916672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w6AEfPmoA5qBqja4e1kg34sTKDKrw9OUuofMPt4TgUI=;
        b=OmIru+MZbLT/KD1oc4ucx+IHeauaFnO3v234xjMdXZh9Q772LQIolz7tbKFrXR/vBGqN/h
        egaTfZ85fApc8mR9E7+JyaqRva7rAePSUXGh5/QQ5a/bVzaNT9P0pAv8hXbygJx2n5ODPJ
        Gyl7ybkoe5wMd8Rj86I7J5+huCV1cTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623916672;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w6AEfPmoA5qBqja4e1kg34sTKDKrw9OUuofMPt4TgUI=;
        b=ZqVw/rBgeffpK+U0k155+xPYxDe3Yl9LeRl6Plmuw1SULlLIUc83i5EONlOtcatSTS+1X4
        FMUGiJLJZyH99rBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id D0C58118DD;
        Thu, 17 Jun 2021 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1623916672; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w6AEfPmoA5qBqja4e1kg34sTKDKrw9OUuofMPt4TgUI=;
        b=OmIru+MZbLT/KD1oc4ucx+IHeauaFnO3v234xjMdXZh9Q772LQIolz7tbKFrXR/vBGqN/h
        egaTfZ85fApc8mR9E7+JyaqRva7rAePSUXGh5/QQ5a/bVzaNT9P0pAv8hXbygJx2n5ODPJ
        Gyl7ybkoe5wMd8Rj86I7J5+huCV1cTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1623916672;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w6AEfPmoA5qBqja4e1kg34sTKDKrw9OUuofMPt4TgUI=;
        b=ZqVw/rBgeffpK+U0k155+xPYxDe3Yl9LeRl6Plmuw1SULlLIUc83i5EONlOtcatSTS+1X4
        FMUGiJLJZyH99rBA==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id HtR3MoAAy2B9FgAALh3uQQ
        (envelope-from <msuchanek@suse.de>); Thu, 17 Jun 2021 07:57:52 +0000
Date:   Thu, 17 Jun 2021 09:57:51 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "kbuild: merge scripts/mkmakefile to top Makefile"
Message-ID: <20210617075751.GR8544@kitsune.suse.cz>
References: <20210526173855.5963-1-msuchanek@suse.de>
 <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz>
 <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
 <20210529053512.GT8544@kitsune.suse.cz>
 <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
 <20210602100315.GL8544@kitsune.suse.cz>
 <CAK7LNAT0AfTb=SVp+iO0rGkLm8__=O+uW-20_iuPvvNkxkbpuA@mail.gmail.com>
 <20210602175929.GN8544@kitsune.suse.cz>
 <CAK7LNAQLC4VFzcgx90T7w-sew0EJmhYOzmuG+AMNLgWMJxRO=A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQLC4VFzcgx90T7w-sew0EJmhYOzmuG+AMNLgWMJxRO=A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 03, 2021 at 03:35:24AM +0900, Masahiro Yamada wrote:
> On Thu, Jun 3, 2021 at 2:59 AM Michal Suchánek <msuchanek@suse.de> wrote:
> >
> > On Thu, Jun 03, 2021 at 12:44:48AM +0900, Masahiro Yamada wrote:
> > > On Thu, Jun 3, 2021 at 12:18 AM Michal Suchánek <msuchanek@suse.de> wrote:
> > > >
> > > > On Wed, Jun 02, 2021 at 06:45:58PM +0900, Masahiro Yamada wrote:
> > > > > On Sat, May 29, 2021 at 2:35 PM Michal Suchánek <msuchanek@suse.de> wrote:
> > > > > >
> > > > > > On Sat, May 29, 2021 at 02:15:55AM +0900, Masahiro Yamada wrote:
> > > > > > > On Thu, May 27, 2021 at 5:28 AM Michal Suchánek <msuchanek@suse.de> wrote:
> > > > > > > >
> > > > > > > > On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> > > > > > > > > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse.de> wrote:
> > > > > > > > > >
> > > > > > > > > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> > > > > > > > > >
> > > > > > > > > > When packaging the kernel it is built in different place from the one in
> > > > > > > > > > which it will be installed. After build the makefile needs to be
> > > > > > > > > > regenerated with the target location but with mkmakefile merged into
> > > > > > > > > > Makefile tehre is no way to do that.
> > > > > > > > > >
> > > > > > > > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > > > > > > >
> > > > > > > > > My patch was not working as expected
> > > > > > > > > regardless of packaging.
> > > > > > > > >
> > > > > > > > > Does the following fix-up work for you?
> > > > > > > >
> > > > > > > > For the packaging I need some way to regenerate the Makefile and fake
> > > > > > > > the directory where the Makefile will be on the user system (ie DESTDIR)
> > > > > > > >
> > > > > > > > Without the mkmakefile I do not see any way to do it.
> > > > > > > >
> > > > > > > > If the kernel makefile is no longer location dependent there is no need
> > > > > > > > any more, of course.
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > > Michal
> > > > > > >
> > > > > > > Sorry, I do not understand this.
> > > > > > >
> > > > > > > IIUC, this patch does not change any functionality.
> > > > > > > The generated Makefile is still the same.
> > > > > > > Why is it a problem?
> > > > > >
> > > > > > It cannot be regenerated.
> > > > >
> > > > > This is an issue regardless of your packaging.
> > > > > That is why I suggested a patch in my previous reply.
> > > > >
> > > > > https://lore.kernel.org/linux-kbuild/CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com/
> > > > >
> > > > >
> > > > > Anyway, please try next-20210602
> > > > > and see if you still have a problem.
> > > >
> > > > Yes, I still have a problem.
> > > >
> > > > My packaging script calls mkmakefile which no longer exists.
> > >
> > >
> > > So, we are not talking about the functionality any more.
> > >
> > > What is important for you is, you have a separate file.
> > >
> > > You overwrite scripts/mkmakefile for doing
> > > whatever hacks you like.
> > >
> > > If the code is moved into the Makefile,
> > > it will be more difficult to insert hacks.
> > >
> > > This is what I understood from your statement.
> >
> > I did not insert hacks. I called the script that your patch removes.
> 
> 
> You can copy scripts/mkmakefile
> to your packaging project if it is needed.
> 
> It is a very short code that generates two lines.
> 
> cat << EOF > Makefile
> # Automatically generated by $0: don't edit
> include $1/Makefile
> EOF
> 
> You can also copy-paste it to your packaging script.

Hello

In fact the mkmakefile script dropped support for the second argument
that tells it where to genereate the makefile and thus became unusable
for packaging some time ago already.

With simplification of the makefile to the point it is trivial no script
to regenereate it is necessary. It can be generated with a simple echo
command.

Thanks

Michal
