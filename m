Return-Path: <linux-kbuild+bounces-146-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C98747F61A2
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 15:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 857BE281F88
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 14:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332FE22EE5;
	Thu, 23 Nov 2023 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=blastwave.org header.i=@blastwave.org header.b="cdb8TPbA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.oetec.com (mail.oetec.com [108.160.241.186])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334731B3;
	Thu, 23 Nov 2023 06:37:51 -0800 (PST)
Received: from [172.16.35.9] (cpe8c6a8d4d360a-cm8c6a8d4d3608.cpe.net.cable.rogers.com [99.253.151.152])
	(authenticated bits=0)
	by mail.oetec.com (8.17.1/8.16.1) with ESMTPSA id 3ANEbBDl087792
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT);
	Thu, 23 Nov 2023 09:37:12 -0500 (EST)
	(envelope-from dclarke@blastwave.org)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=blastwave.org;
	s=default; t=1700750233;
	bh=Ged2w9ywaKuu3NmYHu9HfzcjNR8RiuK6uTXl2aHx/Ns=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=cdb8TPbAU5ikS4B+YDsJ+ewCPXsdhZCkHZIo6fYRt9yXJbDUmbR1wpSX5ipIhibK7
	 2St3FO3WsmAY8By+jxTMWwmmfB5iLj+M/N/sIBQn49U27dkx1gIM1a0dOj/3SJlXPn
	 YR0Gk+sobikZiHH4kQoU9VoOCXrR9VZB2FJOmDVhi0zUQPw73lGuzJQF2qSLaxTeri
	 3Q1CDjhR9BrsdopnT40Z8p9CgF34fVg5oYwga/3C7hcw2It3w+uI9MPNsNImwnFUPc
	 8Sx8P66vHzCe7Uc/8uUovdYozxbfh+sv3qYuHMj5o865PXqHp9tN5gtzh1+K+WApuf
	 aoW8ZbBuEbrZw==
Message-ID: <3f7f1345-5629-5841-e2a9-78c189aecb36@blastwave.org>
Date: Thu, 23 Nov 2023 09:37:11 -0500
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Dennis Clarke <dclarke@blastwave.org>
Subject: =?UTF-8?Q?Re=3a_Fwd=3a_sign-file=2ec=3a149=3a17=3a_warning=3a_impli?=
 =?UTF-8?Q?cit_declaration_of_function_=e2=80=98ENGINE=5fload=5fbuiltin=5fen?=
 =?UTF-8?B?Z2luZXPigJk=?=
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
        Linux Kernel Keyrings <keyrings@vger.kernel.org>
Cc: David Howells <dhowells@redhat.com>,
        David Woodhouse
 <dwmw2@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>
References: <1fca50c4-6d7b-4c9b-bcea-4df17e2c2e7e@gmail.com>
 <e110cfff-08f9-4bbc-6b69-0d67ae6562b6@blastwave.org>
 <da6d3886-3b51-4ce3-92f1-6e86a62ff579@gmail.com>
Content-Language: en-CA
Organization: GENUNIX
In-Reply-To: <da6d3886-3b51-4ce3-92f1-6e86a62ff579@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-oetec-MailScanner-Information: Please contact the ISP for more information
X-oetec-MailScanner-ID: 3ANEbBDl087792
X-oetec-MailScanner: Found to be clean
X-oetec-MailScanner-From: dclarke@blastwave.org

On 11/21/23 23:55, Bagas Sanjaya wrote:
> On 11/17/23 12:34, Dennis Clarke wrote:
>> On 11/16/23 18:41, Bagas Sanjaya wrote:
>>> Hi,
>>>
>>> I notice a bug report on Bugzilla [1]. Quoting from it:
>>>
>> <snip>
>>>> Not related to https://bugzilla.kernel.org/show_bug.cgi?id=215750 but I *feel* that
>>>> this code needs a hug.
>>>
>>> See Bugzilla for the full thread.
>>>
>>> AFAIK, this looks like a bug when the kernel is compiled against custom
>>> (non-system) version of OpenSSL library.
>>>
>>
>> I do not know what you could possibly mean. There is nothing "custom"
>> about OpenSSL. For that matter the gcc compiler I am using was also
>> built by me. Works fine. The sign-file.c source compiles fine.
>>
>> It fails to compile in the usual way when trying to build the kernel.
>>
> 
> Hi Thorsten and all,
> 
> AFAIK there is no reply from kbuild people (maybe they missed this bug?).

I suspect no one is even looking at it. Just us :)

> 
> As for the error itself, let me clarify. The reporter (Dennis) have a build
> problem with /usr/local version of OpenSSL library. He installed it
> (presumably) alongside with system version (which is installed to /usr),
> hence I called the /usr/local version as custom one (IDK if that version
> is vanilla OpenSSL or not). Maybe am I missing something?
> 

Well, today we have OpenSSL 3.2.0 published :

     https://www.openssl.org/source/

So I will try again and this time I will begin with a very stripped down
install of Debian stable. When I mean stripped down I mean there will be
nothing in the base install except reasonable TCP/IP network support and
the ability to FTP a file into it. I can extract a tarball of a decent
compiler that I bootstrapped myself with excellent results :

     https://gcc.gnu.org/pipermail/gcc-testresults/2023-August/794816.html

This will be done on real hardware. Not a virtual machine of any type
where that should make no difference at all. Anyone running ESXi would
see that same results I am seeing anyways.

I want to see if the old sign-file.c code is simply using deprecated
calls and then rewrite/patch as needed. This means the OpenSSL involved
will be the production 3.2.0 release published today.



Dennis Clarke
RISC-V/SPARC/PPC/ARM/CISC
UNIX and Linux spoken


