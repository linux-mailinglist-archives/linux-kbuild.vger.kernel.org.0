Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73D7394A99
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 May 2021 07:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2Fgv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 May 2021 01:36:51 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:36456 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhE2Fgv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 May 2021 01:36:51 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
        (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B073F21915;
        Sat, 29 May 2021 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622266514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IruQw+sP3FcUyEyB6OmkDCTJaBHjzPDejNTz9t8cdss=;
        b=q9GrHYTRYRxil5zszN5QH3w8/VG/d+efJx332oaifGLsmVYx41dsOVKhVUrug9DlkTi5Ft
        09/T8QKSwCrwPB1hQD5s09c7sCT6aS+R7vfohHZi6T4tg5lO9jEfxOuZtfGB1fzzE0rI7A
        YkZd3IzezSatC6t7QaTA+sGiHq7ctJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622266514;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IruQw+sP3FcUyEyB6OmkDCTJaBHjzPDejNTz9t8cdss=;
        b=Lz1QyVGvjYLaeXayk4nSRt+1LSsAiWf573RIhkJinARPLQOU6hb3neDca8DkXi2LNggPq9
        ry0YYTjBfH+0zGBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
        by imap.suse.de (Postfix) with ESMTP id 4B3CE118DD;
        Sat, 29 May 2021 05:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1622266514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IruQw+sP3FcUyEyB6OmkDCTJaBHjzPDejNTz9t8cdss=;
        b=q9GrHYTRYRxil5zszN5QH3w8/VG/d+efJx332oaifGLsmVYx41dsOVKhVUrug9DlkTi5Ft
        09/T8QKSwCrwPB1hQD5s09c7sCT6aS+R7vfohHZi6T4tg5lO9jEfxOuZtfGB1fzzE0rI7A
        YkZd3IzezSatC6t7QaTA+sGiHq7ctJE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1622266514;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IruQw+sP3FcUyEyB6OmkDCTJaBHjzPDejNTz9t8cdss=;
        b=Lz1QyVGvjYLaeXayk4nSRt+1LSsAiWf573RIhkJinARPLQOU6hb3neDca8DkXi2LNggPq9
        ry0YYTjBfH+0zGBQ==
Received: from director2.suse.de ([192.168.254.72])
        by imap3-int with ESMTPSA
        id +9BKEZLSsWCpSwAALh3uQQ
        (envelope-from <msuchanek@suse.de>); Sat, 29 May 2021 05:35:14 +0000
Date:   Sat, 29 May 2021 07:35:13 +0200
From:   Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "kbuild: merge scripts/mkmakefile to top Makefile"
Message-ID: <20210529053512.GT8544@kitsune.suse.cz>
References: <20210526173855.5963-1-msuchanek@suse.de>
 <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz>
 <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Authentication-Results: imap.suse.de;
        none
X-Spam-Level: 
X-Spam-Score: 0.00
X-Spamd-Result: default: False [0.00 / 100.00];
         ARC_NA(0.00)[];
         DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
         TO_DN_ALL(0.00)[];
         FROM_HAS_DN(0.00)[];
         RCPT_COUNT_THREE(0.00)[4];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         RCVD_NO_TLS_LAST(0.10)[];
         RCVD_COUNT_TWO(0.00)[2];
         RCVD_VIA_SMTP_AUTH(0.00)[]
X-Spam-Flag: NO
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 29, 2021 at 02:15:55AM +0900, Masahiro Yamada wrote:
> On Thu, May 27, 2021 at 5:28 AM Michal Suchánek <msuchanek@suse.de> wrote:
> >
> > On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> > > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse.de> wrote:
> > > >
> > > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> > > >
> > > > When packaging the kernel it is built in different place from the one in
> > > > which it will be installed. After build the makefile needs to be
> > > > regenerated with the target location but with mkmakefile merged into
> > > > Makefile tehre is no way to do that.
> > > >
> > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > >
> > > My patch was not working as expected
> > > regardless of packaging.
> > >
> > > Does the following fix-up work for you?
> >
> > For the packaging I need some way to regenerate the Makefile and fake
> > the directory where the Makefile will be on the user system (ie DESTDIR)
> >
> > Without the mkmakefile I do not see any way to do it.
> >
> > If the kernel makefile is no longer location dependent there is no need
> > any more, of course.
> >
> > Thanks
> >
> > Michal
> 
> Sorry, I do not understand this.
> 
> IIUC, this patch does not change any functionality.
> The generated Makefile is still the same.
> Why is it a problem?

It cannot be regenerated.

During package build you have four directories

 - the source directory
 - the build directory
 - the staging directory where files are installed to be included in the
   package
 - the target directory where files will be installed on the target
   system once the package is installed by the user

The makefile is generated for the build directory, not the target
directory. What is needed is a way to generate a makefile in the staging
directory that will work when installed in the target directory.
When mkmakefile is folded into makefile the makefile can no longer be
regenerated because it is up-to-date, and it can no longer be specified
that it should be generated for the target directory, not the staging
directory.

Thanks

Michal
