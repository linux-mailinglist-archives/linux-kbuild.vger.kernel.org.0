Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C5B4121F0
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Sep 2021 20:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358915AbhITSLH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Sep 2021 14:11:07 -0400
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:58230 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1358913AbhITSIx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Sep 2021 14:08:53 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04426;MF=ashimida@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0Up4MQOX_1632161238;
Received: from ashimida.local(mailfrom:ashimida@linux.alibaba.com fp:SMTPD_---0Up4MQOX_1632161238)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 21 Sep 2021 02:07:22 +0800
Subject: Re: [PATCH] [RFC/RFT]SCS:Add gcc plugin to support Shadow Call Stack
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        keescook@chromium.org, ndesaulniers@google.com,
        akpm@linux-foundation.org, tglx@linutronix.de,
        peterz@infradead.org, samitolvanen@google.com, frederic@kernel.org,
        rppt@kernel.org, yifeifz2@illinois.edu, viresh.kumar@linaro.org,
        colin.king@canonical.com, andreyknvl@gmail.com,
        mark.rutland@arm.com, ojeda@kernel.org, will@kernel.org,
        ardb@kernel.org, luc.vanoostenryck@gmail.com, elver@google.com,
        nivedita@alum.mit.edu, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <1632069436-25075-1-git-send-email-ashimida@linux.alibaba.com>
 <YUeva0jP7P2qCr+R@archlinux-ax161>
From:   Dan Li <ashimida@linux.alibaba.com>
Message-ID: <1e00d088-4ced-d345-63b0-7428e9b8452a@linux.alibaba.com>
Date:   Tue, 21 Sep 2021 02:07:17 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <YUeva0jP7P2qCr+R@archlinux-ax161>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nathan,

Thanks for your comments.
I rewrite the configuration as follows:

1) Change the plugin to be enabled by default, and add this option to CC_FLAGS_SCS to keep its behavior consistent with clang
---
diff --git a/Makefile b/Makefile
@@ -923,12 +923,6 @@ KBUILD_CFLAGS_KERNEL += -ffunction-sections -fdata-sections
-ifdef CONFIG_SHADOW_CALL_STACK
-CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
-KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
-export CC_FLAGS_SCS
-endif

@@ -1034,6 +1028,20 @@ include-$(CONFIG_GCC_PLUGINS)	+= scripts/Makefile.gcc-plugins
  include $(addprefix $(srctree)/, $(include-y))
+ifdef CONFIG_SHADOW_CALL_STACK
+
+ifdef CONFIG_CC_IS_CLANG
+CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
+endif
+
+ifdef CONFIG_CC_IS_GCC
+CC_FLAGS_SCS	:= $(ENABLE_SHADOW_CALL_STACK_PLUGIN)
+endif
+
+KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
+export CC_FLAGS_SCS
+endif

diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
@@ -46,6 +46,13 @@ ifdef CONFIG_GCC_PLUGIN_ARM_SSP_PER_TASK
+gcc-plugin-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK) += arm64_scs_plugin.so
+gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK)	\
+		+= -DSHADOW_CALL_STACK_PLUGIN
+ifdef CONFIG_GCC_PLUGIN_SHADOW_CALL_STACK
+    ENABLE_SHADOW_CALL_STACK_PLUGIN += -fplugin-arg-arm64_scs_plugin-enable
+endif

2) Whether SCS is turned on or not is determined by CONFIG_SHADOW_CALL_STACK
    * GCC_PLUGIN_SHADOW_CALL_STACK is only used to indicate whether current platform needs the support of the gcc SCS plugin
      - It only enabled on ARM64 platform with gcc which does not support SCS(!CC_HAVE_SHADOW_CALL_STACK)
      - If one compiler supports SCS (clang or gcc), then CC_HAVE_SHADOW_CALL_STACK should be true at this time, and the plugin is automatically closed
    * As long as the current platform can support SCS(compiler or plugin), ARCH_SUPPORTS_SHADOW_CALL_STACK is always selected
    * CONFIG_SHADOW_CALL_STACK no longer depends on CC_IS_CLANG
---
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
@@ -19,6 +19,15 @@ menuconfig GCC_PLUGINS
+config GCC_PLUGIN_SHADOW_CALL_STACK
+	bool "GCC Shadow Call Stack plugin"
+	depends on (!CC_HAVE_SHADOW_CALL_STACK) && ARM64
+	default y
+	help	....

diff --git a/arch/Kconfig b/arch/Kconfig
@@ -594,7 +594,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
  
  config SHADOW_CALL_STACK
  	bool "Clang Shadow Call Stack"
-	depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
+	depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
  	depends on DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
  	help
  	  This option enables Clang's Shadow Call Stack, which uses a
	
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
@@ -81,7 +81,7 @@ config ARM64
-	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
+	select ARCH_SUPPORTS_SHADOW_CALL_STACK if (CC_HAVE_SHADOW_CALL_STACK || GCC_PLUGIN_SHADOW_CALL_STACK)
  	select ARCH_SUPPORTS_LTO_CLANG if CPU_LITTLE_ENDIAN
@@ -1060,9 +1060,13 @@ config HW_PERF_EVENTS
  # Supported by clang >= 7.0
  config CC_HAVE_SHADOW_CALL_STACK
-	def_bool $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18)
+	def_bool (CC_IS_CLANG && $(cc-option, -fsanitize=shadow-call-stack -ffixed-x18))


On 9/20/21 5:45 AM, Nathan Chancellor wrote:
> Hi Dan,
>> diff --git a/Makefile b/Makefile
>>   ifdef CONFIG_SHADOW_CALL_STACK
> 
> I would rather see this become
> 
> ifeq ($(CONFIG_SHADOW_CALL_STACK)$(CONFIG_CC_IS_CLANG), yy)
> ...
> endif
> 
> rather than just avoiding assigning to CC_FLAGS_SCS.
> 
> However, how does disabling the shadow call stack plugin work for a
> whole translation unit or directory? There are a few places where
> CC_FLAGS_SCS are filtered out and I am not sure I see where that happens
> here? It looks like the plugin has a disabled option but I do not see it
> hooked in anywhere.
   In the new code, translation unit can only enable SCS when CC_FLAGS_SCS is specified.
   This behavior will be consistent with clang.
   If there are other problems in the future, those two can be modified together.
> 
>> -CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
>> +CC_FLAGS_SCS	:= $(if $(CONFIG_CC_IS_CLANG),-fsanitize=shadow-call-stack,)

>>   KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
>>   export CC_FLAGS_SCS
>>   endif
>> diff --git a/arch/Kconfig b/arch/Kconfig
>> index 98db634..81ff127 100644
>> --- a/arch/Kconfig
>> +++ b/arch/Kconfig
>> @@ -594,7 +594,7 @@ config ARCH_SUPPORTS_SHADOW_CALL_STACK
>>   
>>   config SHADOW_CALL_STACK
>>   	bool "Clang Shadow Call Stack"
>> -	depends on CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK
>> +	depends on (CC_IS_CLANG && ARCH_SUPPORTS_SHADOW_CALL_STACK) || GCC_PLUGIN_SHADOW_CALL_STACK
> 
> Is this logic right? SHADOW_CALL_STACK is only supported by arm64 (as
> they set ARCH_SUPPORTS_SHADOW_CALL_STACK) but now you are enabling it
> for any architecture, even though it seems like it still only works on
> arm64. I think this wants to be
> 
> depends on (CC_IS_CLANG || GCC_PLUGIN_SHADOW_CALL_STACK) && ARCH_SUPPORTS_SHADOW_CALL_STACK
> 
   It's modified to rely only on ARCH_SUPPORTS_SHADOW_CALL_STACK	
>> --- a/scripts/gcc-plugins/Kconfig
>> +++ b/scripts/gcc-plugins/Kconfig
>> @@ -19,6 +19,14 @@ menuconfig GCC_PLUGINS
>>   
>>   if GCC_PLUGINS
>>   
>> +config GCC_PLUGIN_SHADOW_CALL_STACK
>> +	bool "GCC Shadow Call Stack plugin"
> 
> This should also have a
> 
> depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
> 
> if you are selecting SHADOW_CALL_STACK, as selecting does not account
> for dependencies.
   Select is removed from the code above
>> +	select SHADOW_CALL_STACK
>> +	help
>> +	  This plugin is used to support the kernel CONFIG_SHADOW_CALL_STACK
>> +	  compiled by gcc. Its principle is basically the same as that of CLANG.
>> +	  For more information, please refer to "config SHADOW_CALL_STACK"
>> +
>>   config GCC_PLUGIN_CYC_COMPLEXITY
>>   	bool "Compute the cyclomatic complexity of a function" if EXPERT
>>   	depends on !COMPILE_TEST	# too noisy
> 
> Cheers,
> Nathan
> 
