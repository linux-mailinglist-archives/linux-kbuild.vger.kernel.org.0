Return-Path: <linux-kbuild+bounces-5659-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED992A2C7F2
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 16:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E0B167758
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Feb 2025 15:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B394A23C8B6;
	Fri,  7 Feb 2025 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rub.de header.i=@rub.de header.b="L6vWV9NB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out1.mail.ruhr-uni-bochum.de (out1.mail.ruhr-uni-bochum.de [134.147.53.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E6623C8A6;
	Fri,  7 Feb 2025 15:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.147.53.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943594; cv=none; b=tq0Ek98u9zJeBf2rGTOfs6+VBLfJBP7MP0FMDa2ya02Z/48b1hphYmbrp8HCYntPft+GzdGtqGrLlqWjsCg3S7NTqqjDGwqDzLrzA84+8yHDX8LjyAjyYGP3kxCEj4bNTc5yMk1wpwkT3rfcWOEVO9CFidh6zFSpIhW0QVrGQOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943594; c=relaxed/simple;
	bh=FaroOrq9VEaU3/0VRYA4vw35+utAAbLCIqzzlAS/eKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JTgqGhVIoD1SYoL996w7OUmp5oUByL9+v3eJC5cqNhb89UTR5OmlGQLLNpdQ+i34GjeWCftr8TYb+oSuCd/LGerEbCdDAqQVpVLABS5LnBHNaf6/FnIhjtRRgL6P2b1j7ox8vsC230/2T9mnEGd13dBNgNNjsUPN3loi8ux8FpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rub.de; spf=pass smtp.mailfrom=rub.de; dkim=pass (2048-bit key) header.d=rub.de header.i=@rub.de header.b=L6vWV9NB; arc=none smtp.client-ip=134.147.53.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rub.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rub.de
Received: from mx1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
	by out1.mail.ruhr-uni-bochum.de (Postfix mo-ext) with ESMTP id 4YqJCT3Sr6z8Sdk;
	Fri, 07 Feb 2025 16:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rub.de; s=mail-2024;
	t=1738942997; bh=FaroOrq9VEaU3/0VRYA4vw35+utAAbLCIqzzlAS/eKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L6vWV9NB/HkTIGDlUP2UTpRrPgw4J5f3DF0NGHNJWPaChCMapAdpdPyTLyF/kBJPS
	 ocXEvMdDLe3K5SSgLw5Jh4DRTwfyfVgMmY6NwPwIDIzPPKx4TwMUdzRMMBo308F8UX
	 bupSg8vn0J/9rdijxJ4WBNTpFVUIWeqxuSfk3b4iDjWkkCHViK8xF8bUPse9SYHgHg
	 Odf/XBKvFXDmSVNQFSkJXUcMqSL1qZtWIqeqqTeR6gtyj+cZvQ18qKyNRo/WpDXqaw
	 lu3OqvqHvR9eKpcvO73VDm+7X+1QpOV8moLzSsrtAFx/7NLdfuHxi8D5+NEyu/xbwF
	 zgN9YTnudRZHA==
Received: from out1.mail.ruhr-uni-bochum.de (localhost [127.0.0.1])
	by mx1.mail.ruhr-uni-bochum.de (Postfix idis) with ESMTP id 4YqJCT24lXz8Sf0;
	Fri, 07 Feb 2025 16:43:17 +0100 (CET)
X-Envelope-Sender: <thorsten.berger@rub.de>
X-RUB-Notes: Internal origin=134.147.42.236
Received: from mail2.mail.ruhr-uni-bochum.de (mail2.mail.ruhr-uni-bochum.de [134.147.42.236])
	by out1.mail.ruhr-uni-bochum.de (Postfix mi-int) with ESMTPS id 4YqJCS3PZvz8SdM;
	Fri, 07 Feb 2025 16:43:16 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.7 at mx1.mail.ruhr-uni-bochum.de
Received: from [IPV6:2a05:3e00:a:500f::a96:4204] (dyn-402469a000000000f005a000.ig09.ipv6.ruhr-uni-bochum.de [IPv6:2a05:3e00:a:500f::a96:4204])
	by mail2.mail.ruhr-uni-bochum.de (Postfix) with ESMTPSA id 4YqJCR6683zDgyX;
	Fri, 07 Feb 2025 16:43:15 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.1 at mail2.mail.ruhr-uni-bochum.de
Message-ID: <bd4d6c71-c7b7-4986-a215-fcffa1534953@rub.de>
Date: Fri, 7 Feb 2025 16:43:15 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/11] kconfig: Add PicoSAT interface
Content-Language: en-US
To: Brendan Jackman <jackmanb@google.com>,
 Luis Chamberlain <mcgrof@kernel.org>
Cc: ole0811sch@gmail.com, deltaone@debian.org, jan.sollmann@rub.de,
 jude.gyimah@rub.de, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 nicolas@fjasle.eu
References: <20241028034949.95322-1-ole0811sch@gmail.com>
 <20250109132817.1426138-1-jackmanb@google.com>
 <Z4FxyuF-Lnqa4Wl_@bombadil.infradead.org>
 <CA+i-1C0HUE2+TmMMthRv1MCSQg4SX-+oZao9-4M3rKg71oA-5A@mail.gmail.com>
From: Thorsten Berger <thorsten.berger@rub.de>
In-Reply-To: <CA+i-1C0HUE2+TmMMthRv1MCSQg4SX-+oZao9-4M3rKg71oA-5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Brendan,

Yes, that's a great idea. It reminds me about the eCos configurator 
configtool developed by the Cygnus Solutions developers, which had such 
a capability. One could manually create a partial specification and ask 
it to complete the configuration. We should be able to create such a 
support soon.

We've just created the final set of patches, with the requested changes 
(also some small naming change in the fix generation to avoid 
confusion). Ole is sending them in.

Best, Thorsten



On 13/01/2025 17:29, Brendan Jackman wrote:
> On Fri, 10 Jan 2025 at 20:15, Luis Chamberlain <mcgrof@kernel.org> wrote:
>> On Thu, Jan 09, 2025 at 01:28:17PM +0000, Brendan Jackman wrote:
>>> Would it be easy enough to provide this support as a standalone binary that can
>>> be called from scripts/config too?
>> I suspect this begs more the question of how could this be useful
>> outside of xconfig.
> I was thinking of something like like this:
>
> $ scripts/sat_config --interactive --enable KVM_AMD
>
> This would then prompt the user with a range of solutions for getting
> KVM_AMD enabled.
>
> Then there might be an "I'm feeling lucky" variant like:
>
> $ scripts/sat_config --first-solution --enable KVM_AMD
>
> Where instead of prompting the user it just picks some arbitrary or
> "minimal" set of changes that leads to KVM_AMD being enabled.
>
>> But one step at a time, this can be done *after*
>> this initial patch set gets merged,
> Totally, please consider this a "yes, and" not a "but".



