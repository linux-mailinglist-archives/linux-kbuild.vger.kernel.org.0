Return-Path: <linux-kbuild+bounces-2980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6229520E8
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 19:17:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02A56B20EB6
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2024 17:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B2871BBBE4;
	Wed, 14 Aug 2024 17:17:34 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675C11BBBCC;
	Wed, 14 Aug 2024 17:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723655854; cv=none; b=X3mBkKvbMnxLmE9a2lw9peCqVqjEvXuyYKVewF4SMCs0YYA8mdt2HSLSp/r7YFkBf9P++DJHgHMPGUo39+2kDPxUtIH0QQcZ1pOQaGlIXXOI1Rvfol7csSCTnYXK7gnepzoqtlEa+YOls/ixFHxepobhBkSmseMeBCQavKt9y6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723655854; c=relaxed/simple;
	bh=HMX2/eLoTDnU6yYOYrTCte8AzPyhAqThSNP5KPe/mAY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBOTdoOEkrujYJvZetxLuCHrWYKqpWfcOJr1TW37cdqm2OrfInigU1ywIOI25PEay5iGsBMzLxcjVs7m1yyI/hGZLIi9H3x0GQm64pJ3ZAT93DOhv9x2KfeGyKAP6cuYfPOvv89nc2bRfnfurchqQBaNdYrUfih6i5ZE7xLmEDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADF0AC4AF0A;
	Wed, 14 Aug 2024 17:17:32 +0000 (UTC)
Date: Wed, 14 Aug 2024 13:17:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni
 <elena.zannoni@oracle.com>
Subject: Re: [PATCH v5 1/4] kbuild: add mod(name,file)_flags to assembler
 flags for module objects
Message-ID: <20240814131746.0a226e34@gandalf.local.home>
In-Reply-To: <20240716031045.1781332-2-kris.van.hees@oracle.com>
References: <20240716031045.1781332-1-kris.van.hees@oracle.com>
	<20240716031045.1781332-2-kris.van.hees@oracle.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 15 Jul 2024 23:10:42 -0400
Kris Van Hees <kris.van.hees@oracle.com> wrote:


As mentioned before, should start off with the goal.

  In order to create the file at build time, modules.builtin.ranges, that
  contains the range of addresses for all built-in modules, there needs to
  be a way to identify what code is compiled into modules.

  To identify what code is compiled into modules during a kernel build, ...



> In order to be able to identify what code is compiled into modules (even
> built-in modules) during a kernel build, one can look for the presence
> of the -DKBUILD_MODFILE and -DKBUILD_MODNAME options in the compile
> command lines.  A simple grep in .*.cmd files for those options is
> sufficient for this.
> 
> Unfortunately, these options are only passed when compiling C source files.
> Various modules also include objects built from assembler source, and these
> options are not passed in that case.
> 
> Adding $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
> adding $(modname_flags) to a_flags (similar to c_flags) makes it possible
> to identify which objects are compiled into modules for both C and
> assembler soure files.

The rest looks good.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

> 
> Signed-off-by: Kris Van Hees <kris.van.hees@oracle.com>
> ---
>  scripts/Makefile.lib | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 9f06f6aaf7fc..f4aec3553ff2 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -238,7 +238,7 @@ modkern_rustflags =                                              \
>  
>  modkern_aflags = $(if $(part-of-module),				\
>  			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
> -			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
> +			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL) $(modfile_flags))
>  
>  c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>  		 -include $(srctree)/include/linux/compiler_types.h       \
> @@ -248,7 +248,7 @@ c_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>  rust_flags     = $(_rust_flags) $(modkern_rustflags) @$(objtree)/include/generated/rustc_cfg
>  
>  a_flags        = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
> -		 $(_a_flags) $(modkern_aflags)
> +		 $(_a_flags) $(modkern_aflags) $(modname_flags)
>  
>  cpp_flags      = -Wp,-MMD,$(depfile) $(NOSTDINC_FLAGS) $(LINUXINCLUDE)     \
>  		 $(_cpp_flags)


