Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33D41D1E6E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2020 21:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390351AbgEMTAl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 May 2020 15:00:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2390336AbgEMTAk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 May 2020 15:00:40 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4843C061A0E
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2020 12:00:40 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id f15so197716plr.3
        for <linux-kbuild@vger.kernel.org>; Wed, 13 May 2020 12:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J7twM4zRYFpQBLZ3sUs+Kg98wBvx8UDi+wQlseLaMQc=;
        b=rq8aGCshEh3yCtRsODzFoOlFOCxc2RRBsm4sz3BoP6/1YquMEAsJ8+DWPhvjH3R+uk
         2GpM9Mydixb9MqMJegZ+znldd7Gh5c9wRxEt3PW0NnBx0DIgmy+CVy1PlxZ9berC1uuQ
         VyTtDovSh7efn2ky50XeeJ0ES5B5SBun48K9sQCMHOiNQulm60FGceRrGuErabffWS5w
         MWOBpO2MctYIYsgPFjhMUQO4RjbjZ+1zE/MBLevV/zjEiM5jIoKE+QUEZiR0Yg0W+LEq
         CuKEtU8yufsgeQyyPtNn4fjrjCNVoiMFImZ0hhgkKbYGDybXI2k2haVQqi0qaq0Kk0JJ
         BgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J7twM4zRYFpQBLZ3sUs+Kg98wBvx8UDi+wQlseLaMQc=;
        b=DkivYJm1I3Ko5lq0Wq0rSJzy4mmp+hRcCQ/OYszCBaGaFA2kXVdKk7luBZ+aPIFvor
         GpJmlyryyagEv/tiEUbUZiDBbFc+ncapvDuWnSbuF38mcfLkZv8fhqa0YA5BiSFaUMrC
         Sy1j4ouFAU87Tcl43GUEeqLF38rlVXikjOusZ7hAgg8dN56k71pNnNGAf5iStl2zsq5V
         ji3waV7XO+vewbq49QVxJO/kxWebtPGBzZUrs2wzXk7J+ZvOPm9lUUW+NWe3jbTTz6bT
         QCs81f4Sbkf9skYPN0xEWUGpAgx/DeOGkTPOzgFXHD8AMd+0EowpG8vWD3M/hP5hzcx8
         EqXw==
X-Gm-Message-State: AGi0PuZ9h+uRfTngkJHc3A5sW4KEUv60EhUMJW4OG0DiGVyOrNUTNKgw
        P2U7U7Rt+g78YORvIf7YgZkSl5IyO/o8x9wFOl/PHg==
X-Google-Smtp-Source: APiQypKUnyaDlwp/m+DRboqHGPykffdQ19U0fIOjS69kODkfPnAD3sk0zQewMEI075IPfkEp2VLogjkmpyvXqcZilg0=
X-Received: by 2002:a17:90b:2302:: with SMTP id mt2mr30435954pjb.25.1589396440044;
 Wed, 13 May 2020 12:00:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
 <20200505004738.ew2lcp27c2n4jqia@google.com> <CAK7LNAR7-VMEWBcJ_Wd+61ZDHEa0gD8FaSs63YPu7m_FgH8Htg@mail.gmail.com>
 <CAKwvOdmEP9Auuc+M+MqPoQmx+70DgdsPYZQ6pg=8oGnfCviqRA@mail.gmail.com> <20200512200114.64vo5lbl7wk2tzxk@google.com>
In-Reply-To: <20200512200114.64vo5lbl7wk2tzxk@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 13 May 2020 12:00:29 -0700
Message-ID: <CAKwvOdnArcsqusvmMDUJyTjVhkOufJZoRHxg-ARDfPhfjNj_JA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Fangrui Song <maskray@google.com>, nickc@redhat.com,
        "H.J. Lu" <hjl.tools@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 12, 2020 at 1:01 PM Fangrui Song <maskray@google.com> wrote:
>
> >Fangrui, I wasn't able to easily find what version of binutils first
> >added support.  Can you please teach me how to fish?
>
> I actually downloaded https://ftp.gnu.org/gnu/binutils/ archives and
> located the sources... I think an easier way is:
>
> % cd binutils-gdb
> % git show binutils-2_26:./gas/as.c | grep compress-debug-sections

This assumes you knew to look at the binutils-2_26 tag, which is
putting the cart before the horse. ;)

I guess:
$ git log gas/as.c
/compress-debug-sections
commit 19a7fe52ae3d ("Make default compression gABI compliant")
looks related
$ git describe --contains "19a7fe52ae3d" | sed 's/~.*//'
users/hjl/linux/release/2.25.51.0.4
so it landed in 2.25.51.0.4.

+ Nick, H.J.
I'm unfamiliar with the git tag conventions of binutils.  Does a patch
that landed in 2.25.51.0.4 mean it shipped in the official 2.25
release, or 2.26 release?  Specifically, commit 19a7fe52ae3d.

> --compress-debug-sections[={none|zlib|zlib-gnu|zlib-gabi}]\n\
> ...
>
> GNU as 2.25 only supports --compress-debug-sections which means "zlib-gnu" in
> newer versions.
>
> Similarly, for GNU ld:
>
> % git show binutils-2_26:./ld/lexsup.c | grep compress-debug-sections
>    --compress-debug-sections=[none|zlib|zlib-gnu|zlib-gabi]\n\
>
> (I have spent a lot of time investigating GNU ld's behavior :)
>
> >Another question I had for Fangrui is, if the linker can compress
> >these sections, shouldn't we just have the linker do it, not the the
> >compiler and assembler?  IIUC the debug info can contain relocations,
> >so the linker would have to decompress these, perform relocations,
> >then recompress these?  I guess having the compiler and assembler
> >compress the debug info as well would minimize the size of the .o
> >files on disk.
>
> The linker will decompress debug info unconditionally. Because
> input .debug_info sections need to be concatenated to form the output
> .debug_info . Whether the output .debug_info is compressed is controlled
> by the linker option --compress-debug-sections=zlib, which is not
> affected by the compression state of object files.
>
> Both GNU as and GNU ld name the option --compress-debug-sections=zlib.
> In a compiler driver context, an unfamiliar user may find
> -Wa,--compress-debug-sections=zlib -Wl,--compress-debug-sections=zlib
> confusing:/

The kernel uses the compiler as the driver for out of line assembly,
as they are all preprocessed first.  Most out of line assembly in the
kernel uses the C preprocessor to #include headers that share #defines
of common constants shared between C and asm.  #ifdef __ASSEMBLY__ is
used frequently in these headers.  But for the linker, the linker
itself is invoked as the driver, though there are a few
inconsistencies we've cleaned up or still have to.

>
> >Otherwise I should add this flag to the assembler invocation, too, in
> >v2.  Thoughts?
>
> Compressing object files along with the linked output should be fine. It
> can save disk space. (It'd be great if you paste the comparison
> with and w/o object files compressed)
>
> Feel free to add:
>
> Reviewed-by: Fangrui Song <maskray@google.com>

Thanks, will add that to v2.

>
> >I have a patch series that enables dwarf5 support in the kernel that
> >I'm working up to.  I wanted to send this first.  Both roughly reduce
> >the debug info size by 20% each, though I haven't measured them
> >together, yet.  Requires ToT binutils because there have been many
> >fixes from reports of mine recently.
>
> This will be awesome! I also heard that enabling DWARF v5 for our object
> files can easily make debug info size smaller by 20%. Glad that the
> kernel can benefit it as well:)

-- 
Thanks,
~Nick Desaulniers
