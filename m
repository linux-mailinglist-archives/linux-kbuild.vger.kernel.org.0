Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59E67D2776
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Oct 2023 02:19:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjJWATv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Oct 2023 20:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbjJWATu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Oct 2023 20:19:50 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51F65DC
        for <linux-kbuild@vger.kernel.org>; Sun, 22 Oct 2023 17:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=m4mT/wFgFT1YGFHDxjcqEEcDst3tz0fHmQKDOa+Ugws=; b=WIzGcnWINuuEWF4Z+4q9bywGFB
        5LHpGB4LE2MH/RKO1rObhEPcnb2RMXaSlWeOXij85fIuNcCPxHvOnfpyxEGF6HYZSASJ0R5JxO5Dn
        ZsYX9NXhmKMhL+MBoMhA4ni8TH8JYtzNt99TE6o26BDf7OabzSvwtsY7SSxaycDtJNjguXFmZ7REH
        kkxOZe+HH0gb9rPT+jmT1/FiGek8H2QU5UnprXPmMH2n6v8zLvCswMtJ8xUooT+a0k9XsGTVJziim
        PCGz06xevhk6hJTvijnBqAXxrOLt5A7uuKRDnycK4VYa/9yO+1qbVWK2ZBY0DB3STEpo8VKWY7sa2
        lDesE2EA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1quifa-0066ZB-1y;
        Mon, 23 Oct 2023 00:19:46 +0000
Message-ID: <487dd696-0d74-4adc-8f0b-a9898d8085d3@infradead.org>
Date:   Sun, 22 Oct 2023 17:19:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: About Kconfig indentation fixes
Content-Language: en-US
To:     P J P <pj.pandit@yahoo.co.in>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
References: <1236784830.606269.1697999064177.ref@mail.yahoo.com>
 <1236784830.606269.1697999064177@mail.yahoo.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1236784830.606269.1697999064177@mail.yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 10/22/23 11:24, P J P wrote:
> Hello Masahiro,
> 
> Please see: -> https://paste.centos.org/view/06ed8bf0
> 
> ===
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index b59e3041fd62..82ae68b13381 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -68,14 +68,14 @@ config EDD_OFF
>           using the kernel parameter 'edd={on|skipmbr|off}'.
>  
>  config FIRMWARE_MEMMAP
> -    bool "Add firmware-provided memory map to sysfs" if EXPERT
> -    default X86
> -    help
> -      Add the firmware-provided (unmodified) memory map to /sys/firmware/memmap.
> -      That memory map is used for example by kexec to set up parameter area
> -      for the next kernel, but can also be used for debugging purposes.
> +       bool "Add firmware-provided memory map to sysfs" if EXPERT
> +       default X86
> +       help
> +         Add the firmware-provided (unmodified) memory map to /sys/firmware/memmap.
> +         That memory map is used for example by kexec to set up parameter area
> +         for the next kernel, but can also be used for debugging purposes.
>  
> -      See also Documentation/ABI/testing/sysfs-firmware-memmap.
> +         See also Documentation/ABI/testing/sysfs-firmware-memmap.
>   
>  config DMIID
> -    bool "Export DMI identification via sysfs to userspace"
> -    depends on DMI
> -    default y
> +       bool "Export DMI identification via sysfs to userspace"
> +       depends on DMI
> +       default y
>         help
>           Say Y here if you want to query SMBIOS/DMI system identification
>           information from userspace through /sys/class/dmi/id/ or if you want 
> ===
> 
> * IIUC majority of Kconfig entries use leading tab(\t) character(s) for indentation. But there are multiple Kconfig entries like above wherein indentation is without the leading tab(\t) character. Ex. above entries use 4 spaces ("   ") for indentation.
> 
> * I wanted to check
>   - is it okay to send fix patches for such inconsistencies? They may lead to errors.

IMO it just mucks up the git history for all of the affected lines.

>   - if Kconfig file has no assigned maintainer(s), should the patch go to -kbuild@ list?

Usually it is better to try to find out who has been merging the most recent patches
to the file (by using 'git log' to see the history).

> 
> * The Kconfig language text below does not say anything about indentation or usage of leading tab(\t) characters. Is that intentional?
> 

It's in coding-style.rst instead of kconfig-language.rst.

>   https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html#menu-dependencies
> 
> * Is there some method/rule to the indentation in Kconfig files/entries?

from Documentation/process/coding-style.rst:

10) Kconfig configuration files
-------------------------------

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.  Example::



-- 
~Randy
