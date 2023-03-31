Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C586D2494
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Mar 2023 18:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232897AbjCaQDA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 31 Mar 2023 12:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbjCaQC7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 31 Mar 2023 12:02:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D531D51A
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2023 09:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680278531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IJdWf+C1H4WFOkVELieC/JAW8cI4Ny85dWN0l46/HX8=;
        b=cfowS3M5ciS3J8hD1oXydeN0sfnjnMIWSi6MUHVbsyWrEl8qAdG3RwCG5j6Vsg+cRnnKUM
        JjU+K3NJE37+ezwbYsT+2NC1Aa8UgFNCIOEGbfDCa4+rjodwspX9NtBTPCaGijoQw/vr8T
        Y+rTEUih9fApNLFb2R82M2xxkcscu7g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-773kjLKRP1uWmrIyLAnahA-1; Fri, 31 Mar 2023 11:58:24 -0400
X-MC-Unique: 773kjLKRP1uWmrIyLAnahA-1
Received: by mail-qt1-f200.google.com with SMTP id b11-20020ac87fcb000000b003e37d72d532so14870536qtk.18
        for <linux-kbuild@vger.kernel.org>; Fri, 31 Mar 2023 08:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680278303;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IJdWf+C1H4WFOkVELieC/JAW8cI4Ny85dWN0l46/HX8=;
        b=sQ0EKcXPQK7ouJzwWizRttJDH0SFcALOp+MpfNDD/bu34S+0d912u/8W/r24tXEznI
         /O9zvQ62iSqpdiB+orY4dMNMG6JlKjLQznSJjeQRqwEfSL3b4/ZuyCYoo5p7qBHgm5A+
         xgj4SAGhIRWuoCfmSs21NveJhwFjxLrwaOQ0sm6HlserNensojB9A8XPYeXLEgwc7wgJ
         TqdkC3AdmcOTTeO1e8ibqOITq/L5Zcw7NYL9ePghgIzcQIsOOskaOgLSBBqVjABhQuVC
         E5s6AoPc9kZazjYEpN61pJxN9ZlXmsTz1EMjlNQ+bsKj3U0WRdd/WW0dvKgH0iBF9Iqh
         0ANw==
X-Gm-Message-State: AO0yUKUf7G0bw6DaWlrrZXMFYGMWd1jpdV+OeTtYnMXG41oOVAQ8dM+C
        2eAmkpsEuhW/oqzaOW9mhVrUyB+yXIdCoYQeSnSNI3cIXcTqzYalKzm7ydzeIHuKjjp0q0JEqk1
        LKfV1YBNxQfSF//GAAW7o5vCE
X-Received: by 2002:ac8:5884:0:b0:3c0:3d0b:e433 with SMTP id t4-20020ac85884000000b003c03d0be433mr35596926qta.10.1680278303530;
        Fri, 31 Mar 2023 08:58:23 -0700 (PDT)
X-Google-Smtp-Source: AK7set9lAS57G/fztM3/8Ml5aym5cxLEs4YQ07OF5pcXIbIHI2+f3a2ZqY6QsbGQpXVR1E5SZKyiZw==
X-Received: by 2002:ac8:5884:0:b0:3c0:3d0b:e433 with SMTP id t4-20020ac85884000000b003c03d0be433mr35596904qta.10.1680278303274;
        Fri, 31 Mar 2023 08:58:23 -0700 (PDT)
Received: from [192.168.1.12] (pool-68-160-135-240.bstnma.fios.verizon.net. [68.160.135.240])
        by smtp.gmail.com with ESMTPSA id h6-20020ac85686000000b003d29e23e214sm692447qta.82.2023.03.31.08.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 08:58:22 -0700 (PDT)
Message-ID: <e37ff5de-f34c-bd86-be04-a21f82612a7e@redhat.com>
Date:   Fri, 31 Mar 2023 11:58:20 -0400
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
From:   Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v7 00/10] livepatch: klp-convert tool
In-Reply-To: <4ce29654-4e1e-4680-9c25-715823ff5e02@p183>
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

On 3/30/23 08:10, Alexey Dobriyan wrote:
> Joe Lawrence wrote:
>> +static int update_strtab(struct elf *elf)
>> +{
>>
>> +	buf = malloc(new_size);
>> +	if (!buf) {
>> +		WARN("malloc failed");
>> +		return -1;
>> +	}
>> +	memcpy(buf, (void *)strtab->data, orig_size);
> 
> This code is called realloc(). :-)
> 
>> +static int write_file(struct elf *elf, const char *file)
>> +{
>>
>> +	fd = creat(file, 0664);
>> +	e = elf_begin(fd, ELF_C_WRITE, NULL);
> 
> elf_end() doesn't close descriptor, so there is potentially corrupted
> data. There is no unlink() call if writes fail as well.
> 
>> +void elf_close(struct elf *elf)
>> +{
>> +
>> +	if (elf->fd > 0)
>> +		close(elf->fd);
> 
> Techically, it is "fd >= 0".
> 
>> +filechk_klp_map = \
>> +	echo "klp-convert-symbol-data.0.1";		\
>> +	echo "*vmlinux";				\
>> +	$(NM) -f posix vmlinux | cut -d\  -f1;		\
>> +	sort $(MODORDER) $(MODULES_LIVEPATCH) |		\
> 
> This probably should be "LC_ALL=C sort" for speed and reproducibility (?).
> 

Thanks, will incorporate these into the next version.

-- 
Joe

