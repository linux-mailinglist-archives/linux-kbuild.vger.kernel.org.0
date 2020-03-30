Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53EBE197367
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Mar 2020 06:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgC3E1a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Mar 2020 00:27:30 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37475 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbgC3E12 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Mar 2020 00:27:28 -0400
Received: by mail-pg1-f194.google.com with SMTP id a32so8091151pga.4
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 21:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wCErMkHXcYOYNzoK4dGPmJDRRznhcOhf9a7n5QpujMY=;
        b=f20+0476azebXfiJB1LAwfN1IiK8IRKj/LdfCjn4RqLtDDsOCu5mTz2ZXCYvGUtGrS
         teSxwLCSdWLS34+2ttzR6QlF0IjfD8PbcSxPLpIBkLOqcPdC9u+FQI6RSpoghEpt6QHJ
         kN9iF1H8gMuCGGT3Zp7LWDaWfM26wn0jNUG2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wCErMkHXcYOYNzoK4dGPmJDRRznhcOhf9a7n5QpujMY=;
        b=ewuw85L94kNCxL8VyKW0MgWNdCGXOSlC1uTDpVn2Y8OxOnpaUawM7G6Hg787dGmU+r
         C+y6VG2BFJ1EFY5BnEgv1XRZZbbY1jiBZ3DbnvtdEmJYOH+XvFe/IYHcbHNDFR5cALX1
         SKlbEVUfM7ot4Yu7VXR3gbaE+y8rAnysiKXw2xZHxu7DIZ1XoPb2GcZXBHrGh6HYqzjq
         Is+Ufq5qLgCmMDg/yxEfP0Sqh+YLshA+cIm5SJWmeNmagyllUQYs0D7am+BwfIs0nReF
         xeUxdNQ+o6CMrWWbmLdD3whvBTHAKD1djEXjpBPyk+UKYq/Rd2iIuIwMVjgETbivN5j+
         ZRog==
X-Gm-Message-State: ANhLgQ2cIgVkiz5XQbDdv3ybqwnTFGYJ0clKw+MIHIDBBXVeHtyPnbGK
        phETI1WZg/feXBuS7T8AiI2TLA==
X-Google-Smtp-Source: ADFU+vsGp6ikNgbOQeqreK5ObCFnBBGCGkKpaZRWMnaVSczh+kUpZkUR3a/dbYlKomAliwaEQB86sQ==
X-Received: by 2002:a63:d255:: with SMTP id t21mr10907513pgi.114.1585542444694;
        Sun, 29 Mar 2020 21:27:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e26sm9142564pfj.61.2020.03.29.21.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 21:27:23 -0700 (PDT)
Date:   Sun, 29 Mar 2020 21:27:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Emese Revfy <re.emese@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kernel-hardening@lists.openwall.com
Subject: Re: [PATCH] gcc-plugins: drop support for GCC <= 4.7
Message-ID: <202003292126.5105600A@keescook>
References: <20200329110832.19961-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329110832.19961-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 29, 2020 at 08:08:32PM +0900, Masahiro Yamada wrote:
> Nobody was opposed to raising minimum GCC version to 4.8 [1]
> So, we will drop GCC <= 4.7 support sooner or later.
> 
> We always use C++ compiler for building plugins for GCC >= 4.8.
> 
> This commit drops the plugin support for GCC <= 4.7 a bit earlier,
> which allows us to dump lots of code.
> 
> [1] https://lkml.org/lkml/2020/1/23/545
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks for getting this cleaned up! I look forward to the 4.8 version
bump. :)

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
> 
> This patch depends on this:
> https://patchwork.kernel.org/patch/11456871/
> 
>  scripts/Kconfig.include      |  3 --
>  scripts/Makefile.build       |  2 +-
>  scripts/Makefile.clean       |  1 -
>  scripts/Makefile.host        | 23 +--------------
>  scripts/gcc-plugin.sh        | 55 +++---------------------------------
>  scripts/gcc-plugins/Kconfig  | 12 ++------
>  scripts/gcc-plugins/Makefile | 21 ++++----------
>  7 files changed, 14 insertions(+), 103 deletions(-)
> 
> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 496d11c92c97..033f6efd92d3 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -42,9 +42,6 @@ $(error-if,$(failure,command -v $(LD)),linker '$(LD)' not found)
>  # Fail if the linker is gold as it's not capable of linking the kernel proper
>  $(error-if,$(success, $(LD) -v | grep -q gold), gold linker '$(LD)' not supported)
>  
> -# gcc version including patch level
> -gcc-version := $(shell,$(srctree)/scripts/gcc-version.sh $(CC))
> -
>  # machine bit flags
>  #  $(m32-flag): -m32 if the compiler supports it, or an empty string otherwise.
>  #  $(m64-flag): -m64 if the compiler supports it, or an empty string otherwise.
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 356601994f3a..9fcbfac15d1d 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -46,7 +46,7 @@ include $(kbuild-file)
>  include scripts/Makefile.lib
>  
>  # Do not include host rules unless needed
> -ifneq ($(hostprogs)$(hostlibs-y)$(hostlibs-m)$(hostcxxlibs-y)$(hostcxxlibs-m),)
> +ifneq ($(hostprogs)$(hostcxxlibs-y)$(hostcxxlibs-m),)
>  include scripts/Makefile.host
>  endif
>  
> diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
> index 1e4206566a82..075f0cc2d8d7 100644
> --- a/scripts/Makefile.clean
> +++ b/scripts/Makefile.clean
> @@ -30,7 +30,6 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
>  __clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
>  		   $(always) $(always-y) $(always-m) $(always-) $(targets) $(clean-files)   \
>  		   $(hostprogs) $(hostprogs-y) $(hostprogs-m) $(hostprogs-) \
> -		   $(hostlibs-y) $(hostlibs-m) $(hostlibs-) \
>  		   $(hostcxxlibs-y) $(hostcxxlibs-m)
>  
>  __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
> diff --git a/scripts/Makefile.host b/scripts/Makefile.host
> index 3b7121d43324..2045855d0b75 100644
> --- a/scripts/Makefile.host
> +++ b/scripts/Makefile.host
> @@ -39,7 +39,6 @@ $(obj)/%.tab.c $(obj)/%.tab.h: $(src)/%.y FORCE
>  # They are linked as C++ code to the executable qconf
>  
>  __hostprogs := $(sort $(hostprogs))
> -host-cshlib := $(sort $(hostlibs-y) $(hostlibs-m))
>  host-cxxshlib := $(sort $(hostcxxlibs-y) $(hostcxxlibs-m))
>  
>  # C code
> @@ -63,7 +62,6 @@ host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
>  host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
>  
>  # Object (.o) files used by the shared libaries
> -host-cshobjs	:= $(sort $(foreach m,$(host-cshlib),$($(m:.so=-objs))))
>  host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-objs))))
>  
>  host-csingle	:= $(addprefix $(obj)/,$(host-csingle))
> @@ -71,9 +69,7 @@ host-cmulti	:= $(addprefix $(obj)/,$(host-cmulti))
>  host-cobjs	:= $(addprefix $(obj)/,$(host-cobjs))
>  host-cxxmulti	:= $(addprefix $(obj)/,$(host-cxxmulti))
>  host-cxxobjs	:= $(addprefix $(obj)/,$(host-cxxobjs))
> -host-cshlib	:= $(addprefix $(obj)/,$(host-cshlib))
>  host-cxxshlib	:= $(addprefix $(obj)/,$(host-cxxshlib))
> -host-cshobjs	:= $(addprefix $(obj)/,$(host-cshobjs))
>  host-cxxshobjs	:= $(addprefix $(obj)/,$(host-cxxshobjs))
>  
>  #####
> @@ -140,13 +136,6 @@ quiet_cmd_host-cxxobjs	= HOSTCXX $@
>  $(host-cxxobjs): $(obj)/%.o: $(src)/%.cc FORCE
>  	$(call if_changed_dep,host-cxxobjs)
>  
> -# Compile .c file, create position independent .o file
> -# host-cshobjs -> .o
> -quiet_cmd_host-cshobjs	= HOSTCC  -fPIC $@
> -      cmd_host-cshobjs	= $(HOSTCC) $(hostc_flags) -fPIC -c -o $@ $<
> -$(host-cshobjs): $(obj)/%.o: $(src)/%.c FORCE
> -	$(call if_changed_dep,host-cshobjs)
> -
>  # Compile .c file, create position independent .o file
>  # Note that plugin capable gcc versions can be either C or C++ based
>  # therefore plugin source files have to be compilable in both C and C++ mode.
> @@ -157,16 +146,6 @@ quiet_cmd_host-cxxshobjs	= HOSTCXX -fPIC $@
>  $(host-cxxshobjs): $(obj)/%.o: $(src)/%.c FORCE
>  	$(call if_changed_dep,host-cxxshobjs)
>  
> -# Link a shared library, based on position independent .o files
> -# *.o -> .so shared library (host-cshlib)
> -quiet_cmd_host-cshlib	= HOSTLLD -shared $@
> -      cmd_host-cshlib	= $(HOSTCC) $(KBUILD_HOSTLDFLAGS) -shared -o $@ \
> -			  $(addprefix $(obj)/, $($(target-stem)-objs)) \
> -			  $(KBUILD_HOSTLDLIBS) $(HOSTLDLIBS_$(target-stem).so)
> -$(host-cshlib): FORCE
> -	$(call if_changed,host-cshlib)
> -$(call multi_depend, $(host-cshlib), .so, -objs)
> -
>  # Link a shared library, based on position independent .o files
>  # *.o -> .so shared library (host-cxxshlib)
>  quiet_cmd_host-cxxshlib	= HOSTLLD -shared $@
> @@ -178,4 +157,4 @@ $(host-cxxshlib): FORCE
>  $(call multi_depend, $(host-cxxshlib), .so, -objs)
>  
>  targets += $(host-csingle)  $(host-cmulti) $(host-cobjs)\
> -	   $(host-cxxmulti) $(host-cxxobjs) $(host-cshlib) $(host-cshobjs) $(host-cxxshlib) $(host-cxxshobjs)
> +	   $(host-cxxmulti) $(host-cxxobjs) $(host-cxxshlib) $(host-cxxshobjs)
> diff --git a/scripts/gcc-plugin.sh b/scripts/gcc-plugin.sh
> index d3caefe53eab..b79fd0bea838 100755
> --- a/scripts/gcc-plugin.sh
> +++ b/scripts/gcc-plugin.sh
> @@ -1,49 +1,14 @@
>  #!/bin/sh
>  # SPDX-License-Identifier: GPL-2.0
> -srctree=$(dirname "$0")
> -
> -SHOW_ERROR=
> -if [ "$1" = "--show-error" ] ; then
> -	SHOW_ERROR=1
> -	shift || true
> -fi
> -
> -gccplugins_dir=$($3 -print-file-name=plugin)
> -plugincc=$($1 -E -x c++ - -o /dev/null -I"${srctree}"/gcc-plugins -I"${gccplugins_dir}"/include 2>&1 <<EOF
> -#include "gcc-common.h"
> -#if BUILDING_GCC_VERSION >= 4008 || defined(ENABLE_BUILD_WITH_CXX)
> -#warning $2 CXX
> -#else
> -#warning $1 CC
> -#endif
> -EOF
> -)
>  
> -if [ $? -ne 0 ]
> -then
> -	if [ -n "$SHOW_ERROR" ] ; then
> -		echo "${plugincc}" >&2
> -	fi
> -	exit 1
> -fi
> +set -e
>  
> -case "$plugincc" in
> -	*"$1 CC"*)
> -		echo "$1"
> -		exit 0
> -		;;
> -
> -	*"$2 CXX"*)
> -		# the c++ compiler needs another test, see below
> -		;;
> +srctree=$(dirname "$0")
>  
> -	*)
> -		exit 1
> -		;;
> -esac
> +gccplugins_dir=$($* -print-file-name=plugin)
>  
>  # we need a c++ compiler that supports the designated initializer GNU extension
> -plugincc=$($2 -c -x c++ -std=gnu++98 - -fsyntax-only -I"${srctree}"/gcc-plugins -I"${gccplugins_dir}"/include 2>&1 <<EOF
> +$HOSTCC -c -x c++ -std=gnu++98 - -fsyntax-only -I $srctree/gcc-plugins -I $gccplugins_dir/include 2>/dev/null <<EOF
>  #include "gcc-common.h"
>  class test {
>  public:
> @@ -52,15 +17,3 @@ public:
>  	.test = 1
>  };
>  EOF
> -)
> -
> -if [ $? -eq 0 ]
> -then
> -	echo "$2"
> -	exit 0
> -fi
> -
> -if [ -n "$SHOW_ERROR" ] ; then
> -	echo "${plugincc}" >&2
> -fi
> -exit 1
> diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
> index 7b63c819610c..a857d69322b4 100644
> --- a/scripts/gcc-plugins/Kconfig
> +++ b/scripts/gcc-plugins/Kconfig
> @@ -1,13 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -preferred-plugin-hostcc := $(if-success,[ $(gcc-version) -ge 40800 ],$(HOSTCXX),$(HOSTCC))
> -
> -config PLUGIN_HOSTCC
> -	string
> -	default "$(shell,$(srctree)/scripts/gcc-plugin.sh "$(preferred-plugin-hostcc)" "$(HOSTCXX)" "$(CC)")" if CC_IS_GCC
> -	help
> -	  Host compiler used to build GCC plugins.  This can be $(HOSTCXX),
> -	  $(HOSTCC), or a null string if GCC plugin is unsupported.
> -
>  config HAVE_GCC_PLUGINS
>  	bool
>  	help
> @@ -17,7 +8,8 @@ config HAVE_GCC_PLUGINS
>  menuconfig GCC_PLUGINS
>  	bool "GCC plugins"
>  	depends on HAVE_GCC_PLUGINS
> -	depends on PLUGIN_HOSTCC != ""
> +	depends on CC_IS_GCC && GCC_VERSION >= 40800
> +	depends on $(success,$(srctree)/scripts/gcc-plugin.sh $(CC))
>  	default y
>  	help
>  	  GCC plugins are loadable modules that provide extra features to the
> diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
> index efff00959a9c..f22858b2c3d6 100644
> --- a/scripts/gcc-plugins/Makefile
> +++ b/scripts/gcc-plugins/Makefile
> @@ -1,18 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
> -PLUGINCC := $(CONFIG_PLUGIN_HOSTCC:"%"=%)
>  GCC_PLUGINS_DIR := $(shell $(CC) -print-file-name=plugin)
>  
> -ifeq ($(PLUGINCC),$(HOSTCC))
> -  HOSTLIBS := hostlibs
> -  HOST_EXTRACFLAGS += -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=gnu99 -ggdb
> -  export HOST_EXTRACFLAGS
> -else
> -  HOSTLIBS := hostcxxlibs
> -  HOST_EXTRACXXFLAGS += -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=gnu++98 -fno-rtti
> -  HOST_EXTRACXXFLAGS += -fno-exceptions -fasynchronous-unwind-tables -ggdb
> -  HOST_EXTRACXXFLAGS += -Wno-narrowing -Wno-unused-variable -Wno-c++11-compat
> -  export HOST_EXTRACXXFLAGS
> -endif
> +HOST_EXTRACXXFLAGS += -I$(GCC_PLUGINS_DIR)/include -I$(src) -std=gnu++98 -fno-rtti
> +HOST_EXTRACXXFLAGS += -fno-exceptions -fasynchronous-unwind-tables -ggdb
> +HOST_EXTRACXXFLAGS += -Wno-narrowing -Wno-unused-variable -Wno-c++11-compat
>  
>  $(obj)/randomize_layout_plugin.o: $(objtree)/$(obj)/randomize_layout_seed.h
>  quiet_cmd_create_randomize_layout_seed = GENSEED $@
> @@ -22,9 +13,9 @@ $(objtree)/$(obj)/randomize_layout_seed.h: FORCE
>  	$(call if_changed,create_randomize_layout_seed)
>  targets = randomize_layout_seed.h randomize_layout_hash.h
>  
> -$(HOSTLIBS)-y := $(foreach p,$(GCC_PLUGIN),$(if $(findstring /,$(p)),,$(p)))
> -always-y := $($(HOSTLIBS)-y)
> +hostcxxlibs-y := $(foreach p,$(GCC_PLUGIN),$(if $(findstring /,$(p)),,$(p)))
> +always-y := $(hostcxxlibs-y)
>  
> -$(foreach p,$($(HOSTLIBS)-y:%.so=%),$(eval $(p)-objs := $(p).o))
> +$(foreach p,$(hostcxxlibs-y:%.so=%),$(eval $(p)-objs := $(p).o))
>  
>  clean-files += *.so
> -- 
> 2.17.1
> 

-- 
Kees Cook
