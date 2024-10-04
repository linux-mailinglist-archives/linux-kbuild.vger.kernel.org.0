Return-Path: <linux-kbuild+bounces-3919-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1C8991048
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 22:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842AB281B88
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 20:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8C11DE885;
	Fri,  4 Oct 2024 20:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="rztRO+h0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02C01D9588;
	Fri,  4 Oct 2024 20:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728072336; cv=none; b=WOMlEMzvkN8iY73cAinOuSaBIcMN1C6Mw1M82Z8l/4EDPreaB1eGDSfIIpGloBnTIP4FhBlNBtQBaxv/60VNaQNFm8eComCO5Ce2Ihulh/Ea3aPbHKLmOoAeS/uNsAKDTXA9wlgboe7Q9q7p7sE4CppY4vaNTvRFiBxj+QUuzYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728072336; c=relaxed/simple;
	bh=lnQnwX51KbeTOk7EqjEaYfYznToRgOVeG1zxycB9DWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bmh2wp6m180VoZlzIPV/ySYxuuFCqOxgAqQrXLwh6J8YVbT7itkXYzv1Q5YeUdIrdWd6NkOlmAz95lpGX6e4Ox6JfAqunha34rjhFajtb7XlDOKhqaDuUhZr4t/iBKISrhlHAA77I3vIqKltsvZMDPETszI5/0Q/tqzxW/aasws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=rztRO+h0; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6WRL0xjAowkqD9cS0vENvWnFkgzMYtUzJr8oCNaqviI=; b=rztRO+h02B1O82cu6Gj2CMMf8j
	CjC/xddPpd8MT1+u63uQto9PGxfkeejXLeJQI7rGTx8LYsbup61t1OQsFBYE6PK6rPAYgTxuua4Mu
	BM8cxYzMgu07pQ3/sjXSV2MF8Sfs2iYV57FJES6dHpafyF5h43BXigTTX0HAS8rWn0wkWg+cBRn+B
	NTDqfGq05EX6jS1+a+QQHvTs5PDRIKzRdvog8MQRgN4EwQcKX5XoH0BRnFbigFJnYywlbiL2WCL7f
	TWl361PbtIprlmLqaB0XbEF5Fkn18kxbd6wOPcZROQWwJ9qEJ5jH9k8qHEMMb7dxQ+9Cl4wBPuAz7
	kU2txdaA==;
Received: from [2001:9e8:9c9:1501:3235:adff:fed0:37e6] (port=43060 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swoYE-00D22o-7N;
	Fri, 04 Oct 2024 22:05:22 +0200
Date: Fri, 4 Oct 2024 22:05:20 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 23/23] kbuild: allow to start building external module in
 any directory
Message-ID: <20241004-little-rigorous-ammonite-6a8ce2@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-24-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-24-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:51PM +0900, Masahiro Yamada wrote:
> Unless an explicit O= option is provided, external module builds must
> start from the kernel directory.
> 
> This can be achieved by using the -C option:
> 
>   $ make -C /path/to/kernel M=/path/to/external/module
> 
> This commit allows starting external module builds from any directory,
> so you can also do the following:
> 
>   $ make -f /path/to/kernel/Makefile M=/path/to/external/module
> 
> The key difference is that the -C option changes the working directory
> and parses the Makefile located there, while the -f option only
> specifies the Makefile to use.
> 
> As shown in the examples in Documentation/kbuild/modules.rst, external
> modules usually have a wrapper Makefile that allows you to build them
> without specifying any make arguments. The Makefile typically contains
> a rule as follows:
> 
>     KDIR ?= /path/to/kernel
>     default:
>             $(MAKE) -C $(KDIR) M=$(CURDIR) $(MAKECMDGOALS)
> 
> The log will appear as follows:
> 
>     $ make
>     make -C /path/to/kernel M=/path/to/external/module
>     make[1]: Entering directory '/path/to/kernel'
>     make[2]: Entering directory '/path/to/exernal/module'
>       CC [M]  helloworld.o
>       MODPOST Module.symvers
>       CC [M]  helloworld.mod.o
>       CC [M]  .module-common.o
>       LD [M]  helloworld.ko
>     make[2]: Leaving directory '/path/to/exernal/module'

s/exernal/external/, also above.

>     make[1]: Leaving directory '/path/to/kernel'
> 
> This changes the working directory twice because the -C option first
> switches to the kernel directory, and then Kbuild internally recurses
> back to the external module directory.
> 
> With this commit, the wrapper Makefile can directly include the kernel
> Makefile:
> 
>     KDIR ?= /path/to/kernel
>     export KBUILD_EXTMOD = $(CURDIR)
>     include $(KDIR)/Makefile
> 
> This avoids unnecessary sub-make invocations:
> 
>     $ make
>       CC [M]  helloworld.o
>       MODPOST Module.symvers
>       CC [M]  helloworld.mod.o
>       CC [M]  .module-common.o
>       LD [M]  helloworld.ko
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/modules.rst | 21 +++++++++++++++++++++
>  Makefile                         |  8 ++++++--
>  2 files changed, 27 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index 03347e13eeb5..5610cfa426bb 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -88,6 +88,12 @@ executed to make module versioning work.
>  
>  		$ make -C /lib/modules/`uname -r`/build M=$PWD modules_install
>  
> +	Starting from Linux 6.13, you can use the -f option instead of -C. This
> +	will avoid unnecessary change of the working directory. The external
> +	module will be output to the directory where you invoke make.
> +
> +		$ make -f /lib/modules/`uname -r`/build/Makefile M=$PWD
> +
>  2.2 Options
>  ===========
>  
> @@ -246,6 +252,21 @@ module 8123.ko, which is built from the following files::
>  	consisting of several hundred lines, and here it really pays
>  	off to separate the kbuild part from the rest.
>  
> +	Linux 6.13 and later support another way. The external module Makefile
> +	can include the kernel Makefile directly, rather than invoking sub Make.
> +
> +	Example 3::
> +
> +		--> filename: Kbuild
> +		obj-m  := 8123.o
> +		8123-y := 8123_if.o 8123_pci.o
> +
> +		--> filename: Makefile
> +		KDIR ?= /lib/modules/`uname -r`/build

KDIR ?= /lib/modules/$(shell uname -r)/build

This patch is another very good idea, thanks!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

> +		export KBUILD_EXTMOD = $(CURDIR)
> +		include $(KDIR)/Makefile
> +
> +
>  3.4 Building Multiple Modules
>  =============================
>  
> diff --git a/Makefile b/Makefile
> index 81603a50c757..88c160ac7b3c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -189,9 +189,13 @@ ifdef KBUILD_EXTMOD
>          objtree := $(realpath $(KBUILD_OUTPUT))
>          $(if $(objtree),,$(error specified kernel directory "$(KBUILD_OUTPUT)" does not exist))
>      else
> -        objtree := $(CURDIR)
> +        objtree := $(abs_srctree)
>      endif
> -    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(KBUILD_EXTMOD))
> +    # If Make is invoked from the kernel directory (either kernel
> +    # source directory or kernel build directory), external modules
> +    # are built in $(KBUILD_EXTMOD) for backward compatibility,
> +    # otherwise, built in the current directory.
> +    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(if $(filter $(CURDIR),$(objtree) $(abs_srctree)),$(KBUILD_EXTMOD)))
>      # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
>      # Make changes the working directory.
>      export abs_extmodtree := $(realpath $(KBUILD_EXTMOD))
> -- 
> 2.43.0
> 

-- 
Nicolas

