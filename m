Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E70428257
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Oct 2021 17:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbhJJPpM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Oct 2021 11:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231842AbhJJPpL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Oct 2021 11:45:11 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 510E3C061570;
        Sun, 10 Oct 2021 08:43:13 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id i189so9130971ioa.1;
        Sun, 10 Oct 2021 08:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OpCVjCuc3iVcpX0DVnJmixGrpdrKly+/TAJywD3ztME=;
        b=NnoI+nF7ucdBF9fqznNVysXDdQZFaWDDLMAompgvSCOhBT0XFDYRbyCCJ07Soj0B9j
         EfP1XP6a8UbpV/zll0rvBj8fjcHb/C2vscN+EKy83H3pIPfSb332v2CAEmyoQYUuGg1z
         2aM86dSHkmzyTXfJndhDm4tpsVTHeaeS5Ed/XfhXTdo6H1HWPUH5FwB/CflSkVxheGBW
         5IHAEnGRxytk0dNeUN0+Am7/6dOwbqkOzCXFECGOflvIjrC8DNUlFY+6yKYIwnL0vCdj
         PifUGPpj4ie2S9RjMwF8/nlHZTVP9SuY9bLvRIK4NqlM/kJ/kCP5D3V+KEdb5UEPw+aU
         Wjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OpCVjCuc3iVcpX0DVnJmixGrpdrKly+/TAJywD3ztME=;
        b=cIfXFNgYsj0tNj8I2Vl/31TJs9rVL75YsXdgoNed0kyUH9kqvh4ySEV5cycoos/OP9
         UDHkPV9Y8zbjC7O64kJGI54CXkZKYLXH6gcDe7a008tSBbDLaNQZTf4Q4FtVW7yforsg
         Ue1Fikz/6wnK0iOScCWyJoc3IY/qxfrK0IvR3uFqR/t8Xz0yDCneMahOgoHRov7ukyeR
         BMuUgnuy4giqWavvFgb+YNWga7BDcLS1dPHy/VL7EYpFQkeFhipJKvCOIOWVlnAK7fO9
         8Yzyf2E6FjHfSYp86TjUmunlONa3yIXSIUdjkNqkvUjtNFgFP5HsVRo7z19/ePBgSvgv
         s+TA==
X-Gm-Message-State: AOAM533a00wuE/l1aMIBS3xuDIADvb49nq49wgOKwkJOqC+1cYzOEQKP
        G5bzT7qC52jnCUyR1sz3fWms8gO2T4jcuPviSY8=
X-Google-Smtp-Source: ABdhPJxgYYW2QnoLUXbcEIRsWr3sga43gDXb4l8EhDLnsdUq9O2SQeF0GUyBpcTP/SPH6/2ORtodUAtvTRZ+JCvS+RU=
X-Received: by 2002:a05:6602:2d4e:: with SMTP id d14mr2010596iow.172.1633880592478;
 Sun, 10 Oct 2021 08:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <1633878992-32884-1-git-send-email-ashimida@linux.alibaba.com>
In-Reply-To: <1633878992-32884-1-git-send-email-ashimida@linux.alibaba.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 10 Oct 2021 17:43:01 +0200
Message-ID: <CANiq72nBqiyrcaW47ZW-6i7zJ6HrmjZWSOr==HkEuBR5rXmpdQ@mail.gmail.com>
Subject: Re: [PATCH] [PATCH V2]ARM64: SCS: Add gcc plugin to support Shadow
 Call Stack
To:     Dan Li <ashimida@linux.alibaba.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sami Tolvanen <samitolvanen@google.com>, frederic@kernel.org,
        Mike Rapoport <rppt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, yifeifz2@illinois.edu,
        Steven Rostedt <rostedt@goodmis.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, andreyknvl@gmail.com,
        Colin King <colin.king@canonical.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Marco Elver <elver@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-hardening@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 10, 2021 at 5:16 PM Dan Li <ashimida@linux.alibaba.com> wrote:
>
> -         This option enables Clang's Shadow Call Stack, which uses a
> -         shadow stack to protect function return addresses from being
> -         overwritten by an attacker. More information can be found in
> -         Clang's documentation:
> +         This option enables Clang/GCC plugin's Shadow Call Stack, which
> +         uses a shadow stack to protect function return addresses from
> +         being overwritten by an attacker. More information can be found
> +         in Clang's documentation:

Perhaps it could be worded in a better way? It sounds like it is a
custom plugin for Clang as well, e.g.:

    This option enables Shadow Call Stack (in the case of GCC, as a plugin),

Cheers,
Miguel
