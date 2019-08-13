Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C6C8BC5C
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 17:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729868AbfHMPC3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 11:02:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36095 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729864AbfHMPC3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 11:02:29 -0400
Received: by mail-wr1-f65.google.com with SMTP id r3so14329364wrt.3
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 08:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Z7Dmwu3NvM4EVDKo63p/xdtZ+TtWJUXj2RkugIVOSr4=;
        b=t2CeC6mtNnAdAq/OptzTNdCWbbeZeKOfLFYM6RAyQrZ+0HjWV7exL8BKTMrkb0IRDM
         w1Li2BGhGTUgB9ErTS9tgo1Yz6QM8ou/fnQvFN6GD0Mq7HXZ87yNGkmCJUWLXt6rKs6k
         PvKCClFv1ahlbnQuGeqpjbwvAm2MCWcT62/V8Td+35/tG+7ESPRSxLHC2rzBwxnuGt+N
         JimGsJMRY0GhBQWRwIO0JxQxJdHd67iGC8UwP5rCsyfQz/WRr5Bsj314c7Az6UMjqbaN
         eTmFEZ3FqInxcxhQiSqHVgIkIWsh+eMXoow+ZwoSg2w2a+BAHbQJr2ibqD7HnpeGDhzo
         kvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Z7Dmwu3NvM4EVDKo63p/xdtZ+TtWJUXj2RkugIVOSr4=;
        b=sNPWf/37TMnwFotjan+PCth9i+34HYXN1SWbMUdRY0HVjUHWapBkVgn7e6Y8RRSAfa
         Um7a3Y7f1k0HBoWmKGk7tGChMeul3B28iEBf1HtHgBB5F7wZzC1OeRrjr/+S4q8boXts
         KNS+H4H/GhwlkCRMzp9PYuJYOztTinfSSF5iLhQc5XvhfVlanpJ7oG2B40jZy4cmMyvW
         HOqmVFCkojLvVdNXH4QbAri67XIInh8S+7RR1LBF8ft0afQTTVFiagXq6kTIpNdTCSaC
         EN7yjRIADz8Ev/UF8Gu+ZFOuhM1+xAjAbSLKtEiSpOWoUscH7yZepes3rAoDpXdoa7E4
         8/vg==
X-Gm-Message-State: APjAAAVBz63sRaRhlxMoS468+tpJtOfTQvd3PwIJGi58AyvPjGHtMBU+
        IYQvmxN9QFMYaI3GJP7AGHep9g==
X-Google-Smtp-Source: APXvYqzczT++Iinfypzj8ZDHy/UBigh5SKekIk8qmEwWyiX/x1k1vy+Nz2A/tkdRk+Iew06bsxv+eA==
X-Received: by 2002:a5d:670d:: with SMTP id o13mr36840270wru.289.1565708546723;
        Tue, 13 Aug 2019 08:02:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id p13sm42846847wrw.90.2019.08.13.08.02.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 13 Aug 2019 08:02:26 -0700 (PDT)
Date:   Tue, 13 Aug 2019 16:02:21 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, maco@android.com,
        kernel-team@android.com, arnd@arndb.de, geert@linux-m68k.org,
        hpa@zytor.com, jeyu@kernel.org, joel@joelfernandes.org,
        kstewart@linuxfoundation.org, linux-arch@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-modules@vger.kernel.org, linux-scsi@vger.kernel.org,
        linux-usb@vger.kernel.org, lucas.de.marchi@gmail.com,
        maco@google.com, michal.lkml@markovi.net, mingo@redhat.com,
        oneukum@suse.com, pombredanne@nexb.com, sam@ravnborg.org,
        sboyd@codeaurora.org, sspatil@google.com,
        stern@rowland.harvard.edu, tglx@linutronix.de,
        usb-storage@lists.one-eyed-alien.net, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: Re: [PATCH v2 10/10] RFC: usb-storage: export symbols in USB_STORAGE
 namespace
Message-ID: <20190813150221.GA107461@google.com>
References: <20180716122125.175792-1-maco@android.com>
 <20190813121733.52480-1-maennich@google.com>
 <20190813121733.52480-11-maennich@google.com>
 <20190813124708.GC12475@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190813124708.GC12475@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 02:47:08PM +0200, Greg KH wrote:
>On Tue, Aug 13, 2019 at 01:17:07PM +0100, Matthias Maennich wrote:
>> Modules using these symbols are required to explicitly import the
>> namespace. This patch was generated with the following steps and serves
>> as a reference to use the symbol namespace feature:
>>
>>  1) Define DDEFAULT_SYMBOL_NAMESPACE in the corresponding Makefile
>>  2) make  (see warnings during modpost about missing imports)
>>  3) make nsdeps
>>
>> Instead of a DEFAULT_SYMBOL_NAMESPACE definition, the EXPORT_SYMBOL_NS
>> variants can be used to explicitly specify the namespace. The advantage
>> of the method used here is that newly added symbols are automatically
>> exported and existing ones are exported without touching their
>> respective EXPORT_SYMBOL macro expansion.
>
>Ok, I can't read text, this answers my previous question.
>
>But, as an example, shouldn't we also have some code here that uses the
>EXPORT_SYMBOL_NS() macro to ensure that it actually works?
>
I will create another patch for a different subsystem where the use of
the macros is more appropriate. Then we have both use cases covered.

Cheers,
Matthias

