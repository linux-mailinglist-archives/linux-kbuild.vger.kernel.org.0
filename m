Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB33D4020A5
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 22:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhIFUPv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 16:15:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24547 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230189AbhIFUPv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 16:15:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630959285;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=KOxnjIKbtZLPasj/9UEIQeFl1DhzMvB0E++PoyHI69E=;
        b=eIfnpUNwMkelaPxSiv82eSFA7/JByMFAiTyapWcvUxyuVBnueTYvUryIOmJyQlJIEmAWsh
        AmdrfBfBeueqJL5rggt9T8sQLYn5oaw+v2smde0zAu6QPfSVWEGE1yumP0Gglfeck8yy8i
        nS2VW3floy+JzRJLpDzpHg4+QT8yMCQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-rSbdxi3SN6WnLzs_n_XJCQ-1; Mon, 06 Sep 2021 16:14:44 -0400
X-MC-Unique: rSbdxi3SN6WnLzs_n_XJCQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6A455122;
        Mon,  6 Sep 2021 20:14:42 +0000 (UTC)
Received: from tucnak.zalov.cz (unknown [10.39.192.10])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BE2026FD1;
        Mon,  6 Sep 2021 20:14:42 +0000 (UTC)
Received: from tucnak.zalov.cz (localhost [127.0.0.1])
        by tucnak.zalov.cz (8.16.1/8.16.1) with ESMTPS id 186KEeTL3025921
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
        Mon, 6 Sep 2021 22:14:40 +0200
Received: (from jakub@localhost)
        by tucnak.zalov.cz (8.16.1/8.16.1/Submit) id 186KEWQI3025920;
        Mon, 6 Sep 2021 22:14:32 +0200
Date:   Mon, 6 Sep 2021 22:14:32 +0200
From:   Jakub Jelinek <jakub@redhat.com>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Florian Weimer <fweimer@redhat.com>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210906201432.GZ920497@tucnak>
Reply-To: Jakub Jelinek <jakub@redhat.com>
References: <871r644bd2.fsf@oldenburg.str.redhat.com>
 <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org>
 <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org>
 <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org>
 <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
 <87lf49wodu.fsf@oldenburg.str.redhat.com>
 <20210906194808.GY1583@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906194808.GY1583@gate.crashing.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 02:48:08PM -0500, Segher Boessenkool wrote:
> > This is an exaggeration.  On several architectures, the kernel cannot
> > use the vector built-ins directly.  Some of the implementing headers are
> > very special and intertwined with the compiler.  <stdarg.h> is currently
> > not such a case, but it's just not technically not feasible to avoid
> > dependencies on all compiler headers.  I think this considerably weakens
> > the case against <stdarg.h> because the compiler version is so obviously
> > harmless.
> 
> Exactly Florian.  Thank you for so clearly making the point.

Yes.  While stdarg.h builtins haven't changed for a while (we had some since
~ 1999, changed them incompatibly in 2000 and again in 2002 and not since then
and I'm not aware of plans to change them in the near future), e.g. for the
backend intrinsics, we change some every year or two, the only guaranteed APIs are
those provided by the headers (x86intrin.h/*mmintrin.h etc. on x86,
arm_{neon,sve}.h etc. on arm*, ...) and the underlying builtins are
sometimes removed, further ones added, etc.
stdarg.h is also such a header, although admittedly much simpler and less
likely to change.

I must say I don't understand the argument about uninstalled compilers,
uninstalled compilers work just fine if one supplies the right include path
for them, for C it is trivial and apparently the kernel has been already
doing that through -nostdinc -isystem .../include, for C++ a little bit
harder but we have a script for that.

	Jakub

