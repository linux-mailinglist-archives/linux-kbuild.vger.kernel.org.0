Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 480EA32DDE6
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 00:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbhCDXhg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Mar 2021 18:37:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhCDXhe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Mar 2021 18:37:34 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2183C061574
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Mar 2021 15:37:33 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id u4so798185lfs.0
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 15:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cgwulWHwm1MDs+ICpQBPD7tM8b4zQh4kzB1wSHVNQH8=;
        b=NmW9oG/5sfp7MEL33QTzTJ0jjyxr8w5jl1+3me8QO/Y8lp3Iq3E1E8vUoObTXScAaK
         HwU6zyO+CH+u7r4c9Q2T37+GP4KtyYQ50FAtKVcIjR7CvPRKnIwyeBzpJAPc5dJP609f
         vs9+ekKihDooog4vC9rIvjW+LwOLRLUJMBMaw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cgwulWHwm1MDs+ICpQBPD7tM8b4zQh4kzB1wSHVNQH8=;
        b=VXQI4h8kaFvPpzKs6PnqSqccWoaNQMFXIzJZOCWlChDJ+KyKfgA1ah++f4Y7sX4KEa
         5xFZJcv3S8/5hz3y0LNW1UCtTg13oUZbGKBrVG3yvvhAqHvaL/vSAsPhhYI9THlHlMII
         /Zj2AZCS2q5QUkjhNQKZ01CeTxmw7Iljq9E8A47WiCcHU8ZmEpNwlvd6qRq3x1kO+b9J
         kOfO2uAh7ZDc8gaxBTNZ+cV91FnhBUcmfw1wC+wJmLH++JmZTo+XYXzT2PB7bOCCyF/v
         a1djPIuYF86zww78Ine2gvQddVgvveHM0aKz7MMyGugUaQFA9KTdR9tDbYhTPCVhqTXE
         jZRw==
X-Gm-Message-State: AOAM532Y22PJ2ZnQxSeOwFGkA+gJQUWm6XqRy9Y8A6zaZfkUIynzuygs
        su1HOpk6lcJCoD+vle80VvTFrnwXyXojbw==
X-Google-Smtp-Source: ABdhPJw0rXWwXdNB3XpB37PhwYqHLLnAbJyH75F02gCu6riDQAs/+4dC69hnQ/+URhD0z8SVidgrBw==
X-Received: by 2002:a19:3806:: with SMTP id f6mr3871863lfa.242.1614901052140;
        Thu, 04 Mar 2021 15:37:32 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id b5sm91659lfi.3.2021.03.04.15.37.30
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 15:37:31 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id t9so187267ljt.8
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Mar 2021 15:37:30 -0800 (PST)
X-Received: by 2002:a2e:9bd0:: with SMTP id w16mr3468202ljj.465.1614901050597;
 Thu, 04 Mar 2021 15:37:30 -0800 (PST)
MIME-Version: 1.0
References: <20210304113708.215121-1-masahiroy@kernel.org> <202103041518.22EB819E@keescook>
In-Reply-To: <202103041518.22EB819E@keescook>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 4 Mar 2021 15:37:14 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj6t2i1BgmWP1Zb2WVF3zZzkHvsxsALJk7VpfKm6UgLcw@mail.gmail.com>
Message-ID: <CAHk-=wj6t2i1BgmWP1Zb2WVF3zZzkHvsxsALJk7VpfKm6UgLcw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rebuild GCC plugins when the compiler is upgraded
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 3:20 PM Kees Cook <keescook@chromium.org> wrote:
>
> This seems fine to me, but I want to make sure Josh has somewhere to
> actually go with this. Josh, does this get you any closer? It sounds
> like the plugins need to move to another location for packaged kernels?

Well, it might be worth extending the stuff that gets installed with
/lib/modules/<kernel-version>/ with enough information and
infrastruvcture to then build any external modules.

Yeah, yeah, there's the /boot/config-<kernelversion> thing too, but
honestly, that probably shouldn't have been in /boot to begin with.
That, and the plugins - and possibly any hashes needed for randstruct
etc - might be good to squirrell away in a
/lib/modules/<kernelversion>/build/ subdirectory?

I dunno. I obviously don't build external modules to begin with, much
less with distro kernels...

             Linus
