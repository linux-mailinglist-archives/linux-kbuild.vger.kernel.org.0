Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8E3302EDC
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 23:21:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbhAYWVa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 17:21:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20622 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732315AbhAYWV0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 17:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611613200;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=m3GTxAXy/n7abTboCl2AAMZcR1+hfsyo/eH4M6+Glow=;
        b=IIcm8Y1TApBt0mBMfWYOFquB3xPHKHvynElJ/lK0nfC9aF1C+qPf88tWnkFpuIhAuwgXnb
        Mb55wbkC1DPFAohIU6cq/goQInSLXKI7V1e+kr6PoGJAiBQpOdnls50N40Mhb+eLYJrQQl
        Yl9xlE7UCc10vT1OzueNpGmszRVLfts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-_TXAzB81MEO-MvEgpRfhAA-1; Mon, 25 Jan 2021 17:19:59 -0500
X-MC-Unique: _TXAzB81MEO-MvEgpRfhAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C327AFA83;
        Mon, 25 Jan 2021 22:19:57 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 74C7860C62;
        Mon, 25 Jan 2021 22:19:55 +0000 (UTC)
Date:   Mon, 25 Jan 2021 16:19:53 -0600
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
Message-ID: <20210125221953.wng3gk3qc32eahil@treble>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <202101251401.F18409FDD1@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202101251401.F18409FDD1@keescook>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 25, 2021 at 02:03:07PM -0800, Kees Cook wrote:
> On Mon, Jan 25, 2021 at 02:42:10PM -0600, Josh Poimboeuf wrote:
> > When a GCC version mismatch is detected, print a warning and disable the
> > plugin.  The only exception is the RANDSTRUCT plugin which needs all
> > code to see the same struct layouts.  In that case print an error.
> 
> I prefer this patch as-is: only randstruct needs a hard failure. The
> others likely work (in fact, randstruct likely works too).

I'm curious about this last statement, why would randstruct likely work?

Even struct module has '__randomize_layout', wouldn't basic module init
go splat?

-- 
Josh

