Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD9E16180D
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 Feb 2020 17:35:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729405AbgBQQfn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 Feb 2020 11:35:43 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37708 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728969AbgBQQfn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 11:35:43 -0500
Received: by mail-wr1-f66.google.com with SMTP id w15so20525164wru.4
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 08:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=52jPAcnAoB9nyjNBUO8yybzpzXsdhabpDRivx/vqyIc=;
        b=UUzhm7q1EVvdF1Pd6XLhsq/6MA/y1xrp8bBCv3aUs70L/SB+mVD+PPnxZxSYvQ90JB
         habZdDrMlFUGlPZEspdHoOl1FN3HNbEa9eaXIk3OTxLHS7zBWOezzdlrQMPnpVfG53GP
         6lpVCKlpBLuULKoT4lipuGr5cJ13bXi/W7sKxGmo0OlElT6DlPV0i1ogCy3ogJfj9n+Y
         q+lNWpLjWG9TFE+IQGWUlARMjMjmXJMalkhlb9l1VtOIqPjkd08t15nc/Da5fehNM1as
         ugGJrsLTzwklZlJDxJkoyDp5+PxlQNRq8CGt1JXZQZIjvepFR9S93/sJ8e8pH14kqKAX
         vgdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=52jPAcnAoB9nyjNBUO8yybzpzXsdhabpDRivx/vqyIc=;
        b=cuDOe6sJjTmJb1t2mpj/a7ygc5eX+l6ndIdaTHNtqbstPIlRa6JTPu/lKCSjc/Uoer
         5mQRxK4ZfTakHjCjvOXDsAL6j1XTDY0/r9ov/h6c9JPSp7h1n9HtUVNw0hQdogEr3Kbi
         u2tXr6AXi50klPpKTWGj54oooRLKoy7hxEkWQjB3RsVBXXZRLsnu5o2TS/9vB5+l5PJm
         AhqeCAVpPAScf/ZHM5QEiyzl7XPRO2vdSyzoAzZdewHctiww1iG6VnaPHW/sPN1M7+rn
         VgzvHpcYbh7YjG6xszpial2s9v8oY3fdqPRXDUlwcViORAQKby119YjN8Z4TAh6bOX8b
         Jlcw==
X-Gm-Message-State: APjAAAVsqYH2dQorDX952FT52Bux3m3Q5GHx8usJobjys36V1QeLbIL6
        5dU9wtnRIVGWhmurpgEXEakqwwlQDhQ=
X-Google-Smtp-Source: APXvYqwANjyM01+uFceFTRuN/F5AwPa51jyHgN/NDw+AGq5VKaoIAKf9kFJD3a2KrUDWQZ8Lx3dckA==
X-Received: by 2002:a5d:4d0a:: with SMTP id z10mr22888113wrt.253.1581957341244;
        Mon, 17 Feb 2020 08:35:41 -0800 (PST)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id r6sm1633466wrp.95.2020.02.17.08.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2020 08:35:40 -0800 (PST)
Date:   Mon, 17 Feb 2020 16:35:40 +0000
From:   Matthias Maennich <maennich@google.com>
To:     Nicolas Pitre <nico@fluxnic.net>
Cc:     Quentin Perret <qperret@google.com>, masahiroy@kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        kernel-team@android.com, jeyu@kernel.org, hch@infradead.org
Subject: Re: [PATCH v4 1/3] kbuild: allow symbol whitelisting with
 TRIM_UNUSED_KSYMS
Message-ID: <20200217163540.GD48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-2-qperret@google.com>
 <20200217152201.GA48466@google.com>
 <20200217153023.GA71210@google.com>
 <nycvar.YSQ.7.76.2002171059230.1559@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <nycvar.YSQ.7.76.2002171059230.1559@knanqh.ubzr>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 17, 2020 at 11:00:39AM -0500, Nicolas Pitre wrote:
>On Mon, 17 Feb 2020, Quentin Perret wrote:
>
>> On Monday 17 Feb 2020 at 15:22:01 (+0000), Matthias Maennich wrote:
>> > In case the whitelist file can't be found, the error message is
>> >
>> >  cat: path/to/file: file not found
>> >
>> > I wonder whether we can make this error message a bit more specific by
>> > telling the user that the KSYMS_WHITELIST is missing.
>>
>> +1, that'd be really useful. I'll check the file existence in v5 (in a
>> POSIX-compliant way, I promise).
>
>In fact, if you explicitly provide a file that is not there, then this
>is arguably a good reason to even fail the build.

I agree, I would expect the build to fail in that case.

Cheers,
Matthias

>
>
>Nicolas
