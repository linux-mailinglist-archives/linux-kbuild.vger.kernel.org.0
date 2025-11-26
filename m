Return-Path: <linux-kbuild+bounces-9875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E3C8BBD5
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 21:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 56D4A357A76
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 20:00:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0270134027E;
	Wed, 26 Nov 2025 20:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U65324fX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4365314D0C;
	Wed, 26 Nov 2025 19:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187199; cv=none; b=Re4mLQGfTA50zLJFjHkRaO+pLghNRi8ton/ivj7w8HE7kGqVCSOgy7YZTOSuMKidzLUct91aI0xOGNt7ws704OpCPy2DoT2YQ/qHZldCDVnfNeLxPwj+JMv2kETdl/JFZBBZADjmg7pQep4bSiEGNR3Pywrc4a/ZD36gxAyCwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187199; c=relaxed/simple;
	bh=JVkhGAnFuqOLyOevdPN+qYtg3KUlxPhUsvfr3ZMySPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JD+NSlNexUHEq2/7sbMfWtAXMJafyjWfIJAfrWZjHEoYjW20cETT4D3SRA7ueRZtCQtK3MaHt3uwnr19bQ8isc7alGKkrBEUq9Txq22suZ3wwLZihLpNEVydieb81IMGAvZmx3hsIWxcF/ZnPsukS8DhM/uz4FAdK1NAzCaHYm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U65324fX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB18FC4CEF7;
	Wed, 26 Nov 2025 19:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764187199;
	bh=JVkhGAnFuqOLyOevdPN+qYtg3KUlxPhUsvfr3ZMySPI=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U65324fXGG4SAU0RxSSsnYMz4mPZOgiBdK+xN20jRu2PlWwEJehwLkEH0mQe199GS
	 08EAZl3rjCxO2tl0b6nzDmvKa3ROgFF2bf5HN7bY6056yhIl4w9gixd5L3RQDmqzQe
	 vlHgWv2f9UIxsGvvxqHcm5VgS1jmgILEHmCoP1ugNbSFSXJREDZZNSuoVueejtfYA/
	 +w6NbiodaPC/iDD9t6JlbFA1byZxznuiEnljp/BYDOmrbVljxa6HHfM5xAx4Xcg74T
	 8+2pLy9tRO2Cgaf+7TPNUFVkjDeuz7nOsIV+QT6UmA8Yg67pHSgskYPwEg+CNmIGpX
	 YV+SfZyZ8wPTA==
Message-ID: <9d9ca6f0-b4cc-4fef-9ca2-9cb754330581@kernel.org>
Date: Wed, 26 Nov 2025 20:59:55 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: [PATCH] gendwarfksyms: Fix build on 32-bit hosts
To: Sami Tolvanen <samitolvanen@google.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251117203806.970840-2-samitolvanen@google.com>
 <aRycVOe5ZXSJJFpn@kitsune.suse.cz>
 <CABCJKucc0bxLJ=b9rkiwWts6uA=ReLFr32K1OP9WH51D-hO4+A@mail.gmail.com>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <CABCJKucc0bxLJ=b9rkiwWts6uA=ReLFr32K1OP9WH51D-hO4+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/11/2025 21.09, Sami Tolvanen wrote:
> On Tue, Nov 18, 2025 at 8:18 AM Michal Suchánek <msuchanek@suse.de> wrote:
>>
>> Hello,
>>
>> On Mon, Nov 17, 2025 at 08:38:07PM +0000, Sami Tolvanen wrote:
>>> We have interchangeably used unsigned long for some of the types
>>> defined in elfutils, assuming they're always 64-bit. This obviously
>>> fails when building gendwarfksyms on 32-bit hosts. Fix the types.
>>>
>>> Reported-by: Michal Suchánek <msuchanek@suse.de>
>>> Closes: https://lore.kernel.org/linux-modules/aRcxzPxtJblVSh1y@kitsune.suse.cz/
>>> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>>> ---
>>>  scripts/gendwarfksyms/dwarf.c   | 4 +++-
>>>  scripts/gendwarfksyms/symbols.c | 5 +++--
>>>  2 files changed, 6 insertions(+), 3 deletions(-)
>>
>> with this patch gendwarfksyms builds on 32bit x86 and Arm.
>>
>> Tested-by: Michal Suchánek <msuchanek@suse.de>
> 
> Great, thanks for testing!  Daniel, do you want to take this fix
> through the modules tree?
> 
> Sami

Absolutely! Since we are at the end of the rc cycle, I'll merge this after
sending the current queued patches.

