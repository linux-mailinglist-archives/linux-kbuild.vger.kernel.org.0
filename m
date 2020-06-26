Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8602620BA48
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jun 2020 22:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725793AbgFZUZk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jun 2020 16:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgFZUZk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jun 2020 16:25:40 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1324DC03E979
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:25:40 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q90so4634706pjh.3
        for <linux-kbuild@vger.kernel.org>; Fri, 26 Jun 2020 13:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lj8Vexb+6K2EkvRLDIIMa04+QiE5YATPbQS9XSZnShM=;
        b=BtJtUAQP1Xeozg2+9z9AlinIWiJ+0lAh++hWmxBVJxh8hwQh9WjK/7JIYmr5qANx8+
         rObqJyzwtVq3+g4FtTBx2OrKqyZPtMpOpfZuGDD8hFjrhT+zs9i3EoZuKsMlc5WpXcLo
         RyNOyqqeE9dKOo/lSlpY6LbgmNvhelDsGFg14Pg/Wz+urEHSpf/69j6TPIHWL8eN24BX
         9pZOzOQGySgZfoYCljqlnssJhYlYZoxFcQsIANIlFuIgerryKcEt0H9LKLdqXsxUtfkU
         q+KeTMaCLhaRiVSysD2ZM5rCRxFidoDg/lOsbGd5wquzb+2yAZcuj0i6JUGBVB9EtP+Z
         evHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lj8Vexb+6K2EkvRLDIIMa04+QiE5YATPbQS9XSZnShM=;
        b=DI+YOsda+aRKyjULR9eIL5L36aMLdYX9Jd5CiYy7RVtvwPNl7KS5xtE0e8D+6ALIQG
         1+DPq52yH2zenbT+l2hAHA7DVATxl3jVqQLUkztji2HhK6h5GY0/a+90V+c9eqxZfnZ2
         PDj9GI3cUzvpgo7o/hP4evbYcZSq2c6qRwuZEN13gp/q0pny7Bit7bTb1gLrol1J87UK
         yOimguSxR8AP2BOKaDf0LkXd7UijTTwte9Xkj9/XK4PtFdXjK2EKoQVl+RhnNemUUSMa
         r7bIVRsZY+FzhlJaGhWEANU1wi4WokDqRTBWufI0r4qOTstDLZvPy6XSwbzT4y7z3I9R
         W20Q==
X-Gm-Message-State: AOAM532Uu+rhMe5JYSv6tbfoymZ0fZzw26V3P1neno//TNoF7cTNB2XF
        gM5NblYDn04qNu0e2lUZPMv3RuaUp29f4JKz0TNqoA==
X-Google-Smtp-Source: ABdhPJzi2CjOFoRaJFc6nIMQidEczrCchKjb4mW48OJK5lS21+wU2sDMo1f9Dcd7/SOBVPm9EP1XSN0nK3bjmIdsPg4=
X-Received: by 2002:a17:90a:30ea:: with SMTP id h97mr5337521pjb.32.1593203139352;
 Fri, 26 Jun 2020 13:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200626185913.92890-1-masahiroy@kernel.org> <CAKwvOd=V_M43CP7G87K3TqSsxua2NcXPz6BnDt-z6167O2WAzQ@mail.gmail.com>
 <202006261319.F130204@keescook>
In-Reply-To: <202006261319.F130204@keescook>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 26 Jun 2020 13:25:27 -0700
Message-ID: <CAKwvOdmFpgSGow3X4AhEC1B-xWNORTgAFBXgYPQHLGyhgefddw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove cc-option test of -fno-stack-protector
To:     Kees Cook <keescook@chromium.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 26, 2020 at 1:21 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 01:13:20PM -0700, Nick Desaulniers wrote:
> > On Fri, Jun 26, 2020 at 12:00 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > +++ b/Makefile
> > > @@ -762,7 +762,7 @@ ifneq ($(CONFIG_FRAME_WARN),0)
> > >  KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
> > >  endif
> > >
> > > -stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> > > +stackp-flags-y                                    := -fno-stack-protector
> > >  stackp-flags-$(CONFIG_STACKPROTECTOR)             := -fstack-protector
> > >  stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> >
> > So it looks like the previous behavior always added
> > `-fno-stack-protector` (since CONFIG_CC_HAS_STACKPROTECTOR_NONE was
> > always true), but then we append either `-fstack-protector` or
> > `-fstack-protector-strong` based on configs.  While that's ok, and you
> > patch doesn't change that behavior, and it's good to be explicit to
> > set the stack protector or not...it seems weird to have
> > `-fno-stack-protector -fstack-protector` in the command line flags.  I
> > would prefer if we checked for not having CONFIG_STACKPROTECTOR or
> > CONFIG_STACKPROTECTOR_STRONG before adding `-fno-stack-protector`.
> > That doesn't have to be done in this patch, per se.
>
> No, it would add only what was latest and most selected. (They're all
> ":=" assignments.) If CONFIG_STACKPROTECTOR_STRONG, only
> -fstack-protector-strong is set. If only CONFIG_STACKPROTECTOR, only
> -fstack-protector is set. Otherwise -fno-stack-protector.

Ah, right. Thanks for pointing that out.  I'm still curious if the
CFLAGS_<file>.o rules get appended or overwrite all flags for that
translation unit?
-- 
Thanks,
~Nick Desaulniers
