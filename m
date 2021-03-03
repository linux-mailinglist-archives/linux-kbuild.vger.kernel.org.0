Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7376432C243
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230141AbhCCX7f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 18:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387392AbhCCT6d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 14:58:33 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBB2C061760
        for <linux-kbuild@vger.kernel.org>; Wed,  3 Mar 2021 11:57:53 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id n16so22187672lfb.4
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 11:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/uIYiDtRjwD/TK3His/5CccHi6NH1uV5qRRXKXn4pqE=;
        b=anJlRTpSFljFjmADV7Piml2CFnNQDd6mlppzM5fOQlOKZqdn/dqwihmnbCYi/ya7eL
         IOGXc9od+7aat29BuDorbvsPFjCc+KX19Tc+zuOWG+E1k1hSl/KKaXZIT0FzQs8PEu5/
         54mDXOe8HZ0MXuwNEkdK10xJu7tBagwtXnmtQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/uIYiDtRjwD/TK3His/5CccHi6NH1uV5qRRXKXn4pqE=;
        b=BEXq1OAoJ1d28LJntHfgnMm08oxJ1GY+wF39St+6DZ2DxWIoDmIsbblfrgKYZjAGOL
         ocW30H+X+HiG+vDWD9AxnBn5iUfcunKiyEZi5RatrcvqTqFCq05E0Ok0t/MaKx2fyQn6
         wbjL6ujq+kx9OX4O5K2js1zbdjxwvzxjRn958y451B0vPXQvA4UQZXUyxPs8YOOJ6/5O
         PPBKc9gSprcBWRQEXlrQXXy4L97mfFJ0Y2H/aMd/tdrPNY2OP3YKTWpRadwsSlJsFoMj
         9IG3OQ6BiNmrM8ltpeXrQ0XNQDJeXTC1kpmScPeGjBHIt3l5FdOdio+oJHcD5R6V7a0S
         n11A==
X-Gm-Message-State: AOAM530RycmbUfzj/R8mz8e6lCLLAtsibvPNQhPQt5gr6/4xfVTlR8t2
        7oumQ7CmxX1dLJeDVw2W4sxeKcmJ3Vq8XQ==
X-Google-Smtp-Source: ABdhPJxykRKfoUMNZGSwNkDLPbJisDiyFKHgd0Ty4IOJA9zWtc4yyoX1d9ApDp+gMCLjxGHJ4O5PwQ==
X-Received: by 2002:a19:4811:: with SMTP id v17mr204921lfa.600.1614801471439;
        Wed, 03 Mar 2021 11:57:51 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id x4sm1334287ljj.91.2021.03.03.11.57.49
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Mar 2021 11:57:49 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id z11so39057395lfb.9
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Mar 2021 11:57:49 -0800 (PST)
X-Received: by 2002:a05:6512:398d:: with SMTP id j13mr191154lfu.41.1614801468954;
 Wed, 03 Mar 2021 11:57:48 -0800 (PST)
MIME-Version: 1.0
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <20210302232649.y2tutffhxsblwqlb@treble> <CAK7LNAReuB5zUq_7S8ZG25+tdQowECDOK1rApYvkPCpHhPjK5w@mail.gmail.com>
 <20210303191516.6ksxmng4pis7ue4p@treble> <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble>
In-Reply-To: <20210303193806.oovupl4ubtkkyiih@treble>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 3 Mar 2021 11:57:33 -0800
X-Gmail-Original-Message-ID: <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
Message-ID: <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 11:38 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> > But in the meantime, making the plugins depend on the gcc version some
> > way is certainly better than not doing so.
>
> So currently, the plugins already so that.  They require the GCC version
> to be exact.  If there's a mismatch, then it fails the OOT module build.

That's not my experience.

Yes, the build fails, but it fails not by _rebuilding_, but by failing
with an error.

IOW, it's a dependency problem.

That said, I absolutely think that distros that think that stackleak
is an important plugin should seriously have a plan to just move to
clang, or push the gcc people to just add the
"-ftrivial-auto-var-init" thing (and talk sense to the clang people
who think that zero isn't good, and want to force a "pattern", but
happily they haven't taken over the world yet).

The kernel gcc plugins _will_ go away eventually. They are an
unmitigated disaster. They always have been. I'm sorry I ever merged
that support. It's not only a maintenance nightmare, it's just a
horrible thing and interface in the first place. It's literally BAD
TECHNOLOGY.

Gcc plugins were badly done. They _should_ have been done twenty years
ago as a proper IR (and people very much asked for them), but for
political reasons the FSF was very much against any kind of
intermediate representation that could be hooked into. It's one of the
reasons clang has been so successful - having the whole LLVM IR model
has made life _so_ much better for anybody working on any kind of
compiler that it's not even funny.

Gcc plugins were too little, too late, and are not even remotely a
good model technically. LLVM did things right with a well-defined IR
front and center, and while I dearly love gcc for a lot of reasons, I
absolutely despise how badly gcc handled this all - and I despise how
that horrible decision was never about technology, and was always due
to bad politics on the part of FSF and rms.

End result: gcc plugins are pure garbage, and you should shun them. If
you really believe you need compiler plugins, you should look at
clang.

That really is the only sane technical answer.

             Linus
