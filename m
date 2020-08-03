Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3929423AE1E
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Aug 2020 22:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgHCU3t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Aug 2020 16:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgHCU3t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Aug 2020 16:29:49 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02B3C06174A;
        Mon,  3 Aug 2020 13:29:48 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 184so827769wmb.0;
        Mon, 03 Aug 2020 13:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=rx326n8kqvmqtDBZg2KJuCvQxOiqLWGvh0q5L2Syl5A=;
        b=A2pYtwPqV8cohAbvhHd+HDXl+q3mcOCDXEbjCVHBzEhbrgBn79Zjx0N6XV7Vijz5pg
         Yd6pPcpjGEuuPk6nYCZ01Q34+8XtkdiaohLtU63fXO6EIoCZXtRhZwJ9c/1kqZes4985
         vBqVckV6S5XLp2V+l5Hf7JNEuEDJyuVs1WvhqnECWu+1lxP0gTHw88ykt0Y5bjyK6FD8
         3oMD0gQ/wWo21H0eMS+dmUFYL0obfNueURQLOZwjQVrk08MSP1g+R3dGMNY63kEh9dWB
         gxT47LCArO6dIMoEsy8Iqr2v6UsqzcWnnpyj3dJGkYSYGimygDQN/PA2V9pWDu1mNS8M
         aPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=rx326n8kqvmqtDBZg2KJuCvQxOiqLWGvh0q5L2Syl5A=;
        b=kYET5HERxeUhdR9q+llJw53tiLVe4qkbHGag1ko41eSv1MJKJpRyYe7qPtawRdKxjX
         qb47XE5BVKOMyQDMH47iDab/h37rxNarrLx1lJV6tD/vg7iOM4T/jWu5B9iua2w4yE/o
         7mCQjadyrwFyczOSpCFguV+opxU0YT+Ln/B7KxfLYoodzBwTfJ7lXj1kPAm1VTaFhGfQ
         vRqi5PaxJXSiRJuXdbskmNE6qUzORjRvkbmVSAw1Ci9ZyQQV51DVET9aO+4KXvysFD8L
         LW3CfT0Y5w5IRGw5c/tXOXwC4nD9uODephibPaX4+EpEnDSqHTsT0YPWRi/tTMGCNBI7
         6M8w==
X-Gm-Message-State: AOAM530eUQX250yICAoJ4RZX+Y0qx68kP0dl5/WIZ6dJQoLpkhvOSXwn
        QgQRvOvvsiDIV94VRKEGO8U=
X-Google-Smtp-Source: ABdhPJwS4tV5NQmuZcMsuCmlX4im7NjZ/SM18Vg7KW8Df9iXv+mBdrrDCVXNuyPVUSASFrVJhUt7Zw==
X-Received: by 2002:a1c:1904:: with SMTP id 4mr775421wmz.119.1596486587182;
        Mon, 03 Aug 2020 13:29:47 -0700 (PDT)
Received: from felia ([2001:16b8:2dc4:9300:551e:9193:4727:1515])
        by smtp.gmail.com with ESMTPSA id v29sm27887294wrv.51.2020.08.03.13.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 13:29:46 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date:   Mon, 3 Aug 2020 22:29:39 +0200 (CEST)
X-X-Sender: lukas@felia
To:     Nick Desaulniers <ndesaulniers@google.com>
cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Pirama Arumuga Nainar <pirama@google.com>,
        Bill Wendling <morbo@google.com>
Subject: Re: [PATCH v7] Makefile: Add clang-tidy and static analyzer support
 to makefile
In-Reply-To: <CAKwvOd=V6-p1H1F65gFAQm+h4Qgt_98-XJeUSNaONmPE9yZciA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2008032138070.9503@felia>
References: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com> <20200728004736.3590053-1-nhuck@google.com> <alpine.DEB.2.21.2008012031540.14646@felia> <CAKwvOd=V6-p1H1F65gFAQm+h4Qgt_98-XJeUSNaONmPE9yZciA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On Mon, 3 Aug 2020, Nick Desaulniers wrote:

> On Sat, Aug 1, 2020 at 12:23 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Hi Nathan, Hi Nick,
> >
> > I have been busy with other topics around the kernel and static analysis;
> > but then, I read clang and static analysis in my mailbox in this patch.
> >
> > So, I thought let me give this patch a try on the weekend.
> >
> > I applied the patch on next-2020729; that worked.
> >
> > Then:
> > $ make clang-tidy
> > scripts/clang-tools/Makefile.clang-tools:13: *** clang-tidy requires
> > CC=clang.  Stop.
> >
> > Okay, that is a good and clear error message.
> >
> > Then:
> >
> > $ make CC=clang-10 defconfig
> > $ make CC=clang-10 clang-tidy
> >
> > python3 scripts/clang-tools/gen_compile_commands.py
> > WARNING: Found 8 entries. Have you compiled the kernel?
> > python3 scripts/clang-tools/run-clang-tools.py clang-tidy
> > compile_commands.json
> >
> > Then actually an error in clang-tidy.
> > Error: no checks enabled.
> > USAGE: clang-tidy [options] <source0> [... <sourceN>]
> > ...
> >
> > I will get to that later how I fixed that for my setup.
> >
> > Okay, good, that is clear... I need to compile it first, got it.
> 
> Hi Lukas,
> Thank you so much for taking the time to apply the patch and help test it.
> 
> For the case of not doing a build first: gen_compile_commands.py
> parses the .*.d files to build the compilation database and warns if
> not many were found.  I think it might be interesting for it to just
> invoke a build if it sees that, or maybe for the clang-tidy and
> clang-analyzer targets to somehow invoke the default make target.  The
> issue there might be that you need to invoke `make clang-tidy` with
> `make CC=clang LD=ld.lld ... clang-tidy` in order to trigger a build
> successfully.
>

I think the workflow is good as it is.

This already indicates to me that the clang-tidy result will depend on the 
kernel config and the build, which is helpful to know.

The coccicheck target, e.g., ignores the kernel config; other basic 
'syntactic' checks in the Makefile, such as make includecheck, seem also 
to be config-independent, but you cannot run it without having a config...
that is a bit inconsistent in that case.
 
> Also, I wonder if gen_compile_commands.py should set a return code in
> that case so that callers can handle such an exceptional case?  In
> that case, I'd consider that a papercut or potential improvement to
> scripts/get_compile_commands.py orthogonal to this patch.
>

I cannot see the immediate use case yet, but maybe I can provide a 
specific use case once I try using clang-tidy in my attempt to work with 
Ericsson's CodeChecker Web UI. It is still a very investigation for me 
here with that.

> >
> > $ make CC=clang-10
> > $ make CC=clang-10 clang-tidy
> >
> > Okay, I run except for the fix I needed.
> >
> > Where is the output from clang-tidy?
> >
> > It prints:
> >
> > python3 scripts/clang-tools/gen_compile_commands.py
> > python3 scripts/clang-tools/run-clang-tools.py clang-tidy compile_commands.json
> >
> > That is it. Does that mean 0 warnings, or where do I find the output?
> > The script suggests it should be in stderr once all the parallel runs
> > collected it, right?
> >
> > I was confused; maybe a short summary output might help here.
> 
> I was also caught by this; for x86 defconfig, the kernel is actually
> clean of instances of linuxkernel-* clang-tidy checks (there was also
> an issue with the CWD for x86 in v6, but was resolved in v7 of this
> patch).  I had to add a case that should fail to make clang-tidy have
> output, and the check only checks for unchecked "ERR_PTR", "PTR_ERR",
> "IS_ERR", "IS_ERR_OR_NULL", "ERR_CAST", "PTR_ERR_OR_ZERO".
> (Documentation for that should be improved.) So if you add a function
> that just constructs an `ERR_PTR(0)` and call it from code that gets
> compiled in, then you'll start to see warnings from clang-tidy for x86
> defconfig.  For aarch64 and arm, you'll see there are some unchecked
> cases that look like low hanging fruit to fix.
>
> It probably can be improved to note that there was no output, but that
> will require more machinery to track how much output there was.  I'd
> prefer to follow up with additional polish on top of this once this
> lands.
>

Agree, it is somehow unfortunate that clang-tidy cannot provide such 
summary. No big issue, though. You will just have further developers 
asking the same question when more developers are attracted...
 
> >
> > Then, I ran
> >
> > $ make CC=clang-10 clang-analyzer
> >
> > And I see a lot of warnings... I guess that is intended.
> >
> > There is a lot of:
> >
> > Suppressed XX warnings (XX in non-user code).
> > Use -header-filter=.* to display errors from all non-system headers. Use -system-headers to display errors from system headers as well.
> >
> > To an outsider, it is unclear if that is intended or if the tool is broken
> > in this setup.
> >
> > Is there are way to silent that meta-warning? Or is my setup broken?
> 
> See also my comment about disabling the clang-diagnostic-* analyzer
> checks. We haven't had time to sort out the cause of them yet, and for
> now they just look like noise.
>

Okay, good to know. So, my setup is not broken and the tool works :)

So, then I guess I finished with this result:

Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


> >
> > In summary, it is pretty clear how to run clang-tidy and clang-analyzer
> > and it was a pretty smooth experience, even with no documentation at hand.
> >
> > It was fun for me. Keep up the good work!
> >
> > Just one issue... see below.
> >
> > > +    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
> >
> > You hardcoded here: clang-tidy
> >
> > But in my Ubuntu 18.04 setup, I got multiple versions of clang and
> > clang-tidy installed; yeah, maybe my setup is broken, but maybe those from
> > others are similar.
> >
> > When I run:
> >
> >   make CC=clang-10 clang-tidy
> >
> > it picks up the "wrong" clang-tidy version...
> >
> > My setup is:
> >
> > $ which clang-tidy
> > /usr/bin/clang-tidy
> >
> > $ which clang-tidy-10
> > /usr/bin/clang-tidy-10
> >
> > $ clang-tidy --version
> > LLVM (http://llvm.org/):
> >   LLVM version 6.0.0
> >
> >   Optimized build.
> >   Default target: x86_64-pc-linux-gnu
> >   Host CPU: znver1
> >
> > $ clang-tidy-10 --version
> > LLVM (http://llvm.org/):
> >   LLVM version 10.0.1
> >
> >   Optimized build.
> >   Default target: x86_64-pc-linux-gnu
> >   Host CPU: znver1
> >
> > When I run make CC=clang-10 clang-tidy, I would expect it to use
> > clang-tidy-10, not clang-tidy. (clang-tidy errors just because it is too
> > old; I guess it does have the linuxkernel-* options.)
> >
> > Now, I cannot fix that without touching your script. There is no way I can
> > tell the build target to use clang-tidy-10.
> >
> > With a quick touch:
> >
> > -    p = subprocess.run(["clang-tidy", "-p", args.path, checks, entry["file"]],
> > +    p = subprocess.run(["clang-tidy-10", "-p", args.path, checks, entry["file"]],
> >
> > I got it to work.
> >
> > Maybe you have a good idea how to get make clang-tidy to pick
> > up the intended version without touching the python script itself?
> >
> > It is a minor issue, but it would be nice if that setting would work
> > somehow.
> 
> Ah right, sorry, I tend to forget about the use case of having
> multiple versions of clang installed.
> 
> I think the best approach here might be for the user (you, in this
> case) to ensure that list of PATHs in the path list has the path to
> the intended version of clang-tidy you'd like to run listed before
> others.  That is similar to the recommendation for the LLVM=1 patch
> set. ie.
> commit a0d1c951ef08e ("kbuild: support LLVM=1 to switch the default
> tools to Clang/LLVM")
> specifically this part of the commit message:
> 
> > the suffixed versions in /usr/bin/ are symlinks to binaries in
> > /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> 
> If `clang-tidy` on your system points to an old version of clang-tidy,
> it may be worthwhile to uninstall the old version, and update the
> symlink to point to a newer version.  That may be simpler than trying
> to support invoking `make clang-tidy` for arbitrary versions or binary
> names of clang-tidy.  I can understand having multiple versions of a
> compiler installed for quickly checking compatibility (though these
> days I prefer godbolt.org for that) or if a particular codebase is
> stuck on an old version of a toolchain for whatever reason; but having
> multiple versions of clang-tidy installed and supporting all of them
> is a little harder to justify.

I can live with that. I can modify the script or modify the symbolic link 
of clang-tidy. No need to support arbitrary broken setups :)


Other question I came across while playing around with clang-tidy on the 
kernel sources.

Is it possible to simply have a .clang-tidy in the repository root to 
configure the clang-tidy invocation rather than having it in the python 
script? If not, why?

I tried it, but I could not really figure out what I really needed to do 
to get the same output behavior than Nathan's command-line invocation 
from the python script.

Here is my .clang-tidy attempt:

$ cat .clang-tidy 
Checks:		'-*,linuxkernel-*'

$ clang-tidy -dump-config
---
Checks:          'clang-diagnostic-*,clang-analyzer-*,-*,linuxkernel-*'
WarningsAsErrors: ''
HeaderFilterRegex: ''
AnalyzeTemporaryDtors: false
FormatStyle:     none
User:            lukas
CheckOptions:    
  - key:             
google-readability-braces-around-statements.ShortStatementLines
    value:           '1'
  - key:             google-readability-function-size.StatementThreshold
    value:           '800'
  - key:             
google-readability-namespace-comments.ShortNamespaceLines
    value:           '10'
  - key:             
google-readability-namespace-comments.SpacesBeforeComments
    value:           '2'
  - key:             modernize-loop-convert.MaxCopySize
    value:           '16'
  - key:             modernize-loop-convert.MinConfidence
    value:           reasonable
  - key:             modernize-loop-convert.NamingStyle
    value:           CamelCase
  - key:             modernize-pass-by-value.IncludeStyle
    value:           llvm
  - key:             modernize-replace-auto-ptr.IncludeStyle
    value:           llvm
  - key:             modernize-use-nullptr.NullMacros
    value:           'NULL'
...

I could not understand why 'clang-diagnostic-*,clang-analyzer-*' is still 
there when running clang-tidy. I think that actually leads to more 
(unwanted) findings, when I run for example:

$ find ./kernel/trace/ -name '*.c' -exec clang-tidy {} +

such as:

./arch/x86/include/asm/apic.h:107:2: error: expected '(' after 'asm' 
[clang-diagnostic-error]
        alternative_io("movl %0, %P1", "xchgl %0, %P1", X86_BUG_11AP,
        ^
./arch/x86/include/asm/alternative.h:240:2: note: expanded from macro 
'alternative_io'
        asm_inline volatile (ALTERNATIVE(oldinstr, newinstr, feature)   \
        ^
./include/linux/compiler_types.h:239:24: note: expanded from macro 
'asm_inline'
#define asm_inline asm __inline
                       ^

Is there no way to completely override the standard clang-tidy 
configuration with .clang-tidy file?

I expected that ',-*' deactivates everything that was activated to the 
left of this checks expression, but it seems not to be the case. 

Did you also try that and hence then settled for passing that checks as 
command-line argument because there is no way to have a sane .clang-tidy 
file in the root? Or did I stumble on some .clang-tidy file 
misunderstanding and we can actually place a .clang-tidy file for simple 
use cases as the example, find ... -exec clang-tidy {} +, above?


Lukas

> -- 
> Thanks,
> ~Nick Desaulniers
> 
