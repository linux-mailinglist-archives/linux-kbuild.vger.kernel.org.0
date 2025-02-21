Return-Path: <linux-kbuild+bounces-5848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA777A3EB3F
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 04:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 956561781D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Feb 2025 03:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4399A13A3F7;
	Fri, 21 Feb 2025 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ruhr-uni-bochum.de header.i=@ruhr-uni-bochum.de header.b="JvTTDic9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out1.mail.ruhr-uni-bochum.de (out1.mail.ruhr-uni-bochum.de [134.147.53.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C7E1F4E38;
	Fri, 21 Feb 2025 03:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.147.53.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740108178; cv=none; b=PPpCv6kLeU463gyPOopA/NizTr3IYal3OnnGd3s+DLBMIwt/OkwUCutMpCT6bSycwIglyHskuoYWAqO6mTbAv2JIkfmBuc9OCLTbc87510BfPqT0zjo1LZP5ko6rv6znrxvn/1RQ9f6t1w92oI4TyKUwpLAqzU5M1Y+K92pb/rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740108178; c=relaxed/simple;
	bh=k4vfaryULm0wVI7PaW//SBe7RD4zp/MFtgRUgrB4+IY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQlCwkMSF1niOvnFyeTe+58ayFBlsbVq/kdFHBlxgREjmjpOJgHOrxJrEP0WUC5Wr22qBOa1wF4D8xrkg/M+jszGn5TZTRsEjhnwNzloqB8h8LvKN0Q6ca/i0HL7LvcNYaJikj8ELR9OCSkOcX2M08gwEYh8JL29PeuqB8NA/Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ruhr-uni-bochum.de; spf=pass smtp.mailfrom=ruhr-uni-bochum.de; dkim=pass (2048-bit key) header.d=ruhr-uni-bochum.de header.i=@ruhr-uni-bochum.de header.b=JvTTDic9; arc=none smtp.client-ip=134.147.53.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ruhr-uni-bochum.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ruhr-uni-bochum.de
Received: from mx1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
	by out1.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4YzZyt2s33z8S6s;
	Fri, 21 Feb 2025 04:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ruhr-uni-bochum.de;
	s=mail-2024; t=1740107766;
	bh=k4vfaryULm0wVI7PaW//SBe7RD4zp/MFtgRUgrB4+IY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JvTTDic9UlIcexaw6dtFTBvlI8mc7PBunf+Q3W8PDBuRDKiTx0RCweIroiPne4u8x
	 Cgf+sSgkDYQxXcpzmwXxmy41AV6ZiSusv3TmOmOLo/nkWRVeONC6Vj3iiZAQD1b/dQ
	 LNLkNHytaRcQWTFxFBfwnNRczzhvqvV5/XVto7BG+Bp9XcSJZ8LWZ+RYRdIMpxFFAI
	 kbbTqvYgeLLGjaoCMNNlM6dD1hu0VyyT7m4zlPymb2KukF6NmeuwC1USYW/rqlSGyk
	 3yhR0Vxv3q05tU/h+z7WnUNsNykhIPL3Sy1Wdf4qYJxTef4jQjQSR5AZaXE57p3gec
	 vlJNwSDetRNqg==
Received: from out1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
	by mx1.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4YzZyt11Xnz8S4P;
	Fri, 21 Feb 2025 04:16:06 +0100 (CET)
X-Envelope-Sender: <Jude.Gyimah@ruhr-uni-bochum.de>
X-RUB-Notes: Internal origin=IPv6:2a05:3e00:c:1001::8693:2aec
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [IPv6:2a05:3e00:c:1001::8693:2aec])
	by out1.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTPS id 4YzZys4wZ2z8S6L;
	Fri, 21 Feb 2025 04:16:05 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.7 at mx1.mail.ruhr-uni-bochum.de
Received: from [192.168.0.102] (unknown [77.37.5.67])
	by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4YzZys0CsRzDgyN;
	Fri, 21 Feb 2025 04:16:04 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.1 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <4da401e6-bfd1-4fa1-9a4a-5ce3705e571d@ruhr-uni-bochum.de>
Date: Fri, 21 Feb 2025 04:16:04 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/11] kconfig: Add support for conflict resolution
To: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Ole Schuerks <ole0811sch@gmail.com>, linux-kbuild@vger.kernel.org,
 jude.gyimah@rub.de, thorsten.berger@rub.de, deltaone@debian.org,
 jan.sollmann@rub.de, linux-kernel@vger.kernel.org, nathan@kernel.org,
 nicolas@fjasle.eu
References: <20250208163959.3973163-1-ole0811sch@gmail.com>
 <CAK7LNAQBBKfSwQ=z3yBchg--gcrAykWz6xvpAYWKse9R9g8KVQ@mail.gmail.com>
 <Z6oeplCypN825pyR@bombadil.infradead.org>
 <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
Content-Language: en-US
From: Jude Gyimah <Jude.Gyimah@ruhr-uni-bochum.de>
In-Reply-To: <CAK7LNAT48101gZzcHF3U-VL1i0Ekns6zXKpNDb3MnScoSNr-kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Quick follow-up. On our end, our SAT-solver implementations can be 
easily adapted to accommodate your future toolchain selection 
refactorings. Also, could you share with us the timelines for your 
refactorings so we can plan and deliver the adjusted SAT-solver patches. 
Best Regards, Jude Gyimah

On 2/11/25 01:46, Masahiro Yamada wrote:
> On Tue, Feb 11, 2025 at 12:43 AM Luis Chamberlain <mcgrof@kernel.org> wrote:
>> On Mon, Feb 10, 2025 at 02:00:52PM +0900, Masahiro Yamada wrote:
>>> Thanks for this, but I have no plans to merge the SAT solver.
>>>
>>> The reason is that my future plan is to move toolchain selection
>>> to the Kconfig stage instead of specifying it statically from the command line.
>> That makes sense.
>>
>>> This approach was suggested by Linus [1], and to achieve that,
>>> the shell evaluation must be dynamically re-evaluated [2].
>> Sure.
>>
>>> The SAT solver would likely conflict with this plan. At least due to the
>>> significant amount of additional code, which would be an obstacle.
>> I can't see how the toolchain selection, if set on Kconfig can't be
>> leveraged later to enable / disable the SAT solver, however I can
>> see the amount of code shuffling incurred to be an extra hurdle to
>> address and a preference to leave that for later.
>>
>> In other words, I susepct it is still possible to evaluate to
>> add support for the SAT solver post toolchain kconfig integration.
>>
>> Thoughts?
>
> It depends on how the dynamic shell evaluation is implemented.
> This is not limited to bool/tristate, but SAT solver only works for
> those two types.
>
>
>
>

