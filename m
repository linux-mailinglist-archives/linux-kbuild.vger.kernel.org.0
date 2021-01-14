Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE5922F5C38
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 09:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbhANIKW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 03:10:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbhANIKV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 03:10:21 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F654C061786;
        Thu, 14 Jan 2021 00:09:41 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id d9so9512119iob.6;
        Thu, 14 Jan 2021 00:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=yJph4w0lqPRbllahTQ9qs1P5veXDXR9nP72ddW4htp4=;
        b=KPjP628f24AwBIV1SfEzodWxdvXH+6+KTbCR6QfDh7pMLn2IGHbmDHici+WXacM5BV
         P+wVpQhTMBKQXczvqoYxrH322L+YXsieDz+4FT5MyYnHLZeSaBT9gYQt5nXDhcE5COAx
         t7gnEpRWflK/udSLJoeSSNLll4hOfX7TbEeoiu31bIRFYU+Jd6KIZyBiNAfNib4AzcBG
         6cyAO6XahYXb4xBrljK5fkCeM9BYOPLAzB88FSeuEHLwWLcelg8cGLQkW7NBQd0931P+
         Kqk54BfEtl26Wk1bgFdsrK3Vl4OONzDM99fRN6PtlOD5w8Qga5ETuQnMQhTs9jrxsI2f
         MgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=yJph4w0lqPRbllahTQ9qs1P5veXDXR9nP72ddW4htp4=;
        b=pNf8v2z6HFcazOmv7J08a9FcslewQ72p0NdZi7zvPy6zPah6W2cIOEUR6y/uqg1MPs
         VkZ7/ZYnvVdwTTE4jbf+wID6+W0epzvqh7bMRNATrlUOK9zuYuEXsb6bD8AmuOCOBdx5
         JsWE6F7X4PO3dF351IG2/IHTfkamYYar2VOSYvisOLrCbFR47AOJxqfvTLTUSl3thh22
         CIM63BuxKZoNGnChdGPns3c3rSvzQCPRvKjvO/31LM3aMmZ+R25UwFVi8vs0GhKz88kA
         XrG5/Vt1FKoiPU4qN0N6l3HkCZ5/CujEjqToZ9xmer/nZathmnrkhB0bqER7RwsHWEA0
         qEXw==
X-Gm-Message-State: AOAM532PxU4escenWJXWPJMt4HMSAIM376hJHC9OIeO9nuQ6d3JMCQdn
        9N5KbBLxm3KER8UphFMYf8AANis6519EHEJtNGdz91AaG7I=
X-Google-Smtp-Source: ABdhPJxRQ8ZDtfgKfpmPeJik+sWpL6jJo0tSNodYWGS6OPH3+aco2htCjWmUT/IOXPHx8uRPXIrf74sG1+/9K+rPHN8=
X-Received: by 2002:a05:6602:2f93:: with SMTP id u19mr4461318iow.110.1610611780953;
 Thu, 14 Jan 2021 00:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20210114042420.229524-1-masahiroy@kernel.org> <CAHFW8PRr6kjEE=7BSzWo7itSZgAhy_dhmnSe1yq5wMfDwEyJ9g@mail.gmail.com>
In-Reply-To: <CAHFW8PRr6kjEE=7BSzWo7itSZgAhy_dhmnSe1yq5wMfDwEyJ9g@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 14 Jan 2021 09:09:29 +0100
Message-ID: <CA+icZUWBUiM2XgGW6Q_KHT1d=1M5nsu2rRaf--xhTR90u2tjeQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check the minimum compiler version in Kconfig
To:     Ilie Halip <ilie.halip@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 8:55 AM Ilie Halip <ilie.halip@gmail.com> wrote:
>
> Hi Masahiro,
>
> > +       #elif defined(__INTEL_COMPILER)
> > +       /* How to get the version of intel compiler? */
> > +       ICC     0               0               0
>
> According to Intel documentation[1], this should do the trick:
>
>     ICC     __INTEL_COMPILER  __INTEL_COMPILER_UPDATE
> __INTEL_COMPILER_BUILD_DATE
>
> I don't have the compiler installed, but I tested this on godbolt[2] and
> looks fine to me. What do you think?
>

I remember at university I used ICC successfully with building a Linux-kernel.
Anyone has used ICC recently?

I cannot remember to have seen any bug-reports regarding ICC to
linux-kernel or linux-kbuild mailing-lists.

- Sedat -

> [1] https://software.intel.com/content/www/us/en/develop/documentation/cpp-compiler-developer-guide-and-reference/top/compiler-reference/macros/additional-predefined-macros.html
> [2] https://godbolt.org/z/E5PE6f
>
> I.H.
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAHFW8PRr6kjEE%3D7BSzWo7itSZgAhy_dhmnSe1yq5wMfDwEyJ9g%40mail.gmail.com.
