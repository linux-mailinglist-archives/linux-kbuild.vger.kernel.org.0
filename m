Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E53D33AF4FE
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Jun 2021 20:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhFUS0l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Jun 2021 14:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhFUS0l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Jun 2021 14:26:41 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BB6C061760
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 11:24:25 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id v7so14857477pgl.2
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Jun 2021 11:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8srstiN/1QZXwDTulF83V5rnWY0uXObxwuHnse4sC/A=;
        b=mbdRjmeqpU09zwARWs6VBWCsKthtt1ciZ7/sKECb+LXhO/trEQk1wiQ8V1CZ0EV2Jm
         ZlEkgW0zlljp2e/FgFuPRW9rdjI05xum01p50e9bFYSmMCNHbE5kQqAAo8oW420leycF
         l0vqb2QcSakmgDG0XDSPywc8AdQoRSaV2MRpsf1z/7e/SYs0HhYtYQWrwQE/QE4PjipG
         c4TpQZj3g/Yj1i5YmfIbNfvRTE4EkwYphVE25FDEvIvwz2vNVjsu4RuTd9AcI1aE94qc
         6y/mckyWvHWNGxtF6OvgOWOlNbuvcJGnmCcaDgeccujmVJiAIXsJrfar32C9U2x7wAJX
         6Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8srstiN/1QZXwDTulF83V5rnWY0uXObxwuHnse4sC/A=;
        b=UHBjRwKjWm6y9E1dhNEm4Hi5tyvv4w+8Kh2fE9xSZ5ST6KfGgT+U7vP2h4PUPNwmfE
         NqTCjqjl1YrdWVhgR27XG3jKjdZ8I8coXaKZjT2TKLwjJc4fD+ZW2n95XK2i0kR/ccNc
         nuRnbotva8Gk5/ayqQmrnA702SNbhN2NFiaB6L8vOdVX5Xa2xCRakYN2jrlKDwwE8SUd
         1lltJbgpgn0nO1B/SbAPwseplfK5z7o46ASb3m9XppfsDONB0YTQBA/gBrpi/+q5SkyC
         uTInhSVAvBKWjWAl4qbW35n6v8mV8eQDr3i7YLIrt1Whmnb4DhOFdoe2iOnVugjDK6RQ
         p8tw==
X-Gm-Message-State: AOAM531u8zwfCM+rWr0k9q4CHnJqCynK6TvpM/9no+898eGABAMMyIhZ
        +EgR7OhS6ICe49tVZQ66L6krag==
X-Google-Smtp-Source: ABdhPJwsKW/VhOsBp1lMcO0miiGnEaYNCbevivBl7JAn5W5XepPB84CTUFkwR3IV2ygsBGL4tRrmSA==
X-Received: by 2002:a63:1143:: with SMTP id 3mr25502463pgr.166.1624299865199;
        Mon, 21 Jun 2021 11:24:25 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:33e1:52f0:4159:6ed])
        by smtp.gmail.com with ESMTPSA id b18sm4756953pft.1.2021.06.21.11.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 11:24:24 -0700 (PDT)
Date:   Mon, 21 Jun 2021 11:24:18 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Borislav Petkov <bp@alien8.de>, Martin Liska <mliska@suse.cz>,
        Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Johannes Berg <johannes.berg@intel.com>,
        linux-toolchains@vger.kernel.org
Subject: Re: [PATCH 1/2] compiler_attributes.h: define __no_profile, add to
 noinstr
Message-ID: <20210621182418.57qbumtovysrlkwy@google.com>
References: <20210618233023.1360185-1-ndesaulniers@google.com>
 <20210618233023.1360185-2-ndesaulniers@google.com>
 <CANiq72kjyiAQn2+ijZKFo7SY3z+dCV6fGXYP1O_Mq7Ui3EqSzQ@mail.gmail.com>
 <CANiq72nbbqeD2dv3z0y3rN-_kdnh=9-pD7oSyWUfaG8oJ2y_8A@mail.gmail.com>
 <CAKwvOd=B6LV9rZmtPacfz_F10jj1wrovoGu8yvdOqKZ69-T6mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOd=B6LV9rZmtPacfz_F10jj1wrovoGu8yvdOqKZ69-T6mQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-06-21, Nick Desaulniers wrote:
>On Sat, Jun 19, 2021 at 4:32 AM Miguel Ojeda
><miguel.ojeda.sandonis@gmail.com> wrote:
>>
>> On Sat, Jun 19, 2021 at 1:26 PM Miguel Ojeda
>> <miguel.ojeda.sandonis@gmail.com> wrote:
>> >
>> > I am not sure if it is best or not to have the GCC link in order to be
>> > consistent with the rest of the links (they are for the docs only). Do
>> > we know if GCC going to implement it soon?
>>
>> i.e. if GCC does not implement it yet we use elsewhere this kind of
>> marker instead:
>>
>>      * Optional: not supported by gcc
>>
>> The first of its kind, normally it is clang/icc there ;-)
>
>:^) GCC does have an attribute since GCC 7.1 for this.
>https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223#c11
>I'm moving Clang over to use that in
>https://reviews.llvm.org/D104658
>Once that lands, I'll send a v2 (without carrying any reviewed by tags).

Thanks! __attribute__((no_profile_instrument_function)) looks good to me.

Also a reminder that __GCC4_has_attribute___no_profile in v1 misses two
underscores. v2 no_profile_instrument_function may need to fix this.


Reviewed-by: Fangrui Song <maskray@google.com>

>>
>> We could nevertheless have the link there, something like:
>>
>>     * Optional: not supported by GCC
>>                 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80223
>
>-- 
>Thanks,
>~Nick Desaulniers
