Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9CB1F5812
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jun 2020 17:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgFJPrj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Jun 2020 11:47:39 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34600 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728075AbgFJPri (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Jun 2020 11:47:38 -0400
Received: by mail-lf1-f66.google.com with SMTP id e125so1756525lfd.1;
        Wed, 10 Jun 2020 08:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=6sU72hfmvoXtRpb7yrYdgKGitdA0Zo5oyFodEYtk0us=;
        b=JkH/0rU9Ek/1M6HbraDLw9C15UxAwrgGTJq0k9EcVtpw8eAm65QqlwIdsS8gczE22B
         RxIE/N0Z43Op6F5NJCw3ulsFabGSYuNRJSvU3KJkPkcIAog2IWA1nKtvUN933vrtl0Yx
         f0jlVmjuMIXqqMybVNlWsWRXaVGW2QshOW8fUjhKzFguK9OV++wAxD5PywVNiDwXdG+r
         vlrIEiRosBrYlOPeUmc+pOqdhc8nRPKmoyJ98kT490bpNzgplBUe103m4X7AzxksRCGt
         AJf4z6X2QNagj2GYHxOhEWtJMVk80gD0rVN2mPNsHlY9+laoamBjTrVUv+3/jyTqSNat
         ywyw==
X-Gm-Message-State: AOAM533vWMzMdwJkdTe6dhRHm/vSZgsn+icMLnzstpOGyjLAWoLYt3il
        r9xHjmqN/VCQpaii/cZpVNI=
X-Google-Smtp-Source: ABdhPJw2jleHxl3BXvvI6W2dCEPdssYybRp9F62QQnkxdm77EFHHEjNNBH+8JAEMFV5K5Y4cVxXFgA==
X-Received: by 2002:ac2:5cd1:: with SMTP id f17mr1951677lfq.4.1591804055359;
        Wed, 10 Jun 2020 08:47:35 -0700 (PDT)
Received: from [192.168.42.234] ([213.87.161.124])
        by smtp.gmail.com with ESMTPSA id d8sm20153lfk.27.2020.06.10.08.47.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 08:47:32 -0700 (PDT)
Reply-To: alex.popov@linux.com
Subject: Re: [PATCH 2/5] gcc-plugins/stackleak: Use asm instrumentation to
 avoid useless register saving
To:     Kees Cook <keescook@chromium.org>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org
References: <20200604134957.505389-1-alex.popov@linux.com>
 <20200604134957.505389-3-alex.popov@linux.com>
 <202006091143.AD1A662@keescook>
From:   Alexander Popov <alex.popov@linux.com>
Autocrypt: addr=alex.popov@linux.com; prefer-encrypt=mutual; keydata=
 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
 j3lCqPk=
Message-ID: <757cbafb-1e13-8989-e30d-33c557d33cc4@linux.com>
Date:   Wed, 10 Jun 2020 18:47:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <202006091143.AD1A662@keescook>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 09.06.2020 21:46, Kees Cook wrote:
> On Thu, Jun 04, 2020 at 04:49:54PM +0300, Alexander Popov wrote:
>> Let's improve the instrumentation to avoid this:
>>
>> 1. Make stackleak_track_stack() save all register that it works with.
>> Use no_caller_saved_registers attribute for that function. This attribute
>> is available for x86_64 and i386 starting from gcc-7.
>>
>> 2. Insert calling stackleak_track_stack() in asm:
>>   asm volatile("call stackleak_track_stack" :: "r" (current_stack_pointer))
>> Here we use ASM_CALL_CONSTRAINT trick from arch/x86/include/asm/asm.h.
>> The input constraint is taken into account during gcc shrink-wrapping
>> optimization. It is needed to be sure that stackleak_track_stack() call is
>> inserted after the prologue of the containing function, when the stack
>> frame is prepared.
> 
> Very cool; nice work!
> 
>> +static void add_stack_tracking(gimple_stmt_iterator *gsi)
>> +{
>> +	/*
>> +	 * The 'no_caller_saved_registers' attribute is used for
>> +	 * stackleak_track_stack(). If the compiler supports this attribute for
>> +	 * the target arch, we can add calling stackleak_track_stack() in asm.
>> +	 * That improves performance: we avoid useless operations with the
>> +	 * caller-saved registers in the functions from which we will remove
>> +	 * stackleak_track_stack() call during the stackleak_cleanup pass.
>> +	 */
>> +	if (lookup_attribute_spec(get_identifier("no_caller_saved_registers")))
>> +		add_stack_tracking_gasm(gsi);
>> +	else
>> +		add_stack_tracking_gcall(gsi);
>> +}
> 
> The build_for_x86 flag is only ever used as an assert() test against
> no_caller_saved_registers, but we're able to test for that separately.
> Why does the architecture need to be tested? (i.e. when this flag
> becomes supported o other architectures, why must it still be x86-only?)

The inline asm statement that is used for instrumentation is arch-specific.
Trying to add
  asm volatile("call stackleak_track_stack")
in gcc plugin on aarch64 makes gcc break spectacularly.
I pass the target arch name to the plugin and check it explicitly to avoid that.

Moreover, I'm going to create a gcc enhancement request for supporting
no_caller_saved_registers attribute on aarch64.

Best regards,
Alexander
