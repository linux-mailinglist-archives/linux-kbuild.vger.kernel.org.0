Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC0B36038E
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 09:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhDOHkx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 03:40:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47684 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231480AbhDOHkv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 03:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618472427;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FABcKglbZyz1XUUkdOXQm+i1lKqkxdPYz82VDd7EHCc=;
        b=E3G/7HUOPVaw66wibjCv1WbFy3oUvSIpPjdbGVrER+fIgFMdIxriPAasDdqOJb3Du7jE5/
        8icemMvkBVKtvzcUgWfSf5p0AYDR8EnlAcwKTSR9fkI0otf1KZhfu/GmUwNat6SdsaObDG
        QEEPJBI/t4Qt+enrR9V/8M5X7ycLMYk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-tEWyrdAZPxuWtH_Lb263gQ-1; Thu, 15 Apr 2021 03:40:25 -0400
X-MC-Unique: tEWyrdAZPxuWtH_Lb263gQ-1
Received: by mail-ej1-f70.google.com with SMTP id lf6-20020a1709071746b029037cee5e31c4so614489ejc.13
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 00:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FABcKglbZyz1XUUkdOXQm+i1lKqkxdPYz82VDd7EHCc=;
        b=DEqQnj6wZG0ZlotMMgIZ6pcfZuO1ycOYQznS6Npj8J/cGU5t0XgWkO+78EokI2Al+d
         oqqOkhn9yJ8dwxcBemWzqm9Fml77NcE/4QzT/j99/gnlyVBzs42rl5pmnS/wkUc1jPCv
         gd3KIzQm+WI2B/m1uC1mpaKHfDlE0bQchG4rq01Cr3SHy/IHPKRpTWgSp/TvWoq31a+z
         pdoRJghfD+DxAaAzp6smqc4tNgm/SiFKydTwBVkZnzD6pmUy76odGeREWMuhdVBkae9k
         e4IqMUf3BxbAgt/WfneB5Lgtzzs5I0ULPaD8UHCSdTL/WuzKDvcLUR7hIKyb/a2ljZvq
         T9Nw==
X-Gm-Message-State: AOAM531ATaE4obQSTOF7O/hW/SE+7UBI8L23f3pf1Mp/WEauV9p3kNeO
        7JhfXObnbIfQDAdzp1N0VIqAqzoRw4+IbV6Qxqr+O8TmRjEQ9MXistIoV+mF5LSrmYxEFu6YKuF
        zIu51vxwsS7wGxIHiZYVcgCiZ
X-Received: by 2002:a17:906:80d6:: with SMTP id a22mr2018524ejx.277.1618472424066;
        Thu, 15 Apr 2021 00:40:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0fuohm6puHv0F4pqjM8Oe2og4+AYVZWqbQ2+dlsXsdUigyAKX+u4GzMQpiq69iOvQF1X+Kw==
X-Received: by 2002:a17:906:80d6:: with SMTP id a22mr2018508ejx.277.1618472423854;
        Thu, 15 Apr 2021 00:40:23 -0700 (PDT)
Received: from [192.168.10.118] ([93.56.169.140])
        by smtp.gmail.com with ESMTPSA id d18sm1701897edv.1.2021.04.15.00.40.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 00:40:23 -0700 (PDT)
Subject: Re: [PATCH 2/2] tools: do not include scripts/Kbuild.include
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Janosch Frank <frankja@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Harish <harish@linux.ibm.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        bpf@vger.kernel.org, clang-built-linux@googlegroups.com,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org
References: <20210415072700.147125-1-masahiroy@kernel.org>
 <20210415072700.147125-2-masahiroy@kernel.org>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9d33ee98-9de3-2215-0c0b-cc856cec1b69@redhat.com>
Date:   Thu, 15 Apr 2021 09:40:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210415072700.147125-2-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 15/04/21 09:27, Masahiro Yamada wrote:
> Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
> scripts/Makefile.compiler"), some kselftests fail to build.
> 
> The tools/ directory opted out Kbuild, and went in a different
> direction. They copy any kind of files to the tools/ directory
> in order to do whatever they want to do in their world.
> 
> tools/build/Build.include mimics scripts/Kbuild.include, but some
> tool Makefiles included the Kbuild one to import a feature that is
> missing in tools/build/Build.include:
> 
>   - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
>     only if supported") included scripts/Kbuild.include from
>     tools/thermal/tmon/Makefile to import the cc-option macro.
> 
>   - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
>     not support -no-pie") included scripts/Kbuild.include from
>     tools/testing/selftests/kvm/Makefile to import the try-run macro.
> 
>   - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
>     failures") included scripts/Kbuild.include from
>     tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
>     target.
> 
>   - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
>     unrecognized option") included scripts/Kbuild.include from
>     tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
>     try-run macro.
> 
> Copy what they want there, and stop including scripts/Kbuild.include
> from the tool Makefiles.

I think it would make sense to add try-run, cc-option and 
.DELETE_ON_ERROR to tools/build/Build.include?

Paolo

> Link: https://lore.kernel.org/lkml/86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com/
> Fixes: d9f4ff50d2aa ("kbuild: spilt cc-option and friends to scripts/Makefile.compiler")
> Reported-by: Janosch Frank <frankja@linux.ibm.com>
> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   tools/testing/selftests/bpf/Makefile          |  3 ++-
>   tools/testing/selftests/kvm/Makefile          | 12 +++++++++++-
>   .../selftests/powerpc/pmu/ebb/Makefile        | 11 ++++++++++-
>   tools/thermal/tmon/Makefile                   | 19 +++++++++++++++++--
>   4 files changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
> index 044bfdcf5b74..d872b9f41543 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
> -include ../../../../scripts/Kbuild.include
>   include ../../../scripts/Makefile.arch
>   include ../../../scripts/Makefile.include
>   
> @@ -476,3 +475,5 @@ EXTRA_CLEAN := $(TEST_CUSTOM_PROGS) $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)	\
>   	prog_tests/tests.h map_tests/tests.h verifier/tests.h		\
>   	feature								\
>   	$(addprefix $(OUTPUT)/,*.o *.skel.h no_alu32 bpf_gcc bpf_testmod.ko)
> +
> +.DELETE_ON_ERROR:
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index a6d61f451f88..8b45bc417d83 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -1,5 +1,15 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -include ../../../../scripts/Kbuild.include
> +
> +TMPOUT = .tmp_$$$$
> +
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
>   
>   all:
>   
> diff --git a/tools/testing/selftests/powerpc/pmu/ebb/Makefile b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> index af3df79d8163..d5d3e869df93 100644
> --- a/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> +++ b/tools/testing/selftests/powerpc/pmu/ebb/Makefile
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
> -include ../../../../../../scripts/Kbuild.include
>   
>   noarg:
>   	$(MAKE) -C ../../
> @@ -8,6 +7,16 @@ noarg:
>   CFLAGS += -m64
>   
>   TMPOUT = $(OUTPUT)/TMPDIR/
> +
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
> +
>   # Toolchains may build PIE by default which breaks the assembly
>   no-pie-option := $(call try-run, echo 'int main() { return 0; }' | \
>           $(CC) -Werror $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS) -no-pie -x c - -o "$$TMP", -no-pie)
> diff --git a/tools/thermal/tmon/Makefile b/tools/thermal/tmon/Makefile
> index 59e417ec3e13..92a683e4866c 100644
> --- a/tools/thermal/tmon/Makefile
> +++ b/tools/thermal/tmon/Makefile
> @@ -1,6 +1,21 @@
>   # SPDX-License-Identifier: GPL-2.0
> -# We need this for the "cc-option" macro.
> -include ../../../scripts/Kbuild.include
> +
> +TMPOUT = .tmp_$$$$
> +
> +try-run = $(shell set -e;		\
> +	TMP=$(TMPOUT)/tmp;		\
> +	mkdir -p $(TMPOUT);		\
> +	trap "rm -rf $(TMPOUT)" EXIT;	\
> +	if ($(1)) >/dev/null 2>&1;	\
> +	then echo "$(2)";		\
> +	else echo "$(3)";		\
> +	fi)
> +
> +__cc-option = $(call try-run,\
> +	$(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> +
> +cc-option = $(call __cc-option, $(CC),\
> +	$(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
>   
>   VERSION = 1.0
>   
> 

