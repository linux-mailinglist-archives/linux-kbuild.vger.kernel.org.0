Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 916982F02D8
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Jan 2021 19:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbhAISVT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 9 Jan 2021 13:21:19 -0500
Received: from mail-lf1-f52.google.com ([209.85.167.52]:45161 "EHLO
        mail-lf1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbhAISVT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Jan 2021 13:21:19 -0500
Received: by mail-lf1-f52.google.com with SMTP id x20so30871251lfe.12
        for <linux-kbuild@vger.kernel.org>; Sat, 09 Jan 2021 10:21:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=KckH3urxuwi1Iv8qWB5wkogr7YV7nFgXX2PlNp4AsPw=;
        b=lmejtWiJsYxMRVMSrbQMctI7KaL7ZFwuqlWCtaxey6OF68rSBYBkr2Z2MwD7DGLrE6
         9QvpksAJgrfCDCdr8REwTaGCBqn5AnO6yjOt1KLIBelMAXe+TTy5OwBf0WvD7gyCL3/W
         YOIx5gqxRdudk/waDrNdJzfBXOmjSP7JkQBVp3BoyhpVN4ur+D8wzIvXDlyWi8u02o+V
         iv/t3WRX3VQrOXqDqX47mKCyXP+lYcd/Trh5FO46xtF1JYrSJbVEiceeG74kAMhymmce
         dJblF1O840s3GNiUwgSXfmx3JTSCSKiLENZKnI7IFYi3VNIviH/3ZsMY/FHSkFAMe7Sg
         ztDA==
X-Gm-Message-State: AOAM530Eu/hXDd14U5Zwj6hx/9w2/+t6uqXHxeGaklUZefLikYjcroSZ
        OTHtSg5Gm0DFkei3QrE/JY+Dse+u/J+pM+R3
X-Google-Smtp-Source: ABdhPJwX4TOjUkK9PLCQPlguI9SF/o2ypKzUg21nQ6DCwYIANLmd/UaMe+rErM1AH3pEwk4wXF7Mfw==
X-Received: by 2002:a05:6512:789:: with SMTP id x9mr3674604lfr.487.1610216437041;
        Sat, 09 Jan 2021 10:20:37 -0800 (PST)
Received: from [192.168.1.8] ([213.87.136.104])
        by smtp.gmail.com with ESMTPSA id f27sm2448674lfk.293.2021.01.09.10.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jan 2021 10:20:36 -0800 (PST)
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
From:   Denis Efremov <efremov@linux.com>
Subject: What CONFIG_ option enables compilation of *.o file?
Message-ID: <17c5b8c7-80c4-c2b4-6eaf-704bfabb0a3c@linux.com>
Date:   Sat, 9 Jan 2021 21:20:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

Is there a general way to get information about what CONFIG_ options
enable compilation of *.o (*.[ch]) file? Maybe with kconfig command or from
some generated files?

I mean, to get information that, for example:
1) driver/block/floppy.o depends on CONFIG_BLK_DEV_FD

From driver/block/Makefile:
	obj-$(CONFIG_BLK_DEV_FD)        += floppy.o

2) kernel/trace/trace_selftest_dynamic.o depends on CONFIG_FTRACE_SELFTEST

From kernel/trace/Makefile:
	ifdef CONFIG_FTRACE_SELFTEST
	obj-y += trace_selftest_dynamic.o
	endif

3) kernel/trace/trace_irqsoff.o depends on either CONFIG_IRQSOFF_TRACER
   or CONFIG_PREEMPT_TRACER

From kernel/trace/Makefile:
	obj-$(CONFIG_IRQSOFF_TRACER) += trace_irqsoff.o
	obj-$(CONFIG_PREEMPT_TRACER) += trace_irqsoff.o

4) drivers/dax/bus.o depends on CONFIG_DAX

From drivers/dax/Makefile:
	obj-$(CONFIG_DAX) += dax.o 
	dax-y += bus.o

5) drivers/soc/bcm/brcmstb/common.o depends on CONFIG_SOC_BRCMSTB

From drivers/Makefile:
	obj-y                           += soc/ 
From drivers/soc/Makefile:
	obj-y                           += bcm/
From drivers/soc/bcm/Makefile:
	obj-$(CONFIG_SOC_BRCMSTB)       += brcmstb/
From drivers/soc/bcm/brcmstb/Makefile
	obj-y += common.o 

Thanks,
Denis

