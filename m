Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 056C65616EF
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Jun 2022 11:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbiF3J5t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Jun 2022 05:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234681AbiF3J5q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Jun 2022 05:57:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F40043ED5;
        Thu, 30 Jun 2022 02:57:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EA866207F;
        Thu, 30 Jun 2022 09:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8C6C34115;
        Thu, 30 Jun 2022 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656583064;
        bh=CU8sfltvgR3OfUDZxSf9YawLMsQ0a1whK3wUGRtf0Bs=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=kjV8bTdOSqdmcOfeELu+uLEV0wvLyXOx2uBHEzgnWssDAkuc6rKwgEtymggTqJJk/
         jFGGckIGTbZ/tqsVcfn6ijY7yU+oZWB4tSXhYcVR0QZsDyIJdpXf1pe99aDEy8nnZi
         8X/+IIcFkQWz7Es2xzU3Bx6Z4quSUWONKLVUr4E85iyhyf4xHhAPKZ/3he49+AZ3ja
         uU1I7dCqXm/5QuMh6e2n+p9ZeVRYYeWmCVPaQxMjc/LPhnXKwwNzDCB7fxkcqOI77x
         yFTYzx54qQPjhOdU/0gCP6CAd84Y8LXaDYs52BTmCB8tiYOgZHrGgnwaojYKd1ueY0
         WmxNIPWum/oKQ==
Message-ID: <178bee80-3ccc-812a-2e2e-46540bbdcc51@kernel.org>
Date:   Thu, 30 Jun 2022 11:57:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Linux v5.19-rc2] rtla: Errors when running `make tools/clean`
Content-Language: en-US
To:     sedat.dilek@gmail.com
Cc:     linux-trace-devel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
References: <CA+icZUX-=vjX1WgJLDGZYZhrpxy+KqynMMFmNPp8pWu0q2sDcg@mail.gmail.com>
 <CA+icZUWFUC5eiKS96vpoPQbX+jx5OYBfD40Ns86sUxE0hcft1w@mail.gmail.com>
From:   Daniel Bristot de Oliveira <bristot@kernel.org>
In-Reply-To: <CA+icZUWFUC5eiKS96vpoPQbX+jx5OYBfD40Ns86sUxE0hcft1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sedat,

On 6/27/22 08:23, Sedat Dilek wrote:
> On Wed, Jun 15, 2022 at 12:23 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>> [ CC linux-kbuild folks ]
>>
>> Hi,
>>
>> while digging into a perf issue I see this:
>>
>> $ cd /path/to/linux.git
>>
>> $ LC_ALL=C make -C tools/ clean 2>&1 | tee ../make-log_tools-clean.txt
>> ...

Do you mind trying this? 

diff --git a/tools/tracing/rtla/Makefile b/tools/tracing/rtla/Makefile
index 3822f4ea5f49..1bea2d16d4c1 100644
--- a/tools/tracing/rtla/Makefile
+++ b/tools/tracing/rtla/Makefile
@@ -1,6 +1,6 @@
 NAME	:=	rtla
 # Follow the kernel version
-VERSION :=	$(shell cat VERSION 2> /dev/null || make -sC ../../.. kernelversion)
+VERSION :=	$(shell cat VERSION 2> /dev/null || make -sC ../../.. kernelversion | grep -v make)
 
 # From libtracefs:
 # Makefiles suck: This macro sets a default value of $(2) for the
