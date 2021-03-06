Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428E532F7E8
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Mar 2021 03:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhCFCve (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 21:51:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27974 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229701AbhCFCvO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 21:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614999069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=++7DcKSf9hOj91f+XMYFeWkJNgQ9ogj9a8AP84qU87E=;
        b=JzbD2YsbfsurOg2vc3gghysdD9DHN82XyUXkyyjqxIhhix4UtewUiEKhuhfhPFnN5zVXRr
        2UeNMs67QJ+XfE7bbK9ZaMmobGE3gt+q/T139tJNJqe6fgzSFAqdFMupH7VFrKwqsEMO1B
        iZYE5ge90ebHZQ3UbojSGYCfvFd+4yM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-aqXXq4NYNOCCDIpKMWr2ag-1; Fri, 05 Mar 2021 21:51:07 -0500
X-MC-Unique: aqXXq4NYNOCCDIpKMWr2ag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8FA78015B7;
        Sat,  6 Mar 2021 02:51:05 +0000 (UTC)
Received: from treble (ovpn-112-85.rdu2.redhat.com [10.10.112.85])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6631D5C1C2;
        Sat,  6 Mar 2021 02:51:02 +0000 (UTC)
Date:   Fri, 5 Mar 2021 20:50:59 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Frank Eigler <fche@redhat.com>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH] kbuild: rebuild GCC plugins when the compiler is upgraded
Message-ID: <20210306025059.z6dn6mi7mxyufkr2@treble>
References: <20210304113708.215121-1-masahiroy@kernel.org>
 <202103041518.22EB819E@keescook>
 <CAHk-=wj6t2i1BgmWP1Zb2WVF3zZzkHvsxsALJk7VpfKm6UgLcw@mail.gmail.com>
 <20210305022500.cyi3cfwgt2t6mona@treble>
 <20210306012815.nfmquoln65vq6yq7@treble>
 <CAK7LNAR7E4Ud9MPy3q5VOab4EFMumr5GMHqyv=H970+gPTBrFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAR7E4Ud9MPy3q5VOab4EFMumr5GMHqyv=H970+gPTBrFg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 06, 2021 at 11:18:31AM +0900, Masahiro Yamada wrote:
> On Sat, Mar 6, 2021 at 10:28 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > On Thu, Mar 04, 2021 at 08:25:00PM -0600, Josh Poimboeuf wrote:
> > > On Thu, Mar 04, 2021 at 03:37:14PM -0800, Linus Torvalds wrote:
> > > > On Thu, Mar 4, 2021 at 3:20 PM Kees Cook <keescook@chromium.org> wrote:
> > > > >
> > > > > This seems fine to me, but I want to make sure Josh has somewhere to
> > > > > actually go with this. Josh, does this get you any closer?
> > >
> > > No, this doesn't seem to help me at all.
> > >
> > > > > It sounds like the plugins need to move to another location for
> > > > > packaged kernels?
> > > >
> > > > Well, it might be worth extending the stuff that gets installed with
> > > > /lib/modules/<kernel-version>/ with enough information and
> > > > infrastruvcture to then build any external modules.
> > >
> > > The gcc plugins live in scripts/, which get installed by "make
> > > modules_install" already.  So the plugins' source and makefiles are in
> > > /lib/modules/<kernel-version>/build/scripts/gcc-plugins.
> > >
> > > So everything needed for building the plugins is already there.  We just
> > > need the kernel makefiles to rebuild the plugins locally, when building
> > > an external module.
> >
> > This seems to work with very limited testing...  Based on top of
> > Masahiro's recent patch:
> >
> >   https://lkml.kernel.org/r/CAK7LNARHoTnZ3gAvHgnYB4n-wYuboxC10A6zURh1ODGhxWd2yA@mail.gmail.com
> 
> Is this a bad coding contest?
> 
> I am not asking you to add ugly ifeq or whatever
> hacks to say "this worked for me".
> 
> Please feel free to do this in the fedora kernel,
> but do not send it to upstream.
> 
> Sorry, I really do not want to see hacks like this any more.

Geez, that's a bit harsh.  I never claimed to be a brilliant makefile
coder.  Do you have any constructive feedback for improving the patch?

> Remember, how badly objtool was integrated in the build system,
> and you even blocked me from fixing that.

I have no idea what you're talking about, nor how it would be relevant
to this patch.

-- 
Josh

