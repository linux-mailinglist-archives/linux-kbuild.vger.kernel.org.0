Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EDB30809B
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 22:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231374AbhA1Vfo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 16:35:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54037 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229596AbhA1Vfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 16:35:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611869657;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=57t5IEFW55dtVez1wzr0cQ3lFQ9NLibehfOHwQswbsw=;
        b=UVJr7MEI/h/sIFOsTeerkeOf+7/hFMVHrWEQk8EHErBKFbU5OtEs8EnpleEglMKxEwzYCs
        tlJU3OTpbk+WbX2qPZy1kNMYbLgwmXeyVaccAvMLI6wPYQHhnmkknytZZAadmOLahW2xco
        S7QeOUN6ubNpYfof9v9XN2YK2VmQMDE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-2XkRJHRdONmXO1wBy5yXBg-1; Thu, 28 Jan 2021 16:34:16 -0500
X-MC-Unique: 2XkRJHRdONmXO1wBy5yXBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7741A8030A2;
        Thu, 28 Jan 2021 21:34:13 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 757636F98B;
        Thu, 28 Jan 2021 21:34:11 +0000 (UTC)
Date:   Thu, 28 Jan 2021 15:34:09 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>,
        David Laight <David.Laight@aculab.com>,
        Jessica Yu <jeyu@kernel.org>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external
 modules
Message-ID: <20210128213409.qxnclchjyq6v23up@treble>
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
 <20210128205207.awdbh4bmx56pxxjl@treble>
 <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
 <CAHk-=wh+3PWi2NuoQ0hbSyLpOHjaBWKcgX6N7+PfPkXzNAfMwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wh+3PWi2NuoQ0hbSyLpOHjaBWKcgX6N7+PfPkXzNAfMwA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 01:23:11PM -0800, Linus Torvalds wrote:
> On Thu, Jan 28, 2021 at 1:03 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I really think the whole compiler version check is purely voodoo programming.
> 
> .. but there are obviously potentially things we - in the kernel - do
> that may make certain compiler versions incompatible. We long long ago
> used to have things like "you can't have an empty struct because gcc
> version x.y.z doesn't support it", so even a UP spinlock would be
> 
>        typedef struct { int gcc_is_buggy; } raw_spinlock_t;
> 
> but only if you compiled it with a version of gcc older than 3.0. So
> compiling one file with one compiler, and another with a newer one,
> would result in the data structures simply not having the same layout.
> 
> That's not because of compiler versions per se, it's because of our
> version checks.

Right, this is what I'm trying to say.  We have features based on
compiler version checks.  Peterz pointed out asm goto as a previous
example.

> THAT workaround is long gone, but I didn't check what other ones we
> might have now. But the gcc version checks we _do_ have are not
> necessarily about major versions at all (ie I trivially found checks
> for 4.9, 4.9.2, 5.1, 7.2 and 9.1).

Then maybe the check should be same major.minor?

And convert it to a strongly worded warning/disclaimer?

-- 
Josh

