Return-Path: <linux-kbuild+bounces-9962-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 202B3CA1263
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 19:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11FFC306AEE1
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 18:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDF7337105;
	Wed,  3 Dec 2025 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3F2M3CxZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36E43321B9;
	Wed,  3 Dec 2025 17:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764784416; cv=none; b=YepuhaqQ/sdtpteuzyn/3d4j01nuMaQkKj0olyKN6O21qK3r8zMiG40cqxd+u5ZyLnNUaG1FsNmi508t/nZWIBqSRfsSuXDMXt+sVxC3pJyHgrmcrYpmLySD1ihA7fBsZofMXV2h/n6VK4ZzsYyz1P9tSC7LwtJoCCjAdvL975Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764784416; c=relaxed/simple;
	bh=baTLm++1hV+B51si0/LSljUFQRdaQgG3Hml1CL9Ok3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0yoWGQUDqsTQi/LIA3SJV+wC1spEDWLg6CSCQ5dvqjSFkgV/gl5/qBpSwVWQeaiZFGgVCK5HLpAxq7fTNZA3FJamxBDo/hrYQh8p2/r/dpjMxuCBBfmwKpxy/nK/B0DStM0yG1nCnVbH99mjY3QBARPjT8RjCigo/wypgvSOvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3F2M3CxZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=oaAxoLUzmnO4hIKzZO3loErk7PPQ3FEbVTsxk3W/pvU=; b=3F2M3CxZl5cDJcbwdMReDFqNBS
	oiWgvfke0NfgMapFmUm92btSIaHDHhEUUtpcHAQPN/dDg/GYuTeQxyZot0hSrV0QbZgrNMbZZnION
	LJu/Hi99VxbEQYoh7oDEx12obt0VRkh+jLObMDIc2LeQFWmYRhkH3vKbqIWLqssKvMIDGp0uKlh/C
	tuFk1SGugT6uryLzgbomyc/uidd5ygTBJ8VRjSeA2Oopv4EP3XKuq95P0TihLHUcZel3lrCNqoIrv
	Pc3+HVIadmx3vT8nrVbrpFsjXISD7Qt/0xLhsUgDaLtRkQRmSiu4g1TdxYgIjn8ip4jQWee1Bh0eU
	lhgKi3eA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQr2g-00000006tA9-1xd3;
	Wed, 03 Dec 2025 17:53:30 +0000
Message-ID: <a19284f6-1a60-4aab-ac2a-ecb81a89fa49@infradead.org>
Date: Wed, 3 Dec 2025 09:53:29 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Why tristate look like bool?
To: Les Boys <lesboyspp43@outlook.com>,
 "yann.morin.1998@free.fr" <yann.morin.1998@free.fr>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <SA2PR10MB4460C7DC4762FBD3065F0794A6D9A@SA2PR10MB4460.namprd10.prod.outlook.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <SA2PR10MB4460C7DC4762FBD3065F0794A6D9A@SA2PR10MB4460.namprd10.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/3/25 4:07 AM, Les Boys wrote:
> First, I wrote a minimal Kconfig:
> ```
> config TRISTATE_TEST
>     tristate "Test"
> ```
> Then, I ran:
> ```
> ./conf --oldaskconfig test.lbConfig
> ```
> Finally, it showed:
> ```
> Test (TRISTATE_TEST) [N/y] (NEW): 
> ```
> This is not excepted, it should shows:
> ```
> Test (TRISTATE_TEST) [N/y/m] (NEW): 
> ```
> I am confused about this problem, no document talks about it, please explain to me, thanks.

I was fairly sure that it has something to do with MODULES.
To your test config file, I added:

config MODULES
    def_bool y

but the test results were still the same. Then I recalled that there is
a special keyword for "modules", described (or mentioned) in
Documentation/kbuild/kconfig-language.rst. When I add "modules" to
CONFIG_MODULES, it works as expected.

config MODULES
	modules
	def_bool y

The kconfig subsystem knows about modular builds but they must be
enabled for them to be allowed on other kconfig symbols.

HTH.

-- 
~Randy


