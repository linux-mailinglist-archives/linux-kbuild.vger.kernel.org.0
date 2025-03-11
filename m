Return-Path: <linux-kbuild+bounces-6037-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D1A5B695
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 03:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D72993AA58E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 02:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B8C31DF25C;
	Tue, 11 Mar 2025 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Tv6dOJ8k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43101DE3BA;
	Tue, 11 Mar 2025 02:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741659502; cv=none; b=CXVKredYk4jyDzhSL7PuNKQbw2HuqK4UMlqOyU41shu9H3Z+DwaEPund4iyENVc/0jb9vb+Umuz57UhvVmoWgbVEb6OSPy/Jiye6wm4GoJs02T9cXn9O3NlLtwjM28t3jGphwePJunFXFYsB0i9Y+kJBsVspVKJf4+iz6skkpjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741659502; c=relaxed/simple;
	bh=Y9N94YMDRPHNKfkLMcJpNVAzTMmQ0xC828hbtgnBiWo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRsQHKmGNwzbb9RMdYRQQKGKlx4dl0zUWTD81VKmtbjNPCe3XUJihsS4a/hHhzb8Y0PQ7OXFjURdrALLKRHP3rKHfokm00kzJCCYFl26lYKkd1250oviR3zJQvAyF/HGBtZEKp5pQnBlikJnrpNLfFqz3PZ2uFkNdmDRK4QMeO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Tv6dOJ8k; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from [192.168.7.202] ([71.202.166.45])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 52B2HieO1868586
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 10 Mar 2025 19:17:45 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 52B2HieO1868586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025021701; t=1741659466;
	bh=5w+jkPsYj3+xtXaAR1BljtUAktgh1d5yDo9LMS7eY2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Tv6dOJ8kWO5nUONDdZcb2E2y9YAiITBfsHh5gSQBja1S0YVWzPNX846oJuXERqBmG
	 iopBe6zgIgY/+oPAyW6jG04DhUOm72lZ4fYnLdMxVkIstux2NKD9gOnQmHfB2zfnnh
	 7cNWkupYITVqCHpFr2lcdpNIi4GyARlaWWNdZZo92aVuV/tBWCuCzFNcQj/J9z8fpq
	 YekxNqnqbCbiTsp4guQ3j1yfvnvKUjbwRlZTFx5cTFfh4wROLC9tKAqkgbklREH3zU
	 +BIrST5tbZ2ikKiO2nsfTr4Uu3HwdVBYDWrXpJktdSDA4yU+IR+YEviObUjJLErP+F
	 oR4jk66WhyIYw==
Message-ID: <8d589cb7-a687-4b99-a19d-67009c4b2ec0@zytor.com>
Date: Mon, 10 Mar 2025 19:17:43 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        nathan@kernel.org, nicolas@fjasle.eu, bp@alien8.de, hpa@zytor.com,
        sraithal@amd.com
References: <20250308040451.585561-1-xin@zytor.com>
 <CAK7LNARHvn4Sy-e4hMmjGt0C7TFaWrGJrLq3YvN0BjehZ8QwSg@mail.gmail.com>
 <6149ac51-07da-45e2-863e-1d4418f6b662@zytor.com>
 <CAK7LNATGToVHEfZ-hmJ=3xbQCdHmBZf7x9w2QtQVGV-nMiP2Ag@mail.gmail.com>
 <CAK7LNAQHfOo3+vnqTt5A=X3SQEpMxz2aQBW2Hmvc_g0gg2ohLw@mail.gmail.com>
Content-Language: en-US
From: Xin Li <xin@zytor.com>
Autocrypt: addr=xin@zytor.com; keydata=
 xsDNBGUPz1cBDACS/9yOJGojBFPxFt0OfTWuMl0uSgpwk37uRrFPTTLw4BaxhlFL0bjs6q+0
 2OfG34R+a0ZCuj5c9vggUMoOLdDyA7yPVAJU0OX6lqpg6z/kyQg3t4jvajG6aCgwSDx5Kzg5
 Rj3AXl8k2wb0jdqRB4RvaOPFiHNGgXCs5Pkux/qr0laeFIpzMKMootGa4kfURgPhRzUaM1vy
 bsMsL8vpJtGUmitrSqe5dVNBH00whLtPFM7IbzKURPUOkRRiusFAsw0a1ztCgoFczq6VfAVu
 raTye0L/VXwZd+aGi401V2tLsAHxxckRi9p3mc0jExPc60joK+aZPy6amwSCy5kAJ/AboYtY
 VmKIGKx1yx8POy6m+1lZ8C0q9b8eJ8kWPAR78PgT37FQWKYS1uAroG2wLdK7FiIEpPhCD+zH
 wlslo2ETbdKjrLIPNehQCOWrT32k8vFNEMLP5G/mmjfNj5sEf3IOKgMTMVl9AFjsINLHcxEQ
 6T8nGbX/n3msP6A36FDfdSEAEQEAAc0WWGluIExpIDx4aW5Aenl0b3IuY29tPsLBDQQTAQgA
 NxYhBIUq/WFSDTiOvUIqv2u9DlcdrjdRBQJlD89XBQkFo5qAAhsDBAsJCAcFFQgJCgsFFgID
 AQAACgkQa70OVx2uN1HUpgv/cM2fsFCQodLArMTX5nt9yqAWgA5t1srri6EgS8W3F+3Kitge
 tYTBKu6j5BXuXaX3vyfCm+zajDJN77JHuYnpcKKr13VcZi1Swv6Jx1u0II8DOmoDYLb1Q2ZW
 v83W55fOWJ2g72x/UjVJBQ0sVjAngazU3ckc0TeNQlkcpSVGa/qBIHLfZraWtdrNAQT4A1fa
 sWGuJrChBFhtKbYXbUCu9AoYmmbQnsx2EWoJy3h7OjtfFapJbPZql+no5AJ3Mk9eE5oWyLH+
 QWqtOeJM7kKvn/dBudokFSNhDUw06e7EoVPSJyUIMbYtUO7g2+Atu44G/EPP0yV0J4lRO6EA
 wYRXff7+I1jIWEHpj5EFVYO6SmBg7zF2illHEW31JAPtdDLDHYcZDfS41caEKOQIPsdzQkaQ
 oW2hchcjcMPAfyhhRzUpVHLPxLCetP8vrVhTvnaZUo0xaVYb3+wjP+D5j/3+hwblu2agPsaE
 vgVbZ8Fx3TUxUPCAdr/p73DGg57oHjgezsDNBGUPz1gBDAD4Mg7hMFRQqlzotcNSxatlAQNL
 MadLfUTFz8wUUa21LPLrHBkUwm8RujehJrzcVbPYwPXIO0uyL/F///CogMNx7Iwo6by43KOy
 g89wVFhyy237EY76j1lVfLzcMYmjBoTH95fJC/lVb5Whxil6KjSN/R/y3jfG1dPXfwAuZ/4N
 cMoOslWkfZKJeEut5aZTRepKKF54T5r49H9F7OFLyxrC/uI9UDttWqMxcWyCkHh0v1Di8176
 jjYRNTrGEfYfGxSp+3jYL3PoNceIMkqM9haXjjGl0W1B4BidK1LVYBNov0rTEzyr0a1riUrp
 Qk+6z/LHxCM9lFFXnqH7KWeToTOPQebD2B/Ah5CZlft41i8L6LOF/LCuDBuYlu/fI2nuCc8d
 m4wwtkou1Y/kIwbEsE/6RQwRXUZhzO6llfoN96Fczr/RwvPIK5SVMixqWq4QGFAyK0m/1ap4
 bhIRrdCLVQcgU4glo17vqfEaRcTW5SgX+pGs4KIPPBE5J/ABD6pBnUUAEQEAAcLA/AQYAQgA
 JhYhBIUq/WFSDTiOvUIqv2u9DlcdrjdRBQJlD89ZBQkFo5qAAhsMAAoJEGu9DlcdrjdR4C0L
 /RcjolEjoZW8VsyxWtXazQPnaRvzZ4vhmGOsCPr2BPtMlSwDzTlri8BBG1/3t/DNK4JLuwEj
 OAIE3fkkm+UG4Kjud6aNeraDI52DRVCSx6xff3bjmJsJJMb12mWglN6LjdF6K+PE+OTJUh2F
 dOhslN5C2kgl0dvUuevwMgQF3IljLmi/6APKYJHjkJpu1E6luZec/lRbetHuNFtbh3xgFIJx
 2RpgVDP4xB3f8r0I+y6ua+p7fgOjDLyoFjubRGed0Be45JJQEn7A3CSb6Xu7NYobnxfkwAGZ
 Q81a2XtvNS7Aj6NWVoOQB5KbM4yosO5+Me1V1SkX2jlnn26JPEvbV3KRFcwV5RnDxm4OQTSk
 PYbAkjBbm+tuJ/Sm+5Yp5T/BnKz21FoCS8uvTiziHj2H7Cuekn6F8EYhegONm+RVg3vikOpn
 gao85i4HwQTK9/D1wgJIQkdwWXVMZ6q/OALaBp82vQ2U9sjTyFXgDjglgh00VRAHP7u1Rcu4
 l75w1xInsg==
In-Reply-To: <CAK7LNAQHfOo3+vnqTt5A=X3SQEpMxz2aQBW2Hmvc_g0gg2ohLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/10/2025 7:13 PM, Masahiro Yamada wrote:
> On Tue, Mar 11, 2025 at 10:52 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>> On Mon, Mar 10, 2025 at 3:23 PM Xin Li <xin@zytor.com> wrote:
>>>
>>> On 3/8/2025 7:12 AM, Masahiro Yamada wrote:
>>>> On Sat, Mar 8, 2025 at 1:05 PM Xin Li (Intel) <xin@zytor.com> wrote:
>>>>>
>>>>> Meanwhile explicitly state that the headers are uapi headers.
>>>>
>>>> There are many internal-use targets, which are not documented in the
>>>> help message.
>>>> I assume this one is the case.
>>>>
>>>> If users want to install UAPI headers, 'headers_install' is
>>>> the user-visible interface and it is already documented.
>>>>
>>>>
>>>
>>> hpa and Boris prefer to add it, which I also agree.  But ofc it's your
>>> call :)
>>>
>>> If you don't want to add help for "headers", it probably still makes
>>> sense to explicitly state that the headers are uapi headers, no?
>>>
>>> Thanks!
>>>       Xin
>>
>>
>> If a help message for "headers" is desired, how about this?
>>
>>    headers  - Build read-to-install uapi headers in usr/include
> 
> 
> 
> 
> For clarification, the following is the rationale.
> 
> 
> Build                 Installation
> -------------------------------------
> vmlinux               install
> modules               modules_install
> dtbs                  dtbs_install
> headers               headers_install
> 
> 
> 
> In Kbuild, the Build and Installation are separate steps,
> since the latter usually requires the root permission.
> 

Oh, I didn't realize, thanks for making it clear.
     Xin

