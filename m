Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88C0C1CFECF
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 22:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730929AbgELUBT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 16:01:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728275AbgELUBT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 16:01:19 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F94FC061A0C
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2020 13:01:19 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so10069828pjh.2
        for <linux-kbuild@vger.kernel.org>; Tue, 12 May 2020 13:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PCwSIslbRORlMBU/zrbEKiLIDLAVoW5iRK+1eK2Uwrw=;
        b=O+feywUZ2Fdm1hRUuc8qWVqzECIR8y8t3hmfIyhVXigNB6rfZfqY3u+Zbrw+zpVtlB
         nSKY20joQtevkjdC+khHVMKp7QUwU0jhI0C9a+y/ozRiSgGqW9wdWTCjLVhsKQrqdOuh
         Uj8ENDsTeA99Qkh9Qgf1PQggbekLC7G8nKXHYeGaIPjbDt3J8oiHKxU8wdoCWTXLkfhJ
         oc/seQT5ZLn38r8jAOWMsSNAj8fIU7xqufxGF1Wm2lXEFVfcDaxPDYo6C1oET1/dIFwu
         3RP330t+tjOlgiUq50NvYm4+rIIvK61c1UXPv3oZXFUa0O1eYlhwMOaNM/ktGcsO0zJJ
         VJOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PCwSIslbRORlMBU/zrbEKiLIDLAVoW5iRK+1eK2Uwrw=;
        b=CndApOHkXn6WRLnRIVl/yakNI9jNkHvkqf7K1WtSTlKb2uaDR846a/YSdbu6rwhbHS
         dWUri+JnvBD23WSkNCsban5fex5+h5QM5GReULqs8wtNQ6V/XkyngDOxTLs/jm4BPYHE
         +WwCThkEqe7TkSSyPrdsLeXuoXeZBnsCB5ZvPSFUHuAlDJjN+fFIMnwn10UBa3GnjeKr
         xqhUeoIm6MeJTnvnIWuMAAdhFFCrL6PntIoA1aqzMfY0dQFs98lOMuiyW2S6zJMQThj+
         JuO64Hk7NBQ5WqPe/f7ONVVk8yw4lK+8YjI36CNRruXvOiSROI6dLsO+MQtegvUSKibj
         MtlA==
X-Gm-Message-State: AGi0PuaCvb0GLXLLWjF+8M0KsiHVPDDMIs3J5K3nm4p9kSkjbx1hoFBg
        or/P4gpjYS/f1OfQZNsnG48Rzw==
X-Google-Smtp-Source: APiQypI7a004ciHEg8EPZsXRFijEKgFekm31+zu4K1ZfcXt0yMkL+/wHIj1K/cXBJeTgedC/ILBeBg==
X-Received: by 2002:a17:902:b582:: with SMTP id a2mr21848929pls.41.1589313678427;
        Tue, 12 May 2020 13:01:18 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
        by smtp.gmail.com with ESMTPSA id q1sm3154941pfg.194.2020.05.12.13.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:01:17 -0700 (PDT)
Date:   Tue, 12 May 2020 13:01:14 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
Message-ID: <20200512200114.64vo5lbl7wk2tzxk@google.com>
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com>
 <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-05-12, Nick Desaulniers wrote:
>On Mon, May 11, 2020 at 10:54 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> > >On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
>> > ><nick.desaulniers@gmail.com> wrote:
>> > >>
>> > >> As debug information gets larger and larger, it helps significantly save
>> > >> the size of vmlinux images to compress the information in the debug
>> > >> information sections. Note: this debug info is typically split off from
>> > >> the final compressed kernel image, which is why vmlinux is what's used
>> > >> in conjunction with GDB. Minimizing the debug info size should have no
>> > >> impact on boot times, or final compressed kernel image size.
>> > >>
>> Nick,
>>
>> I am OK with this patch.
>>
>> Fangrui provided the minimal requirement for
>> --compress-debug-sections=zlib
>>
>>
>> Is it worth recording in the help text?
>> Do you want to send v2?
>
>Yes I'd like to record that information.  I can also record Sedat's
>Tested-by tag.  Thank you for testing Sedat.
>
>I don't know what "linux-image-dbg file" are, or why they would be
>bigger.  The size of the debug info is the primary concern with this
>config.  It sounds like however that file is created might be
>problematic.
>
>Fangrui, I wasn't able to easily find what version of binutils first
>added support.  Can you please teach me how to fish?

I actually downloaded https://ftp.gnu.org/gnu/binutils/ archives and
located the sources... I think an easier way is:

% cd binutils-gdb
% git show binutils-2_26:./gas/as.c | grep compress-debug-sections
--compress-debug-sections[={none|zlib|zlib-gnu|zlib-gabi}]\n\
...

GNU as 2.25 only supports --compress-debug-sections which means "zlib-gnu" in
newer versions.

Similarly, for GNU ld:

% git show binutils-2_26:./ld/lexsup.c | grep compress-debug-sections
   --compress-debug-sections=[none|zlib|zlib-gnu|zlib-gabi]\n\

(I have spent a lot of time investigating GNU ld's behavior :)

>Another question I had for Fangrui is, if the linker can compress
>these sections, shouldn't we just have the linker do it, not the the
>compiler and assembler?  IIUC the debug info can contain relocations,
>so the linker would have to decompress these, perform relocations,
>then recompress these?  I guess having the compiler and assembler
>compress the debug info as well would minimize the size of the .o
>files on disk.

The linker will decompress debug info unconditionally. Because
input .debug_info sections need to be concatenated to form the output
.debug_info . Whether the output .debug_info is compressed is controlled
by the linker option --compress-debug-sections=zlib, which is not
affected by the compression state of object files.

Both GNU as and GNU ld name the option --compress-debug-sections=zlib.
In a compiler driver context, an unfamiliar user may find
-Wa,--compress-debug-sections=zlib -Wl,--compress-debug-sections=zlib
confusing:/

>Otherwise I should add this flag to the assembler invocation, too, in
>v2.  Thoughts?

Compressing object files along with the linked output should be fine. It
can save disk space. (It'd be great if you paste the comparison
with and w/o object files compressed)

Feel free to add:

Reviewed-by: Fangrui Song <maskray@google.com>

>I have a patch series that enables dwarf5 support in the kernel that
>I'm working up to.  I wanted to send this first.  Both roughly reduce
>the debug info size by 20% each, though I haven't measured them
>together, yet.  Requires ToT binutils because there have been many
>fixes from reports of mine recently.

This will be awesome! I also heard that enabling DWARF v5 for our object
files can easily make debug info size smaller by 20%. Glad that the
kernel can benefit it as well:)
