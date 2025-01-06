Return-Path: <linux-kbuild+bounces-5394-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEBBA027E5
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2025 15:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF9AA3A5853
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2025 14:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89F11DDC30;
	Mon,  6 Jan 2025 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="HZ+DKolC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77521D63CD;
	Mon,  6 Jan 2025 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173490; cv=none; b=O1BkSCjRQOaSEPUNpPc4SzabVj4joXVj1bk99m8C9HnlV07BDY7RI0wD0gYkHVWbf9dhx4DEdojS69J/Q52589O3DMZnllH0PO4ax1lxbOGS1EfEZPSjkCJPcJxX84bIHHq50egE2OcpfIiDfHUW7kNW8KyYKRc/X0aun5P+yM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173490; c=relaxed/simple;
	bh=GG6nDcOu7RCbFaHsTxclIxA9AQqLyYRUXVZwXgY9ICY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FsWT4Y+JSFVCLzzX9SPITTeP1NPGBteiPjWzL3lirKW1J/EMcSG0PIx5OHxLfGuob6/OC45YB6VPB/gQqRm/zc/lM90fHZdQlnwvwi8R1UFYgPwtm1eM5Yw1jVgsprpG5e7tyT5nfEYJc3U6o6z+2KSw+/Kn90BnKyP8byycm0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=HZ+DKolC; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=t+t+UsduK+tz2j1G79cwfcBzf0nPtUaMZjchxgJoIus=; t=1736173488;
	x=1736605488; b=HZ+DKolCXKxKzMpRmMILgRVCeflPcqYP0BGr5gITK3q+pf6TiF93BncTsSJIY
	foY+hc3URILgwxRUj1VNnj5mQhvQj4l+odKTRZc1gmCbMIAu9jK73i31y87uJJhTpFtfyZ1hPFdLV
	AlJELxmkgYapk2OwK5ZPslDy6bVphDMX+qNjZZHe/fFLFPAbBtmwqKQA1p/WO4ABLvRw48AGynEad
	4Cz+GEWlwRaOUdjnC813Cy4TDPMzPw4UhYFLOvg4anwGigrJHziHhOGNiSwSc7/1dZu2wcNFEeobF
	Mh/5K0jhTpplmjouOeLUzYtmwxlnw2EtKnPB9NSQ7F3eFT3hCw==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1tUo24-00E8VR-1G;
	Mon, 06 Jan 2025 15:24:40 +0100
Message-ID: <c5e7cf16-4a2b-4fb5-9fe7-a25c6768bf36@leemhuis.info>
Date: Mon, 6 Jan 2025 15:24:37 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] module: sign with sha512 instead of sha1 by default
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, linux-modules@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <52ee32c0c92afc4d3263cea1f8a1cdc809728aff.1729088288.git.linux@leemhuis.info>
 <ZxQ5QJAa-iv4S6sw@bombadil.infradead.org>
 <54fc582e-1da0-410d-b410-316792e3472b@leemhuis.info>
 <d9ace384-07bb-4fa4-9590-9f739be8e3f5@suse.com>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <d9ace384-07bb-4fa4-9590-9f739be8e3f5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1736173488;62161ff2;
X-HE-SMSGID: 1tUo24-00E8VR-1G



On 06.01.25 15:05, Petr Pavlu wrote:
> On 1/4/25 10:43, Thorsten Leemhuis wrote:
>> On 20.10.24 00:57, Luis Chamberlain wrote:
>>> On Wed, Oct 16, 2024 at 04:18:41PM +0200, Thorsten Leemhuis wrote:
>>>> Switch away from using sha1 for module signing by default and use the
>>>> more modern sha512 instead, which is what among others Arch, Fedora,
>>>> RHEL, and Ubuntu are currently using for their kernels.
>>>>
>>>> Sha1 has not been considered secure against well-funded opponents since
>>>> 2005[1]; since 2011 the NIST and other organizations furthermore
>>>> recommended its replacement[2]. This is why OpenSSL on RHEL9, Fedora
>>>> Linux 41+[3], and likely some other current and future distributions
>>>> reject the creation of sha1 signatures, which leads to a build error of
>>>> allmodconfig configurations:
>>>>
>>>>   80A20474797F0000:error:03000098:digital envelope routines:do_sigver_init:invalid digest:crypto/evp/m_sigver.c:342:
>>>>   make[4]: *** [.../certs/Makefile:53: certs/signing_key.pem] Error 1
>>>>   make[4]: *** Deleting file 'certs/signing_key.pem'
>>>>   make[4]: *** Waiting for unfinished jobs....
>>>>   make[3]: *** [.../scripts/Makefile.build:478: certs] Error 2
>>>>   make[2]: *** [.../Makefile:1936: .] Error 2
>>>>   make[1]: *** [.../Makefile:224: __sub-make] Error 2
>>>>   make[1]: Leaving directory '...'
>>>>   make: *** [Makefile:224: __sub-make] Error 2
>>>>
>>>> This change makes allmodconfig work again and sets a default that is
>>>> more appropriate for current and future users, too.
>>>>
>>>> Link: https://www.schneier.com/blog/archives/2005/02/cryptanalysis_o.html [1]
>>>> Link: https://csrc.nist.gov/projects/hash-functions [2]
>>>> Link: https://fedoraproject.org/wiki/Changes/OpenSSLDistrustsha1SigVer [3]
>>>> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
>>>
>>> Thanks!
>>>
>>> Tested-by: kdevops <kdevops@lists.linux.dev> [0]
>>> Links: https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11420092929/job/31775404330 # [0]
>>>
>>> Applied and pushed!
>>
>> Lo! Just wandering:
             ^

Seems it was "let's start the year with a stupid typo in a public
message" time... :-D

>> what happened to that patch? That reply made me
>> assume that the patch was heading towards mainline, but it seems it's
>> not even in -next. Were there problems and it was dropped or something?
> 
> I can't recall that there was any problem with this patch, I assume it
> felt through by some accident. I've now queued it on modules-next.

Great, thx!

Ciao, Thorsten

