Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7016E32DFC3
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 03:49:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbhCECtu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 21:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhCECtt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 21:49:49 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43AAC061756
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Mar 2021 18:49:47 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id q14so925402ljp.4
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 18:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EAKwe7K3kMQANtJjPdLsYeGF7HM5Z9arIs0zPPnm5iE=;
        b=EvEdNgOWOy1LcQaL2gw46k9qbKeV/7H2LcXkYbpwNwDp8xdsQIVuHdbSydTS19raO1
         DwZeef2Mp8pIepnzktZQ9OqZQTngM5gKi0piP0D6+XmFoq8bRqaTenltpLrA78EXLNBZ
         IxakX67rKVQI+ezgtRyBETC7bIYS+8LOU6qU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EAKwe7K3kMQANtJjPdLsYeGF7HM5Z9arIs0zPPnm5iE=;
        b=QkPLTc3HBzHeXc2wCDNTAcUYznaQ/QzW9fLibXIFTIksjd7kB6GhYK/Gi5dutJcvJc
         vXfsAzPxY3xogn6CwVUCyC+Dyw9nUgvC94yRCe1gkbnDbOx9vu0dx2rYB4+VNjTe/QlS
         CN9L/kb7kIdYMowZf+dk2NEShDLOYlf7hJ/emdDwGBbJnX865XbTRBPeI4jdTOlTdTta
         oFjG5mpFQ1Y6OcSHUjTKEzH3boIw6R86PWd8dlV4YZdhOjqDF3Y8mTV1gZxerzqIkkle
         iBNTnHoNKK/YYxAajzY9BzcaH+P/xbuNnpLrT9vAqDzlAJEnvshPLQiIOA1lSW64MUmy
         w8hQ==
X-Gm-Message-State: AOAM53131YynZxqooIqm0fpm3ZbJV0CHVjO7u9QI7dl37NkbQ71sqr1M
        qk2mxmwIfHzgP1SVVqPJHXaKs93Xnm+Vrg==
X-Google-Smtp-Source: ABdhPJzljM/kJg4/TZ1TgoX1rOQGIVEpGdQL4Ocu07OkzfPhY8wGsVNu6huK7gVYaftbLqA3YeEGMg==
X-Received: by 2002:a2e:8444:: with SMTP id u4mr3866774ljh.342.1614912585502;
        Thu, 04 Mar 2021 18:49:45 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id g21sm126866lfr.212.2021.03.04.18.49.43
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 18:49:44 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id v5so1023347lft.13
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 18:49:43 -0800 (PST)
X-Received: by 2002:a05:6512:104b:: with SMTP id c11mr89476lfb.421.1614912583650;
 Thu, 04 Mar 2021 18:49:43 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wjR0CyaKU=6mXW9W+65L8h8DQuBdA2ZY2CfrPe6qurz3A@mail.gmail.com>
 <20210303193806.oovupl4ubtkkyiih@treble> <CAHk-=whA6zru0BaNm4uu5KyZe+aQpRScOnmc9hdOpO3W+xN9Xw@mail.gmail.com>
 <20210303202406.bxgdx5a25j6wc43b@treble> <CAHk-=wi9J3mM8y+aH9e=HRo95giK4BRyyasayAimB0gdvbvDsQ@mail.gmail.com>
 <20210303214534.guyoxcwrgxgcqzy4@treble> <CAK7LNAQaAgg+mVSw_U3_FuuqcqJNnonyhVD1M-ezv71Y+dyAww@mail.gmail.com>
 <20210304150812.rzya7ewmerwhe4m4@treble> <CAK7LNAR0kNJ=DLuvRzRG+-rgMfcrSOZu8Mn6JBJ5do7TzJWLcA@mail.gmail.com>
 <CAHk-=wiT3FGuKuqLniBN2T_PZwD0GH4kf3XNCzq2tfChqn0+SQ@mail.gmail.com> <20210305024140.fv4i4ujreem2w7sw@treble>
In-Reply-To: <20210305024140.fv4i4ujreem2w7sw@treble>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 4 Mar 2021 18:49:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=whT4g=a-YzF9qXPTd5d1DN98x_9N8RWLdeiwg7gMTky+A@mail.gmail.com>
Message-ID: <CAHk-=whT4g=a-YzF9qXPTd5d1DN98x_9N8RWLdeiwg7gMTky+A@mail.gmail.com>
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

On Thu, Mar 4, 2021 at 6:41 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> This thread is making me dizzy, but I think the patch you NAK'ed from me
> was different.  It just added an error on GCC mismatch with external
> modules:
>
>   https://lkml.kernel.org/r/fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com
>
> though I think you were ok with downgrading it to a warning.

Right you are. So that was about the external module thing, which is
obviously incidentally an issue here with the plugin behavior too, but
different.

My inbox is kind of a modern-day Colossal Cave adventure: "You are in
a maze of twisty email threads, all similar but with different hidden
details".

               Linus
