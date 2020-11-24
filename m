Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF942C33D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Nov 2020 23:25:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389432AbgKXWWe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Nov 2020 17:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729098AbgKXWWe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Nov 2020 17:22:34 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163CDC061A4D
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 14:22:34 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id b63so383741pfg.12
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2020 14:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pJHeWjaBdZwomXBYbMExLuGxVcJ2kE2YHepOItpGyl8=;
        b=NfPq1wThF4bax4Wc54yxmbd3O4JURJngGs75IQyFFftNPqrf6BtVI5PUeVLYwXCsWo
         iINS0pl5vQHCGOwgdZb5X9Rm99q9n5neOK2PswQDMPhiN/xxNK+OCDBrF0NViCRYw0aQ
         brlxC/ZOWDeVXmRX9wEDJDnc6oU2xWI9oxtps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pJHeWjaBdZwomXBYbMExLuGxVcJ2kE2YHepOItpGyl8=;
        b=NaQYMqoNCmWqQSdNM7+XL6xMEMbjqKVbncu4ybNErg6qJVZA/Dztlfk+/HjmDksnPq
         i1KN35SjD3pIqrJfIHLuZFV+4N6kMMpECinf6qSDLHE3fWcmPIkv4RXnI178al8BneKA
         cJCxLUfMVO00rgPw+UraAaXDfmxyflA+vuMttNVFaxd/rhXXDQAa8WfkKELaaVSE/fpa
         XzAdteXonLxMex4csklRvkLnBahrdnkSBWV1e44meaLeHWZ6s3y6MUJP47rDxhfIrnc+
         tBXpREBW2CW9X5HIMrbBQZRWLZZqQNHNpNsdF4rNxLf83uYsPHy7sziEFPENEXzFvFqP
         c1mw==
X-Gm-Message-State: AOAM533dTZlp0Kyatij91lMBJ5phQITbr9Zj4SFfGZwSnKlbn7pMtq9r
        tKI8xGeX1XHETQCvK3WQbBO0mA==
X-Google-Smtp-Source: ABdhPJzzU6ZeykNNsfU1lZsn6jxco0s14as0+LQMRx/IH4f1dYuHck5qrCwgoKmtZ6zQDKyRM8sR0A==
X-Received: by 2002:a63:e0f:: with SMTP id d15mr453658pgl.310.1606256553666;
        Tue, 24 Nov 2020 14:22:33 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z29sm175922pgc.68.2020.11.24.14.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 14:22:32 -0800 (PST)
Date:   Tue, 24 Nov 2020 14:22:31 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
Message-ID: <202011241421.A2F3062A70@keescook>
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
 <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > along with a few others. Newer versions of ld.lld do not have these
> > warnings. As a result, do not add '--orphan-handling=warn' to
> > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > Reported-by: kernelci.org bot <bot@kernelci.org>
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Thanks for the additions in v2.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I'm going to carry this for a few days in -next, and if no one screams,
ask Linus to pull it for v5.10-rc6.

Thanks!

-- 
Kees Cook
