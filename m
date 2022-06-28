Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3C0355E463
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jun 2022 15:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346313AbiF1NV3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 28 Jun 2022 09:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346316AbiF1NVM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Jun 2022 09:21:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EB7D235A97
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jun 2022 06:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656422356;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qtr8/zsHx2lgXvXWLguSyb54C2tIRyCmz4eBKyNcZb0=;
        b=FanQX8fbKAboMUhwWZK6X5rjtORLcIMo9+N9BuYj415/quB7NPo1s6G8qlwhkzPUTbVFQz
        mCQ8oDaX8SYWNTB3GMW2CNhEfLHRkCkHSD+feFRf9RgglzlHLsPPZWvi6CszggkY/PXk3V
        ZfGByGtIswFMDbvwUNK+MciAK5dO/qs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-GOhJ-48WO4iP0JlvW1LdJg-1; Tue, 28 Jun 2022 09:19:14 -0400
X-MC-Unique: GOhJ-48WO4iP0JlvW1LdJg-1
Received: by mail-qk1-f199.google.com with SMTP id k190-20020a37bac7000000b006af6d953751so333361qkf.13
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jun 2022 06:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qtr8/zsHx2lgXvXWLguSyb54C2tIRyCmz4eBKyNcZb0=;
        b=FMgddEfYaI97RRpt4HZZsCI26xYhAcYxetedITB+PbwXgf/gMn/g1IwSMJU6mOvlQ0
         G9alb0DkVN4yFNV/yTbXiRMpQbjx520t8xGam4Rrnv1tZ8O2Kh3fKKdBspNCXMdvKO3h
         iY5Q+8z1mxPB3Kr98EXI8PPi9Dpu7xXV4BJi918m/30h9NmsAdkw/M4l469gK0Fk18tl
         adDE4bJj2R1hYt0+gN4JnVid9/F6CTfWIUqvpEiijsmrc/f1vLKK7vPKuJ+T2JgwmYZr
         9+dwb/1WozIImSLdG6gaa5pfdyLsQCZDbNYEEgpAYssQW6RKr5vqzD2hkhovQg287YpY
         Bddw==
X-Gm-Message-State: AJIora+ZMUwoLMfEmH7vyvg8KN2W+hX7xUXpZpSUKwnCrhvlgbHo6z55
        iFPj+9TX4CvKC6z41yZzAfB86CPdCCdz2Ct5tIP1rCPz1bo7l5VX/IOP3UW+e8JCUTohlmvAajq
        lb14UIzUhcfBoO7tAw/pj4S5O
X-Received: by 2002:a05:620a:2629:b0:6ae:f26f:4a6f with SMTP id z41-20020a05620a262900b006aef26f4a6fmr11211899qko.525.1656422354107;
        Tue, 28 Jun 2022 06:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6u3ElgI5SXkTszodT7+MkuzdhwyGAU7ALTb5+ws6xpB7rbXIdQWZhAuG2FGgMK9tgjL0AfQ==
X-Received: by 2002:a05:620a:2629:b0:6ae:f26f:4a6f with SMTP id z41-20020a05620a262900b006aef26f4a6fmr11211875qko.525.1656422353898;
        Tue, 28 Jun 2022 06:19:13 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id ay42-20020a05620a17aa00b006af3bc9c6bbsm3262520qkb.52.2022.06.28.06.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 06:19:13 -0700 (PDT)
Subject: Re: [PATCH 0/2] Enable clang tools for kernels build using gcc
To:     Daniel Thompson <daniel.thompson@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20220628122741.93641-1-daniel.thompson@linaro.org>
From:   Tom Rix <trix@redhat.com>
Message-ID: <0478d832-d902-69ed-7c1c-4f19d942cddf@redhat.com>
Date:   Tue, 28 Jun 2022 06:19:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220628122741.93641-1-daniel.thompson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The limitations of the compilation db are not limited to the kernel.

Why shouldn't the change be made in the llvm project ?

Tom

On 6/28/22 5:27 AM, Daniel Thompson wrote:
> This patch set makes it possible to use clang based tools, such as
> the clangd completion engine, regardless of our choice of compiler
> for the actual kernel build.
>
> Most of the fine details are included in the patch header for the
> first patch (since we'd like them to appear in the kernel history so
> they can help future archaeologists).
>
> Daniel Thompson (2):
>    clang-tools: Generate clang compatible output even with gcc builds
>    Makefile: Enable clang-tidy and clang-analyzer for gcc builds
>
>   Makefile                                    | 11 ++--
>   scripts/clang-tools/gen_compile_commands.py | 71 ++++++++++++++++++++-
>   2 files changed, 74 insertions(+), 8 deletions(-)
>
>
> base-commit: a111daf0c53ae91e71fd2bfe7497862d14132e3e
> --
> 2.35.1
>

