Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 875A268DD5C
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Feb 2023 16:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjBGPzl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Feb 2023 10:55:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232124AbjBGPzk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Feb 2023 10:55:40 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9AF646AC
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Feb 2023 07:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675785297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K03QlXe/LWJeYy5yFUyEedK5XS487p96FeOtyIz5qpg=;
        b=bTvGCLbqhYTr0dZ1UB7q9F9hM90x9b+OZTHRR0eHw/68MCYfr40+dSSpx2Io63WOoPG4OS
        4jijFp8ObSm/S+2Qjr8Azi7uwz898r5zTKPEAQ8jZ2dj8mf+o99ufF6S2L1NrcFssalP3M
        8KQZB8R0187nwoiSWr6Vy87hKXrnhf0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-150-99WotQxLPQqsXYahSXZ6mQ-1; Tue, 07 Feb 2023 10:54:56 -0500
X-MC-Unique: 99WotQxLPQqsXYahSXZ6mQ-1
Received: by mail-qt1-f198.google.com with SMTP id t5-20020a05622a180500b003b9c03cd525so8889700qtc.20
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Feb 2023 07:54:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K03QlXe/LWJeYy5yFUyEedK5XS487p96FeOtyIz5qpg=;
        b=XbeiOuFueAdH+SYIKpR2xrjFI6whvGaO0zRbzvv+abeFAdLt5F+sLvjLs7DFbgxcJr
         6ZCFSkcvRahmAv+7Vg1D7vvbXRcHc3mzCdfPKEJUfcuK/ldvqRE96mIVt4SKtJ3I42Gx
         18mKc6FTpOdQK1p3eAnKB3VziTrvb5ONul5b0iH0UaAr/DPtcubGt8WMfGNEqtlMFQmy
         qtBdiT7DQIZaDMPB9IB0+I+D/vepK+kiT/ENIttHeaUG07FhzIbAWDVU4YZOQcXQSxiD
         2ZDADFohW/02p3uPN9TGlQExXYXX7NeSaWlNbwTvnMgD9dLOTsqn+9TOhPoAyHJIT+j5
         f+pw==
X-Gm-Message-State: AO0yUKVF6Z0qLIzDkYeYsukDZ02Mn/FLnHZS3eNtZN4s7qf4n9XcFBO2
        okkezy1HPoDPSQxgmPNC790iK1WVzsHEajl5hQ2THI2YzTK7DB4uClRAoP+k3i+ZzYixtfogvPb
        tabZF3vEe7QXRMPltmIvL0Qs1
X-Received: by 2002:ac8:7fc3:0:b0:3a8:a6f:fb7 with SMTP id b3-20020ac87fc3000000b003a80a6f0fb7mr6505872qtk.11.1675785296100;
        Tue, 07 Feb 2023 07:54:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9C91L6f9dAU0a0etM+lArtoG4waSol9GtDeOaou0FYQen8Opv4jozWqehZNrsR/AFo+lN0uA==
X-Received: by 2002:ac8:7fc3:0:b0:3a8:a6f:fb7 with SMTP id b3-20020ac87fc3000000b003a80a6f0fb7mr6505828qtk.11.1675785295695;
        Tue, 07 Feb 2023 07:54:55 -0800 (PST)
Received: from [192.168.1.16] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id fd10-20020a05622a4d0a00b003bb50a9f9bbsm121805qtb.7.2023.02.07.07.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 07:54:54 -0800 (PST)
Message-ID: <d2187ca1-2e94-fc5b-a8db-e2123981a5fc@redhat.com>
Date:   Tue, 7 Feb 2023 10:54:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To:     Marcos Paulo de Souza <mpdesouza@suse.de>
Cc:     live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
References: <20220216163940.228309-1-joe.lawrence@redhat.com>
 <20230207125759.xfcsnlma6ezehff7@daedalus>
From:   Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [RFC PATCH v6 00/12] livepatch: klp-convert tool
In-Reply-To: <20230207125759.xfcsnlma6ezehff7@daedalus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2/7/23 07:57, Marcos Paulo de Souza wrote:
> On Wed, Feb 16, 2022 at 11:39:28AM -0500, Joe Lawrence wrote:
>> This mostly a rebase update of the livepatch klp-convert tool used to
>> generate klp-relocation types (explained in the summary below).
>>
>> I'm marking this as an RFC as it hasn't been extensively tested for all
>> livepatch supported arches.  There are may be a few symbol annotation
>> changes pending what may be implemented for the FGKASLR patchset, I've
>> left a few TODO and // question? marks in the code, etc.  At the same
>> time, I think "CET/IBT support and live-patches" highlighted a potential
>> need for this tooling, so I'm posting it in its current format for
>> discussion.  I'll reply to individual patches to highlight a few points
>> of interest.
>>
>>
>> Summary
>> -------
>>
>> Livepatches may use symbols which are not contained in its own scope,
>> and, because of that, may end up compiled with relocations that will
>> only be resolved during module load. Yet, when the referenced symbols
>> are not exported, solving this relocation requires information on the
>> object that holds the symbol (either vmlinux or modules) and its
>> position inside the object, as an object may contain multiple symbols
>> with the same name.  Providing such information must be done accordingly
>> to what is specified in Documentation/livepatch/module-elf-format.txt.
>>
>> Currently, there is no trivial way to embed the required information as
>> requested in the final livepatch elf object. klp-convert solves this
>> problem in two different forms: (i) by relying on a symbol map, which is
>> built during kernel compilation, to automatically infer the relocation
>> targeted symbol, and, when such inference is not possible (ii) by using
>> annotations in the elf object to convert the relocation accordingly to
>> the specification, enabling it to be handled by the livepatch loader.
>>
>> Given the above, add support for symbol mapping in the form of a
>> symbols.klp file; add klp-convert tool; integrate klp-convert tool into
>> kbuild; make livepatch modules discernible during kernel compilation
>> pipeline; add data-structure and macros to enable users to annotate
>> livepatch source code; make modpost stage compatible with livepatches;
>> update livepatch-sample and update documentation.
>>
>> The patch was tested under three use-cases:
>>
>> use-case 1: There is a relocation in the lp that can be automatically
>> resolved by klp-convert.  For example. see the saved_command_line
>> variable in lib/livepatch/test_klp_convert2.c.
>>
>> use-case 2: There is a relocation in the lp that cannot be automatically
>> resolved, as the name of the respective symbol appears in multiple
>> objects. The livepatch contains an annotation to enable a correct
>> relocation.  See the KLP_MODULE_RELOC / KLP_SYMPOS annotation sections
>> in lib/livepatch/test_klp_convert{1,2}.c.
>>
>> use-case 3: There is a relocation in the lp that cannot be automatically
>> resolved similarly as 2, but no annotation was provided in the
>> livepatch, triggering an error during compilation.  Reproducible by
>> removing the KLP_MODULE_RELOC / KLP_SYMPOS annotation sections in
>> lib/livepatch/test_klp_convert{1,2}.c.
>>
>> Selftests have been added to exercise these klp-convert use-cases
>> through several tests.
>>
>>
>> Branches
>> --------
>>
>>
>> Previous versions
>> -----------------
>>
>> RFC:
>>   https://lore.kernel.org/lkml/cover.1477578530.git.jpoimboe@redhat.com/
>> v2:
>>   https://lore.kernel.org/lkml/f52d29f7-7d1b-ad3d-050b-a9fa8878faf2@redhat.com/
>> v3:
>>   https://lore.kernel.org/lkml/20190410155058.9437-1-joe.lawrence@redhat.com/
>> v4:
>>   https://lore.kernel.org/lkml/20190509143859.9050-1-joe.lawrence@redhat.com/
>> v5:
>>   (not posted)
>>   https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v5-devel
>> v6:
>>   https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v6
>>   https://github.com/joe-lawrence/klp-convert-tree/tree/klp-convert-v6-devel
> 
> Hi Joe,
> 
> I send reviews to some patches of the v6 batch, but there is currently a v7 in
> your github profile. I believe that I sent Rb for patches that are the same
> between versions.
> 
> The current version is almost one year older already. Do you plan to send v7
> soon?
> 

Hi Marcos,

Thanks for the reviews and indeed, it has been a while since v6.

For v7, I would like to rebase on top of v6.2 so it includes the recent
x86/ppc64le relocation fixes from Song/Josh.

There are still a fair number of design questions that I have.. but a
fresh version will be much easier to test and review.  I'll try to get
it posted in the new few weeks.

-- 
Joe

