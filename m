Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88E002CB217
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 02:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgLBBJg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 20:09:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727694AbgLBBJg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 20:09:36 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47BE9C0613D4
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 17:08:56 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q10so150803pfn.0
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 17:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ltLpeaxsolQPncFM8sGYWmfl/tK1nPLTaUTVm/mA5BE=;
        b=wApgbcd8u6gO1J0ik8J/8fQ6zRw+KUw8p0JlvaE9zlEB0CkataSmoW3aHSRLcRoRN6
         On9jYY7GBEN4j2uY36KIHuOP+HXHG4kzK7eL7tCamzOOITQ7M9CSbj3CCFQgx2mAjyMT
         akcayOY8U2YzrhI2zmI5MjAB2KeOxpPZ/H1w8ahGqbyFdwHNGwez8nMfy+KAI8xXwAg8
         O7/b3lhmsq2m7cHdAI/sqThS6DA+MG/RgS868OmeAM4YSZMjUv/meNm6hfB8SXtElU0d
         inArEgjEg+RBbhuHHX+HNmGCATIAqq6M/MnM4ycH0KcWqgRyNkU+i70EpEoYGVgqU6He
         0aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ltLpeaxsolQPncFM8sGYWmfl/tK1nPLTaUTVm/mA5BE=;
        b=IPeaMhI/ujJARFkhJDyp/1iNJc9lT2t4Dc0EJXI7OdsYRamvkEfp9R8YCMDTBsBSe5
         +M/OjUtUF2Nw7pab8d2IhSHROQKeiRfxyQFKhG3/PCgDbezrinsQ08SZA7+pmr+Qki2f
         203vk1FrRZ6oO9DQGofYXq+TCCNBKmFUXaVqbEBhiMI6Kr8khhpqCM3rg/3R+g9LNbnp
         edwpVQgk9Teg3LQX3zqvA8YDD52VsRRojzm+YNGYnVY6e/VS2E7EDfBOP2TJadJzTsuI
         EJlqcVbIs9wrbvUJehym5cJR3h/RzEDQnk0JaGu2XgU4tHgCv84yhSrn8HXndpXrtwqn
         AQ3w==
X-Gm-Message-State: AOAM530SUM8wTmUmpc0kJ6lhGXss655LJ14Ozyxug7cPPUtYvJbd/9IY
        yeFzeYveXt+poBYOVFBF7kPGUA==
X-Google-Smtp-Source: ABdhPJx1XvBkLRcpSj5vH9kuUQzLJZ2S0VxjM6GUhPnPj7ToUg/6uUgoU1BTX4bv7WbCbY+jrgUH7g==
X-Received: by 2002:a63:a62:: with SMTP id z34mr302597pgk.193.1606871335639;
        Tue, 01 Dec 2020 17:08:55 -0800 (PST)
Received: from google.com ([100.117.212.88])
        by smtp.gmail.com with ESMTPSA id f17sm137871pfk.70.2020.12.01.17.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 17:08:54 -0800 (PST)
Date:   Tue, 1 Dec 2020 17:08:50 -0800
From:   =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Jakub Jelinek <jakub@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-toolchains@vger.kernel.org,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Alistair Delva <adelva@google.com>
Subject: Re: [PATCH v2 3/4] Kbuild: make DWARF version a choice
Message-ID: <20201202010850.jibrjpyu6xgkff5p@google.com>
References: <CAK7LNAST0Ma4bGGOA_HATzYAmRhZG=x_X=8p_9dKGX7bYc2FMA@mail.gmail.com>
 <20201104005343.4192504-1-ndesaulniers@google.com>
 <20201104005343.4192504-4-ndesaulniers@google.com>
 <CAK7LNAT5MQqUddv+QbFu5ToLBK3eUPArHSBR=5AOS3ONtMqKaw@mail.gmail.com>
 <CAFP8O3Ki9HoqcV450fn29fBOWAbmuGAdB6USLz8pGsW4Vzf7sg@mail.gmail.com>
 <CAK7LNAS_hxevOS7hKxepyCBVU-4j87Yf5Y8DB6mFq+4xuaz3AA@mail.gmail.com>
 <20201201093253.GJ2672@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201201093253.GJ2672@gate.crashing.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-12-01, Segher Boessenkool wrote:
>On Tue, Dec 01, 2020 at 12:38:16PM +0900, Masahiro Yamada wrote:
>> > We can bump -Wa,-gdwarf-2 to -Wa,-gdwarf-3 since GNU actually emits
>> > DWARF v3 DW_AT_ranges (see
>> > https://sourceware.org/bugzilla/show_bug.cgi?id=26850 )
>> > This can avoid the `warning: DWARF2 only supports one section per
>> > compilation unit` warning for Clang.
>
>That warning should be "there can be only one section with executable
>code per translation unit", or similar.
>
>> I am not a DWARF spec expert.
>
>Neither am I.
>
>> Please teach me.
>>
>> In my understanding, "DWARF2 only supports one section ..."
>> is warned only when building .S files with LLVM_IAS=1
>
>.S files are simply run through the C preprocessor first, and then given
>to the assembler.  The only difference there should be wrt debug info is
>you could have some macros that expand to assembler debug statements.
>
>> If this is due to the limitation of DWARF v2, why is it OK to
>> build .c files with LLVM_IAS?
>
>The compiler can of course make sure not to use certain constructs in
>its generated assembler code, while the assembler will have to swallow
>whatever the user wrote.
>

These are all correct. You can use `llvm-dwarfdump a.o` to dump a .o file.
It has one DW_TAG_compile_unit. If the translation unit has a single
contiguous address range, the assembler can emit a pair of
DW_AT_low_pc/DW_AT_high_pc (available in DWARF v2). In the case of
multiple executable sections, it is not guaranteed that in the final
linked image the sections will be contiguous, so the assembler has to
assume there may be non-contiguous address ranges and use DW_AT_ranges.

Unfortunately DW_AT_ranges was introduced in DWARF v3 and technically
not available in DWARF v2. But GNU as ignores this and emits
DW_AT_ranges anyway (this is probably fine - like using a GNU extension).

If -Wa,-gdwarf-2 -> -Wa,-gdwarf-3 can eliminate the LLVM integrated
assembler's warning, we should do it. If people think -Wa,-gdwarf-2 is
not useful and want to delete it, I'll be happier. Whether it is
necessary to use -Wa,-gdwarf-2/-Wa,-gdwarf-5? Personally I would think
this is unnecessary, but I won't mind if people don't mind the
additional complexity in Makefile. (I implemented the -gdwarf-5 address
range stuff for the integrated assembler).
