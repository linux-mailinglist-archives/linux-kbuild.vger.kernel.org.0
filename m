Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03B2E788E3
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 11:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfG2Jvc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 05:51:32 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35305 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbfG2Jvc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 05:51:32 -0400
Received: by mail-pg1-f193.google.com with SMTP id s1so21676611pgr.2;
        Mon, 29 Jul 2019 02:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=99SJzMwxrwMnNx1bm3tOZBw23hbXmUU5QEMotAjzAQU=;
        b=mxjSz2cr/XTBnsStpQdDFLT1n5z26yUA95VDktalQXWunR3mLrAZ7ccG79sHwjCzh9
         eIDxeWlX83TIhRpB/zuvoUT3tU1E+6df+YbIT+TRfeFkGHQNhS2y4Xp6bt5E8A4IMxEQ
         99aEIf26aUOQHkRlZOTg6ox/ZKy7SgIoBmVTUN7nhl4s1+29hgCeRiyKuQZdICCl1I29
         Dqzxjol6U9K5KVUxwO26Kf5/kr8vkQEs6llQ54F/WKP3UEkHYGZNdgGzyYd82o23kK0f
         3stF37VNA/Lf/77JexF1tyIo6WSaN3EUKVRS5YzHS6uww89GcTTVaMrxXKRUst3jVjMq
         4jow==
X-Gm-Message-State: APjAAAWkVjWyTNGys9xj/ckF6jv0oOZLADdmjj5PvM+kot6QWncTBhe6
        TsVnvXPdzKAGIq7d7h/Y+G7G/330gbI=
X-Google-Smtp-Source: APXvYqxW0gBaYbdNrJeg+Nj9EcKMx3/3WVdol/8RL+o0D4kiDd+ToB4XKdL8z/hpOlADft7c4138Kw==
X-Received: by 2002:aa7:843c:: with SMTP id q28mr36252292pfn.152.1564393891184;
        Mon, 29 Jul 2019 02:51:31 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id e124sm98981280pfh.181.2019.07.29.02.51.26
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 02:51:30 -0700 (PDT)
Subject: Re: [PATCH] modpost: check for static EXPORT_SYMBOL* functions
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190714152817.24693-1-efremov@linux.com>
 <20190728100906.18847-1-efremov@linux.com>
 <CAK7LNAR9Gzeh6s2QGRF55ORCt1MMSit_cagx-+Ooor_sRC1U8w@mail.gmail.com>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <21351100-46f2-1ce8-e5ed-722b0ca42801@linux.com>
Date:   Mon, 29 Jul 2019 12:51:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR9Gzeh6s2QGRF55ORCt1MMSit_cagx-+Ooor_sRC1U8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 29.07.2019 06:29, Masahiro Yamada wrote:
> may I ask you to use 'int' instead of 'size_t' here?

Fixed in v2.

Regards,
Denis
