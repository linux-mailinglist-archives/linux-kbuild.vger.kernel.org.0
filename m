Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F73427291A
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Sep 2020 16:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgIUOvD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Sep 2020 10:51:03 -0400
Received: from mga03.intel.com ([134.134.136.65]:31824 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727265AbgIUOvD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Sep 2020 10:51:03 -0400
IronPort-SDR: Amya1mXeOo1TtW/QT3Z5iTDVPlBIeZNfyC0x8Esc+pZFV5BOEWg5P9eAG6+rNVBjU4/WR4WP8e
 44cP1ykpp/Bg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="160452967"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="160452967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 07:50:59 -0700
IronPort-SDR: xn/KgqioDKaaG3NN/05jK2y0x4yrX4ejHsSFo1cxy48yoJXrusOhFwTkZuN6UE+b9SatRW4n+0
 vFFIoQbOkZxg==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; 
   d="scan'208";a="321796207"
Received: from apatwary-mobl.amr.corp.intel.com (HELO [10.212.120.65]) ([10.212.120.65])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 07:50:57 -0700
Subject: Re: [PATCH] modpost: allow modpost to fail on warnings
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Filipe Brandenburger <filbranden@google.com>,
        Greg Thelen <gthelen@google.com>,
        Michael Davidson <md@google.com>,
        Eugene Surovegin <surovegin@google.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20200918215010.250580-1-pierre-louis.bossart@linux.intel.com>
 <CAK7LNATUcRpCvu9iQd_s9i5+3kRA96O+DMd-QGbAu-swmVuauw@mail.gmail.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d14745a6-fbdc-ff84-5553-18af6d922989@linux.intel.com>
Date:   Mon, 21 Sep 2020 09:50:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATUcRpCvu9iQd_s9i5+3kRA96O+DMd-QGbAu-swmVuauw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks for the review,

>> Set KBUILD_MODPOST_FAIL_ON_WARNINGS to a non-empty value to make the
>> kbuild fail when modpost generates any warnings. This will avoid
>> misses such as [1] where the SOF CI did not catch a missing module
>> license.
>>
>> This was initially contributed in 2016 [2], rebase/clean-ups and tests
>> by Pierre Bossart.
>>
>> Test example:
>> $ KBUILD_MODPOST_FAIL_ON_WARNINGS=1 make
>>    GEN     Makefile
>>    DESCEND  objtool
>>    CALL    sof-dev/scripts/atomic/check-atomics.sh
>>    CALL    sof-dev/scripts/checksyscalls.sh
>>    CHK     include/generated/compile.h
>>    MODPOST Module.symvers
>> Kernel: arch/x86/boot/bzImage is ready  (#13)
>> WARNING: modpost: missing MODULE_LICENSE() in sound/soc/intel/boards/snd-soc-sof-sdw.o
>> make[2]: *** [sof-dev/scripts/Makefile.modpost:114: Module.symvers] Error 2
> 
> 
> I think [1] should be an error instead of a warning
> by default.

would the following patch be what you have in mind?

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 422f1cfca289..ae1eb67aa0f2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2018,7 +2018,7 @@ static void read_symbols(const char *modname)
         if (!mod->is_vmlinux) {
                 license = get_modinfo(&info, "license");
                 if (!license)
-                       warn("missing MODULE_LICENSE() in %s\n", modname);
+                       error("missing MODULE_LICENSE() in %s\n", modname);
                 while (license) {
                         if (license_is_gpl_compatible(license))
                                 mod->gpl_compatible = 1;


If yes, also wondering if we can still add the option to treat warnings 
as errors as an opt-in behavior?

Thanks!
-Pierre
