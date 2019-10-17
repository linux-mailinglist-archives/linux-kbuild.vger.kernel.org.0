Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D761DB0CF
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 17:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731390AbfJQPLn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 11:11:43 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34795 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728994AbfJQPLn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 11:11:43 -0400
Received: by mail-lj1-f193.google.com with SMTP id j19so2988666lja.1
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2019 08:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EWXmeJPuiymseCj6xcWqVS3Sx+bDYNGGghSQDXs7lGU=;
        b=dQnAoMOLXxdnkmMnZKKhqkYSJhPE7fd37smKpuRu1Gx0ghF6svHjIV4OA+BFbSyFWz
         qodi5h6+xJSpeqac66M2SEEgLt8Cv2pZxx2LJtw5GbnIXariCqWdbHEGfCZ99W6M/6CN
         xfncevHjC0P6+Y9xBhshp3XPxzlCFmQ5Uf9bM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EWXmeJPuiymseCj6xcWqVS3Sx+bDYNGGghSQDXs7lGU=;
        b=clc23POfQBVC4xRHb/e611tjtWEjRBJHq5mYZqjraZs/rEe1XfS2daXmzDhqt322mB
         eMXju68RDMfX/S/HIoJtwgzlWR81aylNpQXGQIU5yKeA/ZcZqAQ2ayAZuxc5VuJtSZ/5
         vawaAtzgj9ggcFRrVi3EE0bt85eWy/kcatyrW0MoBSl8n4KH6gRgDahhW8iCM6vRiJ1c
         sFlqoRT/8bc/POfYRuENnPkGAfN0myUjdw5NKVF/YjPWKQZ0l8KJtREuWPiUz6+6kN6l
         nL5dLLilpRCU/koNwfyLUsXR31N0TyFB77d0RRwHpJq0CmLTuhLXnk6hoPeGm01V5a68
         9ffw==
X-Gm-Message-State: APjAAAX+mzr1LXG96G0xXnysV2KxuwaEOfMMMAQNsOeSWdWW0UXU4I8O
        RW4W5uuTqd4ZtlQqo0+VSfz3SypRug4=
X-Google-Smtp-Source: APXvYqx/583UZci2sdSZUOiwUhC04+7c5ycEaeveuwQGpcBX8G0gbxXfbH9OP+F8OEM5nAQQXll+cg==
X-Received: by 2002:a2e:a415:: with SMTP id p21mr2866952ljn.59.1571325100877;
        Thu, 17 Oct 2019 08:11:40 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id k21sm1052513lfm.68.2019.10.17.08.11.39
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2019 08:11:40 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id u16so2197699lfq.3
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2019 08:11:39 -0700 (PDT)
X-Received: by 2002:ac2:43a8:: with SMTP id t8mr2721336lfl.134.1571324744327;
 Thu, 17 Oct 2019 08:05:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3uiTSaruN7x5iMaDowYziqMFxKWjDyS1c8pYFJgPJ5Dg@mail.gmail.com>
 <20191017125637.1041949-1-arnd@arndb.de>
In-Reply-To: <20191017125637.1041949-1-arnd@arndb.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 17 Oct 2019 08:05:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiH7Ej9x3RqJkUEW4hDCisgWdi6wai6E0tvo4omF_FbeQ@mail.gmail.com>
Message-ID: <CAHk-=wiH7Ej9x3RqJkUEW4hDCisgWdi6wai6E0tvo4omF_FbeQ@mail.gmail.com>
Subject: Re: [PATCH] [RFC, EXPERIMENTAL] allow building with --std=gnu99
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sasha Levin <sasha.levin@oracle.com>,
        Andrew Pinski <apinski@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        mm-commits@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Ingo Molnar <mingo@elte.hu>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 17, 2019 at 6:02 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> Change enough of the kernel to allow building a 'defconfig'
> kernel on x86 and arm, by turning the compound literals into
> struct initializers.

Ugh. I detest this patch.

Not only is the patch itself fairly ugly, the end result is
unmaintainable, since any regular kernel developer will

 (a) not use ancient compilers

 (b) look at code like this

   static struct rb_root memtype_rbroot = __RB_ROOT;

and go "that double underscore is pointless" and fix it. And it will
build fine for the developer.

So some of the patch looks like fine cleanups and not bad at all, but
some of it really looks like it's going to be long-term annoyance,
with duplicate names and unnecessary underscores.

In general the double underscores in contexts where they don't exist
from before just look wrong.

Some of the "just remove the cast from the macro define" look good,
though. And making users do DEFINE_RB_ROOT() looks fine. It's more the
"make users have to use the internal double-underscore versions" where
I go "that's wrong".

What distros are still stuck on gcc-4?

              Linus
