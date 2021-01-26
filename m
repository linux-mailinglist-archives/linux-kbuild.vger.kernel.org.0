Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4CF3043AD
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 17:22:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392856AbhAZQV4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 11:21:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46787 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2392852AbhAZQVK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 11:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611677982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=OkRiY5ow5UKClr4i0QoBZwnQcXWa51RD9uvqs2Ng6cs=;
        b=QDV/4qnS79Sggec0Zqo3CHsTTHoeEEwK5Eym38ahXBDfrnym5hUDP/UorcHh3LuLaAAIuS
        CpNznKsmsY9JbB/getKZJlqDoxazqyUyaKS+XYBWBlNrxV3b971czRr9WxdXuGtpH5bKwF
        mMtJ7bhG1jLkO5hpYBMM0hbb30ScMwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-32-MdJ5HRgVMcuTlAbJ4OK0YA-1; Tue, 26 Jan 2021 11:19:40 -0500
X-MC-Unique: MdJ5HRgVMcuTlAbJ4OK0YA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE7D91081B3C;
        Tue, 26 Jan 2021 16:19:37 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 405696B8DD;
        Tue, 26 Jan 2021 16:19:36 +0000 (UTC)
Date:   Tue, 26 Jan 2021 10:19:34 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Justin Forbes <jforbes@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>, Greg KH <greg@kroah.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210126161934.z6sng4irl5teonvj@treble>
References: <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com>
 <20210126145155.kcfbnzfqg5qugvcl@treble>
 <YBAyGU7H8E98xKng@hirez.programming.kicks-ass.net>
 <20210126154651.itfrnhwfistia3ss@treble>
 <YBA9r13+1uuyDYuR@hirez.programming.kicks-ass.net>
 <CAFbkSA1CibJ6sp+LPLy3hpchLLH2B5__Lk31TLeVThXi5eZV7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFbkSA1CibJ6sp+LPLy3hpchLLH2B5__Lk31TLeVThXi5eZV7Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 10:15:52AM -0600, Justin Forbes wrote:
> On Tue, Jan 26, 2021 at 10:05 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Tue, Jan 26, 2021 at 09:46:51AM -0600, Josh Poimboeuf wrote:
> > > On Tue, Jan 26, 2021 at 04:15:37PM +0100, Peter Zijlstra wrote:
> > > > On Tue, Jan 26, 2021 at 08:51:55AM -0600, Josh Poimboeuf wrote:
> > > > > User space mixes compiler versions all the time.  The C ABI is stable.
> > > > >
> > > > > What specifically is the harder issue you're referring to?
> > > >
> > > > I don't think the C ABI captures nearly enough. Imagine trying to mix a
> > > > compiler with and without asm-goto support (ok, we fail to build without
> > > > by now, but just imagine).
> > > >
> > > > No C ABI violated, but having that GCC extention vs not having it
> > > > radically changes the kernel ABI.
> > > >
> > > > I think I'm with Greg here, just don't do it.
> > >
> > > Ok, thank you for an actual example.  asm goto is a good one.
> > >
> > > But it's not a cut-and-dry issue.  Otherwise how could modversions
> > > possibly work?
> > >
> > > So yes, we should enforce GCC versions, but I still haven't seen a
> > > reason it should be more than just "same compiler and *major* version".
> >
> > Why bother? rebuilding the kernel and all modules is a matter of 10
> > minutes at most on a decently beefy build box.
> >
> > What actual problem are we trying to solve here?
> 
> This is true for those of us used to working with source and building
> by hand. For users who want everything packaged, rebuilding a kernel
> package for install is considerably longer, and for distros providing
> builds for multiple arches, we are looking at a couple of hours at
> best.  From a Fedora standpoint, I am perfectly fine with it failing
> if someone tries to build a module on gcc10 when the kernel was built
> with gcc11.  It's tedious when the kernel was built with gcc11
> yesterday, and a new gcc11 build today means that kernel needs to be
> rebuilt.

Right.  It's a problem for distro users.  The compiler and kernel are in
separate packages, with separate release cadences.  The latest compiler
version may not exactly match what was used to build the latest kernel.

-- 
Josh

