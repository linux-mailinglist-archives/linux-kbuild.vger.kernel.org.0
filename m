Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02B0432C247
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhCCX7f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 18:59:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60274 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1376961AbhCCTnx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 14:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614800547;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bv5cAMYlaP5qwIgoi2PUPPqfWwaPF9ayOOCbDPpLsEY=;
        b=fqD7u7+wmfT+AN7Wl2pXrorm+uHnyxesofi6AjCPBD6a0OrHRJj1EX3vU01eIvnRqBXlgx
        +hstpnIOoSxtTxQCxKc/uynmkU55PWbM6ObrAM7G8tzADka3cteWjfhBV2s9EHA8ThW4+s
        NTSE1R62yLtvCAxzLFm51pHE1K3EYn8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-3zO5FGdEPoyNzMkrsb1f9Q-1; Wed, 03 Mar 2021 14:38:18 -0500
X-MC-Unique: 3zO5FGdEPoyNzMkrsb1f9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4457E10CE780;
        Wed,  3 Mar 2021 19:38:17 +0000 (UTC)
Received: from treble (ovpn-114-218.rdu2.redhat.com [10.10.114.218])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EBD1518AD4;
        Wed,  3 Mar 2021 19:38:14 +0000 (UTC)
Date:   Wed, 3 Mar 2021 13:38:06 -0600
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
Message-ID: <20210303193806.oovupl4ubtkkyiih@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble>
 <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble>
 <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 03, 2021 at 11:25:34AM -0800, Linus Torvalds wrote:
> On Wed, Mar 3, 2021 at 11:15 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > Adding Linus, who indicated in another thread that we shouldn't force
> > exact GCC versions because there's no technical reason to do so.
> 
> I do not believe we should recompile everything just because the gcc
> version changes.
> 
> But gcc _plugins_ certainly should depend on the kernel version.
> 
> Very few people should be enabling the gcc plugins in the first place.
> Honestly, most of them are bad, and the people who really care about
> those things have already moved to clang which does the important
> parts natively without the need for a plugin. I'm personally waiting
> for the day when we can just say "let's remove them".

You might be sad to learn that some of the plugins are useful for
hardening of a production distro kernel, like stackleak and structleak.

> But in the meantime, making the plugins depend on the gcc version some
> way is certainly better than not doing so.

So currently, the plugins already so that.  They require the GCC version
to be exact.  If there's a mismatch, then it fails the OOT module build.

But that's not usable for a distro.  When users build OOT modules with a
slight GCC mismatch, it breaks the build, effectively requiring the
exact same GCC version for *all* OOT builds going forward.

So there have been a few proposals to better handle GCC version
mismatches:

1) disable the plugin - this works fine for most plugins except
   randstruct

2) rebuild the plugin whenever the GCC version changes

3) fail the build, like today - effectively blocks distros from using
   plugins

-- 
Josh

