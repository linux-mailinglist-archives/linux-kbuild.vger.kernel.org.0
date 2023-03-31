Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16B306D2499
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Mar 2023 18:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231749AbjCaQE4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Mar 2023 12:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbjCaQEt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2023 12:04:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607961EA38
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2023 09:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680278644;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rSNZ8/l+VZ86qtadx/3cTwXAVAmwqfzRU1WoIUzmJNE=;
        b=i/4ZDssOdv28FVs/nwqz4/YhLevJW0QMR7GpPiED/lFt6a/r9evwmVPr7Ad8YEDLt3qk0u
        OMWN2hQgiPKlUsl7cToqhw3JNENKo8geesWLuafR4lFnYiUqOn6/1r4auh1DCbwADysCcK
        QM6Y1XQBcRGrFU+Yrsx9A1Xu56kk2EU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-185-APwFenPaN1uMc6yeNo47tA-1; Fri, 31 Mar 2023 12:03:55 -0400
X-MC-Unique: APwFenPaN1uMc6yeNo47tA-1
Received: by mail-yb1-f200.google.com with SMTP id v67-20020a254846000000b00b8189f73e94so1888804yba.12
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2023 09:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680278635;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSNZ8/l+VZ86qtadx/3cTwXAVAmwqfzRU1WoIUzmJNE=;
        b=r+SkdZGEaEk4yHSvozBDCucHhoNL1e8GbR0pDBLRc+x7oRg+5ORboUt01VhLiLvcdH
         wyHMEC4b4NDwKpDqyLmJ96Zr+VdQP6uO0E08ofeIdM1xlXugEXwp1WsWkOoLGrnjqyjP
         cUSdaU9WYhZu5JJXOl/PofkA+Vcn5YmnYTxHG2PUhSWYBPl+KXyX6qjwdUjsRdvKVw6p
         4WMAaeyO0jtm/3ylhPAv2oi+CYrsYUuHBqfFPHcGm+UPeCHNin4UgzLEd+cX+cd27yFN
         WPQq8XDBXcjtExo2hYdjFdOKhSETJEGl000I8u5YK88SL78mtckfDvnuX09cqas7sWf3
         Y8Hg==
X-Gm-Message-State: AAQBX9feIQi1arcbkX4v+UaGpiQL4QAWYK3ouNLIj1Ez0nj9OPhcDoWp
        5SV64ZZbrTYcDYhmA+6hiBDdRfBonTRe90M/opSKxX0v5R0zSDCQnB67kLMjMyY0/yQhfoG3a7z
        YVIiItAN+qP4LwnvVnA4Pbjgh
X-Received: by 2002:a05:7500:3e83:b0:fe:c8a6:575 with SMTP id li3-20020a0575003e8300b000fec8a60575mr286784gab.18.1680278634914;
        Fri, 31 Mar 2023 09:03:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYLH+nRBLs0BOSrhOyR0e8vNMPADpf6r8qKAygoUTF/7n8384rN6qordhqj3TeCWcFnm7i8Q==
X-Received: by 2002:a05:7500:3e83:b0:fe:c8a6:575 with SMTP id li3-20020a0575003e8300b000fec8a60575mr286763gab.18.1680278634565;
        Fri, 31 Mar 2023 09:03:54 -0700 (PDT)
Received: from [192.168.1.12] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id y25-20020a37f619000000b0074382b756c2sm760767qkj.14.2023.03.31.09.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 09:03:54 -0700 (PDT)
Message-ID: <f1351c5f-16aa-8407-753c-90049956123d@redhat.com>
Date:   Fri, 31 Mar 2023 12:03:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Alexey Dobriyan <adobriyan@gmail.com>
Cc:     live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Josh Poimboeuf <jpoimboe@kernel.org>,
        Miroslav Benes <mbenes@suse.cz>,
        Petr Mladek <pmladek@suse.com>,
        Marcos Paulo de Souza <mpdesouza@suse.com>
References: <4ce29654-4e1e-4680-9c25-715823ff5e02@p183>
 <683593a8-79db-4f3b-bc78-7917284683e4@p183>
From:   Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v7 00/10] livepatch: klp-convert tool
In-Reply-To: <683593a8-79db-4f3b-bc78-7917284683e4@p183>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 3/30/23 13:04, Alexey Dobriyan wrote:
> This patchset somehow breaks the build of the simplest livepatch module:
> 
> 	make -f linux/linux-1/scripts/Makefile.modfinal
> 	make[1]: *** No rule to make target 'linux/module-klp/main.tmp.ko', needed by 'linux/module-klp/main.ko'.  Stop.
> 

Thanks for testing.

Presumably this is an out-of-tree livepatch module?  If so, that is
still on the TODO list.  If not, that is weird as the patchset itself
includes updates to samples/ and lib/ livepatches that build and load fine.

-- 
Joe

> $ cat Kbuild
> obj-m := main.o
> 
> $ cat main.c
> #include <linux/module.h>
> #include <linux/kernel.h>
> #include <linux/livepatch.h>
> #include <linux/seq_file.h>
> 
> static int livepatch_cmdline_proc_show(struct seq_file *m, void *data)
> {
> 	seq_puts(m, "REDACTED 001\n");
> 	return 0;
> }
> 
> static struct klp_func funcs[] = {
> 	{
> 		.old_name = "cmdline_proc_show",
> 		.new_func = livepatch_cmdline_proc_show,
> 	},
> 	{}
> };
> 
> static struct klp_object objs[] = {
> 	{
> 		.funcs = funcs,
> 	},
> 	{}
> };
> 
> static struct klp_patch g_patch = {
> 	.mod = THIS_MODULE,
> 	.objs = objs,
> };
> 
> static int livepatch_init(void)
> {
> 	return klp_enable_patch(&g_patch);
> }
> 
> static void livepatch_exit(void)
> {
> }
> module_init(livepatch_init);
> module_exit(livepatch_exit);
> MODULE_LICENSE("GPL");
> MODULE_INFO(livepatch, "Y");
> 

