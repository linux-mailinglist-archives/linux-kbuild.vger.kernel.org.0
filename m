Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E77397D55F
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2019 08:17:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729318AbfHAGR3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Aug 2019 02:17:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40217 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728884AbfHAGR3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Aug 2019 02:17:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id r1so72174903wrl.7;
        Wed, 31 Jul 2019 23:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MqnGgjVQ38lM7U2cszPbg8rUFcVR6uGjnDxtuRKJL08=;
        b=AohG6MDTwkXlE7ea/7G4qLTmlP0asrDbjhuQGmZqLE0MgRSWRw1XklMstv3waMF8Oa
         7MgtOU1OSLhCY7SXgOaWWkn80UsdVylc7dUa0frFxcaWLzSGUfGRMc58g9AU7Eg+NLji
         q9mSni4M5BXl18c6zg89ZbvOU2GYuLSd321azSiGDP7dmnIxspa0mfD5AmY91qPB9wLc
         Hb8jLrhJ+i2BKKJXZcdgbi9x0c6gCfIGl1lG87KK0CDhbmLa/xFWyB0zjbNawasbOhtS
         sQLwEJVdBYFqy0NlmS5NCIBd21hnIj14h3zY3yM/dVF2/otzYFCpwp6nywXZDJ2h+oBF
         /KJQ==
X-Gm-Message-State: APjAAAVb8Yu+y9Aae6/dWj9UQGh5V5Z1z2Izy4EtzCMHiyH+gotUulAz
        P0Yc33UOw3NLtTXISprkg7GDvQRe09o=
X-Google-Smtp-Source: APXvYqwis1vN1L96JjOt7SEvJZa8aeFnBWtqgg5RItTYIzUQRtJs3bIZ1EYjdaCgC50Wa3fc6hPq8Q==
X-Received: by 2002:adf:e541:: with SMTP id z1mr46249972wrm.48.1564640247154;
        Wed, 31 Jul 2019 23:17:27 -0700 (PDT)
Received: from [10.68.32.192] (broadband-188-32-48-208.ip.moscow.rt.ru. [188.32.48.208])
        by smtp.gmail.com with ESMTPSA id 15sm49480720wmk.34.2019.07.31.23.17.26
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2019 23:17:26 -0700 (PDT)
Subject: Re: [PATCH v4] modpost: check for static EXPORT_SYMBOL* functions
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20190714152817.24693-1-efremov@linux.com>
 <20190730181146.6507-1-efremov@linux.com>
 <CAK7LNASW87=sWqEdPChiwxzS3Wwmtr7kO_=XLToLHYO6mDjotw@mail.gmail.com>
 <CAK7LNARrA7dKWaqqtbNUS2yOJfkign4CNvcn_bp2BLyvVAj2FQ@mail.gmail.com>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <ad31b3a8-f662-ef14-148b-347f3671e7d3@linux.com>
Date:   Thu, 1 Aug 2019 09:17:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARrA7dKWaqqtbNUS2yOJfkign4CNvcn_bp2BLyvVAj2FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 01.08.2019 05:20, Masahiro Yamada wrote:
> 
> The build time impact is very limited.
> I guess this measurement is unnecessary in the commit log.
> 

Thank you for your observations! It was not easy for me to guess to do
it this way because of my limited knowledge about kbuild && modpost
work. In v5 I've only updated commit log: measurements removed, "The
build time impact is very limited and is almost at the unnoticeable
level (< 1 sec)" added instead. Fell free to edit it if you want.

Denis
