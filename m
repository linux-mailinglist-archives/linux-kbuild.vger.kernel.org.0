Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AFF432DFB6
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 03:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCEClw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 21:41:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26182 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229436AbhCEClu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 21:41:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614912110;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Pn33AdVmvC3/0IQYEhPgzHpY70aPmcFl05zItmBqzEA=;
        b=MIzdJPs33X7F56r+JiW4fpEsYLd8VK0pVXuB90k0JzJqZyMhXuhJw5OnzojLnX/cVDJrjO
        Ov/OGUQWdIPQTSu9LnVjd08qXTGiFs6sx1HyqS5MH0uI/Z8ztoC0uZL5zI6nx22QYiADpP
        XF/rus9XyzwM2WFU6zcRzaJs0Zw5qxg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-RZYz0z8bNPuQCSne957cWg-1; Thu, 04 Mar 2021 21:41:46 -0500
X-MC-Unique: RZYz0z8bNPuQCSne957cWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AFBD57;
        Fri,  5 Mar 2021 02:41:45 +0000 (UTC)
Received: from treble (ovpn-113-161.rdu2.redhat.com [10.10.113.161])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FC8D5C1A1;
        Fri,  5 Mar 2021 02:41:43 +0000 (UTC)
Date:   Thu, 4 Mar 2021 20:41:40 -0600
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
Message-ID: <20210305024140.fv4i4ujreem2w7sw@treble>
References: <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble>
 <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble>
 <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble>
 <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
 <20210304150812.rzya7ewmerwhe4m4@treble>
 <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
 <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 04, 2021 at 11:12:42AM -0800, Linus Torvalds wrote:
> On Thu, Mar 4, 2021 at 7:36 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > All the kernel-space objects are rebuilt
> > when the compiler is upgraded.
> 
> I very much NAK'ed that one. Why did that go in?
> 
> Or maybe I NAK'ed another version of it (I think the one I NAK'ed was
> from Josh), and didn't realize that there were multiple ones.

This thread is making me dizzy, but I think the patch you NAK'ed from me
was different.  It just added an error on GCC mismatch with external
modules:

  https://lkml.kernel.org/r/fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com

though I think you were ok with downgrading it to a warning.

-- 
Josh

