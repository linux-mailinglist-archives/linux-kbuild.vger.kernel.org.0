Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B99B40888B
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 11:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238850AbhIMJwF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 05:52:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33790 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238809AbhIMJwD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 05:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631526647;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FWYCzeGtceqA/rq/kRIZJcCWrApBFOcolNNuHNemAH8=;
        b=EMaGuPL5SqWRRfaB/RdGMbH4mrLMXbINagBHPkKNl+T+yJC3jcjt8jWNsRbgHTQzoC4Pfz
        +uo3zp0vg9GwdXIHPetGGvesz+9VDb28CsSyT1JFarMekGE0F6SrBUdjCHqXZlWzCCFsm0
        e72WiqoAEKrmm+05LRdDdDRACwtw9Ok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-ySxaI00DMc2dKdYIgVhaQw-1; Mon, 13 Sep 2021 05:50:44 -0400
X-MC-Unique: ySxaI00DMc2dKdYIgVhaQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21ED4802B9F;
        Mon, 13 Sep 2021 09:50:40 +0000 (UTC)
Received: from oldenburg.str.redhat.com (unknown [10.39.195.4])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id AEAC01972E;
        Mon, 13 Sep 2021 09:50:33 +0000 (UTC)
From:   Florian Weimer <fweimer@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
References: <20210907183843.33028-1-ndesaulniers@google.com>
        <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
        <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
        <YTfkO2PdnBXQXvsm@elver.google.com>
        <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
        <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
        <20210913093256.GA12225@amd>
Date:   Mon, 13 Sep 2021 11:50:31 +0200
In-Reply-To: <20210913093256.GA12225@amd> (Pavel Machek's message of "Mon, 13
        Sep 2021 11:32:56 +0200")
Message-ID: <87a6kgerdk.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

* Pavel Machek:

> Do we really want developers treat warnings as errors? When the code
> is okay but some random version of gcc dislikes it...

There are some warnings-as-errors which are quite reasonable, like
-Werror=implicit-function-declaration (which we can't make the compiler
default without cleaning up userspace first) and perhaps
-Werror=implicit-int.  Some other warnings can be used to enforce coding
style, and there -Werror could make sense as well (-Werror=vla and
others).

But there are also warnings which are emitted by the GCC middle-end (the
optimizers), and turning on -Werror for those is very problematic.
These warnings are very target-specific and also depend on compiler
version and optimization parameters.  Unfortunately that includes the
buffer size warnings based on function attributes (which would otherwise
be a good fit for the kernel because it uses few external headers).

GCC also lacks a facility to suppress warnings if they concern code that
was introduced during optimization and removed again later
(e.g. inlining, constant propagation, dead code removal).

Thanks,
Florian

