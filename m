Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5020C658A32
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Dec 2022 09:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiL2II6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Dec 2022 03:08:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiL2II5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Dec 2022 03:08:57 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E623DB92
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Dec 2022 00:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1672301293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5c2KVd3iEyoCh8u6V32NAXnUsG2MphtjjNVwzV1t5TE=;
        b=UrW3mnbmNyIERHU5vhIo53CKGSB5c8/swbkUc4xAh0pA97lKTCnbxn1Pq0uYD5104DBcTq
        dwIp/odem1A3LHKcxWHgXh4jTabweliDW2d8wT15sdn7wek4Xa7V08pjXEFTzcbQu2A9j3
        xc+fTMYDQs7+6qE/dvYZLWB4ZSV3uOA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-279-JNoRE3FQNOm72c_pPwqvRQ-1; Thu, 29 Dec 2022 03:08:12 -0500
X-MC-Unique: JNoRE3FQNOm72c_pPwqvRQ-1
Received: by mail-qv1-f69.google.com with SMTP id i7-20020a056214020700b004ffce246a2bso9584406qvt.3
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Dec 2022 00:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5c2KVd3iEyoCh8u6V32NAXnUsG2MphtjjNVwzV1t5TE=;
        b=c7pJZiNScfYAgdh0d75X43mei4/yzvgfUkwcRkdKwewGjmVNFPKeVlqTN8CCqlGZco
         14Ibz8ngNZFX9zDBskLkHitIYpYxc7ysBevILPoYR1TDkGSvCzAW3oYzE16mWezdPVLm
         gjJ45NuK6gJhTzRMKXJZYbA614LOFXeZQehSUB6laiosmOPtaT/9jIpkFEvsaOS0R9vZ
         W411VeEHs7myTlSViNjZ6Lxfm56KuvfyDXXoHF+tyny6YbVpHF04GRoVAzzqAVgQWMal
         TS4j8zSuTSlQ+bfmMsNex4VxeywfMEZRvP/QSI0+x6936G/RAGkVQjIll6A3Xe+vsdHU
         z3XA==
X-Gm-Message-State: AFqh2koGRx0SE9+QNAkMs3c42DtpfyiM6nFk/bI5XODF162Xnt2NMBXD
        eX/4bly0f7usCrV83IrLyo3tUH/bwaF4DC7/5jaV4POVE54tQVGdAd0FEOMM1IWzChFQoIZ3xSS
        eBlFM93pwIEwG/Nle1TUN2o7r
X-Received: by 2002:ac8:74d6:0:b0:3a5:2644:bcd2 with SMTP id j22-20020ac874d6000000b003a52644bcd2mr37756757qtr.8.1672301292035;
        Thu, 29 Dec 2022 00:08:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt5V/sAsCEHjQ2ZpxZpa01QLECRhCwCe4d8j9XtsajXrmmVGxtgl/uKFz4jADNN4B3Q9cIchg==
X-Received: by 2002:ac8:74d6:0:b0:3a5:2644:bcd2 with SMTP id j22-20020ac874d6000000b003a52644bcd2mr37756749qtr.8.1672301291837;
        Thu, 29 Dec 2022 00:08:11 -0800 (PST)
Received: from [192.168.33.110] (c-73-19-232-221.hsd1.tn.comcast.net. [73.19.232.221])
        by smtp.gmail.com with ESMTPSA id k20-20020ac84754000000b003a527d29a41sm11180993qtp.75.2022.12.29.00.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 00:08:11 -0800 (PST)
Message-ID: <0357df64-54ad-06fd-031e-66350cb03d54@redhat.com>
Date:   Thu, 29 Dec 2022 03:08:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] kbuild: rpm-pkg: add libelf-devel as alternative for
 BuildRequires
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Guoqing Jiang <guoqing.jiang@linux.dev>,
        Ivan Vecera <ivecera@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        =?UTF-8?B?w43DsWlnbyBIdWd1ZXQ=?= <ihuguet@redhat.com>
References: <20221228191014.659746-1-masahiroy@kernel.org>
Content-Language: en-US
From:   Jonathan Toppins <jtoppins@redhat.com>
In-Reply-To: <20221228191014.659746-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 12/28/22 14:10, Masahiro Yamada wrote:
> Guoqing Jiang reports that openSUSE cannot compile the kernel rpm due
> to "BuildRequires: elfutils-libelf-devel" added by commit 8818039f959b
> ("kbuild: add ability to make source rpm buildable using koji").
> The relevant package name in openSUSE is libelf-devel.
> 
> Add it an alternative package.
> 
> BTW, if it is impossible to solve the build requirement, the final
> resort would be:
> 
>      $ make RPMOPTS=--nodeps rpm-pkg
> 
> This passes --nodeps to the rpmbuild command so it will not verify
> build dependencies. This is useful to test rpm builds on non-rpm
> system. On Debian/Ubuntu, for example, you can install rpmbuild by
> 'apt-get install rpm'.
> 
> NOTE1:
>    Likewise, it is possible to bypass the build dependency check for
>    debian package builds:
> 
>      $ make DPKG_FLAGS=-d deb-pkg
> 
> NOTE2:
>    The 'or' operator is supported since RPM 4.13. So, old distros such
>    as CentOS 7 will break. I suggest installing newer rpmbuild in such
>    cases.
> 
> Link: https://lore.kernel.org/linux-kbuild/ee227d24-9c94-bfa3-166a-4ee6b5dfea09@linux.dev/T/#u
> Fixes: 8818039f959b ("kbuild: add ability to make source rpm buildable using koji")
> Reported-by: Guoqing Jiang <guoqing.jiang@linux.dev>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Jonathan Toppins <jtoppins@redhat.com>

