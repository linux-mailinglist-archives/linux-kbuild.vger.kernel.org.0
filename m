Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C0EA340FF1
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Mar 2021 22:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhCRVip (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 18 Mar 2021 17:38:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhCRVi0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Mar 2021 17:38:26 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E00C061760
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 14:38:24 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id l22so2374118vsr.13
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Mar 2021 14:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vLPqaFCjOxJqP96ilPAU1cPfZQuKxpOHXRuDS0s7Vr4=;
        b=qKVpWtCjskEKfxSobzVob96NxKhzoHpA0zkVpey6v9nz5hqX4fwpWRs2r3Xv0LtQVY
         G16K6pLlLiiOgiA9WlvBYuNv+dkBxVQoBMTZmRC3drafHcUHKnQM/tG/M+cxNlkBKFlD
         6s0+yKEf1+/y0f7FoLfouj1leYGLXXX0BHvTCWQ+suw1xpi/HPjaWWJGI7rE5Zq4hjN+
         KeG6ltSdPXps4+kFCWvGrU0ia0VmTHM2GBqcg/2BbR/sCeCZJbCtvjlsmF4re7pImMHk
         IhFvMOnUBJEqxCQDOIJTiaQI5tXqy8l13Wdqav4qDmK3cuJjAHbGFKOiSQWrw4vDipzM
         ux1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vLPqaFCjOxJqP96ilPAU1cPfZQuKxpOHXRuDS0s7Vr4=;
        b=cSNVdrCOJWPdy+xbXd0AClZ1kR0yDLdrsEEu7I1Lz92wVLxVAh+HfIX7bh7QGjO2/V
         ndpu6V8xRul2CmkEl30pbpct69zquH2vqPHQJ8pJYNZ4+99cSIrh3otrdIDaq+ooSLAx
         kaWi4MYwUogqVLmnWKzDBB/eoA4e+pr3TUp2fnV7rYABj/8JCIX2inklz2yAxq0Q2XyK
         ObyURZLkMJwxoErQv7L+z6Je5RcLtsuQ3h4vqLgmG2nSY3QiBMI+0jiLLMKOPuzyBr5j
         4ByaQZCj9rAFmYPR+G7MTxC6MfV/W1Q6f/3XXnQ80DOwkDA+fniqzUuSbj2RsJMtPqE9
         OCCw==
X-Gm-Message-State: AOAM530p/2EaC9Bb1/VTG952s0q8wll1jX3cip2u5sM9N3zLJ9UyrNhr
        J9/DoFeUBU4xxGVXV4uVbFlxQIxbVrF5t2bI18ko9g==
X-Google-Smtp-Source: ABdhPJyaMaWSU8mQS4gTjUoMCHt/hL7J7EWOKPoWt/RxfzbbDBNbfggOD5G6oZscrzSei7ViS8Oslpe0+7Gv7JZE5Pk=
X-Received: by 2002:a67:2803:: with SMTP id o3mr1141643vso.36.1616103503542;
 Thu, 18 Mar 2021 14:38:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210318171111.706303-1-samitolvanen@google.com>
 <20210318171111.706303-6-samitolvanen@google.com> <CAKwvOd=fWs6g2Bf2a_bA58_-uoWtVmNQnvrPxNhio4R5qGjcMQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=fWs6g2Bf2a_bA58_-uoWtVmNQnvrPxNhio4R5qGjcMQ@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Thu, 18 Mar 2021 14:38:12 -0700
Message-ID: <CABCJKufa_-WSSYzHBSjZ+3i0DfvoGBox7Xa0PcE_Kuhf2rd07g@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] workqueue: use WARN_ON_FUNCTION_MISMATCH
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        bpf <bpf@vger.kernel.org>, linux-hardening@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 18, 2021 at 11:50 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Mar 18, 2021 at 10:11 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > With CONFIG_CFI_CLANG, a callback function passed to
> > __queue_delayed_work from a module points to a jump table entry
> > defined in the module instead of the one used in the core kernel,
> > which breaks function address equality in this check:
> >
> >   WARN_ON_ONCE(timer->function != delayed_work_timer_fn);
> >
> > Use WARN_ON_FUNCTION_MISMATCH() instead to disable the warning
> > when CFI and modules are both enabled.
>
> Does __cficanonical help with such comparisons? Or would that be a
> very invasive change, if the concern was to try to keep these checks
> in place for CONFIG_CFI_CLANG?

The last time I checked, Clang ignored the __cficanonical attribute in
header files, which means it would still generate a local jump table
entry in each module for such functions, and the comparison here would
fail. We could avoid the issue by using __cficanonical for the
callback function *and* using __va_function() when we take the
function address in modules, but that feels way too invasive for this
particular use case.

Sami
