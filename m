Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12EFC32C24C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhCCX7h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 18:59:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30294 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1388035AbhCCUd0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 15:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614803519;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rp8C696QhKx8WEsv8npjzvCJHKF8U4KwqfIW0LL6UTo=;
        b=Pi6r3i72j7HR3ZrAoy9duVv3/4e57Br+IeG+iJZ+AzncZ3r7fK6xrP/rJl9H5m0i1/pyQF
        zaxugn4zH/9CG0/EkPumQ6eKUPjmFJ9IbkBeXG2eq88VmzlhGyT0bFtLJh+VRPhinR8oF4
        8eX66NvjcE0sg25Arz8xXVBR2dLmu4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-ExOu-U9oO0eSbnF6gui41A-1; Wed, 03 Mar 2021 15:31:58 -0500
X-MC-Unique: ExOu-U9oO0eSbnF6gui41A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42B5C514A;
        Wed,  3 Mar 2021 20:31:56 +0000 (UTC)
Received: from treble (ovpn-114-218.rdu2.redhat.com [10.10.114.218])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A645360BFA;
        Wed,  3 Mar 2021 20:31:53 +0000 (UTC)
Date:   Wed, 3 Mar 2021 14:31:50 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210303203150.jwupthv6siil6tn2@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble>
 <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble>
 <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble>
 <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210303202406.bxgdx5a25j6wc43b@treble>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 03, 2021 at 02:24:12PM -0600, Josh Poimboeuf wrote:
> On Wed, Mar 03, 2021 at 11:57:33AM -0800, Linus Torvalds wrote:
> > On Wed, Mar 3, 2021 at 11:38 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > >
> > > > But in the meantime, making the plugins depend on the gcc version some
> > > > way is certainly better than not doing so.
> > >
> > > So currently, the plugins already so that.  They require the GCC version
> > > to be exact.  If there's a mismatch, then it fails the OOT module build.
> > 
> > That's not my experience.
> > 
> > Yes, the build fails, but it fails not by _rebuilding_, but by failing
> > with an error.
> 
> Um, that's what I said.  It does not rebuild.  It fails with an error.
> 
> The *proposal* is to rebuild the plugin -- which Masahiro nacked because
> he claims GCC mismatches aren't supported for OOT builds (plugin or
> not).
> 
> Your nack is for a different reason: GCC plugins are second-class
> citizens.  Fair enough...

Or was it a nack? :-)  Reading your message again, I may have
misinterpreted.  Put simply, should we rebuild plugins when the GCC
version changes?

-- 
Josh

