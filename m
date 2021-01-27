Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A138306398
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 19:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232300AbhA0Swu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jan 2021 13:52:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55543 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232064AbhA0Swq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jan 2021 13:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611773480;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mF61cZgsITSGEqXTWGfoLqDo/tPq9X9q/y5wFM1TLDw=;
        b=Rd9HULBE6FkYuPRPB5FIjMBw614zoghZfieTFaPJFX+SL5pIhBcxfdusf5zBFSSjbMpNQU
        bgIUF5N0UirpPePR59FeGLm51Gzz6KdV9VQ3vArt/IcHSWc2/e7jPzKSMo/UBUvg9CQVTh
        n1bqaMKdQaNwplyJZ8jGLBjqAdc1Ar8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-TSafYW7ROO2gEP1B8eSM9g-1; Wed, 27 Jan 2021 13:51:18 -0500
X-MC-Unique: TSafYW7ROO2gEP1B8eSM9g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91E401800D42;
        Wed, 27 Jan 2021 18:51:16 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE5E60C5F;
        Wed, 27 Jan 2021 18:51:15 +0000 (UTC)
Date:   Wed, 27 Jan 2021 12:51:13 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210127185113.c3est2vssf5tlyyq@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210127180215.GA1745339@infradead.org>
 <20210127183856.moe3p5pxw6bbtunk@treble>
 <20210127184327.GA1755516@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210127184327.GA1755516@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 27, 2021 at 06:43:27PM +0000, Christoph Hellwig wrote:
> On Wed, Jan 27, 2021 at 12:38:56PM -0600, Josh Poimboeuf wrote:
> > On Wed, Jan 27, 2021 at 06:02:15PM +0000, Christoph Hellwig wrote:
> > > Please don't add all this garbage.  We only add infrastructure to the
> > > kernel for what the kernel itself needs, not for weird out of tree
> > > infrastructure.
> > 
> > This isn't new, the kernel already has the infrastructure for building
> > out-of-tree modules.  It's widely used.  Are you suggesting we remove
> > it?  Good luck with that...
> > 
> > Either it should be supported, or not.  Make the case either way.  But I
> > can't understand why people are advocating to leave it half-broken.
> 
> 
> It is not support as any kind of interface.  It is a little aid for
> local development.

Is this a joke?  I've never met anybody who builds OOT modules as a
development aid...

On the other hand I know of several very popular distros (some paid,
some not) who rely on allowing users/partners to build OOT modules as
part of their ecosystem.  To say it's not supported is a farce.

-- 
Josh

