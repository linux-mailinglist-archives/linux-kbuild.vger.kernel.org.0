Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3355F59706B
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Aug 2022 16:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbiHQOAH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Aug 2022 10:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239865AbiHQN7g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Aug 2022 09:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43EE397521
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2022 06:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660744773;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KjJQXLKx4ownQ6qGKVOGjVgQPT8Sm/znLzneF+4NcgY=;
        b=OSn1J1axthkpnrX2URgbqXEuWPfKXfnIItSnXzeQbQrHtzWjNub45OFtL1yBQsJts4Epm4
        2zTmr3V6flLcuQwDLkElDzuCQ7mZn/Ty37mRilXMBUAKrLz6vc3xlybrmBc26IU9glGmz4
        L90w8kPUVQsLnKvUJo0WzCamo+WvjHI=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-45-EHYU9oEnMZquyPlIlFbltQ-1; Wed, 17 Aug 2022 09:59:31 -0400
X-MC-Unique: EHYU9oEnMZquyPlIlFbltQ-1
Received: by mail-pg1-f198.google.com with SMTP id c20-20020a6566d4000000b0041c325bd8ffso5262925pgw.4
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Aug 2022 06:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KjJQXLKx4ownQ6qGKVOGjVgQPT8Sm/znLzneF+4NcgY=;
        b=6lqQo2xe2WB4eVMdj0/KVzTLzq5Q/qPnpoFNiRoHDpo4L7zeQtiOLImHb91l47jgLQ
         5OPUbDHMD5exRkGeiEpjAleSeDJuibK8k3vUWiV+OdFEzccK3mnt4LIH+XDZ5sztk+h1
         jzBZTgg2eoGHMpl7ueU3g47P14EyiM38qUPc3Xe2nnD/h8P4YLwFMSdK+ruRcGto8Hov
         99lSaMHcOD1X6/y+TihWjbn7yp+WqORsbPFiOlzpsqva6AKtltcvuAuAsXpkCyxRKUYo
         3OUQ71cDJwA574xzdiTCFs4T3SaLfelsjq0RrtP+cutTmgD9a8CL7Gy3aEV1EyJcmFNK
         4Ynw==
X-Gm-Message-State: ACgBeo34T6m9jWvJScPXSsa4ui8NfX2niw/GLsSImD5Y9U9LcFAPIN58
        Mc3UicKJiVURjfbeXBAkwCgxBJfk+uea1psv9nUB1cRuE2nqMVcwbqgkjFlB9JWnMAEWCGGe4SQ
        mFZgK7vjAFrkhkWeUKnlmeDXy
X-Received: by 2002:a63:1909:0:b0:421:948e:f88 with SMTP id z9-20020a631909000000b00421948e0f88mr21339524pgl.607.1660744770946;
        Wed, 17 Aug 2022 06:59:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR637QmCodmX2czSDlZ/JVgAIWks5zJd8OVatW/iyct60lWHwBBWKGyAHgYAh9M7gPYym1n1zg==
X-Received: by 2002:a63:1909:0:b0:421:948e:f88 with SMTP id z9-20020a631909000000b00421948e0f88mr21339504pgl.607.1660744770624;
        Wed, 17 Aug 2022 06:59:30 -0700 (PDT)
Received: from [10.211.55.14] (pool-68-163-101-245.bstnma.fios.verizon.net. [68.163.101.245])
        by smtp.gmail.com with ESMTPSA id v63-20020a622f42000000b005289627ae6asm10447794pfv.187.2022.08.17.06.59.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 06:59:30 -0700 (PDT)
Message-ID: <c434a873-6bd2-d681-6713-1183260ce640@redhat.com>
Date:   Wed, 17 Aug 2022 09:59:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: s390/nospec: add an option to use thunk-extern
Content-Language: en-US
To:     Sumanth Korikkar <sumanthk@linux.ibm.com>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        Heiko Carstens <hca@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
References: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
 <cover.thread-d13b6c.your-ad-here.call-01656331067-ext-4899@work.hours>
 <ad6a926e-eed1-a5e2-9f8b-0ea1599bbaed@redhat.com>
 <CAPQ7N1RFyZRCJZc84UxjSQj44ksa6f6ib5B=dVwoqMU9_=s8QA@mail.gmail.com>
 <e853268a-3e0a-3a88-331b-53c74e8796d6@redhat.com>
 <2db2140b-ce07-f066-bcc2-981a53849bbb@linux.ibm.com>
From:   Joe Lawrence <joe.lawrence@redhat.com>
In-Reply-To: <2db2140b-ce07-f066-bcc2-981a53849bbb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/17/22 09:11, Sumanth Korikkar wrote:
> Hi Joe,
> 
> c4e789572557 ("s390/nospec: build expoline.o for modules_prepare
> target") is now in linux.git.
> 
> Note: arch/s390/lib/expoline.o is moved to
> arch/s390/lib/expoline/expoline.o. This means kernel-devel package in
> fedora should also include this updated file path.
> 

To follow up on the last part:

* Mon Aug 15 2022 Fedora Kernel Team <kernel-team@fedoraproject.org>
[6.0.0-0.rc1.12]
...
- kernel.spec.template: update (s390x) expoline.o path (Joe Lawrence)


-- 
Joe

