Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A610A32C3B8
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhCCX7i (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 18:59:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30981 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1389802AbhCCVrP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 16:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614807943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=/LUNLY/w0+Bzk+kXfX0uauiVFlX2RwNcK9iVLBJ9IPA=;
        b=f579Zj3mB4jMdJlThoz54Z2ccesSfd+Vdgn6OJQxFeHyd6hu/32Hza6i1MsPHH1WmcMNhC
        A3toBuBwwgI5P7KCMT1BWxJWTbyqmap/dz8L4i3ZMwSs9Fj7WBPCv4h4VH/kMcViHOYAzr
        yjeZolOBSKsj14W9OFWZLrZPl9388Hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-xR35m5hIMDWHSE7CU3j2Fg-1; Wed, 03 Mar 2021 16:45:42 -0500
X-MC-Unique: xR35m5hIMDWHSE7CU3j2Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3C6CB1E561;
        Wed,  3 Mar 2021 21:45:40 +0000 (UTC)
Received: from treble (ovpn-114-218.rdu2.redhat.com [10.10.114.218])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A435D741;
        Wed,  3 Mar 2021 21:45:37 +0000 (UTC)
Date:   Wed, 3 Mar 2021 15:45:34 -0600
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
Message-ID: <20210303214534.guyoxcwrgxgcqzy4@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble>
 <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble>
 <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble>
 <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble>
 <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 03, 2021 at 12:56:52PM -0800, Linus Torvalds wrote:
> On Wed, Mar 3, 2021 at 12:24 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > Your nack is for a different reason: GCC plugins are second-class
> > citizens.  Fair enough...
> 
> MNo, I didn't NAK it. Quite the reverser.
> 
> I am ABSOLUTELY against rebuilding normal object files just because
> gcc versions change. A compiler version change makes zero difference
> for any normal object file.
> 
> But the gcc plugins are different. They very much _are_ tied to a
> particular gcc version.
> 
> Now, they are tied to a particular gcc version because they are
> horribly badly done, and bad technology, and I went off on a bit of a
> rant about just how bad they are, but the point is that gcc plugins
> depend on the exact gcc version in ways that normal object files do
> _not_.

Thanks, reading comprehension is hard.  I realized after re-reading that
I interpreted your "plugins should depend on the kernel version"
statement too broadly.

Masahiro, any idea how I can make the GCC version a build dependency?

-- 
Josh

