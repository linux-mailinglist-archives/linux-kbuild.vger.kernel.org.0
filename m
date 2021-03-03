Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7359732C20E
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387666AbhCCTcm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39024 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1387217AbhCCTQx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 14:16:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614798927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bz4CI8McQx8p5ZXoYfBIb+l3Y+3kXiSbTdBrsMcZ7oY=;
        b=MzVEhKhwIJ70Rahy3Kz2UmOn+jFioJWHkI+tvl88zc9iA7Oyl2rsdsXLY7BKRhLQmmzPh5
        37Mkjj38vJcgY9FGXFMKoho/LPehJQsuJSTLJcPzF11BaUhJi02C0y/95v5pk+WCBwdcJg
        +YIHLBzEBxBEJGvr146YJ0KX9jfsUBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-METF-eXEMFmv3tb7sfismw-1; Wed, 03 Mar 2021 14:15:23 -0500
X-MC-Unique: METF-eXEMFmv3tb7sfismw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BF4A9F934;
        Wed,  3 Mar 2021 19:15:21 +0000 (UTC)
Received: from treble (ovpn-114-218.rdu2.redhat.com [10.10.114.218])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E3D4E58821;
        Wed,  3 Mar 2021 19:15:18 +0000 (UTC)
Date:   Wed, 3 Mar 2021 13:15:16 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Frank Eigler <fche@redhat.com>,
        Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210303191516.6ksxmng4pis7ue4p@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble>
 <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 04, 2021 at 03:49:35AM +0900, Masahiro Yamada wrote:
> > This problem is becoming more prevalent.  We will need to fix it one way
> > or another, if we want to support distro adoption of these GCC
> > plugin-based features.
> >
> > Frank suggested a possibly better idea: always rebuild the plugins when
> > the GCC version changes.
> 
> 
> That is just another form of the previous patch,
> which was already rejected.
> 
> 
> - That is a hack just for external modules
> - Our consensus is, use the same version for the kernel and external modules
> 
> 
> 
> I use Ubuntu, and I do not see such a problem.
> (I have never seen it on Debian either, except sid.)
> 
> I see Fedora providing GCC whose version is different
> from the one used for building the kernel.
> That is a problem on the distribution side.

I don't understand.  Are you suggesting that a distro should always
release GCC and kernel updates simultaneously?

How is this problem specific to Fedora?  Please be specific about what
Ubuntu and Debian do, which Fedora doesn't do.

Adding Linus, who indicated in another thread that we shouldn't force
exact GCC versions because there's no technical reason to do so.

-- 
Josh

