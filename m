Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A2BF3620E9
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 15:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242499AbhDPN2K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 09:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56843 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235674AbhDPN2K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 09:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618579665;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JAKUqXFHXuyIOfRcOhTnPnVKgo/XPbGiNpXU9KPW1QA=;
        b=Z94XpQHvuhQ3w8zOHIMkRRau4BO+WQaM+PRypVmTn+TDqAfgrIFOge9nX+cGMuX7r+ELEn
        HFheITuz4wJACJltQu5Nfn3yJ6Z0ZNVrXnADmVeoyK6RJa0TRCymaRBEnB228xdN7JVcVM
        lrNh8SlHhOu/vnAlZCc2VOvgpJD+BMM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-LVn29M34N76zSONLt61P7w-1; Fri, 16 Apr 2021 09:27:43 -0400
X-MC-Unique: LVn29M34N76zSONLt61P7w-1
Received: by mail-ej1-f70.google.com with SMTP id n10-20020a1709061d0ab029037caa96b8c5so2022687ejh.23
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 06:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JAKUqXFHXuyIOfRcOhTnPnVKgo/XPbGiNpXU9KPW1QA=;
        b=L6Jx+KMbVGTXH7JXqSiYxuo6ZMvgRkrSmpmaHGAiYH4ucsAM9/mdCC84QVbcg1Xw5/
         Ijslo18EK1NO16Xv64GSbAb8/5TWOEyQxQKfV1G7yhtZxvxx7cCgiB0ZJeLgdfD3YrSW
         KbgdElKn0ShkQT7Uds74Ce+RoogTJuxi03gvfqQ7MF4Xk3qAI0KTayyi1eXhIhOCC4Jx
         L3EKnTBqgYVRiSU2W8gSalGuak6BsT1bfVR+gQWZxQRGQ3AXWguAqhb5daMzx6CVqx3A
         OIQQ3NfOEu7c9z44R/vhUnPtIIrQ+5WUoMKbznljhwl0JejYavhejbP5uJPMNLghwI/X
         y9hQ==
X-Gm-Message-State: AOAM530tfC0ckKRx8z+41Ayx/wDX5ORCB3cxyI4d5eOrM6a8HD2IqEC8
        tOI9IF5c2yIPe6es2ZUefRcd/mYD+otr1h1UrxGmGhxnfIuFJOiumhC8e8yn/VnB2xMZzwVwjdO
        /aHxF+Mfu3aqhrI7IB/yIPU73
X-Received: by 2002:a17:906:3e4a:: with SMTP id t10mr7812300eji.553.1618579662296;
        Fri, 16 Apr 2021 06:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6UeUn5HRMxz6UHppX8f3UHpv0mBTcngffZpbHmagQPNNqqfWIQKVS47kiiMglIJ9lySwYmg==
X-Received: by 2002:a17:906:3e4a:: with SMTP id t10mr7812280eji.553.1618579662121;
        Fri, 16 Apr 2021 06:27:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a? ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
        by smtp.gmail.com with ESMTPSA id p7sm4198620eja.103.2021.04.16.06.27.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 06:27:41 -0700 (PDT)
Subject: Re: [PATCH v2] tools: do not include scripts/Kbuild.include
To:     Christian Borntraeger <borntraeger@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org
Cc:     Janosch Frank <frankja@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Paul Mackerras <paulus@samba.org>,
        Shuah Khan <shuah@kernel.org>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        bpf@vger.kernel.org, clang-built-linux@googlegroups.com,
        kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org
References: <20210416130051.239782-1-masahiroy@kernel.org>
 <ee99eb80-5711-9349-23a4-0faf8d7b60a8@de.ibm.com>
From:   Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c2b0b348-e114-14d0-44c0-11d0ce6f7760@redhat.com>
Date:   Fri, 16 Apr 2021 15:27:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ee99eb80-5711-9349-23a4-0faf8d7b60a8@de.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16/04/21 15:26, Christian Borntraeger wrote:
> 
> 
> On 16.04.21 15:00, Masahiro Yamada wrote:
>> Since commit d9f4ff50d2aa ("kbuild: spilt cc-option and friends to
>> scripts/Makefile.compiler"), some kselftests fail to build.
>>
>> The tools/ directory opted out Kbuild, and went in a different
>> direction. They copy any kind of files to the tools/ directory
>> in order to do whatever they want in their world.
>>
>> tools/build/Build.include mimics scripts/Kbuild.include, but some
>> tool Makefiles included the Kbuild one to import a feature that is
>> missing in tools/build/Build.include:
>>
>>   - Commit ec04aa3ae87b ("tools/thermal: tmon: use "-fstack-protector"
>>     only if supported") included scripts/Kbuild.include from
>>     tools/thermal/tmon/Makefile to import the cc-option macro.
>>
>>   - Commit c2390f16fc5b ("selftests: kvm: fix for compilers that do
>>     not support -no-pie") included scripts/Kbuild.include from
>>     tools/testing/selftests/kvm/Makefile to import the try-run macro.
>>
>>   - Commit 9cae4ace80ef ("selftests/bpf: do not ignore clang
>>     failures") included scripts/Kbuild.include from
>>     tools/testing/selftests/bpf/Makefile to import the .DELETE_ON_ERROR
>>     target.
>>
>>   - Commit 0695f8bca93e ("selftests/powerpc: Handle Makefile for
>>     unrecognized option") included scripts/Kbuild.include from
>>     tools/testing/selftests/powerpc/pmu/ebb/Makefile to import the
>>     try-run macro.
>>
>> Copy what they need into tools/build/Build.include, and make them
>> include it instead of scripts/Kbuild.include.
>>
>> Link: 
>> https://lore.kernel.org/lkml/86dadf33-70f7-a5ac-cb8c-64966d2f45a1@linux.ibm.com/ 
>>
>> Fixes: d9f4ff50d2aa ("kbuild: spilt cc-option and friends to 
>> scripts/Makefile.compiler")
>> Reported-by: Janosch Frank <frankja@linux.ibm.com>
>> Reported-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> looks better.
> Tested-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 

Thank you very much Masahiro, this look great.

Paolo

