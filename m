Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A96A7F19F2
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 16:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732039AbfKFPY7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Nov 2019 10:24:59 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44777 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727548AbfKFPY6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 10:24:58 -0500
Received: by mail-wr1-f68.google.com with SMTP id f2so17402700wrs.11
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Nov 2019 07:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gq3QyBnCV9nTAcj4pWnGxrDyFJDXcEPQTCyegYfFr/Q=;
        b=Yw29w3zfakrlCT2cDey3VVh5tDHaCMvIO6MpF158HWHn8WKL35VHLMIsRDFVIsNSb3
         O+xol5hLWGkMcKNbgbXQJ+Syl8SmDYPsnlj3gO5+rxH7995Xa55eoi59bSW1sl8LGwNT
         MFNzYZrSokupdAH46kaI1bdMItV1E4/cSQ/U74/drfSwbEBRH/8EVuUy1cJRtOtHswC3
         fS9e0txk0bEN2DhZHUhV3RQK9cueVoJD6c4oXzHh8Xj/NQqXheI5whwUpy9q8jMzl0qG
         K+P40Ly9s5RlKyhxZecGXYIgpQPVT7+h61bUF/oHxMW/Y5z1jUDA3eOWjw8MiLwI5kiE
         qkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gq3QyBnCV9nTAcj4pWnGxrDyFJDXcEPQTCyegYfFr/Q=;
        b=rfGN+3rT0wYQpl81I+Bjukq+RR50auy5dfxeE9eJURCrLs0jedQf/3LQQi+17RGK0Q
         y8BRqqrqg7uPRQ0BUVSwgyAGDX6Go1hh+eGsAqHAUGr9DLyCyBI7kLpLKoQAR4L6Np2j
         Po88rFK5S/s7aAp+DPpzc6d+uR9X18ssg0NiLi+nCB0Uib/u0/+0/SWM/r6CqxKY4YiT
         i0Wo7/SA+eM9k04i1K2D+aSdEJ0lLxFG/183T0fCzM7wwDVEEegLweoBfBygSq/aAR0V
         FN9wHymLy5MN3LTu1TfH4Voovg2OKt/atPECWBPipgnitkvsurClX6asws1tL/1Xa22G
         hXHg==
X-Gm-Message-State: APjAAAU/zuiuqJPRoBhA78OfmeosoOrIjrBaHCNQkJQ7Y4d2+4CivzvO
        M3lrBcu2nEkKN8GYSS9oCo0VFQ==
X-Google-Smtp-Source: APXvYqz6Y8xt6u4IPXJKj8XE8xu5Mmxd3odbp1p0H8wbFZ9BqHQdElzA8Z1K+Mep13j2EuKKxvvaaQ==
X-Received: by 2002:adf:e712:: with SMTP id c18mr3072972wrm.127.1573053895499;
        Wed, 06 Nov 2019 07:24:55 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id g5sm3423856wmf.37.2019.11.06.07.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 07:24:54 -0800 (PST)
Date:   Wed, 6 Nov 2019 15:24:54 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] modpost: dump missing namespaces into a single
 modules.nsdeps file
Message-ID: <20191106152454.GA1243@google.com>
References: <20191029123809.29301-1-yamada.masahiro@socionext.com>
 <20191029123809.29301-3-yamada.masahiro@socionext.com>
 <20191031112044.GC2177@linux-8ccs>
 <CAK7LNASCmSUuqLyJhZW+3yrGk1KTPxA-_0x86N=Y7A5psCVUSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNASCmSUuqLyJhZW+3yrGk1KTPxA-_0x86N=Y7A5psCVUSg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 31, 2019 at 08:53:25PM +0900, Masahiro Yamada wrote:
>On Thu, Oct 31, 2019 at 8:20 PM Jessica Yu <jeyu@kernel.org> wrote:
>>
>> +++ Masahiro Yamada [29/10/19 21:38 +0900]:
>> >The modpost, with the -d option given, generates per-module .ns_deps
>> >files.
>> >
>> >Kbuild generates per-module .mod files to carry module information.
>> >This is convenient because Make handles multiple jobs when the -j
>> >option is given.
>> >
>> >On the other hand, the modpost always runs as a single thread.
>> >I do not see a strong reason to produce separate .ns_deps files.
>> >
>> >This commit changes the modpost to generate just one file,
>> >modules.nsdeps, each line of which has the following format:
>> >
>> >  <module_name>: <list of missing namespaces>
>> >
>> >Please note it contains *missing* namespaces instead of required ones.
>> >So, modules.nsdeps is empty if the namespace dependency is all good.
>> >
>> >This will work more efficiently because spatch will no longer process
>> >already imported namespaces. I removed the '(if needed)' from the
>> >nsdeps log since spatch is invoked only when needed.
>> >
>> >This also solved the stale .ns_deps files problem reported by
>> >Jessica Yu:
>> >
>> >  https://lkml.org/lkml/2019/10/28/467
>> >
>> >While I was here, I improved the modpost code a little more;
>> >I freed ns_deps_bus.p because buf_write() allocates memory.
>> >
>> >Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> >---
>> >
>> > .gitignore               |  2 +-
>> > Documentation/dontdiff   |  1 +
>> > Makefile                 |  4 ++--
>> > scripts/Makefile.modpost |  2 +-
>> > scripts/mod/modpost.c    | 44 +++++++++++++++++-----------------------
>> > scripts/mod/modpost.h    |  4 ++--
>> > scripts/nsdeps           | 21 +++++++++----------
>> > 7 files changed, 36 insertions(+), 42 deletions(-)
>> >
>> >diff --git a/.gitignore b/.gitignore
>> >index 70580bdd352c..72ef86a5570d 100644
>> >--- a/.gitignore
>> >+++ b/.gitignore
>> >@@ -32,7 +32,6 @@
>> > *.lzo
>> > *.mod
>> > *.mod.c
>> >-*.ns_deps
>> > *.o
>> > *.o.*
>> > *.patch
>> >@@ -61,6 +60,7 @@ modules.order
>> > /System.map
>> > /Module.markers
>> > /modules.builtin.modinfo
>> >+/modules.nsdeps
>> >
>> > #
>> > # RPM spec file (make rpm-pkg)
>> >diff --git a/Documentation/dontdiff b/Documentation/dontdiff
>> >index 9f4392876099..72fc2e9e2b63 100644
>> >--- a/Documentation/dontdiff
>> >+++ b/Documentation/dontdiff
>> >@@ -179,6 +179,7 @@ mkutf8data
>> > modpost
>> > modules.builtin
>> > modules.builtin.modinfo
>> >+modules.nsdeps
>> > modules.order
>> > modversions.h*
>> > nconf
>> >diff --git a/Makefile b/Makefile
>> >index 0ef897fd9cfd..1e3f307bd49b 100644
>> >--- a/Makefile
>> >+++ b/Makefile
>> >@@ -1356,7 +1356,7 @@ endif # CONFIG_MODULES
>> >
>> > # Directories & files removed with 'make clean'
>> > CLEAN_DIRS  += include/ksym
>> >-CLEAN_FILES += modules.builtin.modinfo
>> >+CLEAN_FILES += modules.builtin.modinfo modules.nsdeps
>>
>> Hmm, I tried to run `make -C path/to/kernel/src M=$(PWD) clean` for a test
>> external module, but it didn't remove modules.nsdeps for me. I declared a
>> MODULE namespace for testing purposes.
>>
>> $ make
>> make -C /dev/shm/linux M=/tmp/ppyu/test-module
>> make[1]: Entering directory '/dev/shm/linux'
>>   AR      /tmp/ppyu/test-module/built-in.a
>>   CC [M]  /tmp/ppyu/test-module/test1.o
>>   CC [M]  /tmp/ppyu/test-module/test2.o
>>   LD [M]  /tmp/ppyu/test-module/test.o
>>   Building modules, stage 2.
>>   MODPOST 1 modules
>> WARNING: module test uses symbol try_module_get from namespace MODULE, but does not import it.
>>   CC [M]  /tmp/ppyu/test-module/test.mod.o
>>   LD [M]  /tmp/ppyu/test-module/test.ko
>> make[1]: Leaving directory '/dev/shm/linux'
>>
>> Then I make nsdeps:
>>
>> make -C /dev/shm/linux M=/tmp/ppyu/test-module nsdeps
>> make[1]: Entering directory '/dev/shm/linux'
>>   Building modules, stage 2.
>>   MODPOST 1 modules
>> WARNING: module test uses symbol try_module_get from namespace MODULE, but does not import it.
>> Adding namespace MODULE to module /tmp/ppyu/test-module/test.ko.
>> --- /tmp/ppyu/test-module/test1.c
>> +++ /tmp/cocci-output-3696-c1f8b3-test1.c
>> @@ -38,3 +38,4 @@ static void __exit hello_cleanup(void)
>>  module_init(hello_init);
>>  module_exit(hello_cleanup);
>>  MODULE_LICENSE("GPL");
>> +MODULE_IMPORT_NS(MODULE);
>> make[1]: Leaving directory '/dev/shm/linux'
>> $ cat modules.nsdeps
>> /tmp/ppyu/test-module/test.ko: MODULE
>>
>> Looks good so far, then I try make clean:
>>
>> $ make clean
>> make -C /dev/shm/linux M=/tmp/ppyu/test-module clean
>> make[1]: Entering directory '/dev/shm/linux'
>>   CLEAN   /tmp/ppyu/test-module/Module.symvers
>> make[1]: Leaving directory '/dev/shm/linux'
>> $ ls
>> Makefile  modules.nsdeps  test1.c  test2.c
>>
>> But modules.nsdeps is still there.
>>
>
>Good catch!
>
>I forgot to take care of it for external module builds.
>
>The following should work. I will fold it in 3/4.
>
>
>
>
>diff --git a/Makefile b/Makefile
>index 79be70bf2899..6035702803eb 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1619,7 +1619,7 @@ _emodinst_post: _emodinst_
>        $(call cmd,depmod)
>
> clean-dirs := $(KBUILD_EXTMOD)
>-clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
>+clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers $(KBUILD_EXTMOD)/modules.nsdeps

Reviewed-by: Matthias Maennich <maennich@google.com>
Tested-by: Matthias Maennich <maennich@google.com>

Thanks for this improvement!

Cheers,
Matthias

>
> PHONY += /
> /:
>
>
>
>-- 
>Best Regards
>Masahiro Yamada
