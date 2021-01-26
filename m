Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46A6304D01
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 00:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731422AbhAZXA5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39706 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390738AbhAZSov (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611686605;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=yMVM7jzABhWKKzh8hHr/9KIVGtxgSH9kKvoBCQuc4S0=;
        b=anXpDQ19uCh/xfTtBYdFq+Xt2Hy+5Zg0mR4EOHoLNdplyQzaMq9BWPE2KVFGqvCg0h8c2V
        S2LTnAvreyQE7bnZYPib7WytLYll7IhdfE70hwOaBMMFf01BbAt/4Qh6HAXhpI6oxTGenN
        fas+mz8AiKHUxqCJUJ0XYbzcPyQ5M5Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-X-LITH48PKSeuToFmu0dYg-1; Tue, 26 Jan 2021 13:43:21 -0500
X-MC-Unique: X-LITH48PKSeuToFmu0dYg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20336802B42;
        Tue, 26 Jan 2021 18:43:20 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 736855D6AD;
        Tue, 26 Jan 2021 18:43:18 +0000 (UTC)
Date:   Tue, 26 Jan 2021 12:43:16 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <20210126184316.hpcy6gqp5vsq6ckq@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <202101251401.F18409FDD1@keescook>
 <20210125221953.wng3gk3qc32eahil@treble>
 <202101260955.F83D191B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202101260955.F83D191B@keescook>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 09:56:10AM -0800, Kees Cook wrote:
> On Mon, Jan 25, 2021 at 04:19:53PM -0600, Josh Poimboeuf wrote:
> > On Mon, Jan 25, 2021 at 02:03:07PM -0800, Kees Cook wrote:
> > > On Mon, Jan 25, 2021 at 02:42:10PM -0600, Josh Poimboeuf wrote:
> > > > When a GCC version mismatch is detected, print a warning and disable the
> > > > plugin.  The only exception is the RANDSTRUCT plugin which needs all
> > > > code to see the same struct layouts.  In that case print an error.
> > > 
> > > I prefer this patch as-is: only randstruct needs a hard failure. The
> > > others likely work (in fact, randstruct likely works too).
> > 
> > I'm curious about this last statement, why would randstruct likely work?
> > 
> > Even struct module has '__randomize_layout', wouldn't basic module init
> > go splat?
> 
> No; the seed is part of the generate includes -- you'll get the same
> layout with the same seed.

Right, but don't you need the plugin enabled to make use of that seed,
so the structs get interpreted properly by the module?  Or am I
completely misunderstanding how this plugin works?

-- 
Josh

