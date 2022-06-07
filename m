Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 945415405F2
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jun 2022 19:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346986AbiFGRcZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Jun 2022 13:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347314AbiFGRaU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jun 2022 13:30:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BED261105D4
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Jun 2022 10:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654622778;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3/UV364lqIHTwaOFv7dNLYog86f9+MNfNsOfPzkrNv0=;
        b=fR5Ka9+A+6b2/FY6s6KRsCbvB4qwYzXitM5gepIn7tO9Lz2JymZL7ZYwWAeaQPfSDX3z1N
        mY4K/IA7HZ6sujTXwJKcKp17P/4tLlS7oK2S+2QeNV4G3gKu4QsU5kOjFmueAT+4qzcwKs
        RALs0fH4vSkbL+Hy1PeGVFpanrocsMs=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-c5YHgW09NuqwnEy8PgoH1w-1; Tue, 07 Jun 2022 13:26:17 -0400
X-MC-Unique: c5YHgW09NuqwnEy8PgoH1w-1
Received: by mail-qt1-f199.google.com with SMTP id 9-20020ac85749000000b00304ee787b02so4292209qtx.11
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Jun 2022 10:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:references:to:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3/UV364lqIHTwaOFv7dNLYog86f9+MNfNsOfPzkrNv0=;
        b=kSZWe/jXaraQayE8GCoh30iUVsCOoYV/q6knXOHRyb7WLErDIwLSjQjpp+5qIunhfq
         L9DRUqkLaFOe3a7tsjfP6njChAqmfe9/IqBxS3jYSWUSbBAvw0kk35JG2G9DTT5SZ7XY
         AO8AzCBzoNa+t+uPGd8znOFwtO6YACs8YfbFiUElr0VIQnkv8QrhCjOgV4tLPxVb28xQ
         MNk0KH6FmbODeJD245v4n+dVXx6LjH0ZZggvwgyNx0ySb4q6bzEYsRa/4OpHFZA7b2Iq
         50sQ8bLKdt1T/U1e12mOgyCEr7b0v+Kn557Kzqi1N/Q/IJSIbDjnj0pKmXYVUw9yFBn2
         7/SA==
X-Gm-Message-State: AOAM533aT10pslsiYIwGx/ZOKzx4MRXpFDejGHcQP3ZwKkY916bPnJN/
        pyMsUkDIte9VkUlJWfYf7dAjOuIhPXlc3IC1Ugy0SE0x1egOKz/0pUukJnistgMPlnTWMZLzPWL
        EPbB6bPUSZBOoRNUt8hZueaQRKD3Ngp3pw6iFXWddQwp/ggbjp7UDW6vQucOQlSHI1h8pJbbakY
        YWbLpHgQ==
X-Received: by 2002:ad4:5bc7:0:b0:466:5cac:64f2 with SMTP id t7-20020ad45bc7000000b004665cac64f2mr23609225qvt.104.1654622776887;
        Tue, 07 Jun 2022 10:26:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx30DjIOJ2y+staca/O9RZjhhcOcN+i7pCjzHeoud4kpXM7ul0SnctL1ggOMLRPlKA4vqrChA==
X-Received: by 2002:ad4:5bc7:0:b0:466:5cac:64f2 with SMTP id t7-20020ad45bc7000000b004665cac64f2mr23609187qvt.104.1654622776469;
        Tue, 07 Jun 2022 10:26:16 -0700 (PDT)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net. [68.163.101.245])
        by smtp.gmail.com with ESMTPSA id t194-20020a3746cb000000b006a371ba1fa5sm13809214qka.32.2022.06.07.10.26.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 10:26:16 -0700 (PDT)
Subject: Fwd: s390/nospec: add an option to use thunk-extern
References: <8417373c-9dba-54bd-ce08-2d36d0a2af04@redhat.com>
To:     linux-s390 <linux-s390@vger.kernel.org>,
        linux-kbuild@vger.kernel.org
From:   Joe Lawrence <joe.lawrence@redhat.com>
X-Forwarded-Message-Id: <8417373c-9dba-54bd-ce08-2d36d0a2af04@redhat.com>
Message-ID: <8569429d-57f8-a0cf-8b17-1291f6973d32@redhat.com>
Date:   Tue, 7 Jun 2022 13:26:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8417373c-9dba-54bd-ce08-2d36d0a2af04@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

[ adding appropriate lists ]

-------- Forwarded Message --------
Subject: Re: s390/nospec: add an option to use thunk-extern
Date: Thu, 2 Jun 2022 08:02:20 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Vasily Gorbik <gor@linux.ibm.com>

Hi Vasily,

I couldn't find the upstream patch post for 1d2ad084800e ("s390/nospec:
add an option to use thunk-extern"), so replying off-list here.  Feel
free to cc the appropriate list.

Regarding this change, as I understand it, when CONFIG_EXPOLINE_EXTERN=y
out-of-tree kernel modules will need to link against
arch/s390x/lib/expoline.o, right?

And if so, shouldn't the top level 'prepare_modules' target create
expoline.o for this purpose?

Regards,
-- 
Joe

