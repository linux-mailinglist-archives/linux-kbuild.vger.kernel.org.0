Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2DB632F3B8
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 20:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbhCETSz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 14:18:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41681 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229465AbhCETSo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 14:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614971924;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wo3BPsLRoEcARqi/I2GE+yDj8s8Utt89EBG5Ym/er0o=;
        b=FNWkDtKaIDeZedOig+LjwICewusz8YBlxUkqnImFuuCkyZ9HBDp600HHLx6MVvMtITGBXO
        QVoE1OAUm36OnWeojNZhZAGUSx49zP+nONW1/yp+0grfyNuHImWGhyIUzED4ksCkVu1ig0
        mSav5jFtk0YK0l+fSUsXTMV4bWxRaVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-UJwHOQoCN-2BC7Rin_2KHg-1; Fri, 05 Mar 2021 14:18:42 -0500
X-MC-Unique: UJwHOQoCN-2BC7Rin_2KHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08D4E800D53;
        Fri,  5 Mar 2021 19:18:41 +0000 (UTC)
Received: from treble (ovpn-116-51.rdu2.redhat.com [10.10.116.51])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EE9A5D6B1;
        Fri,  5 Mar 2021 19:18:38 +0000 (UTC)
Date:   Fri, 5 Mar 2021 13:18:35 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
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
Message-ID: <20210305191835.4e54dei3dmslbo3a@treble>
References: <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble>
 <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble>
 <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
 <20210304150812.rzya7ewmerwhe4m4@treble>
 <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
 <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com>
 <20210305024140.fv4i4ujreem2w7sw@treble>
 <CAK7LNAR3FW8wQe6Zsbj86LQpY4=ASC7Zec-HN4D70FNZcQk0_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAR3FW8wQe6Zsbj86LQpY4=ASC7Zec-HN4D70FNZcQk0_Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Mar 06, 2021 at 01:03:32AM +0900, Masahiro Yamada wrote:
> > Ok.  So it sounds like the best/easiest option is the original patch in
> > this thread:  when building an external module with a GCC mismatch, just
> > disable the GCC plugin, with a warning (or an error for randstruct).
> 
> Just for clarification,
> I believe "the original patch" pointed to this one:
> https://lore.kernel.org/lkml/efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com/
> 
> This is dead. Please do not come back to this.

Sorry, no.  The patch may have been crap, but that doesn't make the
problem I'm trying to solve any less valid.

> See negative comments not only from me, but also from Greg, Peter,
> Christoph.

I responded to those.  Summarizing my replies once again...


- "External modules aren't supported"

  This doesn't even remotely match reality.  Are you honestly using this
  "negative comment" as a reason to NAK the patch?


- "External modules must be built with the same GCC version"

  As has been stated repeatedly, by Linus and others, there's no
  technical reason behind this claim.  It ignores the realities of how
  distros release the kernel and compiler independently, with separate
  cadences.  Minor variances in compiler version are ABI compatible.

  Also, for features which are dependent on compiler version, many of
  those are now enabled by kbuild.  As I suggested to you previously,
  kbuild should warn when such features get disabled (which can happen
  due to a compiler/toolchain change or due to a .config copied from
  another system).

-- 
Josh

