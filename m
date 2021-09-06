Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7BC94016A6
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 08:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229792AbhIFGz2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 02:55:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38301 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239458AbhIFGz2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 02:55:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630911263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=I0Wqq4Jy8iaEMvTgV2vlnpJmZdhB/J5L3qG8Ebh53Cs=;
        b=RlBZBUXiHt8lAQY2HYvXaI0ohzuOpTmqzu6ETw72wxvvFxcG/k9JrLix6wyGk41Q4yioJp
        aJitVMmLjlL0ZxlWnCIBdJN2/eN7V3kqCIJFW2ffB/884ajfM6zZYjT6ovVJSMw+q4Qop0
        F4/nf82+QLmrVkW7LRx5I7Pw2Fb1j0g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-URXiBfWjOkuQsCM7reUm2w-1; Mon, 06 Sep 2021 02:54:20 -0400
X-MC-Unique: URXiBfWjOkuQsCM7reUm2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8718918397A6;
        Mon,  6 Sep 2021 06:54:18 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.194.140])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A11C31045E85;
        Mon,  6 Sep 2021 06:54:15 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        Nathan Chancellor <nathan@kernel.org>,
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
        <871r644bd2.fsf@oldenburg.str.redhat.com>
        <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
Date:   Mon, 06 Sep 2021 08:54:13 +0200
In-Reply-To: <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
        (Linus Torvalds's message of "Sat, 4 Sep 2021 10:22:25 -0700")
Message-ID: <87a6kq2nze.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

* Linus Torvalds:

> On Sat, Sep 4, 2021 at 8:19 AM Florian Weimer <fweimer@redhat.com> wrote:
>>
>> In any case, it would be nice to know what the real motivation is.
>
> I don't know about the original motivation, but the reason I like that
> patch after-the-fact is that I've actually been in situations where I
> test out self-built compilers without installing them.

Does this really simplify matters?  Why wouldn't the gcc compiler driver
find cc1, but not be able to pass the right path options, so that the
include/ subdirectory can be located as well?

> Then it's convenient to have a completely standalone kernel tree.

The final patch in the series is here:

  isystem: delete global -isystem compile option
  <https://lore.kernel.org/linux-kernel/YQhY40teUJcTc5H4@localhost.localdomain/>

It's still not self-contained.  And it seems that there has been quite a
bit of fallout from the removal of <stddef.h>.

> Nobody cares about things like <stdatomic.h> They are completely
> irrelevant for the kernel, exactly because we've always just done our
> own, or used __builtin_xyz() for things.

Apparently, some people care enough about <stdatomic.h> to prevent its
use.  I still have not seen an explanation.  Maybe it's because we
haven't Cc:ed the patch author so far (oops).

Alexey, why are <stdatomic.h> and <float.h> so special that you called
them out in your patch?

If it's about unintended use of libatomic, then maybe we should work on
a proper compiler option that also works for __atomic builtins and the
_Atomic keyword.

Thanks,
Florian

