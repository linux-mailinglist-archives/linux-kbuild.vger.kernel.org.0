Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD5C400A58
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 10:02:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231925AbhIDIDA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 04:03:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28765 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233750AbhIDICn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 04:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630742476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dbDmMaToSJQ6dPIHh+SXBa8mY/4mUayITASUyPnbVTQ=;
        b=Fq52IBk8aWSUrDQXWNT3Uw9NDCUpnTga5fh+JLoUCAe7oYntBr7Oz+xISgEvkJLYZ+oK8U
        UYFxDLzwm0Yje5mATQWLLgSNWDDOkgfNd/IgsJCjKefvAJtqJzPfM0e/GHwpN09vgpRo4v
        An9TYWhN5n8J8ymPq/ed6+sofn6WHXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-NdC7YETuM32Sga8gJDFeqQ-1; Sat, 04 Sep 2021 04:01:13 -0400
X-MC-Unique: NdC7YETuM32Sga8gJDFeqQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E270B10054F6;
        Sat,  4 Sep 2021 08:01:11 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.194.140])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9815D6A1;
        Sat,  4 Sep 2021 08:01:09 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
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
Date:   Sat, 04 Sep 2021 10:01:07 +0200
In-Reply-To: <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> (Nathan
        Chancellor's message of "Fri, 3 Sep 2021 16:04:50 -0700")
Message-ID: <878s0c4vng.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

* Nathan Chancellor:

> We set up the linux-toolchains mailing list after Plumbers 2020 to
> have a common place that kernel developers can bring issues and
> discussion to both clang and GCC folks. I am not sure who exactly from
> the GCC world is subscribed but I have added it now to see.

Someone said that they =E2=80=9Cagree with the reasoning=E2=80=9D, but the =
original
patch does not provide one.  It looks like it's about preventing the use
of compiler-supplied header files, but even that doesn't really answer
the question: why?

Especially since some parts of the kernel actually need some of those
header files.

Thanks,
Florian

