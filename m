Return-Path: <linux-kbuild+bounces-10044-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A014ECB3144
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 14:59:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E755C308479D
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Dec 2025 13:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619A3324B2B;
	Wed, 10 Dec 2025 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AbYn7C8g"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BCA322C83;
	Wed, 10 Dec 2025 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765374930; cv=none; b=t6FBnGcGQTbsimRx1oxcb8+dqSebqmQHhYQ4mA47m0M818CwhjIHnP1yEaS2y8WvjjumETF7rHUf8ebNkOY+JMO6ehD/9+kanJ3izwb3MilIJZ61hdqoFJRgDRTUNQhwvN+s1Zg15cF7dldPoZP92oVzESFSO7RbTaY3ZyJ4B9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765374930; c=relaxed/simple;
	bh=DAtUlv8bDxKZGj8g2l9j9Ya3tL4DDzbIQQvoToS86R4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+lQH5XZR3dI1ewBS8G4uHLw4zCLSblvbV29LdJvYUtQNxM/e3NUGXneULbbACRti9voxM8kK+q8cHNgE4PhRTC6ZdgLmC3bCQRFsiBXZynPP97nkluMkoInBeMJ2T0r9b3AolbioFvcdifPcZEVPyWoU0efc5RpFjpF4mZPOYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AbYn7C8g; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=UIMfeOC7d4j2HsZslC/hqGz2UqxXTYa7u4kBsuOIxeQ=; t=1765374928;
	x=1765806928; b=AbYn7C8g/H4AE60+esc3mTLK2qo6UYY9mLeT2mBNyOF2ZWX5A6/FJuL3pWL73
	JEMDPO99vrH5Us+c5MdrAbyfvjR836tra4lUdnT8pB7F5eW3a4RyKDSg/cko3LVNHYNtqAenTvdkH
	Bm0W2bvYKA3LDin1vBYRHmtiG8pvf+Xn1S2X2JVqzYtX1zUUIatxuJ0QqvjSkWlchXiTlemJzwwUF
	j2dtNn5f0qlsn2lKnnTpT42KlMNKlAzQzPp5Hci9k02ZmUN/4jWEHrC5lVXhTg/JFyCgRMDuCk9Fw
	Ezv4y48vPRrHhGCjhhxJ/COSKNalIhRDADk56V/xA9rDXrODaw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vTKex-00BHlF-1z;
	Wed, 10 Dec 2025 14:55:15 +0100
Message-ID: <429d18da-af3a-43d2-987f-a6da89935d60@leemhuis.info>
Date: Wed, 10 Dec 2025 14:55:14 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>, Askar Safin <safinaskar@gmail.com>
Cc: Dell.Client.Kernel@dell.com, amadeuszx.slawinski@linux.intel.com,
 baojun.xu@ti.com, bo.liu@senarytech.com, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, kailang@realtek.com,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 regressions@lists.linux.dev, rf@opensource.cirrus.com,
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 sam@gentoo.org, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <thomas.weissschuh@linutronix.de>, Daniel Xu <dxu@dxuuu.xyz>
References: <87o6q8l68r.wl-tiwai@suse.de>
 <20251015145749.2572-1-safinaskar@gmail.com> <878qhckxc5.wl-tiwai@suse.de>
 <CAPnZJGDeCkqqUpEh0SBfwvsxfMp9ZDXqvhrC1s9zRp6jX+Fvnw@mail.gmail.com>
 <875xcgkvnw.wl-tiwai@suse.de>
 <CAPnZJGDmCnKPz2eygwDjQGXZWVctGyJxV+OeFSLLeZPOCEvvbA@mail.gmail.com>
 <CAPnZJGBdqPhmNOes4-BRu8C-0d3yco8H93WhdORxm7MRBSw7CQ@mail.gmail.com>
 <CAPnZJGCqY9j-33piRBpkurSDsOfAqV6+ODGtToGDsgNQd-g9cQ@mail.gmail.com>
 <87bjm78978.wl-tiwai@suse.de>
 <CAPnZJGAxrVJooo9CdgExd+uR+s=W9Na2dZzyjKZc=xYZv_kvmA@mail.gmail.com>
 <871plbucj3.wl-tiwai@suse.de>
 <CAPnZJGBq=q2iW9gMEv9U9LCKJ6f6Uu7Z3QrDCw6SdRGL0sAKVQ@mail.gmail.com>
 <875xagt7d1.wl-tiwai@suse.de> <87y0ncrons.wl-tiwai@suse.de>
 <CAPnZJGCknqB3XjNY5zhD7i84pz+uL+v4OUgw04ADxR-W=CAeGA@mail.gmail.com>
 <87345iebky.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <87345iebky.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1765374928;8fb7157f;
X-HE-SMSGID: 1vTKex-00BHlF-1z

On 12/10/25 14:00, Takashi Iwai wrote:
> On Wed, 10 Dec 2025 02:45:55 +0100,
>> On Tue, Dec 9, 2025 at 12:27 PM Takashi Iwai <tiwai@suse.de> wrote:
>> Also, please, add this for regzbot:
>>> Fixes: 2d9223d2d64c ("ALSA: hda: Move controller drivers into sound/hda/controllers directory")
> 
> Actually this tag isn't really right.  This commit casually surfaced
> the issue in your particular case, but the bug itself was introduced
> from the very beginning, and it could hit earlier.

And for the record: regzbot notices when a commit that is tracked to
have caused as regression is mentioned, but only takes a note, as one
commit can cause different regressions that need separate fixes.

What counts for regzbot is the link to the report (e.g.
https://lore.kernel.org/all/20251014034156.4480-1-safinaskar@gmail.com/)
in the fix using a Link or Closes tag. And Takashi usually adds those iirc.

Ciao, Thorsten


