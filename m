Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36EF8170C7B
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 00:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgBZXTD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 18:19:03 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52551 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgBZXTD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 18:19:03 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep11so294395pjb.2
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Feb 2020 15:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zvqE6MvCPvJOL8QerB8lZLb+ktmIbQ2XOCq0TtICEMA=;
        b=Xa3HZa1EpXO1Kjzwiy274G3SpOxwxpWtXQ1vTHcSjfYcGO52mJyQEX33Y5Vti2WKHF
         sAlFBZzlnoSVacu+awRFirdHWDipZoGXW3YY918INaUXDPJ0jdp5klLmO57HXRQh5eYy
         7EmQ/vkz+W6LpEaOQyn1x+VJhE2F6PYeFwOc0Aakhxx48VLJQL2SvCF22nDIvif+g7/K
         68ImH4tBeCvXuMBWWmNXNO8+GBQk7+yYQDCNUw0ks1poL999C1qL1FJOumDPhOzwfCkJ
         JEhPVOB8xvF1x+HTuO56iO3emmw+laMwBPu0Hy2H8i5o9qQbLEFW4RRqe3kxUdl6gnam
         w28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zvqE6MvCPvJOL8QerB8lZLb+ktmIbQ2XOCq0TtICEMA=;
        b=P+zPeJJ10KZ9KM4MIlFbZxfL/slYpNINOkjkRNxs9gdcR7NKfVHOoABov9/g8Y0434
         0PFvl77QOpc14Qzy/5llg1P7TNLNuaEfnckyj4yMUOnoEnn3WcgMrOHap+UddLHNOe+h
         aPHCWF6gWieQTorcJHzZQfMBOM+BmUCyLUJ7G3xLfRT+Ojv90e3gmUwnkSxxg6oaPHcl
         vKxzRwzQ/WrAqu+gH2wD5UxIcMhv9DNIro9YysdS6kifEvz6v9EDvPbF8c/YUgTSNzlR
         uOhDuhVXJF/dcvHp8NiTXRXs+Vd/NOpzNCmApvenEuRV4tVo+2FXzH7bP3X1X3aphYTP
         WelA==
X-Gm-Message-State: APjAAAVznuFVm/p4f7eVHxFy3UCkmjn0EERIoeAIcnxqOn/8KWqtop37
        OnCO5ypIAk+MsT691CyFhM13trPiB4Xr0uqMN4juzA==
X-Google-Smtp-Source: APXvYqwAKmrsXVht51i2+AM65Vb4Wv0xKBJEdypHT8o2uZceWJyGrkmrIqrJoyV2IhJ4izvhHwRRuKGIsYCt9H3pItE=
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr1607216plt.223.1582759141823;
 Wed, 26 Feb 2020 15:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <202002242003.870E5F80@keescook> <20200225041643.GA17425@ubuntu-m2-xlarge-x86>
 <CAKwvOdn0_EETGtBVhbRKMPqv2K04Z1N4PuOZDZ6++Ejbi9-B-w@mail.gmail.com>
 <202002251353.25A016CD@keescook> <3b7b2b366220c9ba39ebc241ba22c0304f0d61b0.camel@perches.com>
In-Reply-To: <3b7b2b366220c9ba39ebc241ba22c0304f0d61b0.camel@perches.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 26 Feb 2020 15:18:50 -0800
Message-ID: <CAKwvOdmSix2hgDGsvcAzVD9L5XmM8tPDMyrdXmZjcvGXu_TMSQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Joe Perches <joe@perches.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 25, 2020 at 2:21 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-02-25 at 13:56 -0800, Kees Cook wrote:
> > I think we should take a specific version stand as the
> > "minimum" version. Being able to build x86 defconfig is a good minimum
> > IMO.
>
> Agree.
>
> It's odd to say that clang 4 is fine for arm when it's
> not fine for x86.  It's also reasonable to expect arm
> users to upgrade their compiler to a more recent version
> when the only cost is a very small bit of time.

That's a very x86 centric point of view.
-- 
Thanks,
~Nick Desaulniers
