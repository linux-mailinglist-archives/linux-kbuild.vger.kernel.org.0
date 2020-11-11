Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED872AF7BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Nov 2020 19:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgKKSJ2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Nov 2020 13:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgKKSJZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Nov 2020 13:09:25 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFC6C0613D1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2020 10:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=slxpBcDq8BGM77UIViJBN0ppo0C8K6AVmS1tsRdTK2A=; b=PBu6E5fdMgCtIE+g8CzC0fOqJq
        toKMW6QBtTWakOiqYcCa8sVMBJAlbdORv1YNWpVPrxKeuohTJ2cyzVhqEK07yezYuOzNB1HWXYrKY
        vMdoVuYotDXWEOXZYepDaxzBU7COmGU9xQH9+ZQfSHz1uu7Ro3kQJClGu9XSTcrXOtJyD4eWuq1tF
        gkXuhExFTfIyeBpoMVktkf8MYWEwxMduhEVw7zO4oX31R9g8AxKvTfncrBWm2tVIAyZV3KPz1H4sQ
        3f6UaVfOPj7F1M2nwnvfoeACTcm1SDUxx/j7yY8y6eKbU4VJcCxbDzwLcfj7fZRn480G9/i8pbtAi
        jc7iUgVA==;
Received: from [2601:1c0:6280:3f0::662d]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kcuYb-0007WS-UE; Wed, 11 Nov 2020 18:09:22 +0000
Subject: Re: unwanted built-ins
To:     jrun <darwinskernel@gmail.com>, linux-kbuild@vger.kernel.org
References: <20201111163135.f6rjjgldlouspfat@savoirfairelinux.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b852dcf4-c8d6-c7b3-3833-5c6083883b9e@infradead.org>
Date:   Wed, 11 Nov 2020 10:09:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201111163135.f6rjjgldlouspfat@savoirfairelinux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/11/20 8:31 AM, jrun wrote:
> hello,
> 
> why things under drivers/gpu/drm get built despite CONFIG_DRM not being set?
> 
> i'm cross compiling for armv7a and pass this as KCONFIG_ALLCONFIG to
> allnoconfig:
> https://gist.github.com/257/d69a5e95bd42cd7db5f1012703113fd1
> 
> if i take drm-y as an example; it seems to me that drm-y should only be built if
> CONFIG_DRM=y|m according to this line in drivers/gpu/drm/Makefile:
> 
> obj-$(CONFIG_DRM)+= drm.o
> 
> final .config has this:
> 
> #
> # Graphics support
> #
> # CONFIG_IMX_IPUV3_CORE is not set
> # CONFIG_DRM is not set
> 
> 
> thanks in advance for help
> -- jrun
> 

Hi,

Is this a speed of build issue?
Yes, make is descending into multiple directories that are not
strictly needed in this kernel config:

  AR      drivers/gpu/drm/arm/built-in.a
  AR      drivers/gpu/drm/rcar-du/built-in.a
  AR      drivers/gpu/drm/omapdrm/dss/built-in.a
  AR      drivers/gpu/drm/omapdrm/displays/built-in.a
  AR      drivers/gpu/drm/omapdrm/built-in.a
  AR      drivers/gpu/drm/tilcdc/built-in.a
  AR      drivers/gpu/drm/imx/built-in.a
  AR      drivers/gpu/drm/i2c/built-in.a
  AR      drivers/gpu/drm/panel/built-in.a
  AR      drivers/gpu/drm/bridge/analogix/built-in.a
  AR      drivers/gpu/drm/bridge/cadence/built-in.a
  AR      drivers/gpu/drm/bridge/synopsys/built-in.a
  AR      drivers/gpu/drm/bridge/built-in.a
  AR      drivers/gpu/drm/hisilicon/built-in.a
  AR      drivers/gpu/drm/tiny/built-in.a
  AR      drivers/gpu/drm/xlnx/built-in.a
  AR      drivers/gpu/drm/built-in.a

The built-in.a files that I see being built are all of size 8 bytes.

Also, since kconfig still applies normal dependency checks to whatever
is in the KCONFIG_ALLCONFIG file [1], I had to modify that file like this:
(note that BCM_63XX was misspelled)


 # CONFIG_VM_EVENT_COUNTERS is not set
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_SLAB_MERGE_DEFAULT is not set
+CONFIG_MMU=y
+CONFIG_ARCH_MULTIPLATFORM=y
+# CONFIG_ARCH_MULTI_V5 is not set
+# CONFIG_ARCH_MULTI_V4_V5 is not set
+CONFIG_ARCH_MULTI_V7=y
+CONFIG_ARCH_MULTI_V6_V7=y
 CONFIG_ARCH_BCM=y
-CONFIG_ARCH_BCM63XX=y
+CONFIG_ARCH_BCM_63XX=y
 # CONFIG_ATAGS is not set
 # CONFIG_SUSPEND is not set
 # CONFIG_STACKPROTECTOR is not set

[1] from Documentation/kbuild/kconfig.rst:
This 'KCONFIG_ALLCONFIG' file is a config file which contains
(usually a subset of all) preset config symbols.  These variable
settings are still subject to normal dependency checks.


-- 
~Randy

