Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBDBA68ABB1
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Feb 2023 18:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjBDRlX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Feb 2023 12:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjBDRlW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Feb 2023 12:41:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25C90233C9
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Feb 2023 09:41:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5CF16068B
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Feb 2023 17:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB72C433D2
        for <linux-kbuild@vger.kernel.org>; Sat,  4 Feb 2023 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675532465;
        bh=ybCstompzJL3UT6e7glRqC4C7D/BXVMzAo3mAy5m9U0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GHvi6mK2TZ40MUWWNoK0X5ZWqMudGGvdn1+VGfEzCi4QdBP3WQSJMJeJRxWq5af1g
         4qpm5jJ+GpcWSLnY2s66pZYa7kRgLNRE/lCoqAv92+o7Q1jBaRMyPgjzMQtKmkNFag
         hcDcFaSv7bvVMJnXkto9i7gKeTw3TnnMW0qOuD+uaSHf/0NHeM2F9UN//qELhFOb5V
         8GdEVmbz6ZAiIGVipmYcCdPzrV/0vePfqoa22+TAuSzPOvXH8kkKB8KmOgvloFHuJz
         VWCQMW0O3NmKxsCZF+QOunFyBdbOGTgwwQCw45LACQyv+2EnCSLx9Qxuh2XxGlwurn
         qSlZbqKAbNyOg==
Received: by mail-oi1-f173.google.com with SMTP id r205so6721206oib.9
        for <linux-kbuild@vger.kernel.org>; Sat, 04 Feb 2023 09:41:05 -0800 (PST)
X-Gm-Message-State: AO0yUKW7gat1SDwiZ1NGTavp4adRVu3IIO0wQaUa/f5HL1A9RVm2CKBr
        DhoLH5QMClVbqb2kSbZmNSNM4y1JYT/e9jUnCxc=
X-Google-Smtp-Source: AK7set+Gr77lG8/yFsySNN4RyXZfVByifEoYqVY2h08O6J7LA8RHp7QVS+b1LDdODkH/JX7Cq6rt8T5w+M0rEJm9jCk=
X-Received: by 2002:aca:6c6:0:b0:35e:7c55:b015 with SMTP id
 189-20020aca06c6000000b0035e7c55b015mr684583oig.287.1675532464295; Sat, 04
 Feb 2023 09:41:04 -0800 (PST)
MIME-Version: 1.0
References: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
In-Reply-To: <80c85984-7609-cab5-2341-48baeb67841e@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 5 Feb 2023 02:40:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
Message-ID: <CAK7LNAQ2==FuLS9P3xqHocd_+4SxkP-Y45F038Y0o9SYwPR6SA@mail.gmail.com>
Subject: Re: PPC64 TOC. warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 5, 2023 at 2:30 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> I'm seeing thousands of these warnings:
> (gcc 12.2.0)
>
>
> ./include/generated/autoksyms.h:7:9: warning: ISO C99 requires whitespace after the macro name
>     7 | #define __KSYM_TOC. 1
>       |         ^~~~~~~~~~
>
> In file included from ../include/asm-generic/export.h:57,
>                  from ./arch/powerpc/include/generated/asm/export.h:1,
>                  from ../arch/powerpc/kernel/misc.S:17:
> ./include/generated/autoksyms.h:7:9: warning: missing whitespace after the macro name
>     7 | #define __KSYM_TOC. 1
>       |         ^~~~~~~~~~
>
>
> Can anything be done about them?
>
> Thanks.
> --
> ~Randy



Hmm, I just thought this issue was fixed by
commit 29500f15b54b63ad0ea60b58e85144262bd24df2



Does this happen only for GCC 12?

Does the following patch fix the issue?
(I did not test it.)





diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
index 12bcfae940ee..70d4ab3621f6 100755
--- a/scripts/gen_autoksyms.sh
+++ b/scripts/gen_autoksyms.sh
@@ -54,7 +54,7 @@ EOT
 } | sed -e 's/ /\n/g' | sed -n -e '/^$/!p' |
 # Remove the dot prefix for ppc64; symbol names with a dot (.) hold entry
 # point addresses.
-sed -e 's/^\.//' |
+sed -e 's/^\.//g' |
 sort -u |
 # Ignore __this_module. It's not an exported symbol, and will be resolved
 # when the final .ko's are linked.










-- 
Best Regards
Masahiro Yamada
