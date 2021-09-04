Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BA9400BE0
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 17:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236798AbhIDPUd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 11:20:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43972 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230514AbhIDPUd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 11:20:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630768771;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zvDeup5okN2+a9recacvzIyRt8oQsyaj87C3UrFckM0=;
        b=aCX9K6luu9eqsiplCHNWOLXh0hXNL2smLL+Zc+K1RFFUz8lITMbAY7u/4rIAoMKm+1coVc
        ya52CAirO5/I49DQE4nINeiARMLhYQcA0LTcyI/mhzxRVsOuO38Jd3FZpxteT7KGizrln3
        mLMOndYj4ZOvyR7HuzJpnUZuzWeKESQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-523-B4_Nd3ZlP523hyVUeBxjYg-1; Sat, 04 Sep 2021 11:19:27 -0400
X-MC-Unique: B4_Nd3ZlP523hyVUeBxjYg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E763E8145E5;
        Sat,  4 Sep 2021 15:19:25 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.194.140])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 28C55189C4;
        Sat,  4 Sep 2021 15:19:22 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
        <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
        <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org>
        <878s0c4vng.fsf@oldenburg.str.redhat.com>
        <20210904131911.GP1583@gate.crashing.org>
Date:   Sat, 04 Sep 2021 17:19:21 +0200
In-Reply-To: <20210904131911.GP1583@gate.crashing.org> (Segher Boessenkool's
        message of "Sat, 4 Sep 2021 08:19:11 -0500")
Message-ID: <871r644bd2.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

* Segher Boessenkool:

> Let me quote the original mail (I had to dig it out of the archives as
> well, no nice threading, too lazy, sorry):

It still doesn't say why.  I did see a reference to fleeting reference
to <stdatomic.h> and <float.h>.

My conjecture is that the real reason is avoid atomic emulation
(softatomic?)  and softfloat code.  It's not related to <stdarg.h> at
all: this header is replaced so that GCC's include subdirectory can be
dropped from the include search path.  What I don't know if this is to
avoid obscure linker failures related to libatomic/softfloat (obviously
not great) or run-time failures (worse).

In any case, it would be nice to know what the real motivation is.

After all, <stdatomic.h> is exactly like <stdarg.h> in that it's
possible to use its functionality even without the header file.  The
__atomic builtins are even documented in the GCC manual (unlike
<stdatomic.h>), which is why some programmers prefer them over the
standard interface.  And then there's the _Atomic keyword itself, whose
use can easily result in calls to libatomic functions, too.  So blocking
<stdatomic.h> makes little sense to me.

I don't know enough about softfloat if blocking the inclusion of
<float.h> is worth it.

Thanks,
Florian

