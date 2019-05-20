Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86BF023000
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2019 11:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730561AbfETJQo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 May 2019 05:16:44 -0400
Received: from mga17.intel.com ([192.55.52.151]:12516 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730302AbfETJQo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 May 2019 05:16:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 May 2019 02:16:44 -0700
X-ExtLoop1: 1
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 May 2019 02:16:41 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        intel-gfx@lists.freedesktop.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [Intel-gfx] [RFC 1/3] kbuild: add support for ensuring headers are self-contained
In-Reply-To: <CAK7LNAQv-fm2iV6HW_FM0Fe6hNDeJ25c9CS2SbroSOneoepFMQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20190516194818.29230-1-jani.nikula@intel.com> <CAK7LNAQv-fm2iV6HW_FM0Fe6hNDeJ25c9CS2SbroSOneoepFMQ@mail.gmail.com>
Date:   Mon, 20 May 2019 12:20:01 +0300
Message-ID: <87zhnh8ou6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 18 May 2019, Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> On Fri, May 17, 2019 at 4:48 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> Sometimes it's useful to be able to explicitly ensure certain headers
>> remain self-contained, i.e. that they are compilable as standalone
>> units, by including and/or forward declaring everything they depend on.
>>
>> Add special target header-test-y where individual Makefiles can add
>> headers to be tested if CONFIG_HEADER_TEST is enabled. This will
>> generate a dummy C file per header that gets built as part of extra-y.
>>
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Cc: Michal Marek <michal.lkml@markovi.net>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  Documentation/kbuild/makefiles.txt |  7 +++++++
>>  init/Kconfig                       |  9 +++++++++
>>  scripts/Makefile.build             | 10 ++++++++++
>>  scripts/Makefile.lib               |  3 +++
>>  4 files changed, 29 insertions(+)
>>
>> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
>> index 03c065855eaf..73df58e5ea0c 100644
>> --- a/Documentation/kbuild/makefiles.txt
>> +++ b/Documentation/kbuild/makefiles.txt
>> @@ -1036,6 +1036,13 @@ When kbuild executes, the following steps are followed (roughly):
>>         In this example, extra-y is used to list object files that
>>         shall be built, but shall not be linked as part of built-in.a.
>>
>> +    header-test-y
>> +
>> +       header-test-y specifies headers (*.h) in the current directory that
>> +       should be compile tested to ensure they are self-contained,
>> +       i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
>> +       this autogenerates dummy sources to include the headers, and builds them
>> +       as part of extra-y.
>>
>>  --- 6.7 Commands useful for building a boot image
>>
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 4592bf7997c0..d91b157201b1 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -95,6 +95,15 @@ config COMPILE_TEST
>>           here. If you are a user/distributor, say N here to exclude useless
>>           drivers to be distributed.
>>
>> +config HEADER_TEST
>> +       bool "Compile test headers that should be standalone compilable"
>> +       help
>> +         Compile test headers listed in header-test-y target to ensure they are
>> +         self-contained, i.e. compilable as standalone units.
>> +
>> +         If you are a developer or tester and want to ensure the requested
>> +         headers are self-contained, say Y here. Otherwise, choose N.
>> +
>>  config LOCALVERSION
>>         string "Local version - append to kernel release"
>>         help
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index 76ca30cc4791..4d4bf698467a 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -291,6 +291,16 @@ quiet_cmd_cc_lst_c = MKLST   $@
>>  $(obj)/%.lst: $(src)/%.c FORCE
>>         $(call if_changed_dep,cc_lst_c)
>>
>> +# Dummy C sources for header test (header-test-y target)
>> +# ---------------------------------------------------------------------------
>> +
>> +quiet_cmd_header_test = HDRTEST $@
>> +      cmd_header_test = echo "\#include \"$(<F)\"" > $@
>> +
>> +# FIXME: would be nice to be able to limit this implicit rule to header-test-y
>> +$(obj)/%.header_test.c: $(src)/%.h FORCE
>> +       $(call if_changed,header_test)
>> +
>>  # Compile assembler sources (.S)
>>  # ---------------------------------------------------------------------------
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 8a1f64f17740..c2839de06485 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
>>  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
>>  endif
>>
>> +# Test self-contained headers
>> +extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.o,$(header-test-y))
>> +
>>  # Add subdir path
>>
>>  extra-y                := $(addprefix $(obj)/,$(extra-y))
>> --
>> 2.20.1
>>
>
>
> Thanks, probably we should do this.
>
> At least, this check will be useful
> for uapi headers since the kernel does not
> test the self-containedness of
> exported headers, (then turned out be problematic
> later in user-space).
>
> I will take a little time to considier
> how far we can extend the idea about
> "headers should be self-contained".

Thanks! Please let me know if/when you need further action from me, I
won't post new versions until then.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
