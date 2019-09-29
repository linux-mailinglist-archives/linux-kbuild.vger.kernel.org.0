Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91206C12DF
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Sep 2019 04:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728747AbfI2C5C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Sep 2019 22:57:02 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39037 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728696AbfI2C5C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Sep 2019 22:57:02 -0400
Received: by mail-lj1-f196.google.com with SMTP id y3so6030329ljj.6
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Sep 2019 19:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C8yXdw0h0p8F6fKLaDgDQwFYdgULtupqFt2t+GrVNvU=;
        b=RW7Sb/4aJlXGRC6xwt+1bMJlvhizR+i9Eq9eKpzZfrVoj22korZmpNc2NL6eCx4v0O
         XXPGp9pLIXXPXxFOrIAiDbgDK+vG9IgDXYMiyWVm9YasXG7Vp+l/53OuGPxzOaycRGU5
         yHT20DkiwOMeWk9YTWw/7WVItYlUJvEa7dj2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C8yXdw0h0p8F6fKLaDgDQwFYdgULtupqFt2t+GrVNvU=;
        b=O1tTkYBchhskPDp+o16DNQ61rfTAA/lBF1SnT3jKjhC0PIjGeY6nwVWcL/v+XZwoER
         UNi6Vm0N2eKqujnJlnaszb88mHj7vu1oPkh3FumEhepiz/b7Rog8TU54qML96Af0LRfg
         ZHi3GvqyxFrYriFXFuVwrzPGCaZRzrpj3l45tY3NrAhpGo00P9PbbYNGVUDpEbV1+iLf
         f76DLIHDPdgahcwdu0UlyoJVV2lkfZJeaj0YAo9WV34s4YmFe/aEzQFw6R6ermtPSXnn
         2W3R1/xqT120mhuxLMZx361IWU3H2aEMli4PMLbQALMONya5u87Pf9NNeOGAAE7Au5n/
         w0ZQ==
X-Gm-Message-State: APjAAAVUXgsBP4bVxOoDt1x8nwAczW09uyibwnXx7eBKOgUuZ7CmxhAT
        FQSa70QCFfXZ4W5GmBMmx7lMRPkE27E=
X-Google-Smtp-Source: APXvYqxNe+FYi3zrEb/nyXZ8PffBEmJ1p+zSqS5ZexP6ErGIOR2wVtoXrAlfWQOXUpdRjaTxxYFWEA==
X-Received: by 2002:a2e:2953:: with SMTP id u80mr7854751lje.233.1569725819881;
        Sat, 28 Sep 2019 19:56:59 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id d3sm1770250ljc.66.2019.09.28.19.56.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2019 19:56:59 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id r22so4582223lfm.1
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Sep 2019 19:56:58 -0700 (PDT)
X-Received: by 2002:ac2:50cb:: with SMTP id h11mr7398086lfm.170.1569725818343;
 Sat, 28 Sep 2019 19:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
In-Reply-To: <CAK7LNAT-D68xMFrE-D_F-2y+iZt45+8iLF9dmTyO8YwUX-bTqA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 28 Sep 2019 19:56:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjdc7Ovi-iVGBGzuP6prTXVRT8rgbnabBd0AiHRqECMCg@mail.gmail.com>
Message-ID: <CAHk-=wjdc7Ovi-iVGBGzuP6prTXVRT8rgbnabBd0AiHRqECMCg@mail.gmail.com>
Subject: Re: [GIT PULL] More Kbuild updates for v5.4-rc1
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 28, 2019 at 11:41 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Please pull some more updates for v5.4-rc1

I pulled this, but I'm not sure if I'm going to keep it.

There's thousands of lines of changes because of the header-test-y
thing, and I'm honestly considering just getting rid of that thing
entirely.

It has no actual upside that I can tell, and it's extremely annoying.
It pollutes the tree with hundreds of *.h.s files, which messes up
filename completion, and just generally is ugly and annoying.

So I've unpulled for now, and I'm not sure I want to pull more noise
for this mis-feature.

                Linus
