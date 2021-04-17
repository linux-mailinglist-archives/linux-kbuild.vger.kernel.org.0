Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0E53630BE
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 16:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236299AbhDQOwa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 10:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36013 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236521AbhDQOwa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 10:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618671123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yG7CbGT59OHfRevt3XXh2eiyrKABZpdeb+wHsJG++fM=;
        b=U2+JSirFA5ZcK2Rwcio3R2IllxT6VLimg4WBnAQILNEWiZHTw2OxNAYMJ8wr2ZLVjtKSza
        2DiqSf1GlusS9wAcbbT6+tkOZlmJR+Gmb4pmQBbif869BkYIeZsE6ld8+/SGd0ykDTdipp
        HrHY2jvoZhTckIQx0nP6ZapjxASCKiM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-Jdb2lqJDPi2tlCgQu-RWDw-1; Sat, 17 Apr 2021 10:52:01 -0400
X-MC-Unique: Jdb2lqJDPi2tlCgQu-RWDw-1
Received: by mail-ed1-f71.google.com with SMTP id t11-20020aa7d4cb0000b0290382e868be07so8712206edr.20
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 07:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yG7CbGT59OHfRevt3XXh2eiyrKABZpdeb+wHsJG++fM=;
        b=DPIjcCj975d9V//nwPaoBjSqJnVXqZSf6ieVhkIIsehCkZ9aue+TpO2B43SIgG6fg+
         Qu09UyvDHjlE4d+WNi3eDwQdAVyiFCHtVtBxy4/sGLVrPbiOk+HUTO/LWqze8jmjcmxl
         D1T7yP9y9WpZVpTJKv8T1pd0LNe2TCtS0FKU9sIvmyW2YfSUIwtSC98dRf2OkrnL8xpS
         fs0iEyCXQxoh/g5VF4ASUnjc6tAzuNt3tS8raMrfkAzzIWp28elT6d/+efkHD8P/Avqo
         MwV+pF7x5Yw1fFR5ds5RyEOesM4xLajLYPkyoART9/jP/sAteImB6mPqiwVTA97t4OR1
         ZMoQ==
X-Gm-Message-State: AOAM5327ifyH2HSdG/PyTH8u2iJ0QiKrVghBNyrPJ0bKmtLR85w/NUgw
        r19aRpWqViY5IXOIN1BHYOCb/oUgztCTNJe97lq3AiT6Wr89qrE1BG6FYBZ0omH13z3elSDkZax
        xrGnhREfWPWrH1oqycV/vW1xH
X-Received: by 2002:a05:6402:290:: with SMTP id l16mr5438955edv.337.1618671120387;
        Sat, 17 Apr 2021 07:52:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHc4iGjW4sOLaFFmFfqQFNbzRCiVqgH6eNtR/zBIoDeFLhVfTfFdsedBGskI5MmVb9QV6caA==
X-Received: by 2002:a05:6402:290:: with SMTP id l16mr5438944edv.337.1618671120248;
        Sat, 17 Apr 2021 07:52:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id a24sm6468394ejr.58.2021.04.17.07.51.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Apr 2021 07:51:59 -0700 (PDT)
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Peter Zijlstra <peterz@infradead.org>,
        Wedson Almeida Filho <wedsonaf@google.com>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
Date:   Sat, 17 Apr 2021 16:51:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16/04/21 09:09, Peter Zijlstra wrote:
> Well, the obvious example would be seqlocks. C11 can't do them

Sure it can.  C11 requires annotating with (the equivalent of) READ_ONCE 
all reads of seqlock-protected fields, but the memory model supports 
seqlocks just fine.

> Simlar thing for RCU; C11 can't optimally do that

Technically if you know what you're doing (i.e. that you're not on 
Alpha) you can do RCU using a relaxed load followed by an 
atomic_signal_fence(memory_order_consume).  Which I agree is horrible 
and not entirely within the standard, but it works in practice.  The 
Linux implementation of memory barriers, atomic RMW primitives, 
load-acquire/store-release etc. is also completely outside the standard, 
so it's not much different and more portable.

The only thing that I really, really miss when programming with C11 
atomics is smp_mb__{before,after}_atomic().

Paolo

